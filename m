From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH mfd+gpio 1/2] drivers: mfd: Add support for Moxtet bus
Date: Tue, 11 Sep 2018 15:43:20 +0100
Message-ID: <20180911144320.GV4185@dell>
References: <20180830144151.13417-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830144151.13417-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 30 Aug 2018, Marek Behún wrote:

> On the Turris Mox router there can be connected different modules to
> the main CPU board, currently a module with a SFP cage, a module with
> MiniPCIe connector, a 4-port switch module and a 8-port switch module,
> for example:
>   [CPU]-[PCIe]-[8-port switch]-[8-port switch]-[SFP]
> 
> Each of this modules has an input and output shift register, and these
> are connected via SPI to CPU board.
> 
> Via this SPI connection we are able to discover which modules are
> connected and we can also read/write some configuration to the modules.
> Fromi/to each module 8 bits can be read (of which lower 4 bits identify
> the module) and written.
> 
> For example from the module with a SFP cage we can read the LOS,
> TX-FAULT and MOD-DEF0 signals, while we can write TX-DISABLE and
> RATE-SELECT signals.
> 
> Other modules may support something else.
> 
> This driver creates a new bus type, called "moxtet". For each Mox module
> it finds via SPI, it creates a new device on the moxtet bus so that
> drivers can be written for them, for example a gpio driver for the
> module with a SFP cage.
> 
> The topology of how Mox modules are connected can then be read by
> listing /sys/bus/moxtet/devices.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>  Documentation/devicetree/bindings/mfd/moxtet.txt |  36 ++

This should be supplied in a separate patch.

>  MAINTAINERS                                      |   7 +

As above please.

>  drivers/mfd/Kconfig                              |  10 +
>  drivers/mfd/Makefile                             |   1 +
>  drivers/mfd/moxtet.c                             | 501 +++++++++++++++++++++++
>  include/linux/mfd/moxtet.h                       | 103 +++++
>  6 files changed, 658 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/moxtet.txt
>  create mode 100644 drivers/mfd/moxtet.c
>  create mode 100644 include/linux/mfd/moxtet.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/moxtet.txt b/Documentation/devicetree/bindings/mfd/moxtet.txt
> new file mode 100644
> index 000000000000..02b96fbd5ddd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/moxtet.txt
> @@ -0,0 +1,36 @@
> +Turris Mox module configuration bus (over SPI)
> +
> +Required properties:
> + - compatible		: Should be "cznic,moxtet".
> + - #address-cells	: Has to be 1
> + - #size-cells		: Has to be 0
> +For other required and optional properties of SPI slave
> +nodes please refer to ../spi/spi-bus.txt.

This line is cut unnecessarily short.

> +Required properties of subnodes:
> + - reg			: Should be position on the Moxtet bus
> + - moxtet,id		: Should be ID of the Moxtet device connected

What is this used for?

> +The driver finds the devices connected to the bus by itself, but it may be
> +needed to reference some of them from other parts of the device tree. In that
> +case the devices can be defined as subnodes of the moxtet node.
> +
> +Example:
> +
> +	moxtet@1 {

Does the device itself have a address, or is it only contactable via
SPI?

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "cznic,moxtet";
> +		reg = <1>;
> +		spi-max-frequency = <1000000>;
> +		spi-cpol;
> +		spi-cpha;
> +
> +		moxtet_sfp: moxtet-sfp@0 {
> +			compatible = "cznic,moxtet-sfp";
> +			gpio-controller;
> +			#gpio-cells;
> +			reg = <0>;
> +			moxtet,id = <1>;
> +		}
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5b256b25905..84e60ee83951 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1412,6 +1412,13 @@ F:	drivers/clocksource/timer-prima2.c
>  F:	drivers/clocksource/timer-atlas7.c
>  N:	[^a-z]sirf
>  
> +ARM/CZ.NIC TURRIS MOX SUPPORT
> +M:	Marek Behun <marek.behun@nic.cz>
> +W:	http://mox.turris.cz
> +S:	Maintained
> +F:	include/mfd/moxtet.h
> +F:	drivers/mfd/moxtet.c
> +
>  ARM/EBSA110 MACHINE SUPPORT
>  M:	Russell King <linux@armlinux.org.uk>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 11841f4b7b2b..cb401841e2ac 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -814,6 +814,16 @@ config MFD_MAX8998
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MOXTET
> +	tristate "CZ.NIC Turris Mox module configuration bus"
> +	depends on SPI_MASTER && OF
> +	help
> +	  Say yes here to add support for the module configuration bus found
> +	  on CZ.NIC's Turris Mox. This is needed for the ability to read
> +	  in what order the modules are connected and to get/set some of
> +	  their settings. For example the GPIOs on Mox SFP module are
> +	  configured through this bus.
> +
>  config MFD_MT6397
>  	tristate "MediaTek MT6397 PMIC Support"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 5856a9489cbd..338ecf311911 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -159,6 +159,7 @@ max8925-objs			:= max8925-core.o max8925-i2c.o
>  obj-$(CONFIG_MFD_MAX8925)	+= max8925.o
>  obj-$(CONFIG_MFD_MAX8997)	+= max8997.o max8997-irq.o
>  obj-$(CONFIG_MFD_MAX8998)	+= max8998.o max8998-irq.o
> +obj-$(CONFIG_MFD_MOXTET)	+= moxtet.o
>  
>  pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
>  obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
> diff --git a/drivers/mfd/moxtet.c b/drivers/mfd/moxtet.c
> new file mode 100644
> index 000000000000..1cd1a62002e7
> --- /dev/null
> +++ b/drivers/mfd/moxtet.c
> @@ -0,0 +1,501 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Turris Mox module configuration bus driver
> + *
> + * Copyright (C) 2018 Marek Behun <marek.behun@nic.cz>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <linux/mfd/moxtet.h>

Alphabetical please.

Right, I can probably save us a both a great deal of time here and
tell you right off of the bat that this is not an MFD.  MFDs will
either use the MFD API or something like of_platform_populate().

Glancing over the reminder of the driver, it looks like an alternative
of MFD or at least MFD-like.  I think drivers/platform would be a
better fit.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
