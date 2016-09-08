From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: Add NextThing GR8 dtsi
Date: Thu, 8 Sep 2016 09:37:48 +0200
Message-ID: <20160908073748.GF8913@lukather>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-4-maxime.ripard@free-electrons.com>
 <CACRpkdZsxA7avmO85R=-Quu7FQwSVMPhQMDmmgL+xbkVTB-2HQ@mail.gmail.com>
 <CAGb2v64h7kq2jWzUJ74vDdOOQOXPxjx3ruSsJMXvyr7fP63BGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64h7kq2jWzUJ74vDdOOQOXPxjx3ruSsJMXvyr7fP63BGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>
List-Id: linux-gpio@vger.kernel.org


--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 12:46:14PM +0800, Chen-Yu Tsai wrote:
> > I mean it like supporting these in *addition* to the custom ones, so th=
ere can
> > be a smooth phase-over.
> >
> > Check for example Laurent's commit for SH-PFC:
> > commit 16ccaf5bb5a52372bfebd3dfbb79dd810ad49c09
> > "pinctrl: sh-pfc: Accept standard function, pins and groups properties"
> > It's awesome, and since, they have improved the looks of Renesas
> > DTS files a lot.
> >
> > It could look a bit like this nice thing from
> > lpc4337-ciaa.dts:
> >
> > &pinctrl {
> >         enet_rmii_pins: enet-rmii-pins {
> >                 enet_rmii_rxd_cfg {
> >                         pins =3D "p1_15", "p0_0";
> >                         function =3D "enet";
> >                         slew-rate =3D <1>;
> >                         bias-disable;
> >                         input-enable;
> >                         input-schmitt-disable;
> >                 };
> >
> >                 enet_rmii_txd_cfg {
> >                         pins =3D "p1_18", "p1_20";
> >                         function =3D "enet";
> >                         slew-rate =3D <1>;
> >                         bias-disable;
> >                         input-enable;
> >                         input-schmitt-disable;
> >                 };
> > (etc)
>=20
> This looks nice.

Indeed.

> I've slightly looked at the generic pinconf stuff.  I think we
> should be able to support them, though the sunxi pinctrl driver
> currently doesn't work well with it though. For example, it doesn't
> declare ".is_generic =3D true", it doesn't filter unsupported pinconf
> parameters, and it doesn't reply to queries correctly. I will fix
> these bits.
>=20
> Also, I think we are needlessly using pin groups, 1 pin per group.
> Can pinconf/pinctrl work without them? Would there be any harm
> converting the sunxi driver to work directly with pins? This would
> make it match generic pinconf parsing, and make it easier to get
> both working together.

I think it comes from a requirement that you had to have groups at
some point (I don't know if it's still the case), which is why we
ended up with single-pin groups, because we can mux each pins entirely
separately.

If it's not required anymore, then yes, it makes total sense to remove
it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0RVMAAoJEBx+YmzsjxAgQ6oP/ivMp0S8i0TcbjdmaYNF3yPl
CPg9cHQ4Vg2rO2yqtFaUjfohxLnPg0yrr7GoVU3gEBVzGEjp+3MEypYsKiaBBeM9
FOEoiXy88Hh+rJqcS/3c+6P6zlBvNsNfrfJZjJXtmYIXRdBub8zwGFZZEK5006uI
aYt1AJ4ZJ+Y+G1aopYKu8cgvUXaPN8dpHPTUAIPfxjB7FLqRI+V/QgBxErcYxuRc
4DPAlYycK3RG+Jid8x++FwYu/SuT3cMdVWQWo5HCxHAYAXpoOBfzdZdZmfV6x3m4
00CeZczmxapnVdBtdKWpQlFL2bN+uw9tfi2G3PIxdh+SaQYd9Jkkvm52CNCHdvie
mnKQrSdvh9zc2BYsg9jVZg55SAh9L/Jp8Aln9fytk1pRqOL+QDAvXS7D8Ck10EWV
4ph4VI2Q80bNj1xaa382JsGox81v4Sn1vmU3EfvuJky+scXc9Didc5+R+jZuGYVl
qp659x+w7CzTNNrVBWMPJu1Wrh0Sy9PJjG93BHshktK1o3N8tZK6f9A/SAqhyUpg
KAGWR2NOE1D72Dzanwb/jibmu4lOgHxEnqR9Hbivb0NP6/1nDEIm0BairFdmn4j1
sDhNcp1b+mkr0q2yki2WQBNyB9NFUkiL5ZdYQLtH2QPyxFK84GzGr22KkrE1+1Xq
V3zLL6fXCJFLVJIobVu9
=drSZ
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--
