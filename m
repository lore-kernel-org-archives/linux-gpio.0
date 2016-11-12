From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add DU support
Date: Sat, 12 Nov 2016 03:49:58 +0200
Message-ID: <1504089.3XCaLOXSrS@avalon>
References: <20161111204003.4022-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58071 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965488AbcKLBtx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2016 20:49:53 -0500
In-Reply-To: <20161111204003.4022-1-niklas.soderlund@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Friday 11 Nov 2016 21:40:03 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> Only the DU parallel RGB output signals are included, HDMI and TCON p=
ins
> will be added in separate groups. Based on a similar patch from Laure=
nt
> Pinchart for the r8a7795 PFC driver.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 100 +++++++++++++++++++++++++=
+++++++
>  1 file changed, 100 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c index dc9b671..70e81ab 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> @@ -1489,6 +1489,86 @@ static const u16 pinmux_data[] =3D {
>  static const struct sh_pfc_pin pinmux_pins[] =3D {
>  =09PINMUX_GPIO_GP_ALL(),
>  };
> +/* - DU
> ---------------------------------------------------------------------=
 */
> +static const unsigned int du_rgb666_pins[] =3D {
> +=09/* R[7:2], G[7:2], B[7:2] */
> +=09RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
> +=09RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
> +=09RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> +=09RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> +=09RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
> +=09RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
> +};
> +static const unsigned int du_rgb666_mux[] =3D {
> +=09DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> +=09DU_DR3_MARK, DU_DR2_MARK,
> +=09DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> +=09DU_DG3_MARK, DU_DG2_MARK,
> +=09DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> +=09DU_DB3_MARK, DU_DB2_MARK,
> +};
> +static const unsigned int du_rgb888_pins[] =3D {
> +=09/* R[7:0], G[7:0], B[7:0] */
> +=09RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13),
> +=09RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10),
> +=09RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 8),
> +=09RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> +=09RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> +=09RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
> +=09RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
> +=09RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
> +=09RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 0),
> +};
> +static const unsigned int du_rgb888_mux[] =3D {
> +=09DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> +=09DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
> +=09DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> +=09DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
> +=09DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> +=09DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
> +};
> +static const unsigned int du_clk_out_0_pins[] =3D {
> +=09/* CLKOUT */
> +=09RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int du_clk_out_0_mux[] =3D {
> +=09DU_DOTCLKOUT0_MARK
> +};
> +static const unsigned int du_clk_out_1_pins[] =3D {
> +=09/* CLKOUT */
> +=09RCAR_GP_PIN(2, 3),
> +};
> +static const unsigned int du_clk_out_1_mux[] =3D {
> +=09DU_DOTCLKOUT1_MARK
> +};
> +static const unsigned int du_sync_pins[] =3D {
> +=09/* EXVSYNC/VSYNC, EXHSYNC/HSYNC */
> +=09RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 4),
> +};
> +static const unsigned int du_sync_mux[] =3D {
> +=09DU_EXVSYNC_DU_VSYNC_MARK, DU_EXHSYNC_DU_HSYNC_MARK
> +};
> +static const unsigned int du_oddf_pins[] =3D {
> +=09/* EXDISP/EXODDF/EXCDE */
> +=09RCAR_GP_PIN(2, 2),
> +};
> +static const unsigned int du_oddf_mux[] =3D {
> +=09DU_EXODDF_DU_ODDF_DISP_CDE_MARK,
> +};
> +static const unsigned int du_cde_pins[] =3D {
> +=09/* CDE */
> +=09RCAR_GP_PIN(2, 0),
> +};
> +static const unsigned int du_cde_mux[] =3D {
> +=09DU_CDE_MARK,
> +};
> +static const unsigned int du_disp_pins[] =3D {
> +=09/* DISP */
> +=09RCAR_GP_PIN(2, 1),
> +};
> +static const unsigned int du_disp_mux[] =3D {
> +=09DU_DISP_MARK,
> +};
>=20
>  /* - SCIF0
> ------------------------------------------------------------------ */=

> static const unsigned int scif0_data_pins[] =3D {
> @@ -1912,6 +1992,14 @@ static const unsigned int sdhi3_ds_mux[] =3D {=

>  };
>=20
>  static const struct sh_pfc_pin_group pinmux_groups[] =3D {
> +=09SH_PFC_PIN_GROUP(du_rgb666),
> +=09SH_PFC_PIN_GROUP(du_rgb888),
> +=09SH_PFC_PIN_GROUP(du_clk_out_0),
> +=09SH_PFC_PIN_GROUP(du_clk_out_1),
> +=09SH_PFC_PIN_GROUP(du_sync),
> +=09SH_PFC_PIN_GROUP(du_oddf),
> +=09SH_PFC_PIN_GROUP(du_cde),
> +=09SH_PFC_PIN_GROUP(du_disp),
>  =09SH_PFC_PIN_GROUP(scif0_data),
>  =09SH_PFC_PIN_GROUP(scif0_clk),
>  =09SH_PFC_PIN_GROUP(scif0_ctrl),
> @@ -1969,6 +2057,17 @@ static const struct sh_pfc_pin_group pinmux_gr=
oups[]
> =3D { SH_PFC_PIN_GROUP(sdhi3_ds),
>  };
>=20
> +static const char * const du_groups[] =3D {
> +=09"du_rgb666",
> +=09"du_rgb888",
> +=09"du_clk_out_0",
> +=09"du_clk_out_1",
> +=09"du_sync",
> +=09"du_oddf",
> +=09"du_cde",
> +=09"du_disp",
> +};
> +
>  static const char * const scif0_groups[] =3D {
>  =09"scif0_data",
>  =09"scif0_clk",
> @@ -2058,6 +2157,7 @@ static const char * const sdhi3_groups[] =3D {
>  };
>=20
>  static const struct sh_pfc_function pinmux_functions[] =3D {
> +=09SH_PFC_FUNCTION(du),
>  =09SH_PFC_FUNCTION(scif0),
>  =09SH_PFC_FUNCTION(scif1),
>  =09SH_PFC_FUNCTION(scif2),

--=20
Regards,

Laurent Pinchart

