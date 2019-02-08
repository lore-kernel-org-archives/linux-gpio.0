From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Fri, 8 Feb 2019 15:25:44 +0100
Message-ID: <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549588593-4856-1-git-send-email-lkml@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Enrico!

Thanks for your patch! I would really like Andy to have a look at it
too, he's more on top of things in the x86 world.

On Fri, Feb 8, 2019 at 2:16 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> From: "Enrico Weigelt, metux IT consult" <info@metux.net>
>
> GPIO platform driver for the AMD G-series PCH (eg. on GX-412TC)
>
> This driver doesn't registers itself automatically, as it needs to
> be provided with platform specific configuration, provided by some
> board driver setup code.
>
> Didn't implement oftree probing yet, as it's rarely found on x86.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org
> Cc: bgolaszewski@baylibre.com
> Cc: dvhart@infradead.org
> Cc: andy@infradead.org
> Cc: platform-driver-x86@vger.kernel.org
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

(...)

> +config GPIO_AMD_FCH
> +       tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
> +       select GPIO_GENERIC

You are selecting GPIO_GENERIC, is this necessary? I thought
X86 was already selecting this.

> +/*
> + * GPIO driver for the AMD G series FCH (eg. GX-412TC)
> + *
> + * Copyright (C) 2018 metux IT consult
> + * Author: Enrico Weigelt <info@metux.net>
> + *
> + * SPDX-License-Identifier: GPL+
> + */

I think checkpatch will complain on that SPDX thing.
Copy something from one of the other drivers, it should be
on the first line of the file.

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_data/x86/amd-fch-gpio-pdata.h>
> +
> +
> +#define GPIO_BIT_DIR           23
> +#define GPIO_BIT_WRITE         22
> +#define GPIO_BIT_READ          16
> +
> +

Cut down the excessive newlines.

> +static void amd_fch_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
> +{
> +       struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
> +       (void)priv;
> +
> +       seq_printf(s, "debug info not implemented yet\n");
> +}

I think you can just skip implementing this then.

> +static int amd_fch_gpio_request(struct gpio_chip *chip, unsigned gpio_pin)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               return 0;
> +
> +       return -EINVAL;
> +}

You can probably skip this too. The core already does this check.

> +       priv->gc.owner                  = THIS_MODULE;
> +       priv->gc.parent                 = &pdev->dev;
> +       priv->gc.label                  = dev_name(&pdev->dev);
> +       priv->gc.base                   = priv->pdata->gpio_base;

No please, use priv->gc.base = -1;

> +       dev_info(&pdev->dev, "initializing on my own II\n");

Drop this.

> +       if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> +               dev_info(&pdev->dev, "enabling debugfs\n");
> +               priv->gc.dbg_show = amd_fch_gpio_dbg_show;
> +       }

I think you can drop this too.

> +       platform_set_drvdata(pdev, priv);
> +
> +       err = devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
> +       dev_info(&pdev->dev, "probe finished\n");

If you keep this info, write something more helpful.

> +/*
> + * struct amd_fch_gpio_reg - GPIO register definition
> + * @reg: register index
> + * @name: signal name
> + */
> +struct amd_fch_gpio_reg {
> +    int         reg;
> +    const char* name;
> +};

Can't you put this in the driver file?

> +struct amd_fch_gpio_pdata {
> +    struct resource          res;
> +    int                      gpio_num;
> +    struct amd_fch_gpio_reg *gpio_reg;
> +    int                      gpio_base;
> +};

Drop gpio_base. We don't hardcode the GPIO base anymore.
Use the character device instead if you want it because of
userspace thingies. (See tools/gpio/*)

Yours,
Linus Walleij
