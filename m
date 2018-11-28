From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: Add driver for PC Engines APU boards
Date: Wed, 28 Nov 2018 14:00:10 +0200
Message-ID: <CAHp75Vc0-t=nBGPbYjbaJDoPEg77xKLVDuhUtFQ6imgnkNuz-g@mail.gmail.com>
References: <20181127132508.5501-1-fe@dev.tdt.de> <20181127132508.5501-2-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127132508.5501-2-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 27, 2018 at 3:25 PM Florian Eckert <fe@dev.tdt.de> wrote:
>
> Add a new device driver "gpio-apu" which will handle the GPIOs on APU2
> and APU3 devices from PC Engines.
>
> APU2 (https://pcengines.ch/schema/apu2c.pdf page 7):
> - G32 is "button_reset" connected to the smd-button on the frontpanel
> - G50 is "mpcie2_reset" connected to mPCIe2 reset line
> - G51 is "mpcie3_reset" connected to mPCIe3 reset line
>
> APU3 (https://pcengines.ch/schema/apu3c.pdf page 7):
> - G32 is "button_reset" connected to the smd-button on the frontpanel
> - G50 is "mpcie2_reset" connected to mPCIe2 reset line
> - G51 is "mpcie3_reset" connected to mPCIe3 reset line
> - G33 is "simswap" connected to SIM switch IC to swap the SIM between
>   mPCIe2 and mPCIe3 slot

> +/* PC Engines APU2/APU3 GPIO device driver
> + *
> + * Copyright (C) 2018 Florian Eckert <fe@dev.tdt.de>
> + */

/*
 * Multi-line comments
 * have this style
 */

> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>

kbuild bot complains for absence of

#include <linux/mod_devicetable.h>

here.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>

> +static int gpio_apu_get_dir(struct gpio_chip *chip, unsigned int offset)
> +{
> +       u32 val;
> +       struct apu_gpio_pdata *apu_gpio = gpiochip_get_data(chip);
> +
> +       spin_lock(&apu_gpio->lock);
> +

> +       val = ~ioread32(apu_gpio->addr[offset]);

There is no need to do ~ under spin lock.

> +
> +       spin_unlock(&apu_gpio->lock);
> +
> +       return !!(val & BIT(APU_GPIO_BIT_DIR));
> +}

> +       if (dmi_check_system(apu3_gpio_dmi_table)) {

(1)

> +               apu_gpio->addr = devm_kzalloc(&pdev->dev,
> +                               sizeof(apu3_gpio_offset),
> +                               GFP_KERNEL);

> +

No need to have this blank line. Same for the other cases.

> +               if (!apu_gpio->addr)
> +                       return -ENOMEM;

> +       } else if (dmi_check_system(apu2_gpio_dmi_table)) {

(2)

I think I have already told about (1) and (2). You may create two
callbacks and utilize .callback member in DMI table.

> +       }

> +static int __init apu_gpio_init(void)
> +{

> +       if (!(dmi_check_system(apu2_gpio_dmi_table)) &&
> +               !(dmi_check_system(apu3_gpio_dmi_table))) {
> +               pr_err("No PC Engines board detected\n");
> +               return -ENODEV;
> +       }

I don't think we need this.

> +       apu_gpio_pdev = platform_device_register_simple(KBUILD_MODNAME,
> +                       -1, NULL, 0);
> +       if (IS_ERR(apu_gpio_pdev))
> +               return PTR_ERR(apu_gpio_pdev);
> +
> +
> +       return platform_driver_register(&apu_gpio_driver);
> +}
> +
> +static void __exit apu_gpio_exit(void)
> +{
> +       platform_device_unregister(apu_gpio_pdev);
> +       platform_driver_unregister(&apu_gpio_driver);
> +}
> +
> +module_init(apu_gpio_init);
> +module_exit(apu_gpio_exit);

After removing unneeded checks why not to simple use
module_platform_driver()
?

-- 
With Best Regards,
Andy Shevchenko
