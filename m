From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Wed, 12 Oct 2016 13:23:05 +0300
Message-ID: <1476267785.11323.444.camel@linux.intel.com>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
         <1476255066-22653-7-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476255066-22653-7-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-10-12 at 14:51 +0800, Tan Jui Nee wrote:
> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.
> 

Almost minor issues below.

> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -161,6 +161,10 @@ obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+=
> intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
>  lpc_ich-objs		:= lpc_ich_core.o

^^^

>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
> +lpc_ich-objs		:= lpc_ich_core.o

^^^ duplication.

> +ifeq ($(CONFIG_X86_INTEL_IVI),y)
> +lpc_ich-objs += lpc_ich_apl.o
> +endif

> +++ b/drivers/mfd/lpc_ich_apl.c
> @@ -0,0 +1,120 @@
> +/*
> + * Intel Apollo Lake In-Vehicle Infotainment (IVI) systems used in
> cars support

> + *
> + * Copyright (C) 2016 Intel Corporation
> + *
> + * Author: Tan, Jui Nee <jui.nee.tan@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <asm/p2sb.h>

Hmm... asm stuff is platform specific, better to put it in separate
section like:

#include <linux/a.h>
#include <linux/d.h>

#include <asm/b.h>

#include "c.h"

> +#include <linux/pci.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/lpc_ich.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "lpc_ich_apl.h"
> +
> 

> +int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset)
> +{
> +	unsigned int i;
> +	int ret;
> +	struct resource base;
> +
> 

> +	if (chipset != LPC_APL)
> +		return -ENODEV;

Replace this by positive check (see below). Moreover -ENODEV will be
returned if no cells were added.

> +	/*
> +	 * Apollo lake, has not 1, but 4 gpio controllers,

Perhaps "Apollo lake has 4 gpio controllers,"

> +	 * handle it a bit differently.
> +	 */
> +
> +	ret = p2sb_bar(dev, PCI_DEVFN(PCI_IDSEL_P2SB, 0), &base);
> +	if (ret)
> +		goto warn_continue;
> +
> +	for (i = 0; i < APL_GPIO_COMMUNITY_MAX; i++) {
> +		struct resource *res = &apl_gpio_io_res[i];
> +
> +		/* Fill MEM resource */
> +		res->start += base.start;
> +		res->end += base.start;
> +		res->flags = base.flags;
> +
> +		res++;
> +	}
> +
> +	ret = mfd_add_devices(&dev->dev, 0,
> +		apl_gpio_devices, ARRAY_SIZE(apl_gpio_devices),
> +			NULL, 0, NULL);
> +

> +	if (ret)
> +warn_continue:

Swap them.

> +		dev_warn(&dev->dev,
> +			"Failed to add Apollo Lake GPIO: %d\n",
> +				ret);
> +
> +	return ret;
> +}


> +++ b/drivers/mfd/lpc_ich_apl.h
> @@ -0,0 +1,29 @@
> +/*
> + * lpc_ich_apl.h - Intel In-Vehicle Infotainment (IVI) systems used
> in cars
> + *                 support

> + *
> + * Copyright (C) 2016, Intel Corporation
> + *
> + * Author: Tan, Jui Nee <jui.nee.tan@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LPC_ICH_APL_H__
> +#define __LPC_ICH_APL_H__
> +
> +#include <linux/pci.h>
> +
> +#if IS_ENABLED(CONFIG_X86_INTEL_IVI)
> +int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset);
> +#else /* CONFIG_X86_INTEL_IVI is not set */
> +static inline int lpc_ich_add_gpio(struct pci_dev *dev,
> +	enum lpc_chipsets chipset)
> +{
> +	return -ENODEV;
> +}
> +#endif

Add comment here if you want to be looking like in p2sb.h.

> +
> +#endif
> 

> --- a/drivers/mfd/lpc_ich_core.c
> +++ b/drivers/mfd/lpc_ich_core.c
> @@ -70,6 +70,8 @@
>  #include <linux/mfd/lpc_ich.h>
>  #include <linux/platform_data/itco_wdt.h>
>  
> +#include "lpc_ich_apl.h"
> +
>  #define ACPIBASE		0x40
>  #define ACPIBASE_GPE_OFF	0x28
>  #define ACPIBASE_GPE_END	0x2f
> @@ -1032,6 +1034,9 @@ static int lpc_ich_probe(struct pci_dev *dev,
>  			cell_added = true;
>  	}
>  
> +	if (!lpc_ich_add_gpio(dev, priv->chipset))
> +		cell_added = true;
> +

Like it's already used:

if (priv->chipset == XXX) {
 do_yyy(dev);
 cell_added = true;
}


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
