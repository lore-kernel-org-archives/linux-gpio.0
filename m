From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: gr8: Add support for the GR8 evaluation
 board
Date: Thu, 8 Sep 2016 09:40:17 +0200
Message-ID: <20160908074017.GG8913@lukather>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-5-maxime.ripard@free-electrons.com>
 <CAGb2v66Ed1u5NaC9ev=ohywCbssy6BnkPcThY2D9O=_eNK1pdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:37028 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752396AbcIHHkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 03:40:39 -0400
Content-Disposition: inline
In-Reply-To: <CAGb2v66Ed1u5NaC9ev=ohywCbssy6BnkPcThY2D9O=_eNK1pdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>


--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 11:23:56PM +0800, Chen-Yu Tsai wrote:
> > +&i2c1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c1_pins_a>;
> > +       status =3D "okay";
> > +
> > +       pcf8563: rtc@51 {
> > +               compatible =3D "phg,pcf8563";
> > +               reg =3D <0x51>;
> > +       };
> > +
> > +       wm8978: codec@1a {
> > +               #sound-dai-cells =3D <0>;
> > +               compatible =3D "wlf,wm8978";
> > +               reg =3D <0x1a>;
> > +       };
>=20
> Seems like I2S support will happen soon? :)

Indeed :)

It's not working for the moment, which is why it's not enabled through
a simple-card, but I'll work on it ASAP.

(same thing with SPDIF).

>=20
> > +};
>=20
> [...]
>=20
> > diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8=
=2Edtsi
> > index d21cfa3f3c14..cdb7a12946c4 100644
> > --- a/arch/arm/boot/dts/ntc-gr8.dtsi
> > +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
>=20
> This looks like the wrong patch. Nevertheless...

Hmmm, indeed.

>=20
> > @@ -228,7 +228,7 @@
> >
> >                 axi_gates: clk@01c2005c {
> >                         #clock-cells =3D <1>;
> > -                       compatible =3D "allwinner,sun4i-a10-axi-gates-c=
lk";
> > +                       compatible =3D "allwinner,sun4i-a10-gates-clk";
> >                         reg =3D <0x01c2005c 0x4>;
> >                         clocks =3D <&axi>;
> >                         clock-indices =3D <0>;
> > @@ -244,7 +244,7 @@
> >                                         <2>, <5>, <6>,
> >                                         <7>, <8>, <9>,
> >                                         <10>, <13>,
> > -                                       <14>, <20>,
> > +                                       <14>, <17>, <20>,
> >                                         <21>, <22>,
> >                                         <28>, <32>, <34>,
> >                                         <36>, <40>, <44>,
> > @@ -254,7 +254,7 @@
> >                                              "ahb_ohci", "ahb_ss", "ahb=
_dma",
> >                                              "ahb_bist", "ahb_mmc0", "a=
hb_mmc1",
> >                                              "ahb_mmc2", "ahb_nand",
> > -                                            "ahb_sdram", "ahb_spi0",
> > +                                            "ahb_sdram", "ahb_sdram", =
"ahb_spi0",
>=20
> I don't think this will work. Copy/paste error?

Yes, that was supposed to be ethernet. Sorry.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0RXgAAoJEBx+YmzsjxAgDXIQAMC1sESnaJGKyKa6Mr8mcrRf
DKJ1OVfmfHUjkvLTy8RCAev3vJwW8UZH6e3vmM5SmnlUqYwPWn0vGNMzNP9eXWIK
oNStFscFoHDLpBDHM7dl56xJv+SDnsrjaGil166uQ4Dcn+PZtYMrJacN13RkD5Or
zjwbcvykCNkpU/bqZXnxnTE97zFz6RmtBOY+9MRKiJQR9f4qgdFyZxclitodTFC2
CE2rO6h5vA1sASh41CbtiEJLiTOJobW9CwIy63P4Y9tzCLjzeIF/TT+CGdF5A0Dp
XOExczRR76hQI7hsplp9Ymde/lfulMsahAbqRSHk4pbSJDsdxnr8EBOFZYVcFzBL
Z03SKqh1ikwYyB9IZXyqV2S/mbh+fFDMDmqXUQODofqRMDQ5wMQYJ2ADc4MUGPYr
jYs5FRwy/pfQZItaqHTWqRhzFrXn7mFQDCr5W9iAntGjUPvTPkHMoktlMbfdsQY/
rEhrboCnm9LWIDiVYwABfOdxZbnT4Z3wlyQB0X0VMRIbUzRTn3F2Ne9a8AEqzmd/
0dwoAZch2qdpnkv+IRJv7oK32joMDAhzqFbxXagBLug7B4R9Uaeb5FrRUIlWJ7gV
+f40VUmYefM6do/DaEmeChNia8GV3LkQxWIfdrFagDyTVD6jZh8KIJYLm1nA8sdx
KthL6/UYTCycIUy4ScJP
=BmFF
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
