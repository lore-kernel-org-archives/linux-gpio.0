From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Merge A31s pinctrl driver with A31
Date: Thu, 2 Feb 2017 09:13:32 +0100
Message-ID: <20170202081332.okjxo4ogm2kp3abh@lukather>
References: <20170201162547.24232-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fypj3jkhyguueo63"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44315 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750903AbdBBINf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 03:13:35 -0500
Content-Disposition: inline
In-Reply-To: <20170201162547.24232-1-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--fypj3jkhyguueo63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 12:25:45AM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series merges support for the A31s' pin controller into the A31
> driver, using the new sunxi variants support code. The A31s is a trimmed
> down version of the A31, with some hardware blocks removed, and some
> pin functions or pins removed. Thus it is easy to support the A31s
> using the A31 driver by marking the extra pins/functions as A31 only.
>=20
> Patch 1 does exactly this.
>=20
> Patch 2 removes the original A31s driver, which is now redundant.
>=20
> I opted not to rename sun6i-a31 to sun6i in various places.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fypj3jkhyguueo63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYkuooAAoJEBx+YmzsjxAg+lsP/A1a8juoleGsXDyFH5l4/SR4
rv4DYmZvloP9YvThiFm/1wtf+QRZrkX67Fg61xU58t7hSk1N1RId+G/jjbDwTW6z
vzbeTMp1TqhuRwpMm1oywUQWgVG65bsLKc5yLZoNfhp8Ls9/oHU66lqDjcMT/ash
KTzFWfM8BeEiuMoWAi9aFr9moNW2jfFkRlOgD39TH4zeSRMXUYXukFhFAhAtlrnL
eF4y99pN5nWvoUUNImYVLR3qMqUrodlltdE6fmGOEFxZyXf1964sAJOGFnQZa180
H8YQr0mQdZqwoXxo208x+aF9yCzfI305gcGOdTj8VF+nVEXn/0oknraStd2i5TlK
KRt+0wsqMLekcISAFSCWlNUe/a3mAXLrqArLPAosUIh5P31HUFGTkqY4qHXyYe0n
8faI7hD8uTW3uShHMXLaR2Y3GRz6dO0FK3IwoMFvCwyDS6nyb57GRLV/y1u22MX8
euo1HzLRBT60JTQ54PDtzA6jm3ZH9yyt3APJAGtR9+ph7KnMoCQftfuCBoeHtvw7
uV0KljVa8S06iQSjO76s2MpzQh1Xwems2OHBRjMqEnJzBZXqSxiovkv0pb//4MaK
hGBw+PYr8bT/rhAUH3ElDs4n2LWVtPYXxVUTpDTB3bKwetYqNl0pMsxumnzzLTm/
+ye9RK1YvwviLuKnmZvG
=kMRS
-----END PGP SIGNATURE-----

--fypj3jkhyguueo63--
