From: Markus Mayer <markus.mayer@linaro.org>
Subject: Re: [PATCH] gpio: bcm-kona: lock IRQs when starting them
Date: Wed, 20 Nov 2013 17:21:33 -0800
Message-ID: <CAPdLdqnsRrAjEw5C5ygpRQoifYeEmK9zeEbt01F8yZ6N9+rw-Q@mail.gmail.com>
References: <1384867051-31066-1-git-send-email-linus.walleij@linaro.org>
	<CAPdLdqmGY=9hDpb8K7VqoXFU_JW2kFD5gKefsx1LSsjoy9eSgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:62672 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754068Ab3KUBVe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2013 20:21:34 -0500
Received: by mail-we0-f178.google.com with SMTP id u56so2697388wes.23
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2013 17:21:33 -0800 (PST)
In-Reply-To: <CAPdLdqmGY=9hDpb8K7VqoXFU_JW2kFD5gKefsx1LSsjoy9eSgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Christian Daudt <bcm@fixthebug.org>

Fixing Christian's e-mail address.

On 20 November 2013 17:13, Markus Mayer <markus.mayer@linaro.org> wrote:
> On 19 November 2013 05:17, Linus Walleij <linus.walleij@linaro.org> wrote:
>> This uses the new API for tagging GPIO lines as in use by
>> IRQs. This enforces a few semantic checks on how the underlying
>> GPIO line is used.
>>
>> Cc: Markus Mayer <markus.mayer@linaro.org>
>> Cc: Christian Daudt <csd@broadcom.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/gpio/gpio-bcm-kona.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
>> index 72c927dc3be1..dee6d03a7959 100644
>> --- a/drivers/gpio/gpio-bcm-kona.c
>> +++ b/drivers/gpio/gpio-bcm-kona.c
>> @@ -449,12 +449,32 @@ static void bcm_kona_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>>         chained_irq_exit(chip, desc);
>>  }
>>
>> +static unsigned int bcm_kona_gpio_irq_startup(struct irq_data *d)
>> +{
>> +       struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
>> +
>> +       if (gpio_lock_as_irq(&kona_gpio->gpio_chip, d->hwirq))
>> +               dev_err(kona_gpio->gpio_chip.dev,
>> +                       "unable to lock HW IRQ %lu for IRQ\n",
>> +                       d->hwirq);
>> +       return 0;
>> +}
>> +
>> +static void bcm_kona_gpio_irq_shutdown(struct irq_data *d)
>> +{
>> +       struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
>> +
>> +       gpio_unlock_as_irq(&kona_gpio->gpio_chip, d->hwirq);
>> +}
>> +
>>  static struct irq_chip bcm_gpio_irq_chip = {
>>         .name = "bcm-kona-gpio",
>>         .irq_ack = bcm_kona_gpio_irq_ack,
>>         .irq_mask = bcm_kona_gpio_irq_mask,
>>         .irq_unmask = bcm_kona_gpio_irq_unmask,
>>         .irq_set_type = bcm_kona_gpio_irq_set_type,
>> +       .irq_startup = bcm_kona_gpio_irq_startup,
>> +       .irq_shutdown = bcm_kona_gpio_irq_shutdown,
>>  };
>>
>>  static struct __initconst of_device_id bcm_kona_gpio_of_match[] = {
>> --
>> 1.8.3.1
>>
>
> I don't know yet why, but as soon as I apply that patch, the cd-gpio
> interrupt doesn't seem to get triggered anymore.
>
> $ grep bcm-kona-gpio /proc/interrupts
> 270:          0  bcm-kona-gpio  14  3f1b0000.sdio cd
>
> The counter remains at 0. If I comment-out the irq_startup &
> irq_shutdown assignments to temporarily disable the new code, the
> interrupt counter increases again when I insert/remove an SD card.
>
> Regards,
> -Markus

-- 
Markus Mayer
Broadcom Landing Team
