From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
Date: Thu, 03 Nov 2016 19:10:06 +0200
Message-ID: <2675389.IrWB4HU6aN@avalon>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se> <20161103153421.15527-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161103153421.15527-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for thr patch.

On Thursday 03 Nov 2016 16:34:21 Niklas S=F6derlund wrote:
> There is a bug in the r8a7795 bias code where a WARN() is trigged
> anytime a pin from PUEN0/PUD0is accessed.
>=20
>  # cat /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins
>=20
>  WARNING: CPU: 2 PID: 2391 at drivers/pinctrl/sh-pfc/pfc-r8a7795.c:53=
64
> r8a7795_pinmux_get_bias+0xbc/0xc8 [..]
>  Call trace:
>  [<ffff0000083c442c>] r8a7795_pinmux_get_bias+0xbc/0xc8
>  [<ffff0000083c37f4>] sh_pfc_pinconf_get+0x194/0x270
>  [<ffff0000083b0768>] pin_config_get_for_pin+0x20/0x30
>  [<ffff0000083b11e8>] pinconf_generic_dump_one+0x168/0x188
>  [<ffff0000083b144c>] pinconf_generic_dump_pins+0x5c/0x98
>  [<ffff0000083b0628>] pinconf_pins_show+0xc8/0x128
>  [<ffff0000081fe3bc>] seq_read+0x16c/0x420
>  [<ffff00000831a110>] full_proxy_read+0x58/0x88
>  [<ffff0000081d7ad4>] __vfs_read+0x1c/0xf8
>  [<ffff0000081d8874>] vfs_read+0x84/0x148
>  [<ffff0000081d9d64>] SyS_read+0x44/0xa0
>  [<ffff000008082f4c>] __sys_trace_return+0x0/0x4
>=20
> This is due to the WARN() check if the reg field of the pullups struc=
t
> is zero, and this should be 0 for pins controlled by the PUEN0/PUD0
> registers. Change the layout of the pullups struct to embed the pin
> number inside the struct and loop over it to fetch the correct
> information or WARN() if no pin is found.

This lowers the memory consumption at the cost of increased CPU usage. =
Given=20
that the get/set bias functions are not part of a critical path I'm fin=
e with=20
that. We could possibly optimize the implementation by using a dichotom=
ic=20
search, but I don't think that's needed at the moment.

I can foresee the r8a7795_pin_to_bias_data() function being used for ot=
her=20
Gen3 SoCs. Could you move it to the core, and move the WARN_ON_ONCE() f=
rom the=20
caller to the function ? It would be great if you could also convert r8=
a7778=20
to use this new method.

