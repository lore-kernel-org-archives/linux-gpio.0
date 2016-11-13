From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv3 5/6] pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
Date: Sun, 13 Nov 2016 03:49:01 +0200
Message-ID: <3799953.2bFHkKiW66@avalon>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se> <20161112160429.12524-6-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161112160429.12524-6-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Saturday 12 Nov 2016 17:04:28 Niklas S=F6derlund wrote:
> Change the data structure and use the generic sh_pfc_pin_to_bias_info=
()
> function to get the register offset and bit information.
>=20
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Except for the bias_info for which I trust your regexp skills,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 342 ++++++++++++++++---------=
------
>  1 file changed, 172 insertions(+), 170 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c index 18ef704..c3af9eb 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
> @@ -24,6 +24,7 @@
>  #include <linux/kernel.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>=20
> +#include "core.h"
>  #include "sh_pfc.h"
>=20
>  #define PORT_GP_PUP_1(bank, pin, fn, sfx)=09\
> @@ -2918,183 +2919,182 @@ static const struct pinmux_cfg_reg
> pinmux_config_regs[] =3D { #define PUPR4=090x110
>  #define PUPR5=090x114
>=20
> -static const struct {
> -=09u16 reg : 11;
> -=09u16 bit : 5;
> -} pullups[] =3D {
> -=09[RCAR_GP_PIN(0,  6)] =3D { PUPR0,  0 },=09/* A0 */
> -=09[RCAR_GP_PIN(0,  7)] =3D { PUPR0,  1 },=09/* A1 */
> -=09[RCAR_GP_PIN(0,  8)] =3D { PUPR0,  2 },=09/* A2 */
> -=09[RCAR_GP_PIN(0,  9)] =3D { PUPR0,  3 },=09/* A3 */
> -=09[RCAR_GP_PIN(0, 10)] =3D { PUPR0,  4 },=09/* A4 */
> -=09[RCAR_GP_PIN(0, 11)] =3D { PUPR0,  5 },=09/* A5 */
> -=09[RCAR_GP_PIN(0, 12)] =3D { PUPR0,  6 },=09/* A6 */
> -=09[RCAR_GP_PIN(0, 13)] =3D { PUPR0,  7 },=09/* A7 */
> -=09[RCAR_GP_PIN(0, 14)] =3D { PUPR0,  8 },=09/* A8 */
> -=09[RCAR_GP_PIN(0, 15)] =3D { PUPR0,  9 },=09/* A9 */
> -=09[RCAR_GP_PIN(0, 16)] =3D { PUPR0, 10 },=09/* A10 */
> -=09[RCAR_GP_PIN(0, 17)] =3D { PUPR0, 11 },=09/* A11 */
> -=09[RCAR_GP_PIN(0, 18)] =3D { PUPR0, 12 },=09/* A12 */
> -=09[RCAR_GP_PIN(0, 19)] =3D { PUPR0, 13 },=09/* A13 */
> -=09[RCAR_GP_PIN(0, 20)] =3D { PUPR0, 14 },=09/* A14 */
> -=09[RCAR_GP_PIN(0, 21)] =3D { PUPR0, 15 },=09/* A15 */
> -=09[RCAR_GP_PIN(0, 22)] =3D { PUPR0, 16 },=09/* A16 */
> -=09[RCAR_GP_PIN(0, 23)] =3D { PUPR0, 17 },=09/* A17 */
> -=09[RCAR_GP_PIN(0, 24)] =3D { PUPR0, 18 },=09/* A18 */
> -=09[RCAR_GP_PIN(0, 25)] =3D { PUPR0, 19 },=09/* A19 */
> -=09[RCAR_GP_PIN(0, 26)] =3D { PUPR0, 20 },=09/* A20 */
> -=09[RCAR_GP_PIN(0, 27)] =3D { PUPR0, 21 },=09/* A21 */
> -=09[RCAR_GP_PIN(0, 28)] =3D { PUPR0, 22 },=09/* A22 */
> -=09[RCAR_GP_PIN(0, 29)] =3D { PUPR0, 23 },=09/* A23 */
> -=09[RCAR_GP_PIN(0, 30)] =3D { PUPR0, 24 },=09/* A24 */
> -=09[RCAR_GP_PIN(0, 31)] =3D { PUPR0, 25 },=09/* A25 */
> -=09[RCAR_GP_PIN(1,  3)] =3D { PUPR0, 26 },=09/* /EX_CS0 */
> -=09[RCAR_GP_PIN(1,  4)] =3D { PUPR0, 27 },=09/* /EX_CS1 */
> -=09[RCAR_GP_PIN(1,  5)] =3D { PUPR0, 28 },=09/* /EX_CS2 */
> -=09[RCAR_GP_PIN(1,  6)] =3D { PUPR0, 29 },=09/* /EX_CS3 */
> -=09[RCAR_GP_PIN(1,  7)] =3D { PUPR0, 30 },=09/* /EX_CS4 */
> -=09[RCAR_GP_PIN(1,  8)] =3D { PUPR0, 31 },=09/* /EX_CS5 */
> -
> -=09[RCAR_GP_PIN(0,  0)] =3D { PUPR1,  0 },=09/* /PRESETOUT=09*/
> -=09[RCAR_GP_PIN(0,  5)] =3D { PUPR1,  1 },=09/* /BS=09=09*/
> -=09[RCAR_GP_PIN(1,  0)] =3D { PUPR1,  2 },=09/* RD//WR=09*/
> -=09[RCAR_GP_PIN(1,  1)] =3D { PUPR1,  3 },=09/* /WE0=09=09*/
> -=09[RCAR_GP_PIN(1,  2)] =3D { PUPR1,  4 },=09/* /WE1=09=09*/
> -=09[RCAR_GP_PIN(1, 11)] =3D { PUPR1,  5 },=09/* EX_WAIT0=09*/
> -=09[RCAR_GP_PIN(1,  9)] =3D { PUPR1,  6 },=09/* DREQ0=09*/
> -=09[RCAR_GP_PIN(1, 10)] =3D { PUPR1,  7 },=09/* DACK0=09*/
> -=09[RCAR_GP_PIN(1, 12)] =3D { PUPR1,  8 },=09/* IRQ0=09=09*/
> -=09[RCAR_GP_PIN(1, 13)] =3D { PUPR1,  9 },=09/* IRQ1=09=09*/
> -
> -=09[RCAR_GP_PIN(1, 22)] =3D { PUPR2,  0 },=09/* DU0_DR0=09*/
> -=09[RCAR_GP_PIN(1, 23)] =3D { PUPR2,  1 },=09/* DU0_DR1=09*/
> -=09[RCAR_GP_PIN(1, 24)] =3D { PUPR2,  2 },=09/* DU0_DR2=09*/
> -=09[RCAR_GP_PIN(1, 25)] =3D { PUPR2,  3 },=09/* DU0_DR3=09*/
> -=09[RCAR_GP_PIN(1, 26)] =3D { PUPR2,  4 },=09/* DU0_DR4=09*/
> -=09[RCAR_GP_PIN(1, 27)] =3D { PUPR2,  5 },=09/* DU0_DR5=09*/
> -=09[RCAR_GP_PIN(1, 28)] =3D { PUPR2,  6 },=09/* DU0_DR6=09*/
> -=09[RCAR_GP_PIN(1, 29)] =3D { PUPR2,  7 },=09/* DU0_DR7=09*/
> -=09[RCAR_GP_PIN(1, 30)] =3D { PUPR2,  8 },=09/* DU0_DG0=09*/
> -=09[RCAR_GP_PIN(1, 31)] =3D { PUPR2,  9 },=09/* DU0_DG1=09*/
> -=09[RCAR_GP_PIN(2,  0)] =3D { PUPR2, 10 },=09/* DU0_DG2=09*/
> -=09[RCAR_GP_PIN(2,  1)] =3D { PUPR2, 11 },=09/* DU0_DG3=09*/
> -=09[RCAR_GP_PIN(2,  2)] =3D { PUPR2, 12 },=09/* DU0_DG4=09*/
> -=09[RCAR_GP_PIN(2,  3)] =3D { PUPR2, 13 },=09/* DU0_DG5=09*/
> -=09[RCAR_GP_PIN(2,  4)] =3D { PUPR2, 14 },=09/* DU0_DG6=09*/
> -=09[RCAR_GP_PIN(2,  5)] =3D { PUPR2, 15 },=09/* DU0_DG7=09*/
> -=09[RCAR_GP_PIN(2,  6)] =3D { PUPR2, 16 },=09/* DU0_DB0=09*/
> -=09[RCAR_GP_PIN(2,  7)] =3D { PUPR2, 17 },=09/* DU0_DB1=09*/
> -=09[RCAR_GP_PIN(2,  8)] =3D { PUPR2, 18 },=09/* DU0_DB2=09*/
> -=09[RCAR_GP_PIN(2,  9)] =3D { PUPR2, 19 },=09/* DU0_DB3=09*/
> -=09[RCAR_GP_PIN(2, 10)] =3D { PUPR2, 20 },=09/* DU0_DB4=09*/
> -=09[RCAR_GP_PIN(2, 11)] =3D { PUPR2, 21 },=09/* DU0_DB5=09*/
> -=09[RCAR_GP_PIN(2, 12)] =3D { PUPR2, 22 },=09/* DU0_DB6=09*/
> -=09[RCAR_GP_PIN(2, 13)] =3D { PUPR2, 23 },=09/* DU0_DB7=09*/
> -=09[RCAR_GP_PIN(2, 14)] =3D { PUPR2, 24 },=09/* DU0_DOTCLKIN=09*/
> -=09[RCAR_GP_PIN(2, 15)] =3D { PUPR2, 25 },=09/* DU0_DOTCLKOUT0 */
> -=09[RCAR_GP_PIN(2, 17)] =3D { PUPR2, 26 },=09/* DU0_HSYNC=09*/
> -=09[RCAR_GP_PIN(2, 18)] =3D { PUPR2, 27 },=09/* DU0_VSYNC=09*/
> -=09[RCAR_GP_PIN(2, 19)] =3D { PUPR2, 28 },=09/* DU0_EXODDF=09*/
> -=09[RCAR_GP_PIN(2, 20)] =3D { PUPR2, 29 },=09/* DU0_DISP=09*/
> -=09[RCAR_GP_PIN(2, 21)] =3D { PUPR2, 30 },=09/* DU0_CDE=09*/
> -=09[RCAR_GP_PIN(2, 16)] =3D { PUPR2, 31 },=09/* DU0_DOTCLKOUT1 */
> -
> -=09[RCAR_GP_PIN(3, 24)] =3D { PUPR3,  0 },=09/* VI0_CLK=09*/
> -=09[RCAR_GP_PIN(3, 25)] =3D { PUPR3,  1 },=09/* VI0_CLKENB=09*/
> -=09[RCAR_GP_PIN(3, 26)] =3D { PUPR3,  2 },=09/* VI0_FIELD=09*/
> -=09[RCAR_GP_PIN(3, 27)] =3D { PUPR3,  3 },=09/* /VI0_HSYNC=09*/
> -=09[RCAR_GP_PIN(3, 28)] =3D { PUPR3,  4 },=09/* /VI0_VSYNC=09*/
> -=09[RCAR_GP_PIN(3, 29)] =3D { PUPR3,  5 },=09/* VI0_DATA0=09*/
> -=09[RCAR_GP_PIN(3, 30)] =3D { PUPR3,  6 },=09/* VI0_DATA1=09*/
> -=09[RCAR_GP_PIN(3, 31)] =3D { PUPR3,  7 },=09/* VI0_DATA2=09*/
> -=09[RCAR_GP_PIN(4,  0)] =3D { PUPR3,  8 },=09/* VI0_DATA3=09*/
> -=09[RCAR_GP_PIN(4,  1)] =3D { PUPR3,  9 },=09/* VI0_DATA4=09*/
> -=09[RCAR_GP_PIN(4,  2)] =3D { PUPR3, 10 },=09/* VI0_DATA5=09*/
> -=09[RCAR_GP_PIN(4,  3)] =3D { PUPR3, 11 },=09/* VI0_DATA6=09*/
> -=09[RCAR_GP_PIN(4,  4)] =3D { PUPR3, 12 },=09/* VI0_DATA7=09*/
> -=09[RCAR_GP_PIN(4,  5)] =3D { PUPR3, 13 },=09/* VI0_G2=09*/
> -=09[RCAR_GP_PIN(4,  6)] =3D { PUPR3, 14 },=09/* VI0_G3=09*/
> -=09[RCAR_GP_PIN(4,  7)] =3D { PUPR3, 15 },=09/* VI0_G4=09*/
> -=09[RCAR_GP_PIN(4,  8)] =3D { PUPR3, 16 },=09/* VI0_G5=09*/
> -=09[RCAR_GP_PIN(4, 21)] =3D { PUPR3, 17 },=09/* VI1_DATA12=09*/
> -=09[RCAR_GP_PIN(4, 22)] =3D { PUPR3, 18 },=09/* VI1_DATA13=09*/
> -=09[RCAR_GP_PIN(4, 23)] =3D { PUPR3, 19 },=09/* VI1_DATA14=09*/
> -=09[RCAR_GP_PIN(4, 24)] =3D { PUPR3, 20 },=09/* VI1_DATA15=09*/
> -=09[RCAR_GP_PIN(4,  9)] =3D { PUPR3, 21 },=09/* ETH_REF_CLK=09*/
> -=09[RCAR_GP_PIN(4, 10)] =3D { PUPR3, 22 },=09/* ETH_TXD0=09*/
> -=09[RCAR_GP_PIN(4, 11)] =3D { PUPR3, 23 },=09/* ETH_TXD1=09*/
> -=09[RCAR_GP_PIN(4, 12)] =3D { PUPR3, 24 },=09/* ETH_CRS_DV=09*/
> -=09[RCAR_GP_PIN(4, 13)] =3D { PUPR3, 25 },=09/* ETH_TX_EN=09*/
> -=09[RCAR_GP_PIN(4, 14)] =3D { PUPR3, 26 },=09/* ETH_RX_ER=09*/
> -=09[RCAR_GP_PIN(4, 15)] =3D { PUPR3, 27 },=09/* ETH_RXD0=09*/
> -=09[RCAR_GP_PIN(4, 16)] =3D { PUPR3, 28 },=09/* ETH_RXD1=09*/
> -=09[RCAR_GP_PIN(4, 17)] =3D { PUPR3, 29 },=09/* ETH_MDC=09*/
> -=09[RCAR_GP_PIN(4, 18)] =3D { PUPR3, 30 },=09/* ETH_MDIO=09*/
> -=09[RCAR_GP_PIN(4, 19)] =3D { PUPR3, 31 },=09/* ETH_LINK=09*/
> -
> -=09[RCAR_GP_PIN(3,  6)] =3D { PUPR4,  0 },=09/* SSI_SCK012=09*/
> -=09[RCAR_GP_PIN(3,  7)] =3D { PUPR4,  1 },=09/* SSI_WS012=09*/
> -=09[RCAR_GP_PIN(3, 10)] =3D { PUPR4,  2 },=09/* SSI_SDATA0=09*/
> -=09[RCAR_GP_PIN(3,  9)] =3D { PUPR4,  3 },=09/* SSI_SDATA1=09*/
> -=09[RCAR_GP_PIN(3,  8)] =3D { PUPR4,  4 },=09/* SSI_SDATA2=09*/
> -=09[RCAR_GP_PIN(3,  2)] =3D { PUPR4,  5 },=09/* SSI_SCK34=09*/
> -=09[RCAR_GP_PIN(3,  3)] =3D { PUPR4,  6 },=09/* SSI_WS34=09*/
> -=09[RCAR_GP_PIN(3,  5)] =3D { PUPR4,  7 },=09/* SSI_SDATA3=09*/
> -=09[RCAR_GP_PIN(3,  4)] =3D { PUPR4,  8 },=09/* SSI_SDATA4=09*/
> -=09[RCAR_GP_PIN(2, 31)] =3D { PUPR4,  9 },=09/* SSI_SCK5=09*/
> -=09[RCAR_GP_PIN(3,  0)] =3D { PUPR4, 10 },=09/* SSI_WS5=09*/
> -=09[RCAR_GP_PIN(3,  1)] =3D { PUPR4, 11 },=09/* SSI_SDATA5=09*/
> -=09[RCAR_GP_PIN(2, 28)] =3D { PUPR4, 12 },=09/* SSI_SCK6=09*/
> -=09[RCAR_GP_PIN(2, 29)] =3D { PUPR4, 13 },=09/* SSI_WS6=09*/
> -=09[RCAR_GP_PIN(2, 30)] =3D { PUPR4, 14 },=09/* SSI_SDATA6=09*/
> -=09[RCAR_GP_PIN(2, 24)] =3D { PUPR4, 15 },=09/* SSI_SCK78=09*/
> -=09[RCAR_GP_PIN(2, 25)] =3D { PUPR4, 16 },=09/* SSI_WS78=09*/
> -=09[RCAR_GP_PIN(2, 27)] =3D { PUPR4, 17 },=09/* SSI_SDATA7=09*/
> -=09[RCAR_GP_PIN(2, 26)] =3D { PUPR4, 18 },=09/* SSI_SDATA8=09*/
> -=09[RCAR_GP_PIN(3, 23)] =3D { PUPR4, 19 },=09/* TCLK0=09*/
> -=09[RCAR_GP_PIN(3, 11)] =3D { PUPR4, 20 },=09/* SD0_CLK=09*/
> -=09[RCAR_GP_PIN(3, 12)] =3D { PUPR4, 21 },=09/* SD0_CMD=09*/
> -=09[RCAR_GP_PIN(3, 13)] =3D { PUPR4, 22 },=09/* SD0_DAT0=09*/
> -=09[RCAR_GP_PIN(3, 14)] =3D { PUPR4, 23 },=09/* SD0_DAT1=09*/
> -=09[RCAR_GP_PIN(3, 15)] =3D { PUPR4, 24 },=09/* SD0_DAT2=09*/
> -=09[RCAR_GP_PIN(3, 16)] =3D { PUPR4, 25 },=09/* SD0_DAT3=09*/
> -=09[RCAR_GP_PIN(3, 17)] =3D { PUPR4, 26 },=09/* SD0_CD=09*/
> -=09[RCAR_GP_PIN(3, 18)] =3D { PUPR4, 27 },=09/* SD0_WP=09*/
> -=09[RCAR_GP_PIN(2, 22)] =3D { PUPR4, 28 },=09/* AUDIO_CLKA=09*/
> -=09[RCAR_GP_PIN(2, 23)] =3D { PUPR4, 29 },=09/* AUDIO_CLKB=09*/
> -=09[RCAR_GP_PIN(1, 14)] =3D { PUPR4, 30 },=09/* IRQ2=09=09*/
> -=09[RCAR_GP_PIN(1, 15)] =3D { PUPR4, 31 },=09/* IRQ3=09=09*/
> -
> -=09[RCAR_GP_PIN(0,  1)] =3D { PUPR5,  0 },=09/* PENC0=09*/
> -=09[RCAR_GP_PIN(0,  2)] =3D { PUPR5,  1 },=09/* PENC1=09*/
> -=09[RCAR_GP_PIN(0,  3)] =3D { PUPR5,  2 },=09/* USB_OVC0=09*/
> -=09[RCAR_GP_PIN(0,  4)] =3D { PUPR5,  3 },=09/* USB_OVC1=09*/
> -=09[RCAR_GP_PIN(1, 16)] =3D { PUPR5,  4 },=09/* SCIF_CLK=09*/
> -=09[RCAR_GP_PIN(1, 17)] =3D { PUPR5,  5 },=09/* TX0=09=09*/
> -=09[RCAR_GP_PIN(1, 18)] =3D { PUPR5,  6 },=09/* RX0=09=09*/
> -=09[RCAR_GP_PIN(1, 19)] =3D { PUPR5,  7 },=09/* SCK0=09=09*/
> -=09[RCAR_GP_PIN(1, 20)] =3D { PUPR5,  8 },=09/* /CTS0=09*/
> -=09[RCAR_GP_PIN(1, 21)] =3D { PUPR5,  9 },=09/* /RTS0=09*/
> -=09[RCAR_GP_PIN(3, 19)] =3D { PUPR5, 10 },=09/* HSPI_CLK0=09*/
> -=09[RCAR_GP_PIN(3, 20)] =3D { PUPR5, 11 },=09/* /HSPI_CS0=09*/
> -=09[RCAR_GP_PIN(3, 21)] =3D { PUPR5, 12 },=09/* HSPI_RX0=09*/
> -=09[RCAR_GP_PIN(3, 22)] =3D { PUPR5, 13 },=09/* HSPI_TX0=09*/
> -=09[RCAR_GP_PIN(4, 20)] =3D { PUPR5, 14 },=09/* ETH_MAGIC=09*/
> -=09[RCAR_GP_PIN(4, 25)] =3D { PUPR5, 15 },=09/* AVS1=09=09*/
> -=09[RCAR_GP_PIN(4, 26)] =3D { PUPR5, 16 },=09/* AVS2=09=09*/
> +static const struct sh_pfc_bias_info bias_info[] =3D {
> +=09{ RCAR_GP_PIN(0,  6), PUPR0,  0 },=09/* A0 */
> +=09{ RCAR_GP_PIN(0,  7), PUPR0,  1 },=09/* A1 */
> +=09{ RCAR_GP_PIN(0,  8), PUPR0,  2 },=09/* A2 */
> +=09{ RCAR_GP_PIN(0,  9), PUPR0,  3 },=09/* A3 */
> +=09{ RCAR_GP_PIN(0, 10), PUPR0,  4 },=09/* A4 */
> +=09{ RCAR_GP_PIN(0, 11), PUPR0,  5 },=09/* A5 */
> +=09{ RCAR_GP_PIN(0, 12), PUPR0,  6 },=09/* A6 */
> +=09{ RCAR_GP_PIN(0, 13), PUPR0,  7 },=09/* A7 */
> +=09{ RCAR_GP_PIN(0, 14), PUPR0,  8 },=09/* A8 */
> +=09{ RCAR_GP_PIN(0, 15), PUPR0,  9 },=09/* A9 */
> +=09{ RCAR_GP_PIN(0, 16), PUPR0, 10 },=09/* A10 */
> +=09{ RCAR_GP_PIN(0, 17), PUPR0, 11 },=09/* A11 */
> +=09{ RCAR_GP_PIN(0, 18), PUPR0, 12 },=09/* A12 */
> +=09{ RCAR_GP_PIN(0, 19), PUPR0, 13 },=09/* A13 */
> +=09{ RCAR_GP_PIN(0, 20), PUPR0, 14 },=09/* A14 */
> +=09{ RCAR_GP_PIN(0, 21), PUPR0, 15 },=09/* A15 */
> +=09{ RCAR_GP_PIN(0, 22), PUPR0, 16 },=09/* A16 */
> +=09{ RCAR_GP_PIN(0, 23), PUPR0, 17 },=09/* A17 */
> +=09{ RCAR_GP_PIN(0, 24), PUPR0, 18 },=09/* A18 */
> +=09{ RCAR_GP_PIN(0, 25), PUPR0, 19 },=09/* A19 */
> +=09{ RCAR_GP_PIN(0, 26), PUPR0, 20 },=09/* A20 */
> +=09{ RCAR_GP_PIN(0, 27), PUPR0, 21 },=09/* A21 */
> +=09{ RCAR_GP_PIN(0, 28), PUPR0, 22 },=09/* A22 */
> +=09{ RCAR_GP_PIN(0, 29), PUPR0, 23 },=09/* A23 */
> +=09{ RCAR_GP_PIN(0, 30), PUPR0, 24 },=09/* A24 */
> +=09{ RCAR_GP_PIN(0, 31), PUPR0, 25 },=09/* A25 */
> +=09{ RCAR_GP_PIN(1,  3), PUPR0, 26 },=09/* /EX_CS0 */
> +=09{ RCAR_GP_PIN(1,  4), PUPR0, 27 },=09/* /EX_CS1 */
> +=09{ RCAR_GP_PIN(1,  5), PUPR0, 28 },=09/* /EX_CS2 */
> +=09{ RCAR_GP_PIN(1,  6), PUPR0, 29 },=09/* /EX_CS3 */
> +=09{ RCAR_GP_PIN(1,  7), PUPR0, 30 },=09/* /EX_CS4 */
> +=09{ RCAR_GP_PIN(1,  8), PUPR0, 31 },=09/* /EX_CS5 */
> +
> +=09{ RCAR_GP_PIN(0,  0), PUPR1,  0 },=09/* /PRESETOUT=09*/
> +=09{ RCAR_GP_PIN(0,  5), PUPR1,  1 },=09/* /BS=09=09*/
> +=09{ RCAR_GP_PIN(1,  0), PUPR1,  2 },=09/* RD//WR=09*/
> +=09{ RCAR_GP_PIN(1,  1), PUPR1,  3 },=09/* /WE0=09=09*/
> +=09{ RCAR_GP_PIN(1,  2), PUPR1,  4 },=09/* /WE1=09=09*/
> +=09{ RCAR_GP_PIN(1, 11), PUPR1,  5 },=09/* EX_WAIT0=09*/
> +=09{ RCAR_GP_PIN(1,  9), PUPR1,  6 },=09/* DREQ0=09*/
> +=09{ RCAR_GP_PIN(1, 10), PUPR1,  7 },=09/* DACK0=09*/
> +=09{ RCAR_GP_PIN(1, 12), PUPR1,  8 },=09/* IRQ0=09=09*/
> +=09{ RCAR_GP_PIN(1, 13), PUPR1,  9 },=09/* IRQ1=09=09*/
> +
> +=09{ RCAR_GP_PIN(1, 22), PUPR2,  0 },=09/* DU0_DR0=09*/
> +=09{ RCAR_GP_PIN(1, 23), PUPR2,  1 },=09/* DU0_DR1=09*/
> +=09{ RCAR_GP_PIN(1, 24), PUPR2,  2 },=09/* DU0_DR2=09*/
> +=09{ RCAR_GP_PIN(1, 25), PUPR2,  3 },=09/* DU0_DR3=09*/
> +=09{ RCAR_GP_PIN(1, 26), PUPR2,  4 },=09/* DU0_DR4=09*/
> +=09{ RCAR_GP_PIN(1, 27), PUPR2,  5 },=09/* DU0_DR5=09*/
> +=09{ RCAR_GP_PIN(1, 28), PUPR2,  6 },=09/* DU0_DR6=09*/
> +=09{ RCAR_GP_PIN(1, 29), PUPR2,  7 },=09/* DU0_DR7=09*/
> +=09{ RCAR_GP_PIN(1, 30), PUPR2,  8 },=09/* DU0_DG0=09*/
> +=09{ RCAR_GP_PIN(1, 31), PUPR2,  9 },=09/* DU0_DG1=09*/
> +=09{ RCAR_GP_PIN(2,  0), PUPR2, 10 },=09/* DU0_DG2=09*/
> +=09{ RCAR_GP_PIN(2,  1), PUPR2, 11 },=09/* DU0_DG3=09*/
> +=09{ RCAR_GP_PIN(2,  2), PUPR2, 12 },=09/* DU0_DG4=09*/
> +=09{ RCAR_GP_PIN(2,  3), PUPR2, 13 },=09/* DU0_DG5=09*/
> +=09{ RCAR_GP_PIN(2,  4), PUPR2, 14 },=09/* DU0_DG6=09*/
> +=09{ RCAR_GP_PIN(2,  5), PUPR2, 15 },=09/* DU0_DG7=09*/
> +=09{ RCAR_GP_PIN(2,  6), PUPR2, 16 },=09/* DU0_DB0=09*/
> +=09{ RCAR_GP_PIN(2,  7), PUPR2, 17 },=09/* DU0_DB1=09*/
> +=09{ RCAR_GP_PIN(2,  8), PUPR2, 18 },=09/* DU0_DB2=09*/
> +=09{ RCAR_GP_PIN(2,  9), PUPR2, 19 },=09/* DU0_DB3=09*/
> +=09{ RCAR_GP_PIN(2, 10), PUPR2, 20 },=09/* DU0_DB4=09*/
> +=09{ RCAR_GP_PIN(2, 11), PUPR2, 21 },=09/* DU0_DB5=09*/
> +=09{ RCAR_GP_PIN(2, 12), PUPR2, 22 },=09/* DU0_DB6=09*/
> +=09{ RCAR_GP_PIN(2, 13), PUPR2, 23 },=09/* DU0_DB7=09*/
> +=09{ RCAR_GP_PIN(2, 14), PUPR2, 24 },=09/* DU0_DOTCLKIN=09*/
> +=09{ RCAR_GP_PIN(2, 15), PUPR2, 25 },=09/* DU0_DOTCLKOUT0 */
> +=09{ RCAR_GP_PIN(2, 17), PUPR2, 26 },=09/* DU0_HSYNC=09*/
> +=09{ RCAR_GP_PIN(2, 18), PUPR2, 27 },=09/* DU0_VSYNC=09*/
> +=09{ RCAR_GP_PIN(2, 19), PUPR2, 28 },=09/* DU0_EXODDF=09*/
> +=09{ RCAR_GP_PIN(2, 20), PUPR2, 29 },=09/* DU0_DISP=09*/
> +=09{ RCAR_GP_PIN(2, 21), PUPR2, 30 },=09/* DU0_CDE=09*/
> +=09{ RCAR_GP_PIN(2, 16), PUPR2, 31 },=09/* DU0_DOTCLKOUT1 */
> +
> +=09{ RCAR_GP_PIN(3, 24), PUPR3,  0 },=09/* VI0_CLK=09*/
> +=09{ RCAR_GP_PIN(3, 25), PUPR3,  1 },=09/* VI0_CLKENB=09*/
> +=09{ RCAR_GP_PIN(3, 26), PUPR3,  2 },=09/* VI0_FIELD=09*/
> +=09{ RCAR_GP_PIN(3, 27), PUPR3,  3 },=09/* /VI0_HSYNC=09*/
> +=09{ RCAR_GP_PIN(3, 28), PUPR3,  4 },=09/* /VI0_VSYNC=09*/
> +=09{ RCAR_GP_PIN(3, 29), PUPR3,  5 },=09/* VI0_DATA0=09*/
> +=09{ RCAR_GP_PIN(3, 30), PUPR3,  6 },=09/* VI0_DATA1=09*/
> +=09{ RCAR_GP_PIN(3, 31), PUPR3,  7 },=09/* VI0_DATA2=09*/
> +=09{ RCAR_GP_PIN(4,  0), PUPR3,  8 },=09/* VI0_DATA3=09*/
> +=09{ RCAR_GP_PIN(4,  1), PUPR3,  9 },=09/* VI0_DATA4=09*/
> +=09{ RCAR_GP_PIN(4,  2), PUPR3, 10 },=09/* VI0_DATA5=09*/
> +=09{ RCAR_GP_PIN(4,  3), PUPR3, 11 },=09/* VI0_DATA6=09*/
> +=09{ RCAR_GP_PIN(4,  4), PUPR3, 12 },=09/* VI0_DATA7=09*/
> +=09{ RCAR_GP_PIN(4,  5), PUPR3, 13 },=09/* VI0_G2=09*/
> +=09{ RCAR_GP_PIN(4,  6), PUPR3, 14 },=09/* VI0_G3=09*/
> +=09{ RCAR_GP_PIN(4,  7), PUPR3, 15 },=09/* VI0_G4=09*/
> +=09{ RCAR_GP_PIN(4,  8), PUPR3, 16 },=09/* VI0_G5=09*/
> +=09{ RCAR_GP_PIN(4, 21), PUPR3, 17 },=09/* VI1_DATA12=09*/
> +=09{ RCAR_GP_PIN(4, 22), PUPR3, 18 },=09/* VI1_DATA13=09*/
> +=09{ RCAR_GP_PIN(4, 23), PUPR3, 19 },=09/* VI1_DATA14=09*/
> +=09{ RCAR_GP_PIN(4, 24), PUPR3, 20 },=09/* VI1_DATA15=09*/
> +=09{ RCAR_GP_PIN(4,  9), PUPR3, 21 },=09/* ETH_REF_CLK=09*/
> +=09{ RCAR_GP_PIN(4, 10), PUPR3, 22 },=09/* ETH_TXD0=09*/
> +=09{ RCAR_GP_PIN(4, 11), PUPR3, 23 },=09/* ETH_TXD1=09*/
> +=09{ RCAR_GP_PIN(4, 12), PUPR3, 24 },=09/* ETH_CRS_DV=09*/
> +=09{ RCAR_GP_PIN(4, 13), PUPR3, 25 },=09/* ETH_TX_EN=09*/
> +=09{ RCAR_GP_PIN(4, 14), PUPR3, 26 },=09/* ETH_RX_ER=09*/
> +=09{ RCAR_GP_PIN(4, 15), PUPR3, 27 },=09/* ETH_RXD0=09*/
> +=09{ RCAR_GP_PIN(4, 16), PUPR3, 28 },=09/* ETH_RXD1=09*/
> +=09{ RCAR_GP_PIN(4, 17), PUPR3, 29 },=09/* ETH_MDC=09*/
> +=09{ RCAR_GP_PIN(4, 18), PUPR3, 30 },=09/* ETH_MDIO=09*/
> +=09{ RCAR_GP_PIN(4, 19), PUPR3, 31 },=09/* ETH_LINK=09*/
> +
> +=09{ RCAR_GP_PIN(3,  6), PUPR4,  0 },=09/* SSI_SCK012=09*/
> +=09{ RCAR_GP_PIN(3,  7), PUPR4,  1 },=09/* SSI_WS012=09*/
> +=09{ RCAR_GP_PIN(3, 10), PUPR4,  2 },=09/* SSI_SDATA0=09*/
> +=09{ RCAR_GP_PIN(3,  9), PUPR4,  3 },=09/* SSI_SDATA1=09*/
> +=09{ RCAR_GP_PIN(3,  8), PUPR4,  4 },=09/* SSI_SDATA2=09*/
> +=09{ RCAR_GP_PIN(3,  2), PUPR4,  5 },=09/* SSI_SCK34=09*/
> +=09{ RCAR_GP_PIN(3,  3), PUPR4,  6 },=09/* SSI_WS34=09*/
> +=09{ RCAR_GP_PIN(3,  5), PUPR4,  7 },=09/* SSI_SDATA3=09*/
> +=09{ RCAR_GP_PIN(3,  4), PUPR4,  8 },=09/* SSI_SDATA4=09*/
> +=09{ RCAR_GP_PIN(2, 31), PUPR4,  9 },=09/* SSI_SCK5=09*/
> +=09{ RCAR_GP_PIN(3,  0), PUPR4, 10 },=09/* SSI_WS5=09*/
> +=09{ RCAR_GP_PIN(3,  1), PUPR4, 11 },=09/* SSI_SDATA5=09*/
> +=09{ RCAR_GP_PIN(2, 28), PUPR4, 12 },=09/* SSI_SCK6=09*/
> +=09{ RCAR_GP_PIN(2, 29), PUPR4, 13 },=09/* SSI_WS6=09*/
> +=09{ RCAR_GP_PIN(2, 30), PUPR4, 14 },=09/* SSI_SDATA6=09*/
> +=09{ RCAR_GP_PIN(2, 24), PUPR4, 15 },=09/* SSI_SCK78=09*/
> +=09{ RCAR_GP_PIN(2, 25), PUPR4, 16 },=09/* SSI_WS78=09*/
> +=09{ RCAR_GP_PIN(2, 27), PUPR4, 17 },=09/* SSI_SDATA7=09*/
> +=09{ RCAR_GP_PIN(2, 26), PUPR4, 18 },=09/* SSI_SDATA8=09*/
> +=09{ RCAR_GP_PIN(3, 23), PUPR4, 19 },=09/* TCLK0=09*/
> +=09{ RCAR_GP_PIN(3, 11), PUPR4, 20 },=09/* SD0_CLK=09*/
> +=09{ RCAR_GP_PIN(3, 12), PUPR4, 21 },=09/* SD0_CMD=09*/
> +=09{ RCAR_GP_PIN(3, 13), PUPR4, 22 },=09/* SD0_DAT0=09*/
> +=09{ RCAR_GP_PIN(3, 14), PUPR4, 23 },=09/* SD0_DAT1=09*/
> +=09{ RCAR_GP_PIN(3, 15), PUPR4, 24 },=09/* SD0_DAT2=09*/
> +=09{ RCAR_GP_PIN(3, 16), PUPR4, 25 },=09/* SD0_DAT3=09*/
> +=09{ RCAR_GP_PIN(3, 17), PUPR4, 26 },=09/* SD0_CD=09*/
> +=09{ RCAR_GP_PIN(3, 18), PUPR4, 27 },=09/* SD0_WP=09*/
> +=09{ RCAR_GP_PIN(2, 22), PUPR4, 28 },=09/* AUDIO_CLKA=09*/
> +=09{ RCAR_GP_PIN(2, 23), PUPR4, 29 },=09/* AUDIO_CLKB=09*/
> +=09{ RCAR_GP_PIN(1, 14), PUPR4, 30 },=09/* IRQ2=09=09*/
> +=09{ RCAR_GP_PIN(1, 15), PUPR4, 31 },=09/* IRQ3=09=09*/
> +
> +=09{ RCAR_GP_PIN(0,  1), PUPR5,  0 },=09/* PENC0=09*/
> +=09{ RCAR_GP_PIN(0,  2), PUPR5,  1 },=09/* PENC1=09*/
> +=09{ RCAR_GP_PIN(0,  3), PUPR5,  2 },=09/* USB_OVC0=09*/
> +=09{ RCAR_GP_PIN(0,  4), PUPR5,  3 },=09/* USB_OVC1=09*/
> +=09{ RCAR_GP_PIN(1, 16), PUPR5,  4 },=09/* SCIF_CLK=09*/
> +=09{ RCAR_GP_PIN(1, 17), PUPR5,  5 },=09/* TX0=09=09*/
> +=09{ RCAR_GP_PIN(1, 18), PUPR5,  6 },=09/* RX0=09=09*/
> +=09{ RCAR_GP_PIN(1, 19), PUPR5,  7 },=09/* SCK0=09=09*/
> +=09{ RCAR_GP_PIN(1, 20), PUPR5,  8 },=09/* /CTS0=09*/
> +=09{ RCAR_GP_PIN(1, 21), PUPR5,  9 },=09/* /RTS0=09*/
> +=09{ RCAR_GP_PIN(3, 19), PUPR5, 10 },=09/* HSPI_CLK0=09*/
> +=09{ RCAR_GP_PIN(3, 20), PUPR5, 11 },=09/* /HSPI_CS0=09*/
> +=09{ RCAR_GP_PIN(3, 21), PUPR5, 12 },=09/* HSPI_RX0=09*/
> +=09{ RCAR_GP_PIN(3, 22), PUPR5, 13 },=09/* HSPI_TX0=09*/
> +=09{ RCAR_GP_PIN(4, 20), PUPR5, 14 },=09/* ETH_MAGIC=09*/
> +=09{ RCAR_GP_PIN(4, 25), PUPR5, 15 },=09/* AVS1=09=09*/
> +=09{ RCAR_GP_PIN(4, 26), PUPR5, 16 },=09/* AVS2=09=09*/
>  };
>=20
>  static unsigned int r8a7778_pinmux_get_bias(struct sh_pfc *pfc,
>  =09=09=09=09=09    unsigned int pin)
>  {
> +=09const struct sh_pfc_bias_info *info;
>  =09void __iomem *addr;
>=20
> -=09if (WARN_ON_ONCE(!pullups[pin].reg))
> +=09info =3D sh_pfc_pin_to_bias_info(bias_info, ARRAY_SIZE(bias_info)=
, pin);
> +=09if (!info)
>  =09=09return PIN_CONFIG_BIAS_DISABLE;
>=20
> -=09addr =3D pfc->windows->virt + pullups[pin].reg;
> +=09addr =3D pfc->windows->virt + info->reg;
>=20
> -=09if (ioread32(addr) & BIT(pullups[pin].bit))
> +=09if (ioread32(addr) & BIT(info->bit))
>  =09=09return PIN_CONFIG_BIAS_PULL_UP;
>  =09else
>  =09=09return PIN_CONFIG_BIAS_DISABLE;
> @@ -3103,15 +3103,17 @@ static unsigned int r8a7778_pinmux_get_bias(s=
truct
> sh_pfc *pfc, static void r8a7778_pinmux_set_bias(struct sh_pfc *pfc,
> unsigned int pin, unsigned int bias)
>  {
> +=09const struct sh_pfc_bias_info *info;
>  =09void __iomem *addr;
>  =09u32 value;
>  =09u32 bit;
>=20
> -=09if (WARN_ON_ONCE(!pullups[pin].reg))
> +=09info =3D sh_pfc_pin_to_bias_info(bias_info, ARRAY_SIZE(bias_info)=
, pin);
> +=09if (!info)
>  =09=09return;
>=20
> -=09addr =3D pfc->windows->virt + pullups[pin].reg;
> -=09bit =3D BIT(pullups[pin].bit);
> +=09addr =3D pfc->windows->virt + info->reg;
> +=09bit =3D BIT(info->bit);
>=20
>  =09value =3D ioread32(addr) & ~bit;
>  =09if (bias =3D=3D PIN_CONFIG_BIAS_PULL_UP)

--=20
Regards,

Laurent Pinchart
