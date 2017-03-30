From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal
Date: Thu, 30 Mar 2017 07:33:52 +0000
Message-ID: <HK2PR0601MB132955B398D6CE3FA300C222B7340@HK2PR0601MB1329.apcprd06.prod.outlook.com>
References: <20170329183658.618942497@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:11444 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932650AbdC3Hd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Mar 2017 03:33:59 -0400
In-Reply-To: <20170329183658.618942497@cogentembedded.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello Sergei,

> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-
> owner@vger.kernel.org] On Behalf Of Sergei Shtylyov
> Sent: 29 March 2017 19:37
>=20
> The R8A7791 PFC driver  was apparently based on the preliminary revisions=
 of
> the user's  manual, which  omitted the DVC_MUTE signal  altogether in the
> PFC section. The modern manual has the signal described,  so just add the
> necassary data to the driver...
>=20
> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Should this patch also CC stable? (Patch 1/2 does)


Kind regards, Chris

>=20
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -203,7 +203,7 @@ enum {
>=20
>  	/* IPSR6 */
>  	FN_AUDIO_CLKB, FN_STP_OPWM_0_B, FN_MSIOF1_SCK_B,
> -	FN_SCIF_CLK, FN_BPFCLK_E,
> +	FN_SCIF_CLK, FN_DVC_MUTE, FN_BPFCLK_E,
>  	FN_AUDIO_CLKC, FN_SCIFB0_SCK_C, FN_MSIOF1_SYNC_B, FN_RX2,
>  	FN_SCIFA2_RXD, FN_FMIN_E,
>  	FN_AUDIO_CLKOUT, FN_MSIOF1_SS1_B, FN_TX2, FN_SCIFA2_TXD,
> @@ -573,7 +573,7 @@ enum {
>=20
>  	/* IPSR6 */
>  	AUDIO_CLKB_MARK, STP_OPWM_0_B_MARK,
> MSIOF1_SCK_B_MARK,
> -	SCIF_CLK_MARK, BPFCLK_E_MARK,
> +	SCIF_CLK_MARK, DVC_MUTE_MARK, BPFCLK_E_MARK,
>  	AUDIO_CLKC_MARK, SCIFB0_SCK_C_MARK,
> MSIOF1_SYNC_B_MARK, RX2_MARK,
>  	SCIFA2_RXD_MARK, FMIN_E_MARK,
>  	AUDIO_CLKOUT_MARK, MSIOF1_SS1_B_MARK, TX2_MARK,
> SCIFA2_TXD_MARK, @@ -1093,6 +1093,7 @@ static const u16 pinmux_data[]
> =3D {
>  	PINMUX_IPSR_MSEL(IP6_2_0, STP_OPWM_0_B, SEL_SSP_1),
>  	PINMUX_IPSR_MSEL(IP6_2_0, MSIOF1_SCK_B, SEL_SOF1_1),
>  	PINMUX_IPSR_MSEL(IP6_2_0, SCIF_CLK, SEL_SCIF_0),
> +	PINMUX_IPSR_GPSR (IP6_2_0, DVC_MUTE),
>  	PINMUX_IPSR_MSEL(IP6_2_0, BPFCLK_E, SEL_FM_4),
>  	PINMUX_IPSR_GPSR(IP6_5_3, AUDIO_CLKC),
>  	PINMUX_IPSR_MSEL(IP6_5_3, SCIFB0_SCK_C, SEL_SCIFB_2), @@ -
> 5899,7 +5900,7 @@ static const struct pinmux_cfg_reg pinmu
>  		0, 0,
>  		/* IP6_2_0 [3] */
>  		FN_AUDIO_CLKB, FN_STP_OPWM_0_B, FN_MSIOF1_SCK_B,
> -		FN_SCIF_CLK, 0, FN_BPFCLK_E,
> +		FN_SCIF_CLK, FN_DVC_MUTE, FN_BPFCLK_E,
>  		0, 0, }
>  	},
>  	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,

