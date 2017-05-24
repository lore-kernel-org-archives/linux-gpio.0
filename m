From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio
Date: Wed, 24 May 2017 15:57:49 +0300
Message-ID: <2806448.cAnmeTWMfp@avalon>
References: <1495626214-15502-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51211 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761714AbdEXM5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 08:57:31 -0400
In-Reply-To: <1495626214-15502-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wednesday 24 May 2017 13:43:34 Geert Uytterhoeven wrote:
> Configuration of the lcd0 pinmux group and GPIO hog for the external
> GPIO mux are done using a single device node, causing the "output-hig=
h"
> property to be applied to both.  This will fail for the pinmux group,=

> but doesn't cause any harm, as the failure is ignored silently.
>=20
> However, after "pinctrl: sh-pfc: propagate errors on group config", t=
he
> failure will become fatal, leading to a broken display:
>=20
>     sh-pfc e6050000.pin-controller: pin_config_group_set op failed fo=
r group
> 102 sh-pfc e6050000.pin-controller: Error applying setting, reverse t=
hings
> back sh-pfc e6050000.pin-controller: failed to select default state
>=20
> Split the configuration in two subnodes, and replace the GPIO hog by =
a
> pull-up pin bias to fix this.
>=20
> Fixes: ffd2f9a5afb730b9 ("ARM: shmobile: armadillo800eva dts: Add pin=
ctrl
> and gpio-hog for lcdc0") Signed-off-by: Geert Uytterhoeven
> <geert+renesas@glider.be>
> ---
> This is a hard dependency for "pinctrl: sh-pfc: propagate errors on
> group config" (https://patchwork.kernel.org/patch/9186713/).
>=20
> Notes:
>   1. Just keeping the GPIO hog doesn't work, as the sh-pfc driver
>      requires each pinctrl (sub)node to have at least one "pins" or
>      "groups" property,
>   2. Keeping "output-high" doesn't work, as the sh-pfc driver does no=
t
>      implement PIN_CONFIG_OUTPUT.
>=20
> Should I fix 1 and/or 2 instead?
> ---
>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts index
> 44b335b9f035436d..7feedc86f6915654 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> @@ -267,13 +267,16 @@
>  =09};
>=20
>  =09lcd0_pins: lcd0 {
> -=09=09groups =3D "lcd0_data24_0", "lcd0_lclk_1", "lcd0_sync";
> -=09=09function =3D "lcd0";
> +=09=09mux {
> +=09=09=09groups =3D "lcd0_data24_0", "lcd0_lclk_1", "lcd0_sync";
> +=09=09=09function =3D "lcd0";
> +=09=09};
>=20
> -=09=09/* DBGMD/LCDC0/FSIA MUX */
> -=09=09gpio-hog;
> -=09=09gpios =3D <176 0>;
> -=09=09output-high;
> +=09=09gpio {
> +=09=09=09/* DBGMD/LCDC0/FSIA MUX */
> +=09=09=09pins =3D "PORT176";
> +=09=09=09bias-pull-up;

The signal is pulled low through a 10k=CE=A9 resistor, so a pull-up is =
a bit weak.=20
You'll end up with an intermediate voltage level that could result in m=
eta-
stability and/or latch-up. I think we need to really drive the output t=
o 1.

> +=09=09};
>  =09};
>  };

--=20
Regards,

Laurent Pinchart