> Fixes: 560655247b627ac7 ("pinctrl: sh-pfc: r8a7795: Add bias pinconf
> support") Signed-off-by: Niklas S=F6derlund
> <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 350 ++++++++++++++++---------=
------
>  1 file changed, 180 insertions(+), 170 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c index 2e8cc2a..69e1f31 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -5189,171 +5189,187 @@ static int r8a7795_pin_to_pocctrl(struct sh=
_pfc
> *pfc, unsigned int pin, u32 *poc #define PU6=090x18
>=20
>  static const struct {
> +=09u16 pin;
>  =09u16 reg : 11;
>  =09u16 bit : 5;
>  } pullups[] =3D {
> -=09[RCAR_GP_PIN(2, 11)] =3D { PU0, 31 },=09/* AVB_PHY_INT */
> -=09[RCAR_GP_PIN(2, 10)] =3D { PU0, 30 },=09/* AVB_MAGIC */
> -=09[RCAR_GP_PIN(2,  9)] =3D { PU0, 29 },=09/* AVB_MDC */
> -
> -=09[RCAR_GP_PIN(1, 19)] =3D { PU1, 31 },=09/* A19 */
> -=09[RCAR_GP_PIN(1, 18)] =3D { PU1, 30 },=09/* A18 */
> -=09[RCAR_GP_PIN(1, 17)] =3D { PU1, 29 },=09/* A17 */
> -=09[RCAR_GP_PIN(1, 16)] =3D { PU1, 28 },=09/* A16 */
> -=09[RCAR_GP_PIN(1, 15)] =3D { PU1, 27 },=09/* A15 */
> -=09[RCAR_GP_PIN(1, 14)] =3D { PU1, 26 },=09/* A14 */
> -=09[RCAR_GP_PIN(1, 13)] =3D { PU1, 25 },=09/* A13 */
> -=09[RCAR_GP_PIN(1, 12)] =3D { PU1, 24 },=09/* A12 */
> -=09[RCAR_GP_PIN(1, 11)] =3D { PU1, 23 },=09/* A11 */
> -=09[RCAR_GP_PIN(1, 10)] =3D { PU1, 22 },=09/* A10 */
> -=09[RCAR_GP_PIN(1,  9)] =3D { PU1, 21 },=09/* A9 */
> -=09[RCAR_GP_PIN(1,  8)] =3D { PU1, 20 },=09/* A8 */
> -=09[RCAR_GP_PIN(1,  7)] =3D { PU1, 19 },=09/* A7 */
> -=09[RCAR_GP_PIN(1,  6)] =3D { PU1, 18 },=09/* A6 */
> -=09[RCAR_GP_PIN(1,  5)] =3D { PU1, 17 },=09/* A5 */
> -=09[RCAR_GP_PIN(1,  4)] =3D { PU1, 16 },=09/* A4 */
> -=09[RCAR_GP_PIN(1,  3)] =3D { PU1, 15 },=09/* A3 */
> -=09[RCAR_GP_PIN(1,  2)] =3D { PU1, 14 },=09/* A2 */
> -=09[RCAR_GP_PIN(1,  1)] =3D { PU1, 13 },=09/* A1 */
> -=09[RCAR_GP_PIN(1,  0)] =3D { PU1, 12 },=09/* A0 */
> -=09[RCAR_GP_PIN(2,  8)] =3D { PU1, 11 },=09/* PWM2_A */
> -=09[RCAR_GP_PIN(2,  7)] =3D { PU1, 10 },=09/* PWM1_A */
> -=09[RCAR_GP_PIN(2,  6)] =3D { PU1,  9 },=09/* PWM0 */
> -=09[RCAR_GP_PIN(2,  5)] =3D { PU1,  8 },=09/* IRQ5 */
> -=09[RCAR_GP_PIN(2,  4)] =3D { PU1,  7 },=09/* IRQ4 */
> -=09[RCAR_GP_PIN(2,  3)] =3D { PU1,  6 },=09/* IRQ3 */
> -=09[RCAR_GP_PIN(2,  2)] =3D { PU1,  5 },=09/* IRQ2 */
> -=09[RCAR_GP_PIN(2,  1)] =3D { PU1,  4 },=09/* IRQ1 */
> -=09[RCAR_GP_PIN(2,  0)] =3D { PU1,  3 },=09/* IRQ0 */
> -=09[RCAR_GP_PIN(2, 14)] =3D { PU1,  2 },=09/* AVB_AVTP_CAPTURE_A */
> -=09[RCAR_GP_PIN(2, 13)] =3D { PU1,  1 },=09/* AVB_AVTP_MATCH_A */
> -=09[RCAR_GP_PIN(2, 12)] =3D { PU1,  0 },=09/* AVB_LINK */
> -
> -=09[RCAR_GP_PIN(7,  3)] =3D { PU2, 29 },=09/* HDMI1_CEC */
> -=09[RCAR_GP_PIN(7,  2)] =3D { PU2, 28 },=09/* HDMI0_CEC */
> -=09[RCAR_GP_PIN(7,  1)] =3D { PU2, 27 },=09/* AVS2 */
> -=09[RCAR_GP_PIN(7,  0)] =3D { PU2, 26 },=09/* AVS1 */
> -=09[RCAR_GP_PIN(0, 15)] =3D { PU2, 25 },=09/* D15 */
> -=09[RCAR_GP_PIN(0, 14)] =3D { PU2, 24 },=09/* D14 */
> -=09[RCAR_GP_PIN(0, 13)] =3D { PU2, 23 },=09/* D13 */
> -=09[RCAR_GP_PIN(0, 12)] =3D { PU2, 22 },=09/* D12 */
> -=09[RCAR_GP_PIN(0, 11)] =3D { PU2, 21 },=09/* D11 */
> -=09[RCAR_GP_PIN(0, 10)] =3D { PU2, 20 },=09/* D10 */
> -=09[RCAR_GP_PIN(0,  9)] =3D { PU2, 19 },=09/* D9 */
> -=09[RCAR_GP_PIN(0,  8)] =3D { PU2, 18 },=09/* D8 */
> -=09[RCAR_GP_PIN(0,  7)] =3D { PU2, 17 },=09/* D7 */
> -=09[RCAR_GP_PIN(0,  6)] =3D { PU2, 16 },=09/* D6 */
> -=09[RCAR_GP_PIN(0,  5)] =3D { PU2, 15 },=09/* D5 */
> -=09[RCAR_GP_PIN(0,  4)] =3D { PU2, 14 },=09/* D4 */
> -=09[RCAR_GP_PIN(0,  3)] =3D { PU2, 13 },=09/* D3 */
> -=09[RCAR_GP_PIN(0,  2)] =3D { PU2, 12 },=09/* D2 */
> -=09[RCAR_GP_PIN(0,  1)] =3D { PU2, 11 },=09/* D1 */
> -=09[RCAR_GP_PIN(0,  0)] =3D { PU2, 10 },=09/* D0 */
> -=09[RCAR_GP_PIN(1, 27)] =3D { PU2,  8 },=09/* EX_WAIT0_A */
> -=09[RCAR_GP_PIN(1, 26)] =3D { PU2,  7 },=09/* WE1_N */
> -=09[RCAR_GP_PIN(1, 25)] =3D { PU2,  6 },=09/* WE0_N */
> -=09[RCAR_GP_PIN(1, 24)] =3D { PU2,  5 },=09/* RD_WR_N */
> -=09[RCAR_GP_PIN(1, 23)] =3D { PU2,  4 },=09/* RD_N */
> -=09[RCAR_GP_PIN(1, 22)] =3D { PU2,  3 },=09/* BS_N */
> -=09[RCAR_GP_PIN(1, 21)] =3D { PU2,  2 },=09/* CS1_N_A26 */
> -=09[RCAR_GP_PIN(1, 20)] =3D { PU2,  1 },=09/* CS0_N */
> -
> -=09[RCAR_GP_PIN(4,  9)] =3D { PU3, 31 },=09/* SD3_DAT0 */
> -=09[RCAR_GP_PIN(4,  8)] =3D { PU3, 30 },=09/* SD3_CMD */
> -=09[RCAR_GP_PIN(4,  7)] =3D { PU3, 29 },=09/* SD3_CLK */
> -=09[RCAR_GP_PIN(4,  6)] =3D { PU3, 28 },=09/* SD2_DS */
> -=09[RCAR_GP_PIN(4,  5)] =3D { PU3, 27 },=09/* SD2_DAT3 */
> -=09[RCAR_GP_PIN(4,  4)] =3D { PU3, 26 },=09/* SD2_DAT2 */
> -=09[RCAR_GP_PIN(4,  3)] =3D { PU3, 25 },=09/* SD2_DAT1 */
> -=09[RCAR_GP_PIN(4,  2)] =3D { PU3, 24 },=09/* SD2_DAT0 */
> -=09[RCAR_GP_PIN(4,  1)] =3D { PU3, 23 },=09/* SD2_CMD */
> -=09[RCAR_GP_PIN(4,  0)] =3D { PU3, 22 },=09/* SD2_CLK */
> -=09[RCAR_GP_PIN(3, 11)] =3D { PU3, 21 },=09/* SD1_DAT3 */
> -=09[RCAR_GP_PIN(3, 10)] =3D { PU3, 20 },=09/* SD1_DAT2 */
> -=09[RCAR_GP_PIN(3,  9)] =3D { PU3, 19 },=09/* SD1_DAT1 */
> -=09[RCAR_GP_PIN(3,  8)] =3D { PU3, 18 },=09/* SD1_DAT0 */
> -=09[RCAR_GP_PIN(3,  7)] =3D { PU3, 17 },=09/* SD1_CMD */
> -=09[RCAR_GP_PIN(3,  6)] =3D { PU3, 16 },=09/* SD1_CLK */
> -=09[RCAR_GP_PIN(3,  5)] =3D { PU3, 15 },=09/* SD0_DAT3 */
> -=09[RCAR_GP_PIN(3,  4)] =3D { PU3, 14 },=09/* SD0_DAT2 */
> -=09[RCAR_GP_PIN(3,  3)] =3D { PU3, 13 },=09/* SD0_DAT1 */
> -=09[RCAR_GP_PIN(3,  2)] =3D { PU3, 12 },=09/* SD0_DAT0 */
> -=09[RCAR_GP_PIN(3,  1)] =3D { PU3, 11 },=09/* SD0_CMD */
> -=09[RCAR_GP_PIN(3,  0)] =3D { PU3, 10 },=09/* SD0_CLK */
> -
> -=09[RCAR_GP_PIN(5, 19)] =3D { PU4, 31 },=09/* MSIOF0_SS1 */
> -=09[RCAR_GP_PIN(5, 18)] =3D { PU4, 30 },=09/* MSIOF0_SYNC */
> -=09[RCAR_GP_PIN(5, 17)] =3D { PU4, 29 },=09/* MSIOF0_SCK */
> -=09[RCAR_GP_PIN(5, 16)] =3D { PU4, 28 },=09/* HRTS0_N */
> -=09[RCAR_GP_PIN(5, 15)] =3D { PU4, 27 },=09/* HCTS0_N */
> -=09[RCAR_GP_PIN(5, 14)] =3D { PU4, 26 },=09/* HTX0 */
> -=09[RCAR_GP_PIN(5, 13)] =3D { PU4, 25 },=09/* HRX0 */
> -=09[RCAR_GP_PIN(5, 12)] =3D { PU4, 24 },=09/* HSCK0 */
> -=09[RCAR_GP_PIN(5, 11)] =3D { PU4, 23 },=09/* RX2_A */
> -=09[RCAR_GP_PIN(5, 10)] =3D { PU4, 22 },=09/* TX2_A */
> -=09[RCAR_GP_PIN(5,  9)] =3D { PU4, 21 },=09/* SCK2 */
> -=09[RCAR_GP_PIN(5,  8)] =3D { PU4, 20 },=09/* RTS1_N_TANS */
> -=09[RCAR_GP_PIN(5,  7)] =3D { PU4, 19 },=09/* CTS1_N */
> -=09[RCAR_GP_PIN(5,  6)] =3D { PU4, 18 },=09/* TX1_A */
> -=09[RCAR_GP_PIN(5,  5)] =3D { PU4, 17 },=09/* RX1_A */
> -=09[RCAR_GP_PIN(5,  4)] =3D { PU4, 16 },=09/* RTS0_N_TANS */
> -=09[RCAR_GP_PIN(5,  3)] =3D { PU4, 15 },=09/* CTS0_N */
> -=09[RCAR_GP_PIN(5,  2)] =3D { PU4, 14 },=09/* TX0 */
> -=09[RCAR_GP_PIN(5,  1)] =3D { PU4, 13 },=09/* RX0 */
> -=09[RCAR_GP_PIN(5,  0)] =3D { PU4, 12 },=09/* SCK0 */
> -=09[RCAR_GP_PIN(3, 15)] =3D { PU4, 11 },=09/* SD1_WP */
> -=09[RCAR_GP_PIN(3, 14)] =3D { PU4, 10 },=09/* SD1_CD */
> -=09[RCAR_GP_PIN(3, 13)] =3D { PU4,  9 },=09/* SD0_WP */
> -=09[RCAR_GP_PIN(3, 12)] =3D { PU4,  8 },=09/* SD0_CD */
> -=09[RCAR_GP_PIN(4, 17)] =3D { PU4,  7 },=09/* SD3_DS */
> -=09[RCAR_GP_PIN(4, 16)] =3D { PU4,  6 },=09/* SD3_DAT7 */
> -=09[RCAR_GP_PIN(4, 15)] =3D { PU4,  5 },=09/* SD3_DAT6 */
> -=09[RCAR_GP_PIN(4, 14)] =3D { PU4,  4 },=09/* SD3_DAT5 */
> -=09[RCAR_GP_PIN(4, 13)] =3D { PU4,  3 },=09/* SD3_DAT4 */
> -=09[RCAR_GP_PIN(4, 12)] =3D { PU4,  2 },=09/* SD3_DAT3 */
> -=09[RCAR_GP_PIN(4, 11)] =3D { PU4,  1 },=09/* SD3_DAT2 */
> -=09[RCAR_GP_PIN(4, 10)] =3D { PU4,  0 },=09/* SD3_DAT1 */
> -
> -=09[RCAR_GP_PIN(6, 24)] =3D { PU5, 31 },=09/* USB0_PWEN */
> -=09[RCAR_GP_PIN(6, 23)] =3D { PU5, 30 },=09/* AUDIO_CLKB_B */
> -=09[RCAR_GP_PIN(6, 22)] =3D { PU5, 29 },=09/* AUDIO_CLKA_A */
> -=09[RCAR_GP_PIN(6, 21)] =3D { PU5, 28 },=09/* SSI_SDATA9_A */
> -=09[RCAR_GP_PIN(6, 20)] =3D { PU5, 27 },=09/* SSI_SDATA8 */
> -=09[RCAR_GP_PIN(6, 19)] =3D { PU5, 26 },=09/* SSI_SDATA7 */
> -=09[RCAR_GP_PIN(6, 18)] =3D { PU5, 25 },=09/* SSI_WS78 */
> -=09[RCAR_GP_PIN(6, 17)] =3D { PU5, 24 },=09/* SSI_SCK78 */
> -=09[RCAR_GP_PIN(6, 16)] =3D { PU5, 23 },=09/* SSI_SDATA6 */
> -=09[RCAR_GP_PIN(6, 15)] =3D { PU5, 22 },=09/* SSI_WS6 */
> -=09[RCAR_GP_PIN(6, 14)] =3D { PU5, 21 },=09/* SSI_SCK6 */
> -=09[RCAR_GP_PIN(6, 13)] =3D { PU5, 20 },=09/* SSI_SDATA5 */
> -=09[RCAR_GP_PIN(6, 12)] =3D { PU5, 19 },=09/* SSI_WS5 */
> -=09[RCAR_GP_PIN(6, 11)] =3D { PU5, 18 },=09/* SSI_SCK5 */
> -=09[RCAR_GP_PIN(6, 10)] =3D { PU5, 17 },=09/* SSI_SDATA4 */
> -=09[RCAR_GP_PIN(6,  9)] =3D { PU5, 16 },=09/* SSI_WS4 */
> -=09[RCAR_GP_PIN(6,  8)] =3D { PU5, 15 },=09/* SSI_SCK4 */
> -=09[RCAR_GP_PIN(6,  7)] =3D { PU5, 14 },=09/* SSI_SDATA3 */
> -=09[RCAR_GP_PIN(6,  6)] =3D { PU5, 13 },=09/* SSI_WS34 */
> -=09[RCAR_GP_PIN(6,  5)] =3D { PU5, 12 },=09/* SSI_SCK34 */
> -=09[RCAR_GP_PIN(6,  4)] =3D { PU5, 11 },=09/* SSI_SDATA2_A */
> -=09[RCAR_GP_PIN(6,  3)] =3D { PU5, 10 },=09/* SSI_SDATA1_A */
> -=09[RCAR_GP_PIN(6,  2)] =3D { PU5,  9 },=09/* SSI_SDATA0 */
> -=09[RCAR_GP_PIN(6,  1)] =3D { PU5,  8 },=09/* SSI_WS01239 */
> -=09[RCAR_GP_PIN(6,  0)] =3D { PU5,  7 },=09/* SSI_SCK01239 */
> -=09[RCAR_GP_PIN(5, 25)] =3D { PU5,  5 },=09/* MLB_DAT */
> -=09[RCAR_GP_PIN(5, 24)] =3D { PU5,  4 },=09/* MLB_SIG */
> -=09[RCAR_GP_PIN(5, 23)] =3D { PU5,  3 },=09/* MLB_CLK */
> -=09[RCAR_GP_PIN(5, 22)] =3D { PU5,  2 },=09/* MSIOF0_RXD */
> -=09[RCAR_GP_PIN(5, 21)] =3D { PU5,  1 },=09/* MSIOF0_SS2 */
> -=09[RCAR_GP_PIN(5, 20)] =3D { PU5,  0 },=09/* MSIOF0_TXD */
> -
> -=09[RCAR_GP_PIN(6, 31)] =3D { PU6,  6 },=09/* USB31_OVC */
> -=09[RCAR_GP_PIN(6, 30)] =3D { PU6,  5 },=09/* USB31_PWEN */
> -=09[RCAR_GP_PIN(6, 29)] =3D { PU6,  4 },=09/* USB30_OVC */
> -=09[RCAR_GP_PIN(6, 28)] =3D { PU6,  3 },=09/* USB30_PWEN */
> -=09[RCAR_GP_PIN(6, 27)] =3D { PU6,  2 },=09/* USB1_OVC */
> -=09[RCAR_GP_PIN(6, 26)] =3D { PU6,  1 },=09/* USB1_PWEN */
> -=09[RCAR_GP_PIN(6, 25)] =3D { PU6,  0 },=09/* USB0_OVC */
> -};
> +=09{ RCAR_GP_PIN(2, 11), PU0, 31 },=09/* AVB_PHY_INT */
> +=09{ RCAR_GP_PIN(2, 10), PU0, 30 },=09/* AVB_MAGIC */
> +=09{ RCAR_GP_PIN(2,  9), PU0, 29 },=09/* AVB_MDC */
> +
> +=09{ RCAR_GP_PIN(1, 19), PU1, 31 },=09/* A19 */
> +=09{ RCAR_GP_PIN(1, 18), PU1, 30 },=09/* A18 */
> +=09{ RCAR_GP_PIN(1, 17), PU1, 29 },=09/* A17 */
> +=09{ RCAR_GP_PIN(1, 16), PU1, 28 },=09/* A16 */
> +=09{ RCAR_GP_PIN(1, 15), PU1, 27 },=09/* A15 */
> +=09{ RCAR_GP_PIN(1, 14), PU1, 26 },=09/* A14 */
> +=09{ RCAR_GP_PIN(1, 13), PU1, 25 },=09/* A13 */
> +=09{ RCAR_GP_PIN(1, 12), PU1, 24 },=09/* A12 */
> +=09{ RCAR_GP_PIN(1, 11), PU1, 23 },=09/* A11 */
> +=09{ RCAR_GP_PIN(1, 10), PU1, 22 },=09/* A10 */
> +=09{ RCAR_GP_PIN(1,  9), PU1, 21 },=09/* A9 */
> +=09{ RCAR_GP_PIN(1,  8), PU1, 20 },=09/* A8 */
> +=09{ RCAR_GP_PIN(1,  7), PU1, 19 },=09/* A7 */
> +=09{ RCAR_GP_PIN(1,  6), PU1, 18 },=09/* A6 */
> +=09{ RCAR_GP_PIN(1,  5), PU1, 17 },=09/* A5 */
> +=09{ RCAR_GP_PIN(1,  4), PU1, 16 },=09/* A4 */
> +=09{ RCAR_GP_PIN(1,  3), PU1, 15 },=09/* A3 */
> +=09{ RCAR_GP_PIN(1,  2), PU1, 14 },=09/* A2 */
> +=09{ RCAR_GP_PIN(1,  1), PU1, 13 },=09/* A1 */
> +=09{ RCAR_GP_PIN(1,  0), PU1, 12 },=09/* A0 */
> +=09{ RCAR_GP_PIN(2,  8), PU1, 11 },=09/* PWM2_A */
> +=09{ RCAR_GP_PIN(2,  7), PU1, 10 },=09/* PWM1_A */
> +=09{ RCAR_GP_PIN(2,  6), PU1,  9 },=09/* PWM0 */
> +=09{ RCAR_GP_PIN(2,  5), PU1,  8 },=09/* IRQ5 */
> +=09{ RCAR_GP_PIN(2,  4), PU1,  7 },=09/* IRQ4 */
> +=09{ RCAR_GP_PIN(2,  3), PU1,  6 },=09/* IRQ3 */
> +=09{ RCAR_GP_PIN(2,  2), PU1,  5 },=09/* IRQ2 */
> +=09{ RCAR_GP_PIN(2,  1), PU1,  4 },=09/* IRQ1 */
> +=09{ RCAR_GP_PIN(2,  0), PU1,  3 },=09/* IRQ0 */
> +=09{ RCAR_GP_PIN(2, 14), PU1,  2 },=09/* AVB_AVTP_CAPTURE_A */
> +=09{ RCAR_GP_PIN(2, 13), PU1,  1 },=09/* AVB_AVTP_MATCH_A */
> +=09{ RCAR_GP_PIN(2, 12), PU1,  0 },=09/* AVB_LINK */
> +
> +=09{ RCAR_GP_PIN(7,  3), PU2, 29 },=09/* HDMI1_CEC */
> +=09{ RCAR_GP_PIN(7,  2), PU2, 28 },=09/* HDMI0_CEC */
> +=09{ RCAR_GP_PIN(7,  1), PU2, 27 },=09/* AVS2 */
> +=09{ RCAR_GP_PIN(7,  0), PU2, 26 },=09/* AVS1 */
> +=09{ RCAR_GP_PIN(0, 15), PU2, 25 },=09/* D15 */
> +=09{ RCAR_GP_PIN(0, 14), PU2, 24 },=09/* D14 */
> +=09{ RCAR_GP_PIN(0, 13), PU2, 23 },=09/* D13 */
> +=09{ RCAR_GP_PIN(0, 12), PU2, 22 },=09/* D12 */
> +=09{ RCAR_GP_PIN(0, 11), PU2, 21 },=09/* D11 */
> +=09{ RCAR_GP_PIN(0, 10), PU2, 20 },=09/* D10 */
> +=09{ RCAR_GP_PIN(0,  9), PU2, 19 },=09/* D9 */
> +=09{ RCAR_GP_PIN(0,  8), PU2, 18 },=09/* D8 */
> +=09{ RCAR_GP_PIN(0,  7), PU2, 17 },=09/* D7 */
> +=09{ RCAR_GP_PIN(0,  6), PU2, 16 },=09/* D6 */
> +=09{ RCAR_GP_PIN(0,  5), PU2, 15 },=09/* D5 */
> +=09{ RCAR_GP_PIN(0,  4), PU2, 14 },=09/* D4 */
> +=09{ RCAR_GP_PIN(0,  3), PU2, 13 },=09/* D3 */
> +=09{ RCAR_GP_PIN(0,  2), PU2, 12 },=09/* D2 */
> +=09{ RCAR_GP_PIN(0,  1), PU2, 11 },=09/* D1 */
> +=09{ RCAR_GP_PIN(0,  0), PU2, 10 },=09/* D0 */
> +=09{ RCAR_GP_PIN(1, 27), PU2,  8 },=09/* EX_WAIT0_A */
> +=09{ RCAR_GP_PIN(1, 26), PU2,  7 },=09/* WE1_N */
> +=09{ RCAR_GP_PIN(1, 25), PU2,  6 },=09/* WE0_N */
> +=09{ RCAR_GP_PIN(1, 24), PU2,  5 },=09/* RD_WR_N */
> +=09{ RCAR_GP_PIN(1, 23), PU2,  4 },=09/* RD_N */
> +=09{ RCAR_GP_PIN(1, 22), PU2,  3 },=09/* BS_N */
> +=09{ RCAR_GP_PIN(1, 21), PU2,  2 },=09/* CS1_N_A26 */
> +=09{ RCAR_GP_PIN(1, 20), PU2,  1 },=09/* CS0_N */
> +
> +=09{ RCAR_GP_PIN(4,  9), PU3, 31 },=09/* SD3_DAT0 */
> +=09{ RCAR_GP_PIN(4,  8), PU3, 30 },=09/* SD3_CMD */
> +=09{ RCAR_GP_PIN(4,  7), PU3, 29 },=09/* SD3_CLK */
> +=09{ RCAR_GP_PIN(4,  6), PU3, 28 },=09/* SD2_DS */
> +=09{ RCAR_GP_PIN(4,  5), PU3, 27 },=09/* SD2_DAT3 */
> +=09{ RCAR_GP_PIN(4,  4), PU3, 26 },=09/* SD2_DAT2 */
> +=09{ RCAR_GP_PIN(4,  3), PU3, 25 },=09/* SD2_DAT1 */
> +=09{ RCAR_GP_PIN(4,  2), PU3, 24 },=09/* SD2_DAT0 */
> +=09{ RCAR_GP_PIN(4,  1), PU3, 23 },=09/* SD2_CMD */
> +=09{ RCAR_GP_PIN(4,  0), PU3, 22 },=09/* SD2_CLK */
> +=09{ RCAR_GP_PIN(3, 11), PU3, 21 },=09/* SD1_DAT3 */
> +=09{ RCAR_GP_PIN(3, 10), PU3, 20 },=09/* SD1_DAT2 */
> +=09{ RCAR_GP_PIN(3,  9), PU3, 19 },=09/* SD1_DAT1 */
> +=09{ RCAR_GP_PIN(3,  8), PU3, 18 },=09/* SD1_DAT0 */
> +=09{ RCAR_GP_PIN(3,  7), PU3, 17 },=09/* SD1_CMD */
> +=09{ RCAR_GP_PIN(3,  6), PU3, 16 },=09/* SD1_CLK */
> +=09{ RCAR_GP_PIN(3,  5), PU3, 15 },=09/* SD0_DAT3 */
> +=09{ RCAR_GP_PIN(3,  4), PU3, 14 },=09/* SD0_DAT2 */
> +=09{ RCAR_GP_PIN(3,  3), PU3, 13 },=09/* SD0_DAT1 */
> +=09{ RCAR_GP_PIN(3,  2), PU3, 12 },=09/* SD0_DAT0 */
> +=09{ RCAR_GP_PIN(3,  1), PU3, 11 },=09/* SD0_CMD */
> +=09{ RCAR_GP_PIN(3,  0), PU3, 10 },=09/* SD0_CLK */
> +
> +=09{ RCAR_GP_PIN(5, 19), PU4, 31 },=09/* MSIOF0_SS1 */
> +=09{ RCAR_GP_PIN(5, 18), PU4, 30 },=09/* MSIOF0_SYNC */
> +=09{ RCAR_GP_PIN(5, 17), PU4, 29 },=09/* MSIOF0_SCK */
> +=09{ RCAR_GP_PIN(5, 16), PU4, 28 },=09/* HRTS0_N */
> +=09{ RCAR_GP_PIN(5, 15), PU4, 27 },=09/* HCTS0_N */
> +=09{ RCAR_GP_PIN(5, 14), PU4, 26 },=09/* HTX0 */
> +=09{ RCAR_GP_PIN(5, 13), PU4, 25 },=09/* HRX0 */
> +=09{ RCAR_GP_PIN(5, 12), PU4, 24 },=09/* HSCK0 */
> +=09{ RCAR_GP_PIN(5, 11), PU4, 23 },=09/* RX2_A */
> +=09{ RCAR_GP_PIN(5, 10), PU4, 22 },=09/* TX2_A */
> +=09{ RCAR_GP_PIN(5,  9), PU4, 21 },=09/* SCK2 */
> +=09{ RCAR_GP_PIN(5,  8), PU4, 20 },=09/* RTS1_N_TANS */
> +=09{ RCAR_GP_PIN(5,  7), PU4, 19 },=09/* CTS1_N */
> +=09{ RCAR_GP_PIN(5,  6), PU4, 18 },=09/* TX1_A */
> +=09{ RCAR_GP_PIN(5,  5), PU4, 17 },=09/* RX1_A */
> +=09{ RCAR_GP_PIN(5,  4), PU4, 16 },=09/* RTS0_N_TANS */
> +=09{ RCAR_GP_PIN(5,  3), PU4, 15 },=09/* CTS0_N */
> +=09{ RCAR_GP_PIN(5,  2), PU4, 14 },=09/* TX0 */
> +=09{ RCAR_GP_PIN(5,  1), PU4, 13 },=09/* RX0 */
> +=09{ RCAR_GP_PIN(5,  0), PU4, 12 },=09/* SCK0 */
> +=09{ RCAR_GP_PIN(3, 15), PU4, 11 },=09/* SD1_WP */
> +=09{ RCAR_GP_PIN(3, 14), PU4, 10 },=09/* SD1_CD */
> +=09{ RCAR_GP_PIN(3, 13), PU4,  9 },=09/* SD0_WP */
> +=09{ RCAR_GP_PIN(3, 12), PU4,  8 },=09/* SD0_CD */
> +=09{ RCAR_GP_PIN(4, 17), PU4,  7 },=09/* SD3_DS */
> +=09{ RCAR_GP_PIN(4, 16), PU4,  6 },=09/* SD3_DAT7 */
> +=09{ RCAR_GP_PIN(4, 15), PU4,  5 },=09/* SD3_DAT6 */
> +=09{ RCAR_GP_PIN(4, 14), PU4,  4 },=09/* SD3_DAT5 */
> +=09{ RCAR_GP_PIN(4, 13), PU4,  3 },=09/* SD3_DAT4 */
> +=09{ RCAR_GP_PIN(4, 12), PU4,  2 },=09/* SD3_DAT3 */
> +=09{ RCAR_GP_PIN(4, 11), PU4,  1 },=09/* SD3_DAT2 */
> +=09{ RCAR_GP_PIN(4, 10), PU4,  0 },=09/* SD3_DAT1 */
> +
> +=09{ RCAR_GP_PIN(6, 24), PU5, 31 },=09/* USB0_PWEN */
> +=09{ RCAR_GP_PIN(6, 23), PU5, 30 },=09/* AUDIO_CLKB_B */
> +=09{ RCAR_GP_PIN(6, 22), PU5, 29 },=09/* AUDIO_CLKA_A */
> +=09{ RCAR_GP_PIN(6, 21), PU5, 28 },=09/* SSI_SDATA9_A */
> +=09{ RCAR_GP_PIN(6, 20), PU5, 27 },=09/* SSI_SDATA8 */
> +=09{ RCAR_GP_PIN(6, 19), PU5, 26 },=09/* SSI_SDATA7 */
> +=09{ RCAR_GP_PIN(6, 18), PU5, 25 },=09/* SSI_WS78 */
> +=09{ RCAR_GP_PIN(6, 17), PU5, 24 },=09/* SSI_SCK78 */
> +=09{ RCAR_GP_PIN(6, 16), PU5, 23 },=09/* SSI_SDATA6 */
> +=09{ RCAR_GP_PIN(6, 15), PU5, 22 },=09/* SSI_WS6 */
> +=09{ RCAR_GP_PIN(6, 14), PU5, 21 },=09/* SSI_SCK6 */
> +=09{ RCAR_GP_PIN(6, 13), PU5, 20 },=09/* SSI_SDATA5 */
> +=09{ RCAR_GP_PIN(6, 12), PU5, 19 },=09/* SSI_WS5 */
> +=09{ RCAR_GP_PIN(6, 11), PU5, 18 },=09/* SSI_SCK5 */
> +=09{ RCAR_GP_PIN(6, 10), PU5, 17 },=09/* SSI_SDATA4 */
> +=09{ RCAR_GP_PIN(6,  9), PU5, 16 },=09/* SSI_WS4 */
> +=09{ RCAR_GP_PIN(6,  8), PU5, 15 },=09/* SSI_SCK4 */
> +=09{ RCAR_GP_PIN(6,  7), PU5, 14 },=09/* SSI_SDATA3 */
> +=09{ RCAR_GP_PIN(6,  6), PU5, 13 },=09/* SSI_WS34 */
> +=09{ RCAR_GP_PIN(6,  5), PU5, 12 },=09/* SSI_SCK34 */
> +=09{ RCAR_GP_PIN(6,  4), PU5, 11 },=09/* SSI_SDATA2_A */
> +=09{ RCAR_GP_PIN(6,  3), PU5, 10 },=09/* SSI_SDATA1_A */
> +=09{ RCAR_GP_PIN(6,  2), PU5,  9 },=09/* SSI_SDATA0 */
> +=09{ RCAR_GP_PIN(6,  1), PU5,  8 },=09/* SSI_WS01239 */
> +=09{ RCAR_GP_PIN(6,  0), PU5,  7 },=09/* SSI_SCK01239 */
> +=09{ RCAR_GP_PIN(5, 25), PU5,  5 },=09/* MLB_DAT */
> +=09{ RCAR_GP_PIN(5, 24), PU5,  4 },=09/* MLB_SIG */
> +=09{ RCAR_GP_PIN(5, 23), PU5,  3 },=09/* MLB_CLK */
> +=09{ RCAR_GP_PIN(5, 22), PU5,  2 },=09/* MSIOF0_RXD */
> +=09{ RCAR_GP_PIN(5, 21), PU5,  1 },=09/* MSIOF0_SS2 */
> +=09{ RCAR_GP_PIN(5, 20), PU5,  0 },=09/* MSIOF0_TXD */
> +
> +=09{ RCAR_GP_PIN(6, 31), PU6,  6 },=09/* USB31_OVC */
> +=09{ RCAR_GP_PIN(6, 30), PU6,  5 },=09/* USB31_PWEN */
> +=09{ RCAR_GP_PIN(6, 29), PU6,  4 },=09/* USB30_OVC */
> +=09{ RCAR_GP_PIN(6, 28), PU6,  3 },=09/* USB30_PWEN */
> +=09{ RCAR_GP_PIN(6, 27), PU6,  2 },=09/* USB1_OVC */
> +=09{ RCAR_GP_PIN(6, 26), PU6,  1 },=09/* USB1_PWEN */
> +=09{ RCAR_GP_PIN(6, 25), PU6,  0 },=09/* USB0_OVC */
> +};
> +
> +static int r8a7795_pin_to_bias_data(unsigned int pin, u32 *reg, u32 =
*bit)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(pullups); i++) {
> +=09=09if (pullups[i].pin =3D=3D pin) {
> +=09=09=09*reg =3D pullups[i].reg;
> +=09=09=09*bit =3D BIT(pullups[i].bit);
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return -EINVAL;
> +}
>=20
>  static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
>  =09=09=09=09=09    unsigned int pin)
> @@ -5361,12 +5377,9 @@ static unsigned int r8a7795_pinmux_get_bias(st=
ruct
> sh_pfc *pfc, u32 reg;
>  =09u32 bit;
>=20
> -=09if (WARN_ON_ONCE(!pullups[pin].reg))
> +=09if (WARN_ON_ONCE(r8a7795_pin_to_bias_data(pin, &reg, &bit)))
>  =09=09return PIN_CONFIG_BIAS_DISABLE;
>=20
> -=09reg =3D pullups[pin].reg;
> -=09bit =3D BIT(pullups[pin].bit);
> -
>  =09if (sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit) {
>  =09=09if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
>  =09=09=09return PIN_CONFIG_BIAS_PULL_UP;

Slightly out of scope, but the following code

        if (sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit) {
                if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
                        return PIN_CONFIG_BIAS_PULL_UP;
                else
                        return PIN_CONFIG_BIAS_PULL_DOWN;
        } else
                return PIN_CONFIG_BIAS_DISABLE;

misses braces around the else. It could be written

        if (!(sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit))
                return PIN_CONFIG_BIAS_DISABLE;
        else if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
                return PIN_CONFIG_BIAS_PULL_UP;
        else
                return PIN_CONFIG_BIAS_PULL_DOWN;

> @@ -5383,12 +5396,9 @@ static void r8a7795_pinmux_set_bias(struct sh_=
pfc
> *pfc, unsigned int pin, u32 reg;
>  =09u32 bit;
>=20
> -=09if (WARN_ON_ONCE(!pullups[pin].reg))
> +=09if (WARN_ON_ONCE(r8a7795_pin_to_bias_data(pin, &reg, &bit)))
>  =09=09return;
>=20
> -=09reg =3D pullups[pin].reg;
> -=09bit =3D BIT(pullups[pin].bit);
> -
>  =09enable =3D sh_pfc_read_reg(pfc, PUEN + reg, 32) & ~bit;
>  =09if (bias !=3D PIN_CONFIG_BIAS_DISABLE)
>  =09=09enable |=3D bit;

--=20
Regards,

Laurent Pinchart
