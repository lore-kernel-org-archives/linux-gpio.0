From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/3] pinctrl: freescale: Add i.MX8MN pinctrl driver support
Date: Tue, 11 Jun 2019 10:45:51 +0000
Message-ID: <AM0PR04MB4211964EA3993A99465D861980ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <20190530030546.9224-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190530030546.9224-2-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Leonard Crestez <leonard.crestez@nxp.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, enric.balletbo@collabo
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

> From: Anson.Huang@nxp.com [mailto:Anson.Huang@nxp.com]
> Sent: Thursday, May 30, 2019 11:06 AM
> 
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add the pinctrl driver support for i.MX8MN.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/pinctrl/freescale/Kconfig          |   7 +
>  drivers/pinctrl/freescale/Makefile         |   1 +
>  drivers/pinctrl/freescale/pinctrl-imx8mn.c | 348
> +++++++++++++++++++++++++++++
>  3 files changed, 356 insertions(+)
>  create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mn.c
> 
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index aeab0d9..4ff52fa 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -123,6 +123,13 @@ config PINCTRL_IMX7ULP
>  	help
>  	  Say Y here to enable the imx7ulp pinctrl driver
> 
> +config PINCTRL_IMX8MN

Nitpick: this seems should be under imx8mm if in alphabetical order

> +	bool "IMX8MN pinctrl driver"
> +	depends on ARCH_MXC && ARM64
> +	select PINCTRL_IMX
> +	help
> +	  Say Y here to enable the imx8mn pinctrl driver
> +
>  config PINCTRL_IMX8MM
>  	bool "IMX8MM pinctrl driver"
>  	depends on ARCH_MXC && ARM64
> diff --git a/drivers/pinctrl/freescale/Makefile
> b/drivers/pinctrl/freescale/Makefile
> index 02020a7..18225da 100644
> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_IMX6SX)	+= pinctrl-imx6sx.o
>  obj-$(CONFIG_PINCTRL_IMX6UL)	+= pinctrl-imx6ul.o
>  obj-$(CONFIG_PINCTRL_IMX7D)	+= pinctrl-imx7d.o
>  obj-$(CONFIG_PINCTRL_IMX7ULP)	+= pinctrl-imx7ulp.o
> +obj-$(CONFIG_PINCTRL_IMX8MN)	+= pinctrl-imx8mn.o

ditto

>  obj-$(CONFIG_PINCTRL_IMX8MM)	+= pinctrl-imx8mm.o
>  obj-$(CONFIG_PINCTRL_IMX8MQ)	+= pinctrl-imx8mq.o
>  obj-$(CONFIG_PINCTRL_IMX8QM)	+= pinctrl-imx8qm.o
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> new file mode 100644
> index 0000000..67161df
> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2018-2019 NXP
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/of_device.h>

This could be of.h

Otherwise:
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
