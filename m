From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/5] pinctrl: pinctrl-imx: add soc specific mux_mode mask
 and shift property
Date: Fri, 12 May 2017 13:32:45 +0000
Message-ID: <AM3PR04MB306315F2D57F469AE313E2980E20@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-he1eur01on0061.outbound.protection.outlook.com ([104.47.0.61]:59104
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755124AbdELNct (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 09:32:49 -0400
In-Reply-To: <1494592686-30967-4-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.S. Dong" <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>

> -----Original Message-----
> From: Dong Aisheng [mailto:aisheng.dong@nxp.com]
> Sent: Friday, May 12, 2017 8:38 PM
> To: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linus.walleij@linaro.org;
> shawnguo@kernel.org; stefan@agner.ch; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; A.S. Dong
> Subject: [PATCH 2/5] pinctrl: pinctrl-imx: add soc specific mux_mode mask
> and shift property
>=20
> MX7ULP MUX mode mask and shift bit is different from VF610.
> Let's make it a platform specific property for the later easy of adding
> MX7ULP support.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Please ignore this one which is sent out accidentally.
It's actually the same as the following one except the patch title differen=
ce.
[PATCH 2/5] pinctrl: imx: add soc specific mux_mode mask and shift property

Others all are ok.

Regards
Dong Aisheng

> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c   | 10 +++++-----
>  drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++++
>  drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
>  3 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 406881d..ef4951f 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -197,8 +197,8 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev,
> unsigned selector,
>  		if (info->flags & SHARE_MUX_CONF_REG) {
>  			u32 reg;
>  			reg =3D readl(ipctl->base + pin_reg->mux_reg);
> -			reg &=3D ~(0x7 << 20);
> -			reg |=3D (pin->mux_mode << 20);
> +			reg &=3D ~info->mux_mask;
> +			reg |=3D (pin->mux_mode << info->mux_shift);
>  			writel(reg, ipctl->base + pin_reg->mux_reg);
>  		} else {
>  			writel(pin->mux_mode, ipctl->base + pin_reg->mux_reg);
> @@ -288,7 +288,7 @@ static int imx_pmx_gpio_request_enable(struct
> pinctrl_dev *pctldev,
>=20
>  mux_pin:
>  	reg =3D readl(ipctl->base + pin_reg->mux_reg);
> -	reg &=3D ~(0x7 << 20);
> +	reg &=3D ~info->mux_mask;
>  	reg |=3D imx_pin->config;
>  	writel(reg, ipctl->base + pin_reg->mux_reg);
>=20
> @@ -432,7 +432,7 @@ static int imx_pinconf_get(struct pinctrl_dev *pctlde=
v,
>  	*config =3D readl(ipctl->base + pin_reg->conf_reg);
>=20
>  	if (info->flags & SHARE_MUX_CONF_REG)
> -		*config &=3D 0xffff;
> +		*config &=3D ~info->mux_mask;
>=20
>  	return 0;
>  }
> @@ -459,7 +459,7 @@ static int imx_pinconf_set(struct pinctrl_dev *pctlde=
v,
>  		if (info->flags & SHARE_MUX_CONF_REG) {
>  			u32 reg;
>  			reg =3D readl(ipctl->base + pin_reg->conf_reg);
> -			reg &=3D ~0xffff;
> +			reg &=3D info->mux_mask;
>  			reg |=3D configs[i];
>  			writel(reg, ipctl->base + pin_reg->conf_reg);
>  		} else {
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h
> b/drivers/pinctrl/freescale/pinctrl-imx.h
> index b5c8fe1..eb0ce95 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -64,6 +64,10 @@ struct imx_pinctrl_soc_info {
>  	const char *gpr_compatible;
>  	struct mutex mutex;
>=20
> +	/* MUX_MODE shift and mask in case SHARE_MUX_CONF_REG */
> +	unsigned int mux_mask;
> +	u8 mux_shift;
> +
>  	/* generic pinconf */
>  	bool generic_pinconf;
>  	const struct pinconf_generic_params *custom_params; diff --git
> a/drivers/pinctrl/freescale/pinctrl-vf610.c
> b/drivers/pinctrl/freescale/pinctrl-vf610.c
> index 2b1e198..3bd8556 100644
> --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> @@ -299,6 +299,8 @@ static struct imx_pinctrl_soc_info vf610_pinctrl_info
> =3D {
>  	.pins =3D vf610_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(vf610_pinctrl_pads),
>  	.flags =3D SHARE_MUX_CONF_REG | ZERO_OFFSET_VALID,
> +	.mux_mask =3D 0x700000,
> +	.mux_shift =3D 20,
>  };
>=20
>  static const struct of_device_id vf610_pinctrl_of_match[] =3D {
> --
> 2.7.4

