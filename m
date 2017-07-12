From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 7/7] pinctrl: pinctrl-imx7ulp: add gpio_set_direction
 support
Date: Wed, 12 Jul 2017 13:59:57 +0000
Message-ID: <AM3PR04MB3067C5E7E96CBFFF84B68B180AF0@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
 <1498046395-30001-8-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:33610
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752417AbdGLOAA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 10:00:00 -0400
In-Reply-To: <1498046395-30001-8-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

Hi Shawn,

> -----Original Message-----
> From: Dong Aisheng [mailto:aisheng.dong@nxp.com]
> Sent: Wednesday, June 21, 2017 8:00 PM
> To: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linus.walleij@linaro.org;
> shawnguo@kernel.org; stefan@agner.ch; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; A.s. Dong; Alexandre Courbot
> Subject: [PATCH V4 7/7] pinctrl: pinctrl-imx7ulp: add gpio_set_direction
> support
>=20
> Add gpio_set_direction support. This makes the driver support GPIO
> input/output dynamically change from userspace.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>=20
> ---
> ChangeLog:
>  * New patch. Derived from the original:
>    [PATCH 1/2] pinctrl: pinctrl-imx: add IBE and OBE SoC property

And this one.

Please help review.

Regards
Dong Aisheng

> ---
>  drivers/pinctrl/freescale/pinctrl-imx7ulp.c | 26
> ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> index 96127dc..b7bebb2 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> @@ -259,6 +259,8 @@ static const struct pinctrl_pin_desc
> imx7ulp_pinctrl_pads[] =3D {
>  	IMX_PINCTRL_PIN(IMX7ULP_PAD_PTF19),
>  };
>=20
> +#define BM_OBE_ENABLED		BIT(17)
> +#define BM_IBE_ENABLED		BIT(16)
>  #define BM_LK_ENABLED		BIT(15)
>  #define BM_MUX_MODE		0xf00
>  #define BP_MUX_MODE		8
> @@ -300,10 +302,34 @@ static void imx7ulp_cfg_params_fixup(unsigned long
> *configs,
>  	}
>  }
>=20
> +static int imx7ulp_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> +					  struct pinctrl_gpio_range *range,
> +					  unsigned offset, bool input)
> +{
> +	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +	struct imx_pinctrl_soc_info *info =3D ipctl->info;
> +	const struct imx_pin_reg *pin_reg;
> +	u32 reg;
> +
> +	pin_reg =3D &info->pin_regs[offset];
> +	if (pin_reg->mux_reg =3D=3D -1)
> +		return -EINVAL;
> +
> +	reg =3D readl(ipctl->base + pin_reg->mux_reg);
> +	if (input)
> +		reg =3D (reg & ~BM_OBE_ENABLED) | BM_IBE_ENABLED;
> +	else
> +		reg =3D (reg & ~BM_IBE_ENABLED) | BM_OBE_ENABLED;
> +	writel(reg, ipctl->base + pin_reg->mux_reg);
> +
> +	return 0;
> +}
> +
>  static struct imx_pinctrl_soc_info imx7ulp_pinctrl_info =3D {
>  	.pins =3D imx7ulp_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(imx7ulp_pinctrl_pads),
>  	.flags =3D ZERO_OFFSET_VALID | SHARE_MUX_CONF_REG,
> +	.gpio_set_direction =3D imx7ulp_pmx_gpio_set_direction,
>  	.mux_mask =3D BM_MUX_MODE,
>  	.mux_shift =3D BP_MUX_MODE,
>  	.generic_pinconf =3D true,
> --
> 2.7.4

