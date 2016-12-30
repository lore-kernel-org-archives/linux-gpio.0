From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: armada-37xx: Add gpio support
Date: Fri, 30 Dec 2016 09:51:51 +0100
Message-ID: <CACRpkdY_68=5oBN3TLs_ohc0gc2=yiG3qizg7MGh4F7Z+-ZzSg@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com> <20161222172501.16121-4-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:34094 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751410AbcL3IwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:52:06 -0500
Received: by mail-qt0-f181.google.com with SMTP id d45so168477401qta.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:51:56 -0800 (PST)
In-Reply-To: <20161222172501.16121-4-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Thu, Dec 22, 2016 at 6:24 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> GPIO management is pretty simple and is part of the same IP than the pin
> controller for the Armada 37xx SoCs.  This patch adds the GPIO support to
> the pinctrl-armada-37xx.c file, it also allows sharing common functions
> between the gpiolib and the pinctrl drivers.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Some remarks:

> +static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
> +                                         unsigned int offset)
> +{
> +       struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
> +       unsigned int reg = OUTPUT_EN;
> +       unsigned int val, mask;
> +
> +       if (offset >= GPIO_PER_REG) {
> +               offset -= GPIO_PER_REG;
> +               reg += sizeof(u32);
> +       }

Add a comment saying we never have more than two registers?
If there would be three registers this would fail, right?

> +       mask = BIT(offset);
> +
> +       regmap_read(info->regmap, reg, &val);
>
> +       return (val & mask) == 0;

Use this:

return !(val & mask);

> +static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
> +       unsigned int reg = INPUT_VAL;
> +       unsigned int val, mask;
> +
> +       if (offset >= GPIO_PER_REG) {
> +               offset -= GPIO_PER_REG;
> +               reg += sizeof(u32);
> +       }
> +       mask = BIT(offset);

This code is repeating. Break out a static (inline?) helper to do this.

> +static int armada_37xx_gpiolib_register(struct platform_device *pdev,
> +                                       struct armada_37xx_pinctrl *info)

Nit: gpiochip_register or so is more to the point.

> +       ret = gpiochip_add_pin_range(&info->gpio_chip, dev_name(dev), 0,
> +                                    pinbase, info->data->nr_pins);
> +       if (ret)
> +               return ret;

Why do you do this?

Why not just put the ranges into the device tree? We already support
this in the gpiolib core and it is helpful.

See Documentation/devicetree/bindings/gpio/gpio.txt
and other DTS files for gpio-ranges.

Yours,
Linus Walleij
