From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: Add NextThing GR8 dtsi
Date: Thu, 8 Sep 2016 09:41:55 +0200
Message-ID: <20160908074155.GH8913@lukather>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-4-maxime.ripard@free-electrons.com>
 <CAGb2v67WLn6Sv9ie9CrA52zHf0xbwVd7YrJ_2pF3UW8LmxVvRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="D6IIOQQv2Iwyp54J"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:37064 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755601AbcIHHmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 03:42:07 -0400
Content-Disposition: inline
In-Reply-To: <CAGb2v67WLn6Sv9ie9CrA52zHf0xbwVd7YrJ_2pF3UW8LmxVvRQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>


--D6IIOQQv2Iwyp54J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 12:32:48AM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 7, 2016 at 10:53 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > From: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> >
> > The GR8 is an SoC made by Nextthing loosely based on the sun5i family.
> >
> > Since it's not clear yet what we can factor out and merge with the A10s=
 and
> > A13 support, let's keep it out of the sun5i.dtsi include tree. We will
> > figure out what can be shared when things settle down.
> >
> > Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/ntc-gr8.dtsi | 1080 ++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 1080 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/ntc-gr8.dtsi
> >
> > diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8=
=2Edtsi
> > new file mode 100644
> > index 000000000000..d21cfa3f3c14
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
> > @@ -0,0 +1,1080 @@
>=20
> [...]
>=20
> > +               pll3x2: pll3x2_clk {
> > +                       compatible =3D "fixed-factor-clock";
>=20
> I think you want "allwinner,sun4i-a10-pll3-2x-clk"?

Indeed.

> > +               tcon_ch1_clk: clk@01c2012c {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun4i-a10-tcon-ch1-cl=
k";
> > +                       reg =3D <0x01c2012c 0x4>;
> > +                       clocks =3D <&pll3>, <&pll7>, <&pll3x2>, <&pll7x=
2>;
> > +                       clock-output-names =3D "tcon-ch1-sclk";
> > +               };
>=20
> Nit: Is there a ve_clk we could add?

I don't know. No one uses it, and the next item on my todo list is to
move the sun5i SoCs to sunxi-ng, so it seems a bit useless to add that
one.

>=20
> [...]
>=20
> > +               pio: pinctrl@01c20800 {
> > +                       compatible =3D "nextthing,gr8-pinctrl";
> > +                       reg =3D <0x01c20800 0x400>;
> > +                       interrupts =3D <28>;
> > +                       clocks =3D <&apb0_gates 5>;
> > +                       gpio-controller;
> > +                       interrupt-controller;
> > +                       #interrupt-cells =3D <3>;
> > +                       #gpio-cells =3D <3>;
> > +
> > +                       i2c0_pins_a: i2c0@0 {
> > +                               allwinner,pins =3D "PB0", "PB1";
> > +                               allwinner,function =3D "i2c0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       i2c1_pins_a: i2c1@0 {
> > +                               allwinner,pins =3D "PB15", "PB16";
> > +                               allwinner,function =3D "i2c1";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       i2c2_pins_a: i2c2@0 {
> > +                               allwinner,pins =3D "PB17", "PB18";
> > +                               allwinner,function =3D "i2c2";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       i2s0_pins_a: i2s0@0 {
> > +                               allwinner,pins =3D "PB5", "PB6", "PB7",=
 "PB8", "PB9";
> > +                               allwinner,function =3D "i2s0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
>=20
> You may want to split out the MCLK pin. Some codecs don't need it, and the
> pin can be allocated for other uses.

ACK.

>=20
> > +
> > +                       ir0_rx_pins_a: ir0@0 {
> > +                               allwinner,pins =3D "PB4";
> > +                               allwinner,function =3D "ir0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       lcd_rgb666_pins: lcd_rgb666@0 {
> > +                               allwinner,pins =3D "PD2", "PD3", "PD4",=
 "PD5", "PD6", "PD7",
> > +                                                "PD10", "PD11", "PD12"=
, "PD13", "PD14", "PD15",
> > +                                                "PD18", "PD19", "PD20"=
, "PD21", "PD22", "PD23",
> > +                                                "PD24", "PD25", "PD26"=
, "PD27";
> > +                               allwinner,function =3D "lcd0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       mmc0_pins_a: mmc0@0 {
> > +                               allwinner,pins =3D "PF0", "PF1", "PF2",=
 "PF3",
> > +                                                "PF4", "PF5";
> > +                               allwinner,function =3D "mmc0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_30_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       nand_pins_a: nand_base0@0 {
> > +                               allwinner,pins =3D "PC0", "PC1", "PC2",
> > +                                               "PC5", "PC8", "PC9", "P=
C10",
> > +                                               "PC11", "PC12", "PC13",=
 "PC14",
> > +                                               "PC15";
> > +                               allwinner,function =3D "nand0";
> > +                               allwinner,drive =3D <0>;
> > +                               allwinner,pull =3D <0>;
>=20
> Macros for the nand pins?

Indeed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--D6IIOQQv2Iwyp54J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0RZCAAoJEBx+YmzsjxAglDYP/1eDhlSn6hetT0w2Yh3BIjuN
vBTz67wevefxic4mazTw64aMcLTVNckej4ms9GvrPToZq5mADz6G895CIZeH+hQK
9dzK7wXh0o7TXw9OwVq1fi6F4KbyqbIqq9KD3sSZNee3dXQd4SwTQ/MS4L7mHYYz
ar1sGNsne8rQc456GAbtVjqHumYf39EvbcKru8eOZP5Jju7FUaphIq7kUFQL4R4E
9FWqrLzeXIe9kE+oczLcQWhz4axqetryL2BBSQ++L0x+hEoghJSxVHYFWs+owfvW
Rx47u+K7NJ8exlwQkulgjL6B8q1Cr6t8EuAEeARoId7TuYGVJEFg/20V247kgYb2
mCTUSeIvYT+JW3t4j3w/sw/A1+SrVemLu6YjajsAxKOQrrU0EBh7YZT9/Xv+pfSq
rCG4iWN2CewUMzyzCMCQHuQS5s1rkq+oxxdtrSQRH5tF/YMqrHNX6EeMscvxsSi1
gPJezuu2MSIAL6Yicv03djP9Hh9OP7E/NfhP16Y+pmD+M5L2visSBE44o/wkLar/
ooN+6bUTLo7h+nM28yuYVJn+aIdEYnR/tgSIxUeWtn0P0HnwoBJCGGA7AHkWl09p
A2IRSz66lEj7Q+GN2O7k8M21ML3uG2IDCxtPpefyIJJDt4SGweCxo0OKomgO81vo
nf/ePUsc4VnwwlAyhkQZ
=BAyj
-----END PGP SIGNATURE-----

--D6IIOQQv2Iwyp54J--
