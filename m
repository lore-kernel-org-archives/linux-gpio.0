From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 28 Jun 2016 11:49:46 +0300
Message-ID: <CAHp75VfG+3EPy3TZ=Co098zTXzmd5ekWbrhZ759CEKFMzyEiUw@mail.gmail.com>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com> <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, ptyser@xes-inc.com, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2016 at 10:56 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:
> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.

> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -369,8 +369,9 @@ config MFD_INTEL_QUARK_I2C_GPIO
>
>  config LPC_ICH
>         tristate "Intel ICH LPC"
> -       depends on PCI
> +       depends on X86 && PCI

This might deserve to be a separate change. Lee, what is your opinion?

>         select MFD_CORE
> +       select P2SB

This is okay

> @@ -155,7 +155,7 @@ obj-$(CONFIG_PMIC_ADP5520)  += adp5520.o
>  obj-$(CONFIG_MFD_KEMPLD)       += kempld-core.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO) += intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)          += lpc_sch.o

> -lpc_ich-objs           := lpc_ich-core.o
> +lpc_ich-objs           := lpc_ich-core.o lpc_ich-apl.o
>  obj-$(CONFIG_LPC_ICH)          += lpc_ich.o

I don't know if there is any requirement, but what I see in other Makefiles is

obj-$(CONFIG_DRV_OPTION) = drv_name.o
drv_name-objs := main.o aux1.o

Perhaps you may do the same.

