From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Merge A31s pinctrl driver with A31
Date: Tue, 7 Feb 2017 16:04:37 +0100
Message-ID: <20170207150437.ob77nbtanmsijoeh@lukather>
References: <20170201162547.24232-1-wens@csie.org>
 <20170202081332.okjxo4ogm2kp3abh@lukather>
 <CACRpkdZUOszrqbPq4Ak+pUeYQB2qBnSrE2qWMkoNzvw+E74maw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uybiboa4zmsn6hyi"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:48084 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753587AbdBGPEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 10:04:40 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZUOszrqbPq4Ak+pUeYQB2qBnSrE2qWMkoNzvw+E74maw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--uybiboa4zmsn6hyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Feb 06, 2017 at 11:07:33AM +0100, Linus Walleij wrote:
> On Thu, Feb 2, 2017 at 9:13 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Feb 02, 2017 at 12:25:45AM +0800, Chen-Yu Tsai wrote:
> >> Hi everyone,
> >>
> >> This series merges support for the A31s' pin controller into the A31
> >> driver, using the new sunxi variants support code. The A31s is a trimm=
ed
> >> down version of the A31, with some hardware blocks removed, and some
> >> pin functions or pins removed. Thus it is easy to support the A31s
> >> using the A31 driver by marking the extra pins/functions as A31 only.
> >>
> >> Patch 1 does exactly this.
> >>
> >> Patch 2 removes the original A31s driver, which is now redundant.
> >>
> >> I opted not to rename sun6i-a31 to sun6i in various places.
> >
> > Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Could you guys make a patch either adding these drivers as
> commonly maintained by you two in MAINTAINERS?
>=20
> It is commonly maintained right?
>=20
> Or if you prefer, just list the pinctrl dir under the Allwinner
> SoC support entry?

I'm not sure what you mean. We already have a wildcard matching sun*i
in our maintainer entry, so the pinctrl driver is definitely covered.

Or do you want us to add an explicit one?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uybiboa4zmsn6hyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmeIAAAoJEBx+YmzsjxAgP3wP/0XYpAjGNjqBe9tUHI4nzLVM
87DlXhlN+/+hNoXMU9I2bgAAMBLAOOyCjl7BXSDFfc5zeCI6A5Fv1sAavwEnrUIi
ZbrLUJtMzaykjX6u+jA3Yko/mEmO2/QBgQ6FPrLkaxZmscc/WxYlWcc+9K+XCuVl
sDtkGXt3PVXy+6l0U0MFeutRlF+28+mokTQwwXXsNeTrlGNHveEnVfQv0IrqufSq
zHGnjLgrbyQFF2xFzPPDzJkAtn1vU6Vb2+6FsmGM3pNA+Eai45aR71e7Lgq1RIBJ
iTMlyQqNu7OWvK02eC9ZoZ89s/kg8sBJJ4C+Oz6eZO7LP66jED0nYjvRa7msz6UC
GTjhLVa2fnU8+ORud0P6fKs4Cgq+NYhJE7t7/9LFJM0agy/FETYDBkHCDkVZ4k+T
FLE/ylaDg0xIR7LmCYDTtTWUdTf3mgNQRN4mL56p86qUOy7FrVJBmUhuEeS0inmD
bGcHCuQ8BcUsEgZQLwyHYbwp7yN9d0kwLtkPAgOtBaflSL2els025ghP5MZJ86oX
EjhqJhBxUNotaeyGsjb64GW3W6eYXgM+WRdiBLc6ItdZ2NoH9U9cfRCtatdL8glt
GFJzMDIYsgnkdTGtUAv2aEbQ9h0zKIFFCIckOQw+LMJQajUFv+a8NAiHfaQ9TzEM
6KywRtkZ6CDQMFXGj3lP
=PBwX
-----END PGP SIGNATURE-----

--uybiboa4zmsn6hyi--
