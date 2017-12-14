From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/2] gpiolib: use kstrdup_const() for gpio_device label
Date: Thu, 14 Dec 2017 15:30:33 +0100
Message-ID: <CAMRc=MenAwfAwf-YsoJeBEdDQat6K+snzP5FHqQ+OZ7DFyjEEw@mail.gmail.com>
References: <20171213112520.7479-1-brgl@bgdev.pl> <20171213112520.7479-2-brgl@bgdev.pl>
 <1513194279.27409.37.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:38525 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753234AbdLNOae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 09:30:34 -0500
Received: by mail-oi0-f67.google.com with SMTP id s9so4000328oie.5
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2017 06:30:34 -0800 (PST)
In-Reply-To: <1513194279.27409.37.camel@perches.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-13 20:44 GMT+01:00 Joe Perches <joe@perches.com>:
> On Wed, 2017-12-13 at 12:25 +0100, Bartosz Golaszewski wrote:
>> Users often pass a pointer to a static string to gpiochip_add_data()
>> family of functions. Avoid unnecessary memory allocations with the
>> provided helper routine.
> []
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> []
>> @@ -1171,9 +1171,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>>       }
>>
>>       if (chip->label)
>> -             gdev->label = kstrdup(chip->label, GFP_KERNEL);
>> +             gdev->label = kstrdup_const(chip->label, GFP_KERNEL);
>>       else
>> -             gdev->label = kstrdup("unknown", GFP_KERNEL);
>> +             gdev->label = kstrdup_const("unknown", GFP_KERNEL);
>
> A plain ?: would be more intelligible
> and a bit smaller object code too.
>
> ie:
>         gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);
>
>>       if (!gdev->label) {
>>               status = -ENOMEM;
>>               goto err_free_descs;
>

Good point. Sent v2.

Thanks,
Bartosz
