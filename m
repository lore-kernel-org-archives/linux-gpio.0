From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/4] pinctrl: sunxi: Add GR8 controller support
Date: Wed, 7 Sep 2016 21:27:19 +0200
Message-ID: <20160907192719.GD28134@lukather>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-2-maxime.ripard@free-electrons.com>
 <CACRpkdZv+B72T1F=syKnfOu4MDne5ev+eUc-5EXfUysd_fo4BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:48236 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752721AbcIGT1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 15:27:21 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZv+B72T1F=syKnfOu4MDne5ev+eUc-5EXfUysd_fo4BQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>


--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Sep 07, 2016 at 09:17:08PM +0200, Linus Walleij wrote:
> On Wed, Sep 7, 2016 at 4:53 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > From: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> >
> > Just like the other member of the sunxi family, let's add a pinctrl tab=
le
> > for the muxing options.
> >
> > Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> This v2 patch applied to the pinctrl tree.

Thanks!

> I guess the rest of the patches will go through other trees like ARM
> SoC?

Indeed, I'll pick them through my tree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0GoXAAoJEBx+YmzsjxAgfygP/j8nTQBZufmE+xpofx7oHDRC
8M6RdsOCbn4TiYM63jGxt7EzxGSzVhFsY2SDxGwm+rTPs+lFB3LRtlCUTTzaYgZa
rEBGOWNxmFlgFxerIBbpv0zUiG+YWylspeCbMUCSqqEPOS3EpVOLbnkVTSusk5Dm
rhMRCByx4b3209+/L/6Yat590hK7Lpi2bhFXWrfVDuFIKJxv/2/PNkrnM/GJui5H
JtwHnq/BCojWvbYfqBeqvqmratQC8C3Kk6q5D8qcHaaUq2wBCGJo1sccHUoaMmXZ
1r1cxubvUT6jqROUVEXh68vlVqoa3QHm8tLejJW2vCBuKdjwV6uoB2aNUv/V7u5e
xxGGFUoJ9iNpV1Y0tr9qWBTyDx13ObEywff6oWnxcEAZfSqMHTrWMHrg/vHXyRrN
Li9kAO7NHLDvooD0ERWMPMiV1VmgTrxSsLGv3mtTDbgyxynA5O9s837jpJjVKNOA
hPc46qDic+AC0n77Phf5Sy8xPms5+OHwGM1KsknmTBN+uMr51SYDMqQDgqO/qbz/
SQRH2eZKeEQXAXEO3zaMSRqN3Mzj4Hx7BLBfsqysGs7jsn11Vxh9OdirxCJ5rYji
Nt0r0AOLcxHb75Hw6g/m6mYEutz4mOoG/T/TmyGO6eBMnX1HXFSbAmTMuw1zgv+u
2DXZ1LAbPMRRWa8yNxES
=KLd/
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
