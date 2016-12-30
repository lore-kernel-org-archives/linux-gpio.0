From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: aramda-37xx: Add irqchip support
Date: Fri, 30 Dec 2016 09:58:06 +0100
Message-ID: <CACRpkdbR-WRT0rJp2CuN6CkZF=J35JUgGHjW7beyaimipz0ehw@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com> <20161222172501.16121-5-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:34390 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752302AbcL3I6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:58:07 -0500
Received: by mail-qk0-f182.google.com with SMTP id h201so152722538qke.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:58:07 -0800 (PST)
In-Reply-To: <20161222172501.16121-5-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Thu, Dec 22, 2016 at 6:24 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The Armada 37xx SoCs can handle interrupt through GPIO. However it can
> only manage the edge ones.
>
> The way the interrupt are managed are classical so we can use the generic
> interrupt chip model.
>
> The only unusual "feature" is that many interrupts are connected to the
> parent interrupt controller. But we do not take advantage of this and use
> the chained irq with all of them.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

So this is very simple and should use GPIOLIB_IRQCHIP.

Begin with select GPIOLIB_IRQCHIP in your Kconfig and then look
at conversions such as commit 85ae9e512f437cd09bf61564bdba29ab88bab3e3
("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
for inspiration.

> @@ -64,6 +71,8 @@ struct armada_37xx_pinctrl {
>         struct armada_37xx_pin_data     *data;
>         struct device                   *dev;
>         struct gpio_chip                gpio_chip;
> +       struct irq_chip                 irq_chip;
> +       struct irq_domain               *domain;

You don't need a domain when using GPIOLIB_IRQCHIP

> +static int armada_37xx_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
> +
> +       return irq_create_mapping(info->domain, offset);
> +}

Nor this.

The irqchip code should be pretty much the same but you need to
dereference gpio_chip from chip data and pick the irqchip from
there.

Yours,
Linus Walleij
