From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio:mcp23s08 Fixed missing interrupts
Date: Wed, 15 Feb 2017 14:37:15 +0800
Message-ID: <ea72ed58-09fb-6d33-8105-c9384931e41f@electromag.com.au>
References: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
 <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
 <8aa3227c-c55c-6319-42ac-97e90c9098dd@electromag.com.au>
 <CAKpcJVZs7o=4M2mHDBRbRS4Kpno9mjd4XappVNgygy+=954jMg@mail.gmail.com>
 <b06d79e0-f966-933b-57d2-8bd79ee0f9a9@electromag.com.au>
 <CAKpcJVaX=RqT3e4e=SPdWWfd9Me6m77z5aVh_afG_WOO_G8Byw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:55234 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750922AbdBOGhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2017 01:37:19 -0500
In-Reply-To: <CAKpcJVaX=RqT3e4e=SPdWWfd9Me6m77z5aVh_afG_WOO_G8Byw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On 15/02/2017 10:37, Robert Middleton wrote:
> On Mon, Feb 13, 2017 at 8:12 PM, Phil Reid <preid@electromag.com.au> wrote:
>> On 14/02/2017 00:25, Robert Middleton wrote:
>>>
>>> On Mon, Feb 13, 2017 at 12:15 AM, Phil Reid <preid@electromag.com.au>
>>> wrote:
>>>>
>>>> G'day Rob,
>>>>
>>>> I've tested this and it works for my use case.
>>>> Which has rising & falling irqs and not very fast inputs.
>>>>
>>>> A couple of comment below. I'm no expert on the kernel standards thou.
>>>>
>>>> I've also cc-dd the gpio maintainers. See MAINTAINERS file for a list
>>>> people
>>>> to copy for different subfolder etc.
>>>>
>>>>
>>>> On 12/02/2017 04:02, robert.middleton@rm5248.com wrote:
>>>>>
>>>>>
>>>>> From: Robert Middleton <robert.middleton@rm5248.com>
>>>>>
>>>>> When an interrupt occurs on an MCP23S08 chip, the INTF register will
>>>>> only
>>>>> contain one bit as causing the interrupt.  If more than two pins change
>>>>> at
>>>>> the same time on the chip, this causes one of the pins to not be
>>>>> reported.
>>>>> This patch fixes the logic for checking if a pin has changed, so that
>>>>> multiple pins will always cause more than one change.
>>>>
>>>>
>>>>
>>>> Comments need to be wrapped to 75 chars.
>>>> Also needs signed-by. "git format-patch -s" will do it for you.
>>>>
>>>
>>> Ah, I didn't realize that the signed-by was required(I was assuming
>>> signed-by was
>>> only for the actual kernel maintainers).
>>>
>>>>
>>>>> ---
>>>>>  drivers/gpio/gpio-mcp23s08.c | 26 +++++++++++++++++++++-----
>>>>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
>>>>> index 99d37b5..b7ceee3 100644
>>>>> --- a/drivers/gpio/gpio-mcp23s08.c
>>>>> +++ b/drivers/gpio/gpio-mcp23s08.c
>>>>> @@ -337,7 +337,7 @@ mcp23s08_direction_output(struct gpio_chip *chip,
>>>>> unsigned offset, int value)
>>>>>  static irqreturn_t mcp23s08_irq(int irq, void *data)
>>>>>  {
>>>>>         struct mcp23s08 *mcp = data;
>>>>> -       int intcap, intf, i;
>>>>> +       int intcap, intf, i, gpio, gpio_cache;
>>>>>         unsigned int child_irq;
>>>>>
>>>>>         mutex_lock(&mcp->lock);
>>>>> @@ -356,14 +356,30 @@ static irqreturn_t mcp23s08_irq(int irq, void
>>>>> *data)
>>>>>         }
>>>>>
>>>>>         mcp->cache[MCP_INTCAP] = intcap;
>>>>> +
>>>>> +       /* This clears the interrupt */
>>>>
>>>>
>>>> Only for no s18 chips. But it should matter for them.
>>>>
>>>>
>>>>> +       gpio = mcp->ops->read(mcp, MCP_GPIO);
>>>>> +       if (gpio < 0) {
>>>>> +               mutex_unlock(&mcp->lock);
>>>>> +               return IRQ_HANDLED;
>>>>> +       }
>>>>> +       gpio_cache = mcp->cache[MCP_GPIO];
>>>>> +       mcp->cache[MCP_GPIO] = gpio;
>>>>>         mutex_unlock(&mcp->lock);
>>>>>
>>>>>
>>>>>         for (i = 0; i < mcp->chip.ngpio; i++) {
>>>>> -               if ((BIT(i) & mcp->cache[MCP_INTF]) &&
>>>>> -                   ((BIT(i) & intcap & mcp->irq_rise) ||
>>>>> -                    (mcp->irq_fall & ~intcap & BIT(i)) ||
>>>>> -                    (BIT(i) & mcp->cache[MCP_INTCON]))) {
>>>>> +               /* We must check all of the inputs on the chip,
>>>>> +                * otherwise we may not notice a change on >=2 pins
>>>>> +                */
>>>>> +               int bit_changed = (BIT(i) & gpio_cache) !=
>>>>> +                       (BIT(i) & mcp->cache[MCP_GPIO]);
>>>>> +               int defval_changed = (BIT(i) & mcp->cache[MCP_GPIO]) !=
>>>>> +                       (BIT(i) & mcp->cache[MCP_DEFVAL]);
>>>>> +               if ((bit_changed && (BIT(i) & mcp->irq_rise)) ||
>>>>> +                       (bit_changed && (~BIT(i) & mcp->irq_fall)) ||
>>>>> +                       ((BIT(i) & mcp->cache[MCP_INTCON]) &&
>>>>
>>>>
>>>> trailing space on this line.
>>>> I'm not sure what the formatting should be here, but most other kernel
>>>> code
>>>> I've looked
>>>> using space to align to the open bracket of the if statement when the
>>>> condition exceeds
>>>> one line.
>>>>
>>>>> +                       defval_changed)) {
>>>>>                         child_irq =
>>>>> irq_find_mapping(mcp->chip.irqdomain,
>>>>> i);
>>>>>                         handle_nested_irq(child_irq);
>>>>>                 }
>>>>>
>>>>
>>>> bit_changed / defval_changed could be of type bool to be clearer that
>>>> it's
>>>> meant to
>>>> be a bool result. These should also be defined at the top of the function
>>>> I
>>>> believe.
>>>>
>>>
>>> I forgot that the kernel actually has a 'bool' type; I was thinking it was
>>> C89 only.
>>>
>>> Are variables always supposed to be at the start of a function?  I'm
>>> wondering
>>> because since they are used only in that one block, it doesn't make sense
>>> to me at least that you would want them as function-level variables.

All I can say is that I did a patch that way, and it got changed later on
to move the definitions to the top of the function.

see commit ea3d579d8f0cc5f16105c2741e2d409563beb948
gpio: pca953x: coding style fixes


>>>
>>>> I pretty sure the logic will trigger a interrupt on both a rising and
>>>> falling edge of the input
>>>> even if only falling edge is requested. But I may be missing something
>>>> obvious.
>>>>
>>>
>>> I think that you're correct here actually; I thought I had tested this
>>> by setting
>>> the 'rising'/'falling' edge in sysfs, but testing it again just now I
>>> get changes in
>>> userspace on both turning it on and off.  I'll look back into it
>>> today/tomorrow.
>>>
>>>> Also what is the impact to short interrupt events. Should the INTCAP /
>>>> INTF
>>>> flags still be consider as well.
>>>> ie. A short pulse on input which may happen before GPIO input register be
>>>> read, but captured by INTCAP
>>>> be consider as well. This change may break systems relying on that
>>>> behaviour.
>>>>
>>>
>>> The reason that I wasn't able to compare against the INTF register was
>>> because
>>> since only 1 bit is ever set, you don't get more than 1 pin change event.
>>> For
>>> example, if pin 1 changes, INTF would read 0x0001.
>>> If both pins 1 and 2 change at the same time, INTF would read either
>>> 0x0002
>>> or 0x0001, it wouldn't have both set.  From the testing that I did, it
>>> looked like
>>> INTCAP would contain the proper data, but I wasn't sure if that would
>>> always
>>> be the case.
>>>
>>> My reasoning for reading the GPIO input register was to clear the
>>> interrupt as
>>> soon as possible, so that if there was a short interrupt the kernel would
>>> get
>>> the interrupt again.  I'm not sure if that is the proper approach; I have
>>> been
>>> told before that in the IRQ handler you should get the data and clear the
>>> interrupt as fast as possible in order to wait for more interrupts.
>>
>>
>> I'm suggest combining the two approaches.
>> If the pin toggles quickly an you only read the GPIO input to determine
>> which pins triggered
>> the irq you may miss calling the nested irq handler.
>> So you'd need to consider the INTF / INTCAP state and after than also check
>> GPIO state.
>> eg:
>> Pin trigger int. (example high)
>> INTF / INTCAP get set.
>> Pin returns to previous state (example low)
>> ISR handler run and reads the the GPIO.
>> No IRQ would be detected if only the GPIO state is considered.
>>
>> But if you also look at INTF INTCAP you could trigger both a rising and
>> falling irq.
>>
>> Considering that the chip is SPI / I2c it can be a relatively long time
>> before the handler
>> can actually read the GPIO state.
>>
>
> That probably makes the most sense.  I'll pull together a new patch in the next
> few days with those changes and make sure that I test it fully by checking all
> of the possible states.  I did want to make sure that I was fixing this in the
> correct way, so this is quite helpful.
>
> One thing that I couldn't figure out how to test, is in mcp23s08_irq_set_type
> there are macros IRQ_TYPE_LEVEL_HIGH/IRQ_TYPE_LEVEL_LOW, how
> exactly are those used?  The documentation for the sysfs interface only talks
> about the edge being both/rising/falling, and not about the level being only
> high or low, so I couldn't figure out exactly how those segments of the code
> get exercised.

I'm not familiar with the sysfs interface and what features it has.
But for in kernel consumer the expectation is that the IRQ will be triggered
continuously while the GPIO is correspondingly high or low.

This is used in the mcp23s08 driver when setting up it's irq, search for
IRQF_TRIGGER_HIGH / IRQF_TRIGGER_LOW in the irq_setup function.
If the irq pin is routed to a gpio then it would request the gpio to be
configured with  IRQ_TYPE_LEVEL_HIGH / IRQ_TYPE_LEVEL_LOW

Doesn't look like the user interface to the gpio system exposes this mode.
Neither the legacy sysfs or the new gpio-cdev interface seem to have it.


>
>>
>>>
>>>> FYI: You can run scripts/checkpatch.pl against you patch to identify some
>>>> of
>>>> the problems highlighted above.
>>>>
>>>> not related to your changes: this function always returns IRQ_HANDLED in
>>>> all
>>>> cases.
>>>> Other GPIO drivers return IRQ_NONE if no handler was called or in some
>>>> case
>>>> if an error occurred
>>>> in reading the state. I'm not sure what the correct behaviour is supposed
>>>> to
>>>> be.
>>>> Docs suggest IRQ_NONE helps the kernel detect bad irq.
>>>> Someone more knowledgeable may be able to offer a hint on that one.
>>>> I can do a patch if this needs changing.
>>>>
>>


-- 
Regards
Phil Reid

