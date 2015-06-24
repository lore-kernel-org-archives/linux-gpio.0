From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Wed, 24 Jun 2015 21:09:28 +0800
Message-ID: <CAAQ0ZWSa7zSkNiwkAH0LooaiK+pnpQNsFcPaPrwgsYpatAg3cw@mail.gmail.com>
References: <1435138299-20561-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:36365 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbbFXNJ3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 09:09:29 -0400
Received: by igbiq7 with SMTP id iq7so96748625igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 06:09:28 -0700 (PDT)
In-Reply-To: <1435138299-20561-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>, Shawn Guo <shawnguo@kernel.org>

Jun,

A couple of comments below.

On Wed, Jun 24, 2015 at 5:31 PM, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add ZTE zx296702 GPIO controller support
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpio/Kconfig         |   6 +
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-zx296702.c | 324 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 drivers/gpio/gpio-zx296702.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index caefe80..aba5226 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -970,6 +970,12 @@ config GPIO_MC33880
>           SPI driver for Freescale MC33880 high-side/low-side switch.
>           This provides GPIO interface supporting inputs and outputs.
>
> +config GPIO_ZX296702
> +       bool "ZTE ZX296702 GPIO support"
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say yes here to support the ZTE ZX296702 GPIO device
> +

This GPIO block is available on ZTE ZX family SoCs, not only ZX296702.
I suggest you name the option GPIO_ZX and the driver gpio-zx.

[...]

> +static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
> +               int value)
> +{
> +       struct zx_gpio *chip = to_zx(gc);
> +       unsigned long flags;
> +       unsigned char gpiodir;

It's a 8-bit variable.  Is it what you want?  I guess you need to use
unsigned short to get a 16-bit variable.

Shawn

> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&chip->lock, flags);
> +       gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
> +       gpiodir |= BIT(offset);
> +       writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
> +
> +       if (value)
> +               writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
> +       else
> +               writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
> +       spin_unlock_irqrestore(&chip->lock, flags);
> +
> +       return 0;
> +}
