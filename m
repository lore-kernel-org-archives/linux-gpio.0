From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Fri, 3 Aug 2018 22:08:26 +0300
Message-ID: <CAHp75VdNf8BCYEq348CQe2OUUOLdYehsr5TmBDQXXEAm59+kDg@mail.gmail.com>
References: <20180801111243.2848-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801111243.2848-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 1, 2018 at 2:12 PM, Florian Eckert <fe@dev.tdt.de> wrote:

Thanks for the patch, my comments below.

> Add a new device driver "gpio-apu" which will now handle the GPIOs on
> APU2 and APU3 devices from PC Engines.

> - APU2/APU3 -> front button reset support
> - APU3 -> SIM switch support

Good.
Can we see some specification for those platforms?

> +/* PC Engines APU2/APU3 GPIO device driver
> + *
> + * Copyright (C) 2018 Florian Eckert <fe@dev.tdt.de>

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version
> + *
> + * This program is distributed in the hope that it will be useful
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>

SPDX, please!

> + */

> +#include <linux/gpio.h>
> +#include <linux/gpio_keys.h>

These both looks very strange in here.

> +#define APU_FCH_ACPI_MMIO_BASE 0xFED80000
> +#define APU_FCH_GPIO_BASE      (APU_FCH_ACPI_MMIO_BASE + 0x1500)

Wow! Can we see ACPI tables for these boards? Care to share (via some
file share service) output of `acpidump -o tables.dat` ?

> +#define APU_GPIO_BIT_WRITE     22
> +#define APU_GPIO_BIT_READ      16
> +#define APU_GPIO_BIT_DIR       23

WR and RD looks shorter,
And please keep them sorted by value.

> +#define APU_IOSIZE             sizeof(u32)

This is usual for x86 stuff, no need to have a definition, I think.

> +struct apu_gpio_pdata {
> +       struct platform_device *pdev;
> +       struct gpio_chip *chip;
> +       unsigned long *offset;
> +       void __iomem **addr;
> +       int iosize; /* for devm_ioremap() */
> +       spinlock_t lock;
> +};
> +
> +static struct apu_gpio_pdata *apu_gpio;
> +static struct platform_device *keydev;
> +
> +/* APU2 */
> +static unsigned long apu2_gpio_offset[APU2_NUM_GPIO] = {
> +       APU_FCH_GPIO_BASE + 89 * APU_IOSIZE, //KEY
> +};
> +static void __iomem *apu2_gpio_addr[APU2_NUM_GPIO] = {NULL};
> +
> +/* APU3 */
> +static unsigned long apu3_gpio_offset[APU3_NUM_GPIO] = {
> +       APU_FCH_GPIO_BASE + 89 * APU_IOSIZE, //KEY
> +       APU_FCH_GPIO_BASE + 90 * APU_IOSIZE, //SIM
> +};
> +static void __iomem *apu3_gpio_addr[APU3_NUM_GPIO] = {NULL, NULL};
> +

> +static int gpio_apu_get_dir (struct gpio_chip *chip, unsigned offset)

Style! We do not use space between func and its parameter list.

> +{
> +       u32 val;
> +
> +       spin_lock(&apu_gpio->lock);
> +

> +       val = ~ioread32(apu_gpio->addr[offset]);

This is unusual (I mean ~). Better to leave IO alone and do bits
manipulations latter on.

> +       val = (val >> APU_GPIO_BIT_DIR) & 1;

Do you need this under spin lock?

> +
> +       spin_unlock(&apu_gpio->lock);
> +
> +       return val;
> +}


> +static int gpio_apu_get_data (struct gpio_chip *chip, unsigned offset)
> +{
> +       u32 val;
> +
> +       spin_lock(&apu_gpio->lock);
> +
> +       val = ioread32(apu_gpio->addr[offset]);
> +       val = (val >> APU_GPIO_BIT_READ) & 1;
> +
> +       spin_unlock(&apu_gpio->lock);
> +
> +       return val;
> +}

Similar comments as per _get_dir().

> +static struct gpio_keys_button apu_gpio_keys[] = {

> +};
> +
> +static void register_gpio_keys_polled(int id, unsigned poll_interval,
> +                                     unsigned nbuttons,
> +                                     struct gpio_keys_button *buttons)
> +{

> +}

Above must not be here.

> +       if (dmi_match(DMI_PRODUCT_NAME, "APU3")) {
> +               apu_gpio->offset = apu3_gpio_offset;
> +               apu_gpio->addr = apu3_gpio_addr;
> +               apu_gpio->iosize = APU_IOSIZE;
> +               apu_gpio->chip->ngpio = ARRAY_SIZE(apu3_gpio_offset);
> +               for( i = 0; i < ARRAY_SIZE(apu3_gpio_offset); i++) {
> +                       apu3_gpio_addr[i] = devm_ioremap(&pdev->dev,
> +                                       apu_gpio->offset[i], apu_gpio->iosize);
> +                       if (!apu3_gpio_addr[i]) {
> +                               return -ENOMEM;
> +                       }
> +               }
> +       } else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
> +                  dmi_match(DMI_BOARD_NAME, "apu2") ||
> +                  dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
> +               apu_gpio->offset = apu2_gpio_offset;
> +               apu_gpio->addr = apu2_gpio_addr;
> +               apu_gpio->iosize = APU_IOSIZE;
> +               apu_gpio->chip->ngpio = ARRAY_SIZE(apu2_gpio_offset);
> +               for( i = 0; i < ARRAY_SIZE(apu2_gpio_offset); i++) {
> +                       apu2_gpio_addr[i] = devm_ioremap(&pdev->dev,
> +                                       apu_gpio->offset[i], apu_gpio->iosize);
> +                       if (!apu2_gpio_addr[i]) {
> +                               return -ENOMEM;
> +                       }
> +               }
> +       }

The above should be part either as callback or driver_data of DMI entries.

> +       ret = gpiochip_add(&gpio_apu_chip);

devm_

> +       if (ret) {

> +               pr_err("Adding gpiochip failed\n");

dev_err(), but I consider this message completely useless.

> +       }

> +
> +       register_gpio_keys_polled(-1, 20, ARRAY_SIZE(apu_gpio_keys), apu_gpio_keys);
> +

Not part of this driver. Remove.

> +       return ret;
> +}

> +module_init(apu_gpio_init);
> +module_exit(apu_gpio_exit);

Consider to use module_platform_driver() and accompanying data
structures and functions.

-- 
With Best Regards,
Andy Shevchenko
