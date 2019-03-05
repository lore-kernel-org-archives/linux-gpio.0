From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] pinctrl: freescale: fix link errors
Date: Tue, 5 Mar 2019 03:00:42 +0000
Message-ID: <AM0PR04MB42119B4C4FE9DE3A352A0FB480720@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190304202640.1765847-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304202640.1765847-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>, =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Arnd,

> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Tuesday, March 5, 2019 4:26 AM
>=20
> Submitted by Anders Roxell already
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

How would suggest to handle this patch?

I've already given an Ack to Andres' v3 patch with a few additional comment=
s,
but seems did not see any follow ups.

https://lore.kernel.org/patchwork/patch/1034330/

Regards
Dong Aisheng

> ---
>  drivers/pinctrl/freescale/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescal=
e/Kconfig
> index e6dff3167a67..e447b996e79f 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -138,14 +138,14 @@ config PINCTRL_IMX8MQ
>=20
>  config PINCTRL_IMX8QM
>  	bool "IMX8QM pinctrl driver"
> -	depends on ARCH_MXC && ARM64
> +	depends on ARCH_MXC && ARM64 && IMX_SCU
>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qm pinctrl driver
>=20
>  config PINCTRL_IMX8QXP
>  	bool "IMX8QXP pinctrl driver"
> -	depends on ARCH_MXC && ARM64
> +	depends on ARCH_MXC && ARM64 && IMX_SCU
>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qxp pinctrl driver
> --
> 2.20.0
