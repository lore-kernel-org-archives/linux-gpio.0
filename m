From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Thu, 2 Aug 2018 23:30:00 +0200
Message-ID: <CACRpkdbY3w-ptUOkv5TUZh+5oEGU+4BLO_6=12QecRveTSBKSQ@mail.gmail.com>
References: <20180801111243.2848-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801111243.2848-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: fe@dev.tdt.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 1, 2018 at 1:12 PM Florian Eckert <fe@dev.tdt.de> wrote:

> Add a new device driver "gpio-apu" which will now handle the GPIOs on
> APU2 and APU3 devices from PC Engines.
>
> - APU2/APU3 -> front button reset support
> - APU3 -> SIM switch support
>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>

Hi Florian, thanks for the patch!

I looped in Andy Schevchenko and Mika Westerberg who are authorities on
x86 platform drivers in general and GPIO and pin control in particular so they
can help out with the review.

I'm a bit confused whether these things are really GPIOs or just
switches but since they can change direction they seem to be GPIOs.

I don't know if the placement of the driver is right either: I was under
the impression that this type of drivers should live under
drivers/platform/x86 but Andy can surely tell.

> +config GPIO_APU
> +       tristate "PC Engines APU2/APU3 GPIO support"
> +       depends on X86
> +       select GPIO_GENERIC

Thanks for activating the helpers! This makes everything simpler.
But your driver should (and can) use them too, just make sure to
call bgpio_init() with the right address offsets and everything should
just work.

> +       help
> +         Say Y here to support GPIO functionality on APU2/APU3 boards
> +         from PC Engines.
> +         - APU2/APU3 -> front button reset support
> +         - APU3 -> SIM switch support

I don't know about the approach to bundle GPIO keys into a GPIO
driver, but Andy will tell.

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

Instead of the big bulk of license text, use the simple oneline SPDX identifier.
In this case, at the top of the file:

// SPDX-License-Identifier: GPL-2.0

See Documentation/process/license-rules.rst for full info.

> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>

Use just <linux/driver.h> for GPIO drivers.

> +#define APU_FCH_ACPI_MMIO_BASE 0xFED80000

Hm this looks hardcoded. Isn't ACPI giving you the base address?
Not that I understand ACPI, but...

> +#define APU_FCH_GPIO_BASE      (APU_FCH_ACPI_MMIO_BASE + 0x1500)
> +#define APU_GPIO_BIT_WRITE     22
> +#define APU_GPIO_BIT_READ      16
> +#define APU_GPIO_BIT_DIR       23
> +#define APU_IOSIZE             sizeof(u32)
> +
> +#define APU2_NUM_GPIO          1
> +#define APU3_NUM_GPIO          2
> +
> +struct apu_gpio_pdata {
> +       struct platform_device *pdev;
> +       struct gpio_chip *chip;
> +       unsigned long *offset;
> +       void __iomem **addr;
> +       int iosize; /* for devm_ioremap() */

Can you keep this in a local variable? It doesn't seem like
it needs to be in the state container.

> +       spinlock_t lock;

I think checkpatch now mandates that you put in a comment
about what this lock is locking.

> +static struct apu_gpio_pdata *apu_gpio;
> +static struct platform_device *keydev;

I don't know a about static singletons, but I guess this would
only ever probe once, so it's probably OK, but Andy knows
better.

> +static int gpio_apu_get_dir (struct gpio_chip *chip, unsigned offset)
> +{
> +       u32 val;
> +
> +       spin_lock(&apu_gpio->lock);
> +
> +       val = ~ioread32(apu_gpio->addr[offset]);

Some comment on why this needs to be inversed?

> +       val = (val >> APU_GPIO_BIT_DIR) & 1;

I would write:

#include <linux/bitops.h>

val = !!(val & BIT(APU_GPIO_BIT_DIR);

or even fold into the read:

val = !!(~ioreaad() & BIT(APU_GPIO_BIT_DIR));

But this and all the other GPIO accessors go away if you use GPIO_GENERIC
properly with bgpio_init() and the right addresses and flags.

> +static struct gpio_chip gpio_apu_chip = {
> +       .label = "gpio-apu",
> +       .owner = THIS_MODULE,
> +       .base = -1,
> +       .get_direction = gpio_apu_get_dir,
> +       .direction_input = gpio_apu_dir_in,
> +       .direction_output = gpio_apu_dir_out,
> +       .get = gpio_apu_get_data,
> +       .set = gpio_apu_set_data,
> +};

So instead of a static GPIO chip leave the functions undefined
and call bgpio_init() that will set them up for MMIO GPIO.

> +static struct gpio_keys_button apu_gpio_keys[] = {
> +       {
> +               .desc           = "Reset button",
> +               .type           = EV_KEY,
> +               .code           = KEY_RESTART,
> +               .debounce_interval = 60,
> +               .gpio           = 510,
> +               .active_low     = 1,
> +       },
> +};

Andy has to tell whether he likes this idea.

> +       apu_gpio->pdev = pdev;
> +       apu_gpio->chip = &gpio_apu_chip;
> +       spin_lock_init(&apu_gpio->lock);
> +
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

So here, after figuring out the base addresses and all, call bgpio_init()
before adding the gpio_chip, which will set up the desired access
functions.

> +       ret = gpiochip_add(&gpio_apu_chip);
> +       if (ret) {
> +               pr_err("Adding gpiochip failed\n");
> +       }
> +
> +       register_gpio_keys_polled(-1, 20, ARRAY_SIZE(apu_gpio_keys), apu_gpio_keys);

I don't know if this is a good idea?

Yours,
Linus Walleij
