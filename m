From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC] gpio: Driver for SYSCON-based GPIOs
Date: Tue, 19 Nov 2013 09:47:47 +0100
Message-ID: <CACRpkdZfUnzejxRZ5eoiSV8bg-mkmdwQr0Dyf9tE=HJzVBH1UQ@mail.gmail.com>
References: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:48968 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818Ab3KSIrr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 03:47:47 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so3270759oag.6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 00:47:47 -0800 (PST)
In-Reply-To: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

On Fri, Nov 15, 2013 at 7:42 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> This is RFC only yet, so I did not add DT bindings for this
> driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Good idea. I like the general concept.

> +struct syscon_gpio_priv {
> +       struct gpio_chip        chip;
> +       struct regmap           *syscon;
> +       u32                     bit_offset;

Use a simple unsigned int for bit offset please.

> +static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
> +       unsigned int val;
> +       int ret;
> +
> +       ret = regmap_read(priv->syscon, priv->bit_offset / 32, &val);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !!(val & (priv->bit_offset % 32));
> +}

Grrr OK drivers/mfd/syscon has its regmap constrained like that:

static struct regmap_config syscon_regmap_config = {
        .reg_bits = 32,
        .val_bits = 32,
        .reg_stride = 4,
};

Assuming just like the people causing the y2k problem that
"32 bits ought to fit everyone".

This is not your fault, but I'd like you to insert a big comment
explaining that the syscon driver semantics hammer down the
32 bit register width and there is nothing you can do about it.

Yours,
Linus Walleij
