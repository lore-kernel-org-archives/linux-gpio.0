From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] pinctrl: sh-pfc: r8a7794: Add i2c5 pin groups and
 function
Date: Mon, 18 Dec 2017 18:11:35 +0000
Message-ID: <TY1PR06MB08958053615BA1B4B6A8A030C00E0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513620243-4188-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513620243-4188-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

Dear All,

this patch depends on the following patches:

pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
pinctrl: sh-pfc: r8a7794: Add tpu groups and function

Thanks,
Fab

> Subject: [PATCH] pinctrl: sh-pfc: r8a7794: Add i2c5 pin groups and functi=
on
>
> Add i2c5 pin groups and function to r8a7745 PFC driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> This patch is based on renesas devel tag renesas-devel-20171218-v4.15-rc4
>
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 41 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pf=
c/pfc-r8a7794.c
> index f133b4f..1640024 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -2228,6 +2228,35 @@ enum {
>  static const unsigned int i2c4_e_mux[] =3D {
>  I2C4_SCL_E_MARK, I2C4_SDA_E_MARK,
>  };
> +/* - I2C5 --------------------------------------------------------------=
----- */
> +static const unsigned int i2c5_pins[] =3D {
> +/* SCL, SDA */
> +RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 15),
> +};
> +static const unsigned int i2c5_mux[] =3D {
> +I2C5_SCL_MARK, I2C5_SDA_MARK,
> +};
> +static const unsigned int i2c5_b_pins[] =3D {
> +/* SCL, SDA */
> +RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
> +};
> +static const unsigned int i2c5_b_mux[] =3D {
> +I2C5_SCL_B_MARK, I2C5_SDA_B_MARK,
> +};
> +static const unsigned int i2c5_c_pins[] =3D {
> +/* SCL, SDA */
> +RCAR_GP_PIN(4, 31), RCAR_GP_PIN(4, 30),
> +};
> +static const unsigned int i2c5_c_mux[] =3D {
> +I2C5_SCL_C_MARK, I2C5_SDA_C_MARK,
> +};
> +static const unsigned int i2c5_d_pins[] =3D {
> +/* SCL, SDA */
> +RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
> +};
> +static const unsigned int i2c5_d_mux[] =3D {
> +I2C5_SCL_D_MARK, I2C5_SDA_D_MARK,
> +};
>  /* - INTC --------------------------------------------------------------=
----- */
>  static const unsigned int intc_irq0_pins[] =3D {
>  /* IRQ0 */
> @@ -3821,6 +3850,10 @@ enum {
>  SH_PFC_PIN_GROUP(i2c4_c),
>  SH_PFC_PIN_GROUP(i2c4_d),
>  SH_PFC_PIN_GROUP(i2c4_e),
> +SH_PFC_PIN_GROUP(i2c5),
> +SH_PFC_PIN_GROUP(i2c5_b),
> +SH_PFC_PIN_GROUP(i2c5_c),
> +SH_PFC_PIN_GROUP(i2c5_d),
>  SH_PFC_PIN_GROUP(intc_irq0),
>  SH_PFC_PIN_GROUP(intc_irq1),
>  SH_PFC_PIN_GROUP(intc_irq2),
> @@ -4196,6 +4229,13 @@ enum {
>  "i2c4_e",
>  };
>
> +static const char * const i2c5_groups[] =3D {
> +"i2c5",
> +"i2c5_b",
> +"i2c5_c",
> +"i2c5_d",
> +};
> +
>  static const char * const intc_groups[] =3D {
>  "intc_irq0",
>  "intc_irq1",
> @@ -4537,6 +4577,7 @@ enum {
>  SH_PFC_FUNCTION(i2c2),
>  SH_PFC_FUNCTION(i2c3),
>  SH_PFC_FUNCTION(i2c4),
> +SH_PFC_FUNCTION(i2c5),
>  SH_PFC_FUNCTION(intc),
>  SH_PFC_FUNCTION(mmc),
>  SH_PFC_FUNCTION(msiof0),
> --
> 1.9.1



[https://www2.renesas.eu/media/email/unicef_2017.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
