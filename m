From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: number gpio ranges starting from 0
Date: Thu, 24 Jul 2014 14:48:57 +0200
Message-ID: <20140724124857.GX20328@lukather>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
 <1405358677-23657-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="psqk/gGHwSe2Tjny"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:48122 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758208AbaGXMwh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 08:52:37 -0400
Content-Disposition: inline
In-Reply-To: <1405358677-23657-3-git-send-email-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com


--psqk/gGHwSe2Tjny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 01:24:37AM +0800, Chen-Yu Tsai wrote:
> The pinctrl-sunxi driver originally used the pin number as the gpio
> range offset. This resulted in large, bogus gpio numbers for the
> new sun6i-a31-r pinctrl devices.
>=20
> This patch makes the driver number the gpios ranges starting from an
> offset of 0, by subtracting the pin_base number from the pin number.
> This also makes the system-wide gpio number match the pin number.
>=20
> Tested on sun8i with sysfs exported gpios.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--psqk/gGHwSe2Tjny
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT0QC5AAoJEBx+YmzsjxAgTXoP+gMWDpxNjoHFCE81jhmFlafc
eyfDGlxb2iML3onAWeNoqd1rVv0cvMhe2/+gpDbgC4hT+Z/iLfK5i4gJ7mF5bBnO
IWtlOp1oQ4NIddtGk7Zy24PtB+IJX9S2tdXH6MzEVZ2LemmU8ApsUaF0y7lFv4YZ
tFQZQoO9lhU9d86J2uMujDkOCSTpEUg8PWc3epFhiBEFtUzWsyLMRSS78cuqQAJ/
sjV4m374eiKn5HVWaEmeQm7a6TgVG3lc9uZgEk/i3KSlHfU/ruFORg6j0yEoXTBn
ek+6E5zemXHEsPNvN3qBWon8W6cEaCPktIm2UoJUN8khUV+c5XLIgkLFFP2UInna
GrSRdjvgADp++DJtNn/IGYEiPGfgWpIJNYC3QGtZ3yzOHWSUJIDJb+090FOnQaIW
r+ZLRtr5aEBe5TbW691CL3s0XM9gJmtls8yUtyKJ7agSn3hTsTO8L9TVb6l7dTkY
bgM1IYDMmtXQED2sqsSBLAExXFVYFQcPVYAGu3EgSgDAEWvXBvoYaXjarmn+KFJi
FMR3feKdBaWKFGtcxc/jdMXMGohSIprmXCjbpUlG/Y6DcYq6ADSRWbo9l5FSP693
znODqcfoUTzNsg+RSCjuNaLThAzBk6NhbVHkdNiDHv9qvx3uFWK3Vi4KySw1w4lo
OlSWkFL2/jYgwAYke7qX
=MckY
-----END PGP SIGNATURE-----

--psqk/gGHwSe2Tjny--
