From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [RFC PATCH] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Mon, 4 Jan 2016 09:43:28 +0100
Message-ID: <20160104084328.GB23528@lukather>
References: <1451582246-32373-1-git-send-email-andre.przywara@arm.com>
 <CAEzqOZsE_kDChAbLkwmwjqdDbovv1e0G1tTffhhp25PkwJQ0+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:34972 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751278AbcADInc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2016 03:43:32 -0500
Content-Disposition: inline
In-Reply-To: <CAEzqOZsE_kDChAbLkwmwjqdDbovv1e0G1tTffhhp25PkwJQ0+Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: andre.przywara@arm.com, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, will.deacon@arm.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>, linux@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 04, 2016 at 02:34:52PM +0800, Vishnu Patekar wrote:
> > diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Mak=
efile
> > index e080290..130e7bc 100644
> > --- a/drivers/pinctrl/sunxi/Makefile
> > +++ b/drivers/pinctrl/sunxi/Makefile
> > @@ -12,5 +12,6 @@ obj-$(CONFIG_PINCTRL_SUN7I_A20)               +=3D pi=
nctrl-sun7i-a20.o
> >  obj-$(CONFIG_PINCTRL_SUN8I_A23)                +=3D pinctrl-sun8i-a23.o
> >  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)      +=3D pinctrl-sun8i-a23-r.o
> >  obj-$(CONFIG_PINCTRL_SUN8I_A33)                +=3D pinctrl-sun8i-a33.o
> > +obj-$(CONFIG_PINCTRL_A64)              +=3D pinctrl-a64.o
>=20
> Shouldn't this follow pinctrl config name like other sunXi SOCs?
> This should be PINCTRL_SUN??_A64.
>=20
> First, we should find family name for A64. I remember, on IRC Maxime
> refering A64 to family named sun10i.

It's called sun50i in the BSP, so I guess we can go with that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWijCwAAoJEBx+YmzsjxAgwSoQAMAv2EnlILaeBFWmhlaSY3CL
c8JKbrt2EwqMmht1A3+JspFIfWWYWh3doKbCdJrDJSmru75nJWAJcO8RCKpI8fEm
WItea6tc4ipafdVM+w2EyIuw7a/mxBiWxnJVyYyjybuwf78H33wVJGPOL04iB4aM
+nVJwZqAl17s1palenngRBD0ReoMj1BVbsAJFfqdXt/G88fuZS2FkbD3MCAFG9iA
vD/UxF4sDj5AVTSZMrN3KQQ6okrr3KNFKJL6GBuxeAD6A6rXdT/APcbPgpDfJgXa
MBmMn6z2rSQMGJwk2TFwUoX9aHFbDI82t/RKuyh8s4bb0J5LFQflj2upOP+pVlIx
HHD2ytsNRtXn3jIGCBnjBH7vD1jmMvOak6jjZt5zNJhT83wJHUhNFyZ6YPSDvdts
B8TI2KMBaKcZQ36qpF169LDnGtJdJ3EAsPvf+c1gCT3OwTddZA6rNUnwQOv5RhQp
CZXtTxrIRb8gzrL6vl9ZaEWDPWDmMEUTtlX2iswTjSwufA966NOoJjCDqwRHzSAi
JWGcxtr3GieR949MtqokBr02d6T6aO+w8KsAub9q8/UkZNQ8l9FEVtFG6xwj9puA
Cpr+CF9vUjynTy9/rvDU8zPxn3TSEIXLk3FCXZRe1D8JkW6NipUbw2ffIgeEaAwd
XjcZrWVPn9U9Tfat6ezX
=WNew
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
