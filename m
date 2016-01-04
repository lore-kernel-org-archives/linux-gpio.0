From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] gpio: Add driver for TI TPIC2810
Date: Mon, 4 Jan 2016 17:07:59 -0300
Message-ID: <CABxcv=nV-bMROukBHc8_a8soaTTGKEPq_Nz7AJLu1qNbwwxNBA@mail.gmail.com>
References: <1450210252-12121-1-git-send-email-afd@ti.com>
	<CACRpkdak90H+eZXH=9tZYzQ5DCZsYRXqF7i+tdAqQ8_Y0fcjug@mail.gmail.com>
	<56841820.3040807@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:32829 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbcADUH7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2016 15:07:59 -0500
Received: by mail-yk0-f174.google.com with SMTP id k129so237135501yke.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2016 12:07:59 -0800 (PST)
In-Reply-To: <56841820.3040807@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Andrew,

[snip]

>
>>> +static const struct i2c_device_id tpic2810_id_table[] = {
>>> +       { "tpic2810", },
>>> +       { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
>>> +
>>> +static struct i2c_driver tpic2810_driver = {
>>> +       .driver = {
>>> +               .name = "tpic2810",
>>> +       },
>>> +       .probe = tpic2810_probe,
>>> +       .remove = tpic2810_remove,
>>> +       .id_table = tpic2810_id_table,
>>> +};
>>> +module_i2c_driver(tpic2810_driver);
>>
>>
>> No device tree probing? Which platform uses this?
>> I was expecting an .of_match_table()  in .driver.
>>
>
> As far as I know .of_match_table and MODULE_ALIAS for
> DT have no real effect on I2C devices as they match
> on "anything,i2c_name". And only throw an I2C
> MODALIAS to userspace for loading. So we can use
> this device in a DTS without any driver modifications.
>
> At least it worked like this on my test platform
> (am57xx-evm).
>

Is true that it works due how the I2C core is implemented but IMHO
that is wrong and should be fixed at some point.

I posted a patch series [0] to fix most of the I2C drivers in
preparation for this so please add a proper OF table to not introduce
yet another issue to fix.

> I think it might be best to keep drivers DT agnostic
> when possible, in case DT is superseded by something,
> so we don't end up with mountains of dead code.
>

It isn't mountain of code but just simple tables to match a device
with a driver and to report proper module aliases.

The problem with using the I2C device ID as a fallback is that the DT
binding doc list the compatible strings that are valid for this device
but DTB can use "anything,i2c_name" as you said or just "i2c_name" and
so not following the DT bindings.

Also, it would cause problems if there are two I2C drivers with the
same "i2c_name" but a different vendor, so the vendor prefix is
important.

> Thanks,
> Andrew
>

[0]: https://lkml.org/lkml/2015/7/30/519

Best regards,
Javier
