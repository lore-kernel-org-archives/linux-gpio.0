From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] added ams AS3722 gpio support
Date: Fri, 16 Aug 2013 17:38:37 +0200
Message-ID: <CACRpkdbMUz3ujrb-QP4d_Mrc7SxKUsNLOF9_qsBphfqp5nF76w@mail.gmail.com>
References: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:42914 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753802Ab3HPPii (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:38:38 -0400
Received: by mail-oa0-f43.google.com with SMTP id i10so2444075oag.16
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:38:37 -0700 (PDT)
In-Reply-To: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Lobmaier <florian.lobmaier@ams.com>, Mark Brown <broonie@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Wed, Aug 14, 2013 at 4:59 PM, Florian Lobmaier
<florian.lobmaier@ams.com> wrote:

> Signed-off-by: Florian Lobmaier <florian.lobmaier@ams.com>

Empty commit message on an entirely new driver?
Please elaborate a bit on the hardware, it's hard for me
to apply non-descript code.

> +config GPIO_AS3722
> +        tristate "ams AS3722 GPIO support"
> +        depends on MFD_AS3722

This driver is not in the mainline kernel, I can't understand the driver
unless you send the entire series.

(...)
> +static int as3722_gpio_direction_in(struct gpio_chip *chip, unsigned
> +               offset)
> +{
> +       struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
> +       struct as3722 *as3722 = as3722_gpio->as3722;
> +
> +       return as3722_set_bits(as3722, AS3722_GPIO0_CONTROL_REG + offset,
> +                              AS3722_GPIO_MODE_MASK,
> +                              AS3722_GPIO_MODE_INPUT);
(...)
> +       ret = as3722_reg_read(as3722, AS3722_GPIO_SIGNAL_IN_REG, &val);


These accessors is looking a lot like regmap being reimplemented.

Have you considered switching the core driver to use regmap?

This is definately to be fixed since it's using a new core MFD
driver.

> +static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
> +       struct as3722 *as3722 = as3722_gpio->as3722;
> +       int ret;
> +       u32 val;
> +
> +       ret = as3722_reg_read(as3722, AS3722_GPIO_SIGNAL_IN_REG, &val);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (val & (AS3722_GPIO1_SIGNAL_MASK << offset))
> +               return 1;
> +       else
> +               return 0;
> +}

Use this construct:
return !!(val & (AS3722_GPIO1_SIGNAL_MASK << offset));

> +static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
> +       struct as3722 *as3722 = as3722_gpio->as3722;
> +
> +       return regmap_irq_get_virq(as3722->irq_data, AS3722_IRQ_GPIO1 + offset);
> +}

And *here* yoy're using regmap, this looks messy.

Please use an irqdomain with the handling in the MFD core
instead so the driver get a translated IRQ base per AS3722 IRQ passed,
and get rid of this clunkiness.

For example see how we're handling this in ab8500-core.c
and abx500-pinctrl.c

> +static int as3722_gpio_probe(struct platform_device *pdev)
> +{
> +       struct as3722 *as3722 =  dev_get_drvdata(pdev->dev.parent);
> +       struct as3722_platform_data *pdata = dev_get_platdata(pdev->dev.parent);
> +       struct as3722_gpio *as3722_gpio;
> +       int ret;
> +
> +       as3722_gpio = devm_kzalloc(&pdev->dev,
> +                                  sizeof(*as3722_gpio), GFP_KERNEL);
> +       if (as3722_gpio == NULL)
> +               return -ENOMEM;

Just if (!as3722_gpio)

Yours,
Linus Walleij
