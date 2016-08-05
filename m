From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/2] gpio: add Technologic I2C-FPGA gpio support
Date: Fri, 5 Aug 2016 18:45:49 -0400
Message-ID: <CAP=VYLotrmxG0q1g6fcWQqcfoSM6TMVwkOqMKZQbXtUZsAQkmA@mail.gmail.com>
References: <1470408106-8078-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1470408106-8078-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470408106-8078-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@savoirfairelinux.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 5, 2016 at 10:41 AM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:
> This driver is generic and aims to support all Technologic Systems's
> boards embedding FPGA GPIOs with an I2C interface.
>
> This driver supports TS-4900, TS-7970, TS-7990 and TS-4100 series.
>
> Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
> ---
>  drivers/gpio/Kconfig       |   6 ++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-ts4900.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 245 insertions(+)
>  create mode 100644 drivers/gpio/gpio-ts4900.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 98dd47a..459fb71 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -779,6 +779,12 @@ config GPIO_TPIC2810
>           To compile this driver as a module, choose M here: the module will
>           be called gpio-tpic2810.
>
> +config GPIO_TS4900
> +       bool "Technologic Systems FPGA I2C GPIO"

Please don't use module.h and MODULE_<xyz> macros in drivers that are bool.

Either delete all the module related stuff and use a builtin registration fcn,
or use a tristate Kconfig if there is a genuine use case for a modular driver.

Thanks,
Paul.
--

> +       help
> +         Say yes here to enabled the GPIO driver for Technologic's FPGA core.
> +         Series supported include TS-4100, TS-4900, TS-7970 and TS-7990.
> +
>  endmenu
>
>  menu "MFD GPIO expanders"
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2a035ed..4dcc21f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_TPS6586X) += gpio-tps6586x.o
>  obj-$(CONFIG_GPIO_TPS65910)    += gpio-tps65910.o
>  obj-$(CONFIG_GPIO_TPS65912)    += gpio-tps65912.o
>  obj-$(CONFIG_GPIO_TS4800)      += gpio-ts4800.o
> +obj-$(CONFIG_GPIO_TS4900)      += gpio-ts4900.o
>  obj-$(CONFIG_GPIO_TS5500)      += gpio-ts5500.o
>  obj-$(CONFIG_GPIO_TWL4030)     += gpio-twl4030.o
>  obj-$(CONFIG_GPIO_TWL6040)     += gpio-twl6040.o
> diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
> new file mode 100644
> index 0000000..104d1e0
> --- /dev/null
> +++ b/drivers/gpio/gpio-ts4900.c
> @@ -0,0 +1,238 @@
> +/*
> + * Digital I/O driver for Technologic Systems I2C FPGA Core
> + *
> + * Copyright (C) 2015 Technologic Systems
> + * Copyright (C) 2016 Savoir-Faire Linux
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether expressed or implied; without even the implied warranty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License version 2 for more details.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/i2c.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +

[...]

> +static const struct i2c_device_id ts4900_gpio_id_table[] = {
> +       { "ts4900-gpio", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ts4900_gpio_id_table);
> +
> +static struct i2c_driver ts4900_gpio_driver = {
> +       .driver = {
> +               .name = "ts4900-gpio",
> +               .of_match_table = ts4900_gpio_of_match_table,
> +       },
> +       .probe = ts4900_gpio_probe,
> +       .remove = ts4900_gpio_remove,
> +       .id_table = ts4900_gpio_id_table,
> +};
> +module_i2c_driver(ts4900_gpio_driver);
> +
> +MODULE_AUTHOR("Technologic Systems");
> +MODULE_DESCRIPTION("GPIO interface for Technologic Systems I2C-FPGA core");
> +MODULE_LICENSE("GPL");
> --
> 2.5.5
>
