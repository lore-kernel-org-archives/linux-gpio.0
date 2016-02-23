From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH] gpio: pisosr: Use devm_gpiod_get_optional for gpio->load_gpio
Date: Tue, 23 Feb 2016 09:09:07 +0800
Message-ID: <CAFRkauDfK5hmZVoeKC8WRCaSkpbTPXmAszzeVCNdptt+KffE4A@mail.gmail.com>
References: <1456143411.23008.1.camel@ingics.com>
	<56CB2CB1.3080201@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33259 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755049AbcBWBJK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 20:09:10 -0500
Received: by mail-lf0-f41.google.com with SMTP id m1so106475312lfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2016 17:09:08 -0800 (PST)
In-Reply-To: <56CB2CB1.3080201@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2016-02-22 23:43 GMT+08:00 Andrew F. Davis <afd@ti.com>:
> On 02/22/2016 06:16 AM, Axel Lin wrote:
>>
>> gpio->load_gpio is optional, so use devm_gpiod_get_optional instead.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>   drivers/gpio/gpio-pisosr.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
>> index f9f1074..8b8bf8f 100644
>> --- a/drivers/gpio/gpio-pisosr.c
>> +++ b/drivers/gpio/gpio-pisosr.c
>> @@ -125,15 +125,12 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>>         if (!gpio->buffer)
>>                 return -ENOMEM;
>>
>> -       gpio->load_gpio = devm_gpiod_get(dev, "load", GPIOD_OUT_LOW);
>> +       gpio->load_gpio = devm_gpiod_get_optional(dev, "load",
>> GPIOD_OUT_LOW);
>>         if (IS_ERR(gpio->load_gpio)) {
>>                 ret = PTR_ERR(gpio->load_gpio);
>> -               if (ret != -ENOENT && ret != -ENOSYS) {
>> -                       if (ret != -EPROBE_DEFER)
>> -                               dev_err(dev, "Unable to allocate load
>> GPIO\n");
>> -                       return ret;
>> -               }
>> -               gpio->load_gpio = NULL;
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "Unable to allocate load GPIO\n");
>> +               return ret;
>>         }
>>
>>         mutex_init(&gpio->lock);
>>
>
> How does this work when the GPIO subsystem is disabled? It looks like
> we get will get -ENOSYS and fail probe. The issue is then that

I think it's no problem for this driver as it is in drivers/gpio/ folder,
it's always build with GPIOLIB.

> devm_gpiod_get_optional returns an error when it cant get the optional
> GPIO in that case, when it should probably just return NULL, I would
> think all the optional functions should.

I had similar question when I mad this change.
When !GPIOLIB, all the gpio APIs return error.
But for (devm_)gpiod_get_optional, it seems reasonable to return NULL
in !GPIOLIB case
because it's optional anyway.