> +++ b/drivers/mfd/lpc_ich-apl.c
> @@ -0,0 +1,126 @@
> +/*
> + * Purpose: Create a platform device to bind with Intel Apollo Lake
> + * Pinctrl GPIO platform driver
> + * Copyright (C) 2016 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/lpc_ich.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <asm/p2sb.h>
> +

> +#if defined(CONFIG_X86_INTEL_APL)

And why you can't use

ifeq ($(CONFIG_...,y))
lpc_ich-objs += ...
endif

in the Makefile?

> +/* Offset data for Apollo Lake GPIO communities */
> +#define APL_GPIO_SOUTHWEST_OFFSET      0xc00000
> +#define APL_GPIO_NORTHWEST_OFFSET      0xc40000
> +#define APL_GPIO_NORTH_OFFSET          0xc50000
> +#define APL_GPIO_WEST_OFFSET           0xc70000
> +
> +#define APL_GPIO_SOUTHWEST_NPIN                43
> +#define APL_GPIO_NORTHWEST_NPIN                77
> +#define APL_GPIO_NORTH_NPIN            78
> +#define APL_GPIO_WEST_NPIN             47
> +
> +#define APL_GPIO_IRQ 14
> +
> +#define PCI_IDSEL_P2SB 0x0d
> +
> +static struct resource apl_gpio_io_res[] = {
> +       DEFINE_RES_MEM_NAMED(APL_GPIO_NORTH_OFFSET,
> +               APL_GPIO_NORTH_NPIN * SZ_8, "apl_pinctrl_n"),
> +       DEFINE_RES_MEM_NAMED(APL_GPIO_NORTHWEST_OFFSET,
> +               APL_GPIO_NORTHWEST_NPIN * SZ_8, "apl_pinctrl_nw"),
> +       DEFINE_RES_MEM_NAMED(APL_GPIO_WEST_OFFSET,
> +               APL_GPIO_WEST_NPIN * SZ_8, "apl_pinctrl_w"),
> +       DEFINE_RES_MEM_NAMED(APL_GPIO_SOUTHWEST_OFFSET,
> +               APL_GPIO_SOUTHWEST_NPIN * SZ_8, "apl_pinctrl_sw"),
> +       DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +};
> +
> +static struct pinctrl_pin_desc apl_pinctrl_pdata;
> +
> +static struct mfd_cell apl_gpio_devices[] = {
> +       {
> +               .name = "apl-pinctrl",
> +               .id = 0,
> +               .num_resources = ARRAY_SIZE(apl_gpio_io_res),
> +               .resources = apl_gpio_io_res,
> +               .pdata_size = sizeof(apl_pinctrl_pdata),
> +               .platform_data = &apl_pinctrl_pdata,
> +               .ignore_resource_conflicts = true,
> +       },
> +       {
> +               .name = "apl-pinctrl",
> +               .id = 1,
> +               .num_resources = ARRAY_SIZE(apl_gpio_io_res),
> +               .resources = apl_gpio_io_res,
> +               .pdata_size = sizeof(apl_pinctrl_pdata),
> +               .platform_data = &apl_pinctrl_pdata,
> +               .ignore_resource_conflicts = true,
> +       },
> +       {
> +               .name = "apl-pinctrl",
> +               .id = 2,
> +               .num_resources = ARRAY_SIZE(apl_gpio_io_res),
> +               .resources = apl_gpio_io_res,
> +               .pdata_size = sizeof(apl_pinctrl_pdata),
> +               .platform_data = &apl_pinctrl_pdata,
> +               .ignore_resource_conflicts = true,
> +       },
> +       {
> +               .name = "apl-pinctrl",
> +               .id = 3,
> +               .num_resources = ARRAY_SIZE(apl_gpio_io_res),
> +               .resources = apl_gpio_io_res,
> +               .pdata_size = sizeof(apl_pinctrl_pdata),
> +               .platform_data = &apl_pinctrl_pdata,
> +               .ignore_resource_conflicts = true,
> +       },
> +};
> +
> +int lpc_ich_misc(struct pci_dev *dev)
> +{
> +       unsigned int apl_p2sb = PCI_DEVFN(PCI_IDSEL_P2SB, 0);
> +       unsigned int i;
> +       int ret;
> +
> +       /*
> +        * Apollo lake, has not 1, but 4 gpio controllers,
> +        * handle it a bit differently.
> +        */
> +
> +       for (i = 0; i < ARRAY_SIZE(apl_gpio_io_res)-1; i++) {
> +               struct resource *res = &apl_gpio_io_res[i];
> +
> +               apl_gpio_devices[i].resources = res;
> +
> +               /* Fill MEM resource */
> +               ret = p2sb_bar(dev, apl_p2sb, res++);
> +               if (ret)
> +                       goto warn_continue;
> +
> +               apl_pinctrl_pdata.name = kasprintf(GFP_KERNEL, "%u",
> +                       i + 1);
> +       }
> +
> +       if (apl_pinctrl_pdata.name)
> +               ret = mfd_add_devices(&dev->dev, apl_gpio_devices->id,
> +                       apl_gpio_devices, ARRAY_SIZE(apl_gpio_devices),
> +                               NULL, 0, NULL);
> +       else
> +               ret = -ENOMEM;
> +
> +warn_continue:
> +       if (ret)
> +               dev_warn(&dev->dev,
> +                       "Failed to add Apollo Lake GPIO %s: %d\n",
> +                               apl_pinctrl_pdata.name, ret);
> +
> +       kfree(apl_pinctrl_pdata.name);
> +       return 0;
> +}
> +#endif

Regarding to the above I don't see Lee's comments addressed. Can you
remind whar is the result of that discussion?

> +       if (priv->chipset == LPC_APL) {
> +               ret = lpc_ich_misc(dev);
> +               if (!ret)
> +                       cell_added = true;
> +       }

It might be better to call via pointer in the struct lpc_ich_info.

> --- a/include/linux/mfd/lpc_ich.h
> +++ b/include/linux/mfd/lpc_ich.h
> @@ -43,4 +43,11 @@ struct lpc_ich_info {
>         u8 use_gpio;
>  };

> +#if defined(CONFIG_X86_INTEL_APL)
> +int lpc_ich_misc(struct pci_dev *dev);
> +#else
> +static inline int lpc_ich_misc(struct pci_dev *dev)
> +{ return -ENODEV; }

It could be one line, ...

> +#endif

...but the name of this function should not be so generic. What if
tomorrow you will get one more module which needs one more function?

Moreover this is a part of internal driver interface, I would move
this part into special header under drivers/mfd.

-- 
With Best Regards,
Andy Shevchenko
