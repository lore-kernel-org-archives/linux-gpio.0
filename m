From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Thu, 10 Nov 2016 18:19:22 +0200
Message-ID: <1478794762.5295.134.camel@linux.intel.com>
References: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
         <1478768430-13422-7-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478768430-13422-7-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Thu, 2016-11-10 at 17:00 +0800, Tan Jui Nee wrote:
> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.

@@ -161,6 +161,10 @@ obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+=
> intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)
> 		+= lpc_sch.o


>  lpc_ich-objs		:= lpc_ich_core.o
>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
> +lpc_ich-objs		:= lpc_ich_core.o

Once I pointed out on this.

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
> +#include <linux/pci.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/lpc_ich.h>
> +#include <linux/pinctrl/pinctrl.h>

Perhaps some order like

#include <linux/mfd/core.h>
#include <linux/mfd/lpc_ich.h>
#include <linux/pci.h>
#include <linux/pinctrl/pinctrl.h>

#include <asm/p2sb.h>

> +
> +#include "lpc_ich_apl.h"


> +int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset)
> +{

> +	unsigned int i;
> +	int ret;
> +	struct resource base;

Reversed tree, please:

	struct resource base;
	unsigned int i;
	int ret;

> +
> +	if (chipset != LPC_APL)
> +		return -ENODEV;
> +	/*
> +	 * Apollo lake, has not 1, but 4 gpio controllers,
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
> 

> +	if (ret)
> +warn_continue:

Better if you put label before if for sake of readability. I pointed
once to this.

> +		dev_warn(&dev->dev,
> +			"Failed to add Apollo Lake GPIO: %d\n",
> +				ret);
> +
> +	return ret;
> +}

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
