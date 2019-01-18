From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2] pinctrl: freescale: fix link errors
Date: Fri, 18 Jan 2019 08:22:18 +0000
Message-ID: <AM0PR04MB4211E227D5F21802479C6ABC809C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190114111327.27272-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114111327.27272-1-anders.roxell@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

> From: Anders Roxell [mailto:anders.roxell@linaro.org]
> Sent: Monday, January 14, 2019 7:13 PM
> Subject: [PATCH v2] pinctrl: freescale: fix link errors
>=20
> Fix link errors when PINCTRL_IMX_SCU, PINCTRL_IMX8QM or
> PINCTRL_IMXBQXP is enabled as a module and the dependent module is
> built-in.
>=20
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinctrl_sc_=
ipc_init':
> pinctrl-scu.c:(.text+0x10): undefined reference to `imx_scu_get_handle'
> ld: pinctrl-scu.c:(.text+0x10): relocation truncated to fit: R_AARCH64_CA=
LL26
> against undefined symbol `imx_scu_get_handle'
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_get=
_scu':
> pinctrl-scu.c:(.text+0xa0): undefined reference to `imx_scu_call_rpc'
> ld: pinctrl-scu.c:(.text+0xa0): relocation truncated to fit: R_AARCH64_CA=
LL26
> against undefined symbol `imx_scu_call_rpc'
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_set=
_scu':
> pinctrl-scu.c:(.text+0x1b4): undefined reference to `imx_scu_call_rpc'
> ld: pinctrl-scu.c:(.text+0x1b4): relocation truncated to fit: R_AARCH64_C=
ALL26
> against undefined symbol `imx_scu_call_rpc'
> ld: drivers/pinctrl/freescale/pinctrl-imx8qxp.o: in function
> `imx8qxp_pinctrl_probe':
> pinctrl-imx8qxp.c:(.text+0x28): undefined reference to `imx_pinctrl_probe=
'
> ld: pinctrl-imx8qxp.c:(.text+0x28): relocation truncated to fit:
> R_AARCH64_CALL26 against undefined symbol `imx_pinctrl_probe'
>=20
> Rework so that PINCTRL_IMX_SCU and the config's that 'select
> PINCTRL_IMX_SCU' depends on IMX_SCU=3Dy.
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the fix.

> ---
>  drivers/pinctrl/freescale/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescal=
e/Kconfig
> index b318c24b61be..a599b72b350a 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_IMX
>=20
>  config PINCTRL_IMX_SCU
>  	bool
> -	depends on IMX_SCU
> +	depends on IMX_SCU=3Dy
>  	select PINCTRL_IMX
>=20
>  config PINCTRL_IMX1_CORE
> @@ -131,14 +131,14 @@ config PINCTRL_IMX8MQ
>=20
>  config PINCTRL_IMX8QM
>  	bool "IMX8QM pinctrl driver"
> -	depends on ARCH_MXC && ARM64
> +	depends on IMX_SCU=3Dy && ARCH_MXC && ARM64

Neither IMX_SCU nor PINCTRL_IMX8QM can be built as module.
So I guess the fix could be simply:
depends on IMX_SCU && ARCH_MXC && ARM64

>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qm pinctrl driver
>=20
>  config PINCTRL_IMX8QXP
>  	bool "IMX8QXP pinctrl driver"
> -	depends on ARCH_MXC && ARM64
> +	depends on IMX_SCU=3Dy && ARCH_MXC && ARM64

Ditto

Can you please check if this works and update the commit log accordingly?

Regards
Dong Aisheng

>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qxp pinctrl driver
> --
> 2.19.2
