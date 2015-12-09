From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] gpio: pl061: add support for wakeup configuration
Date: Wed, 9 Dec 2015 15:20:54 +0000
Message-ID: <566846D6.6010501@arm.com>
References: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
 <CACRpkdZKKWbWDmRGGfHSuF1R-OLubLkuCPWtYxXVh+iwprL7-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50241 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750937AbbLIPU6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 10:20:58 -0500
In-Reply-To: <CACRpkdZKKWbWDmRGGfHSuF1R-OLubLkuCPWtYxXVh+iwprL7-Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aubrey Li <aubrey.li@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sudeep Holla <sudeep.holla@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>



On 09/12/15 15:08, Linus Walleij wrote:
> On Fri, Nov 27, 2015 at 6:19 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>> The PL061 supports interrupts and those can be wakeup interrupts. We
>> need to provide support for configuring those interrupts as wakeup
>> sources.
>>
>> This patch adds irq_set_wake callback for PL061 so that GPIO interrupts
>> can be configured as wakeup.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>   drivers/gpio/gpio-pl061.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
>> index 4d4b37676702..8b1cbd5767f9 100644
>> --- a/drivers/gpio/gpio-pl061.c
>> +++ b/drivers/gpio/gpio-pl061.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/module.h>
>>   #include <linux/io.h>
>>   #include <linux/ioport.h>
>> +#include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>   #include <linux/irqchip/chained_irq.h>
>>   #include <linux/bitops.h>
>> @@ -269,12 +270,20 @@ static void pl061_irq_ack(struct irq_data *d)
>>          spin_unlock(&chip->lock);
>>   }
>>
>> +static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +
>> +       return irq_set_irq_wake(gc->irq_parent, state);
>> +}
>> +
>>   static struct irq_chip pl061_irqchip = {
>>          .name           = "pl061",
>>          .irq_ack        = pl061_irq_ack,
>>          .irq_mask       = pl061_irq_mask,
>>          .irq_unmask     = pl061_irq_unmask,
>>          .irq_set_type   = pl061_irq_type,
>> +       .irq_set_wake   = pl061_irq_set_wake,
>>   };
>
> Is this really all that is needed? Don't you need to call
> device_wakeup_enable(&adev->dev, 1); on the amba (primecell)
> device providing this GPIO, lest it may be suspended itself
> and render this exercise pointless.
>

Do you mean something like :


-->8--

diff --git i/drivers/gpio/gpio-pl061.c w/drivers/gpio/gpio-pl061.c
index 4d4b37676702..467e0b278cf0 100644
--- i/drivers/gpio/gpio-pl061.c
+++ w/drivers/gpio/gpio-pl061.c
@@ -354,6 +354,7 @@ static int pl061_probe(struct amba_device *adev, 
const struct amba_id *id)
         }

         amba_set_drvdata(adev, chip);
+       dev_pm_set_wake_irq(&adev->dev, irq);
         dev_info(&adev->dev, "PL061 GPIO chip @%pa registered\n",
                  &adev->res.start);

-->8--

If yes, I agree that's one possible solution.

> And if not, why not?
>

The only reason I didn't go for the above solution is that some
platforms may not have any gpio pins as wakeup source, so it may be
unnecessary to do that. Also in order to that, we also implicitly force
platforms to mark the GPIO controller as wakeup source rather than just
the few GPIO pins that are wakeup capable.

> How are GPIO chips providing IRQs actually going to do this,
> provided that they need to be kept awake themselves?
>

Not gone through all the implementations. Just started with PL061 when I
tested on Juno(Beware it doesn't work with std. firmware as there are
some know issues still under investigation)

-- 
Regards,
Sudeep
