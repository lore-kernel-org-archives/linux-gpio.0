From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add driver for TI TPIC2810
Date: Thu, 24 Dec 2015 00:29:58 +0100
Message-ID: <CACRpkdak90H+eZXH=9tZYzQ5DCZsYRXqF7i+tdAqQ8_Y0fcjug@mail.gmail.com>
References: <1450210252-12121-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32787 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbbLWX37 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Dec 2015 18:29:59 -0500
Received: by mail-ob0-f170.google.com with SMTP id bx1so57716491obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Dec 2015 15:29:59 -0800 (PST)
In-Reply-To: <1450210252-12121-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 15, 2015 at 9:10 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.
>
> The TPIC2810 has 8 open-drain outputs that can but used to drive
> LEDs and other low-side switched resistive loads.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

This patch will have to be rebased to apply and compile after the release
of kernel v4.5-rc1, as we have too much lined up right now, I see no
big problems
with it but here are some more minor comments.

 +static inline struct tpic2810 *to_tpic2810(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct tpic2810, chip);
> +}

We are getting rid of this design pattern, check the gpiochip_get_data()
function that will be introduced in v4.5-rc1 and patches I merge to all
other drivers.

> +static const struct i2c_device_id tpic2810_id_table[] = {
> +       { "tpic2810", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
> +
> +static struct i2c_driver tpic2810_driver = {
> +       .driver = {
> +               .name = "tpic2810",
> +       },
> +       .probe = tpic2810_probe,
> +       .remove = tpic2810_remove,
> +       .id_table = tpic2810_id_table,
> +};
> +module_i2c_driver(tpic2810_driver);

No device tree probing? Which platform uses this?
I was expecting an .of_match_table()  in .driver.

Yours,
Linus Walleij
