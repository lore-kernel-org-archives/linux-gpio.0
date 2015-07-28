From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/2] ARM: sunxi: dt: Convert users to the PIO
 interrupts binding
Date: Tue, 28 Jul 2015 14:39:39 +0200
Message-ID: <20150728123939.GZ2564@lukather>
References: <1438000918-9026-1-git-send-email-maxime.ripard@free-electrons.com>
 <1438000918-9026-3-git-send-email-maxime.ripard@free-electrons.com>
 <CACRpkdYT0gsrZZcWrkES4EdF0G1oY_t0isOTbJtbCGx2KP2HTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xIVvx4XxNQcAboQ3"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57919 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751985AbbG1MkE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 08:40:04 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYT0gsrZZcWrkES4EdF0G1oY_t0isOTbJtbCGx2KP2HTw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--xIVvx4XxNQcAboQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2015 at 02:58:29PM +0200, Linus Walleij wrote:
> On Mon, Jul 27, 2015 at 2:41 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > The current DTs were setting the cell size to 2, but used the default x=
late
> > function that was assuming an interrupt cell size of 1, leading to the
> > second part of the cell (the flags) being ignored, while we were having=
 an
> > inconsistent binding between the interrupts and gpio (that could also be
> > used as interrupts).
> >
> > That "binding" doesn't work either with newer SoCs that have multiple i=
rq
> > banks.
> >
> > Now that we fixed the pinctrl driver to handle this like it should alwa=
ys
> > have been handled, convert the DT users, and while we're at it, remove =
the
> > size-cells property of PIO that is completely useless.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> I guess this will be merged through ARM SoC?
>=20
> If you want me to carry it in pinctrl and you're *certain* it
> will not collide with something else coming in from ARM SoC
> then tell me ... prefer to even have ARM SoC maintainers
> ACK on this actually.

I'll merge it through my tree (and then arm-soc).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xIVvx4XxNQcAboQ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVt3gLAAoJEBx+YmzsjxAgtccQALBWYYkQmfK6CqOsFVkMBiiJ
/C9nXFk5nvSUWOfbpHC1qgn1gLaVG6tc/MIl40NQ/5uFGNjKhFM8UiwvmjJQz0on
Wbj7qKhlI1rMQW7Qw8YyvHdwouyaT1DA+XjemLb3K9VH21tfSa6hpHIBxcmEx1xT
OtnzdBXK3n8T9YLuR4WIsLoariL+Xzi4ptUW1gL6v1IMi6Zv2HItRblfyBmm3S6n
JiDdrw1CmvBlktkMJrthH4zl+3rAJ/pn9GC3hvBCo/PJC17yKS/gvAzFgWdtuoSN
BqWGdOBymBJKBpTH5OBgaPp6aBvZvzBUSmxzrB5O4112/ZV3bLovISYR2Rq4Z1v5
IVHmSTt8TNbfXBelWVnmRKKPRLEGAtxSox58BEHPNwOmbbHAMp17uj9u1CfyszmP
tzDBrnTGN46GV4Hwl9P4EPNHi+IwU6f7vs/bzdI0tRmWqtmIT3U6RVmui8iIlKak
uiPLqr2rLzOZbA/O5Yok+40vDav1I+RQVSYA6fyo7WwbBpx44Z3rEczAwM234b4V
ZNsvVfkElLHj00g2drGQ4dJMJ41Qv/Qb40aPqqPBgzD+SbQMPOhocPSiHKAvo5n7
u2Fp0u5MmvxTvYEPQyLz1qb1WjgTXaXeE37+xVgVi/efI+V+UAIFMtCBb9+08ebK
cIBVAC3s2By1gjXKA0V9
=Kf2X
-----END PGP SIGNATURE-----

--xIVvx4XxNQcAboQ3--
