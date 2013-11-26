From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2] gpio: lynxpoint: lock IRQs when starting them
Date: Tue, 26 Nov 2013 13:18:26 +0100
Message-ID: <CABxcv==Xr8caOtaPdFt7wQFK=_19pHiCajf+9aJVDxMFZx4Cug@mail.gmail.com>
References: <1385461419-5979-1-git-send-email-linus.walleij@linaro.org>
	<20131126114926.GY2281@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:64026 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755276Ab3KZMSa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 07:18:30 -0500
Received: by mail-we0-f180.google.com with SMTP id u56so5281054wes.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 04:18:26 -0800 (PST)
In-Reply-To: <20131126114926.GY2281@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <acourbot@nvidia.com>

Hi Mika,

On Tue, Nov 26, 2013 at 12:49 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Nov 26, 2013 at 11:23:39AM +0100, Linus Walleij wrote:
>> This uses the new API for tagging GPIO lines as in use by
>> IRQs. This enforces a few semantic checks on how the underlying
>> GPIO line is used.
>>
>> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> ChangeLog v1->v2:
>> - Explicitly call .enable()/.disable() callbacks from the
>>   startup()/shutdown() callbacks to satisfy implicit semantics.
>> ---
>>  drivers/gpio/gpio-lynxpoint.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
>> index a0804740a0b7..70831e4b2c8b 100644
>> --- a/drivers/gpio/gpio-lynxpoint.c
>> +++ b/drivers/gpio/gpio-lynxpoint.c
>> @@ -301,6 +301,26 @@ static void lp_irq_disable(struct irq_data *d)
>>       spin_unlock_irqrestore(&lg->lock, flags);
>>  }
>>
>> +static unsigned int lp_irq_startup(struct irq_data *d)
>> +{
>> +     struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
>> +
>> +     if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
>> +             dev_err(lg->chip.dev,
>> +                     "unable to lock HW IRQ %lu for IRQ\n",
>> +                     irqd_to_hwirq(d));
>> +     lp_irq_enable(d);
>
> I may be missing something but doesn't this now end up calling
> lp_irq_enable() twice? First in ->irq_startup() and then later on in
> ->irq_enable().
> --

As far as I understood from Grygorii explanation chip->irq_startup()
and chip->irq_enable() are mutually exclusive at
request_[threaded]_irq(). And he seems to be correct by looking at
irq_startup() in irq/chip.c [0].

Thanks a lot and best regards,
Javier

[0]: http://lxr.free-electrons.com/source/kernel/irq/chip.c#L175
