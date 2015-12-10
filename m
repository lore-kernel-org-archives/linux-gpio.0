From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: add support for wakeup configuration
Date: Thu, 10 Dec 2015 19:22:12 +0100
Message-ID: <CACRpkdZMhzgWqCLodW9B9o7HFi6UnKPccGNPbiErfY2OEoUMHA@mail.gmail.com>
References: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
	<CACRpkdZKKWbWDmRGGfHSuF1R-OLubLkuCPWtYxXVh+iwprL7-Q@mail.gmail.com>
	<566846D6.6010501@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35338 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753360AbbLJSWN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:22:13 -0500
Received: by obc18 with SMTP id 18so64313768obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:22:12 -0800 (PST)
In-Reply-To: <566846D6.6010501@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Aubrey Li <aubrey.li@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>

On Wed, Dec 9, 2015 at 4:20 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> On 09/12/15 15:08, Linus Walleij wrote:
>> On Fri, Nov 27, 2015 at 6:19 PM, Sudeep Holla <sudeep.holla@arm.com>
>> wrote:
>>
>>> The PL061 supports interrupts and those can be wakeup interrupts. We
>>> need to provide support for configuring those interrupts as wakeup
>>> sources.
>>>
>>> This patch adds irq_set_wake callback for PL061 so that GPIO interrupts
>>> can be configured as wakeup.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Alexandre Courbot <gnurou@gmail.com>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>> ---
>>>   drivers/gpio/gpio-pl061.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
>>> index 4d4b37676702..8b1cbd5767f9 100644
>>> --- a/drivers/gpio/gpio-pl061.c
>>> +++ b/drivers/gpio/gpio-pl061.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/module.h>
>>>   #include <linux/io.h>
>>>   #include <linux/ioport.h>
>>> +#include <linux/interrupt.h>
>>>   #include <linux/irq.h>
>>>   #include <linux/irqchip/chained_irq.h>
>>>   #include <linux/bitops.h>
>>> @@ -269,12 +270,20 @@ static void pl061_irq_ack(struct irq_data *d)
>>>          spin_unlock(&chip->lock);
>>>   }
>>>
>>> +static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
>>> +{
>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> +
>>> +       return irq_set_irq_wake(gc->irq_parent, state);
>>> +}
>>> +
>>>   static struct irq_chip pl061_irqchip = {
>>>          .name           = "pl061",
>>>          .irq_ack        = pl061_irq_ack,
>>>          .irq_mask       = pl061_irq_mask,
>>>          .irq_unmask     = pl061_irq_unmask,
>>>          .irq_set_type   = pl061_irq_type,
>>> +       .irq_set_wake   = pl061_irq_set_wake,
>>>   };
>>
>>
>> Is this really all that is needed? Don't you need to call
>> device_wakeup_enable(&adev->dev, 1); on the amba (primecell)
>> device providing this GPIO, lest it may be suspended itself
>> and render this exercise pointless.
>>
>
> Do you mean something like :
>
>
> -->8--
>
> diff --git i/drivers/gpio/gpio-pl061.c w/drivers/gpio/gpio-pl061.c
> index 4d4b37676702..467e0b278cf0 100644
> --- i/drivers/gpio/gpio-pl061.c
> +++ w/drivers/gpio/gpio-pl061.c
> @@ -354,6 +354,7 @@ static int pl061_probe(struct amba_device *adev, const
> struct amba_id *id)
>         }
>
>         amba_set_drvdata(adev, chip);
> +       dev_pm_set_wake_irq(&adev->dev, irq);

I don't really know :(

I was under the impression that we may need *both*, because if
the GPIO line is wakeup-capable, the wakeup event will not be
detected unless the GPIO controller is also online, simply.

Maybe:

if (any_lines_on_me_wakeup_capable)
    dev_pm_set_wake()...

I need the help from the power maintainers to figure this out...

Yours,
Linus Walleij
