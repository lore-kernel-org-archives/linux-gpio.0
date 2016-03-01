From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Change mux setting on PI irq pins
Date: Mon, 29 Feb 2016 20:42:55 -0800
Message-ID: <20160301044255.GD8418@lukather>
References: <cover.1456698862.git.henry@nitronetworks.nl>
 <bd99b2fb93c4c7da52ceb70a43dafded76fff974.1456698862.git.henry@nitronetworks.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:55777 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751953AbcCAEnA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 23:43:00 -0500
Content-Disposition: inline
In-Reply-To: <bd99b2fb93c4c7da52ceb70a43dafded76fff974.1456698862.git.henry@nitronetworks.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Henry Paulissen <henry@nitronetworks.nl>
Cc: linux-sunxi@googlegroups.com, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Lee Jones <lee@kernel.org>, Fabian Frederick <fabf@skynet.be>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 12:13:27AM +0100, Henry Paulissen wrote:
> While I was testing irq's on the cubietruck I found a couple of
> not working irq pins. Further diving into the problem it opened
> up a mess called "manual".
>=20
> This so called manual (A20 user manual v1.3 dated 2014-10-10) says:
>=20
> Pin overview:
>     Page 237:       EINT26 is on mux 5.
>     Page 288:       EINT26 is on mux 6.
>=20
> The manual is so contradicting that further tests had to be made
> to see which of the 2 statements where correct.
>=20
> This patch is based on actual outcome of these tests and not what
> the manual says.
>=20
> Test procedure used:
>=20
> Connect a 1 pulse per second (GPS) line to the pin.
>=20
> echo pin### > /sys/class/gpio/export
> echo in > /sys/class/gpio/gpio###/direction
> echo rising > /sys/class/gpio/gpio###/edge
>=20
> Check /proc/interrupts if a irq was attached and if irq's where
> received.
>=20
> Hardware used:
> Henry Paulissen: Cubietruck
> Andere Przywara: BananaPi M1
>=20
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Henry Paulissen <henry@nitronetworks.nl>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks !

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1R3OAAoJEBx+YmzsjxAgil8QALd8LdsbrOcaA9J/fYdOmPFg
v8syt3Pq/JinsJFWmka13GyCvIC/s7HaUgvhCyPlohsOSWuucAQ1AkF9i6AilZAF
0MhaliJRtwwbdWjFTs92B1sH8pYa4z7V6N0mXLOX3Khvtd+nQqxHQ8xzAaOdb8Zo
8VklEW1IEuA/RA+YB4kdEiJlkJS5WP4oTPoYdvExmxhNiPDkBZCis2pwPPIxO4py
8rdTpG+1XGhYjBSI/8oiDNIETH52AH4oVS0C0dK6pT9m0ewjDkDOQojzUcGNYvIq
b6mkezblI2e9EPW6Lbh3chmUJ731oHJYMakUzEZazF8j9+OAx6RgtBm6PjJsaTts
A2v7ZM0f/tLuwOsV42DsN4qxpSY+UjpxJyRbtNYzQQRz9Nl9qnVOIyUdv+I1Y8R3
DUoxDBmafHxLybgos7eKEmLnZTzUefgoXZTc8umvrl+I7pHzejzxZSQiXcjk8gk7
rIuqorSOAqr+RVe3X0LMUdKGXFfue14qLMiG/NpLZMsS7k9LUJmfnymo515NTIPD
IF58jmApJ5xxN2JOUDZjNAWIRJJJhiUTWOyaaGdp7roefaozIbInuFuLB8wQbf78
msAt0TIUQtNAE8LERtJv6AeOx1b3LHFfi+y/lmQtL7Vz/RPhENxw7SRxIxp3/Byg
cuhtHwBfBxxuc4TC7cqe
=7omB
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
