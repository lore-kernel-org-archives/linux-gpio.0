From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Thu, 7 Feb 2019 20:06:49 +0200
Message-ID: <CAHp75Vdn-3aBOMo1yzGVS-rWOdgiYasK++yfvzi3iSyOL4Mtqg@mail.gmail.com>
References: <1549559639-9447-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549559639-9447-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 7, 2019 at 7:14 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> GPIO platform driver for the AMD G-series PCH (eg. on GX-412TC)
>
> This driver doesn't registers itself automatically, as it needs to
> be provided with platform specific configuration, provided by some
> board driver setup code.
>
> Didn't implement oftree probing yet, as it's rarely found on x86.

Thanks for the patch, see my comments below.

Overall I have a feeling that this driver can be replaced with
existing generic one where one register per pin is allocated.
Unfortunately, I didn't look deep into this and hope Linus will help
to figure this out.

> @@ -0,0 +1,171 @@
> +/*
> + * GPIO driver for the AMD G series FCH (eg. GX-412TC)
> + *
> + * Copyright (C) 2018 metux IT consult
> + * Author: Enrico Weigelt <info@metux.net>
> + *

> + * SPDX-License-Identifier: GPL+

SPDX should go as a separate first line in a proper format.

> + */

> +// FIXME: add spinlocks

Then fix them and come again.

> +#include <linux/init.h>
> +#include <linux/module.h>

One of them should be present, another one dropped.

> +#define GPIO_BIT_DIR           23
> +#define GPIO_BIT_WRITE         22
> +#define GPIO_BIT_READ          16

Oh, namespace issues.
What about using BIT() macro?

> +
> +

Why two blank lines?

> +static uint32_t *amd_fch_gpio_addr(struct gpio_chip *gc, unsigned gpio)
> +{
> +       struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
> +

> +       if (gpio > priv->pdata->gpio_num) {
> +               dev_err(&priv->pdev->dev, "gpio number %d out of range\n", gpio);
> +               return NULL;
> +       }

On which circumstances it may happen?

> +
> +       return priv->base + priv->pdata->gpio_reg[gpio].reg*sizeof(u32);
> +}
> +
> +static int amd_fch_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> +{

> +       volatile uint32_t *ptr = amd_fch_gpio_addr(gc, offset);

volatile?!

I think you need to use readl()/writel() (or their _relaxed variants) instead.
Same applies for entire code.

> +       if (!ptr) return -EINVAL;

This code has style issues.
Check your entire file.

> +
> +       *ptr &= ~(1 << GPIO_BIT_DIR);
> +       return 0;
> +}

> +static void amd_fch_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
> +{
> +       struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
> +       (void)priv;
> +
> +       seq_printf(s, "debug info not implemented yet\n");
> +}

Remove whatever is not implemented and not required to have a stub.

> +static int amd_fch_gpio_request(struct gpio_chip *chip, unsigned gpio_pin)
> +{

> +       if (gpio_pin < chip->ngpio)
> +               return 0;

Is it even possible?

> +
> +       return -EINVAL;
> +}


> +
> +static int amd_fch_gpio_probe(struct platform_device *pdev)
> +{
> +       struct amd_fch_gpio_priv *priv;

> +       struct amd_fch_gpio_pdata *pdata = pdev->dev.platform_data;

We have a helper to get this. platform_get_data() IIRC.

> +       int err;
> +
> +       if (!pdata) {
> +               dev_err(&pdev->dev, "no platform_data\n");
> +               return -ENOENT;
> +       }
> +

> +       if (!(priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL))) {

Should be two lines.

> +               dev_err(&pdev->dev, "failed to allocate priv struct\n");

Noise.

> +               return -ENOMEM;
> +       }
> +

> +       if (IS_ERR(priv->base = devm_ioremap_resource(&pdev->dev, &priv->pdata->res))) {

> +               dev_err(&pdev->dev, "failed to map iomem\n");

Noise (that function will print a message)

> +               return -ENXIO;

Shadowed error code.

> +       }
> +

> +       dev_info(&pdev->dev, "initializing on my own II\n");

Noise.

> +

> +       if (IS_ENABLED(CONFIG_DEBUG_FS)) {

Do you really care?

> +               dev_info(&pdev->dev, "enabling debugfs\n");

Noise.

> +               priv->gc.dbg_show = amd_fch_gpio_dbg_show;
> +       }
> +
> +       platform_set_drvdata(pdev, priv);
> +

> +       err = devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
> +       dev_info(&pdev->dev, "probe finished\n");
> +       return err;

return devm_gpiochip_add_data(...);

> +}

> +MODULE_LICENSE("GPL");

License mismatch. I really don't look what 'GPL+' means. OTOH I know
this one corresponds to GPL-2.0+.

> +++ b/include/linux/platform_data/x86/amd-fch-gpio-pdata.h
> @@ -0,0 +1,41 @@
> +/*
> + * AMD FCH gpio driver platform-data
> + *
> + * Copyright (C) 2018 metux IT consult
> + * Author: Enrico Weigelt <info@metux.net>
> + *

> + * SPDX-License-Identifier: GPL

Same comments.

> + */

> +/*

It's not marked as kernel doc.

> + * struct amd_fch_gpio_reg - GPIO register definition
> + * @reg: register index
> + * @name: signal name
> + */
> +struct amd_fch_gpio_reg {
> +    int         reg;
> +    const char* name;
> +};

Isn't this provided by GPIO library? We have so called labels.

> +/*
> + * struct amd_fch_gpio_pdata - GPIO chip platform data
> + * @resource: iomem range
> + * @gpio_reg: array of gpio registers
> + * @gpio_num: number of entries
> + */
> +struct amd_fch_gpio_pdata {
> +    struct resource          res;
> +    int                      gpio_num;
> +    struct amd_fch_gpio_reg *gpio_reg;
> +    int                      gpio_base;
> +};

-- 
With Best Regards,
Andy Shevchenko
