From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 0/7] pinctrl: imx: add imx7ulp pinctrl support
Date: Mon, 3 Jul 2017 10:36:42 +0000
Message-ID: <AM3PR04MB306A0A86603EF133C37852480D60@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0087.outbound.protection.outlook.com ([104.47.2.87]:3041
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753373AbdGCKgq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jul 2017 06:36:46 -0400
In-Reply-To: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

> -----Original Message-----
> From: Dong Aisheng [mailto:aisheng.dong@nxp.com]
> Sent: Wednesday, June 21, 2017 8:00 PM
> To: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linus.walleij@linaro.org;
> shawnguo@kernel.org; stefan@agner.ch; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; A.s. Dong
> Subject: [PATCH V4 0/7] pinctrl: imx: add imx7ulp pinctrl support
>=20
> i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports,
> IOMUXC1 for A7 ports and IOMUXC DDR for DDR interface.
>=20
> This patch series adds the IOMUXC1 support for A7.
> It only supports generic pin config.
>=20
> ChangeLog:
> v3->v4:
>  This patch series is a combine of the following patches per
> Maintainer's request.
> [PATCH V3 1/2] dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
> https://www.spinics.net/lists/arm-kernel/msg582995.html
> [PATCH V3 2/2] pinctrl: imx: add imx7ulp driver
> https://www.spinics.net/lists/arm-kernel/msg582996.html
> [PATCH 0/2] pinctrl: pinctrl-imx: add gpio support for mx7ulp
> https://www.spinics.net/lists/arm-kernel/msg580993.html
>=20
>  Detailed changes as follows:
>  * change pad name to IMX7ULP_PAD_X style
>  * switch to generic pinmux property
>  * remove input/output generic property decodes as the standard
>    input/out property name are still under discussing.
>    It does not affect the normal GPIO function as imx7ulp pinctrl
>    driver supports gpio_set_direction which will set input/output enable
>    automatically.
>    See: [PATCH V4 7/7] pinctrl: pinctrl-imx7ulp: add gpio_set_direction
>    It will be added back later for other pads once the standard property
>    is determined.
>=20
> Dong Aisheng (7):
>   dt-bindings: pinctrl: extend the pinmux property to support integers
>     array
>   dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
>   pinctrl: imx: switch to use the generic pinmux property
>   pinctrl: imx: add imx7ulp driver
>   pinctrl: imx: remove gpio_request_enable and gpio_disable_free
>   pinctrl: imx: make imx_pmx_ops.gpio_set_direction platform specific
>     callbacks
>   pinctrl: pinctrl-imx7ulp: add gpio_set_direction support
>=20

Is the series got missed?

I saw you only picked the revised patch 1.

Or do I need resend it?

Regards
Dong Aisheng

>  .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |  61 +++
>  .../bindings/pinctrl/pinctrl-bindings.txt          |   9 +-
>  arch/arm/boot/dts/imx7ulp-pinfunc.h                | 468
> +++++++++++++++++++++
>  drivers/pinctrl/freescale/Kconfig                  |   7 +
>  drivers/pinctrl/freescale/Makefile                 |   1 +
>  drivers/pinctrl/freescale/pinctrl-imx.c            | 123 +-----
>  drivers/pinctrl/freescale/pinctrl-imx.h            |  20 +
>  drivers/pinctrl/freescale/pinctrl-imx7ulp.c        | 364
> ++++++++++++++++
>  drivers/pinctrl/freescale/pinctrl-vf610.c          |  25 ++
>  9 files changed, 958 insertions(+), 120 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
>  create mode 100644 arch/arm/boot/dts/imx7ulp-pinfunc.h
>  create mode 100644 drivers/pinctrl/freescale/pinctrl-imx7ulp.c
>=20
> --
> 2.7.4

