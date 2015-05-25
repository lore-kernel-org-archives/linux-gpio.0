From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 25 May 2015 21:54:29 +0300
Message-ID: <55636FE5.7090709@linaro.org>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org> <20150518110214.GC28127@localhost> <CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com> <20150521142524.GA30660@localhost> <555E40FD.7010209@linaro.org> <20150524171251.GA25494@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:37099 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbbEYSye (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 14:54:34 -0400
Received: by wifw1 with SMTP id w1so5884059wif.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2015 11:54:33 -0700 (PDT)
In-Reply-To: <20150524171251.GA25494@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 05/24/2015 08:12 PM, Johan Hovold wrote:
> On Thu, May 21, 2015 at 11:33:01PM +0300, Grygorii.Strashko@linaro.org wrote:
>> On 05/21/2015 05:25 PM, Johan Hovold wrote:
>>> On Tue, May 19, 2015 at 04:28:55PM +0200, Linus Walleij wrote:
> 
>>>> I introduced the gpiochip_[un]lock_as_irq() calls so we
>>>> could safeguard against this. Notably that blocks client A
>>>> from setting the line as output. I hope.
>>>
>>> A problem with the current implementation is that it uses as a flag
>>> rather than a refcount. As I pointed out elsewhere in this thread, it is
>>> possible to request a shared IRQ (e.g. via the sysfs interface) and
>>> release it, thereby making it possible to change the direction of the
>>> pin while still in use for irq.
>>
>> Yes (checked). And this is an issue which need to be fixed.
>> - gpio sysfs should not call gpiochip_un/lock_as_irq()
> 
> This is a known but unrelated issue. The lock/unlock call in the sysfs
> implementation is at worst redundant. I suggested removing it earlier,
> but Linus pointed out that there were still a few drivers not
> implementing the irq resource callbacks that need to be updated first.
> 
>> - gpio drivers should use gpiochip API or implement
>>    .irq_release/request_resources() callbacks
>>
>> in this case case IRQ core will do just what is required. Right?
> 
> No, the problem is that the "lock" is implemented using a flag rather
> than a refcount.

I've rechecked __setup_irq() and what I can see from it is that
irq_request_resources(), __irq_set_trigger() and irq_startup() 
functions will be called only when the first IRQ action is installed.
So, It looks like flag should work here. Am I missing smth?


> 
>>>> I thought this would mean the line would only be used as IRQ
>>>> in this case, so I could block any gpiod_get() calls to that
>>>> line but *of course* some driver is using the IRQ and snooping
>>>> into the GPIO value at the same time. So can't simplify things
>>>> like so either.
>>>>
>>>> Maybe I'm smashing open doors here...
>>>
>>> No, I understand that use case. But there are some issues with how it's
>>> currently implemented. Besides the example above, nothing pins a gpio
>>> chip driver in memory unless it has requested gpios, specifically,
>>> requesting a pin for irq use is not enough.
>>
>> ok. An issue. Possible fix below:
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index ea11706..64392ad 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -514,6 +514,9 @@ static int gpiochip_irq_reqres(struct irq_data *d)
>>   {
>>          struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>>   
>> +       if (!try_module_get(chip->owner))
>> +               return -ENODEV;
>> +
>>          if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>>                  chip_err(chip,
>>                          "unable to lock HW IRQ %lu for IRQ\n",
>> @@ -528,6 +531,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
>>          struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>>   
>>          gpiochip_unlock_as_irq(chip, d->hwirq);
>> +       module_put(chip->owner);
>>   }
> 
> The resource callbacks would be the place to do resource allocation, but
> the above snippet is obviously broken as its leaking resources in the
> error path.

True, Thanks. This was the very fast try to solve issue. It could be converted
to the patch if GPIO maintainers agree with this approach.

> 
>>>> Anyway to get back to the original statement:
>>>>
>>>>> This is backwards. All gpios *should* be requested. *If* we are to
>>>>> include not-requested gpios in the debug output, then it is those pins
>>>>> that need to be marked as not-requested.
>>>>
>>>> This is correct, all GPIOs accessed *as gpios* should be
>>>> requested, no matter if they are then cast to IRQs by gpiod_to_irq
>>>> or not. However if the same hardware is used as only "some IRQ"
>>>> through it's irqchip interface, it needs not be requested, but
>>>> that is by definition not a GPIO, it is an IRQ.
>>>
>>> True. And since it is not a GPIO, should it show up in
>>> /sys/kernel/debug/gpio? ;)
>>
>> "Nice" idea :)
>> This information needed for debugging and testing which includes
>> checking of pin state (hi/lo) - especially useful during board's
>> bring-up when a lot of mistakes are detected related to wrong usage
>> of IRQ/GPIO numbers.
> 
> At least the gpio-irq mapping for requested gpios could be useful.
> 
> Another issue here is that you would start calling gpio accessors for
> unrequested gpios. Are you sure all gpio drivers can, and will always be
> able to, handle that? [ When using the gpiod interface, gpios will always
> be requested and must not be accessed after having been released. ]

Agree :(. I'm not sure.  This is very sensible remark:
- call of gpiod_get_direction() can be avoided, in general, for <irq-only> case
- but gpiod_to_irq() -- is not.

.. Looks like it's time to drop this stuff :,,(

Thanks all.

--
regards,
-grygorii
