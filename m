From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 3/7] pinctrl: imx: switch to use the generic pinmux
 property
Date: Wed, 12 Jul 2017 13:57:25 +0000
Message-ID: <AM3PR04MB3068BC904003E560AF4F62280AF0@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
 <1498046395-30001-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr40058.outbound.protection.outlook.com ([40.107.4.58]:61984
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752417AbdGLN52 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 09:57:28 -0400
In-Reply-To: <1498046395-30001-4-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>

Hi Shawn,

> -----Original Message-----
> From: Dong Aisheng [mailto:aisheng.dong@nxp.com]
> Sent: Wednesday, June 21, 2017 8:00 PM
> To: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linus.walleij@linaro.org;
> shawnguo@kernel.org; stefan@agner.ch; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; A.s. Dong
> Subject: [PATCH V4 3/7] pinctrl: imx: switch to use the generic pinmux
> property
>=20
> The generic pinmux property seems to be more suitable for IMX.
> So we change to use 'pinmux' instead of 'pins'.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>=20

Would you help review this minor change?

I will collect your ACKs and resent based on 4.13 RC1.

Regards
Dong Aisheng

> ---
> ChangeLog:
>  * new patch
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 72aca75..fc1ba3c 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -563,14 +563,14 @@ static int imx_pinctrl_parse_groups(struct
> device_node *np,
>  	 * do sanity check and calculate pins number
>  	 *
>  	 * First try legacy 'fsl,pins' property, then fall back to the
> -	 * generic 'pins'.
> +	 * generic 'pinmux'.
>  	 *
> -	 * Note: for generic 'pins' case, there's no CONFIG part in
> +	 * Note: for generic 'pinmux' case, there's no CONFIG part in
>  	 * the binding format.
>  	 */
>  	list =3D of_get_property(np, "fsl,pins", &size);
>  	if (!list) {
> -		list =3D of_get_property(np, "pins", &size);
> +		list =3D of_get_property(np, "pinmux", &size);
>  		if (!list) {
>  			dev_err(info->dev,
>  				"no fsl,pins and pins property in node %s\n",
> --
> 2.7.4

