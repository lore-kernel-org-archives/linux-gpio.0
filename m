From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: H3 requires irq_read_needs_mux
Date: Tue, 2 Feb 2016 14:24:21 +0100
Message-ID: <20160202132421.GT4652@lukather>
References: <20160202100217.GA7483@box2.japko.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="53TzBEXPl5+8hjUY"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:41787 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932579AbcBBNYX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 08:24:23 -0500
Content-Disposition: inline
In-Reply-To: <20160202100217.GA7483@box2.japko.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--53TzBEXPl5+8hjUY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 11:03:03AM +0100, Krzysztof Adamski wrote:
> It seems that on H3, just like on A10, when GPIOs are configured as
> external interrupt data registers does not contain their value.  When
> value is read, GPIO function must be temporary switched to input for
> reads.
>=20
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--53TzBEXPl5+8hjUY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsK4FAAoJEBx+YmzsjxAghF4P/1lsU7fd6FGLasaZPUuFvmnw
W/uYjZEvg+WVcH41JvKN6DJvtnY/ZDypio82ZhjRAKBsVzfFCNnUhaAC3alNIjF8
tofDPEM1SYXdXKRkT9Bz4N7T0+mCsZS6eodBwgO310Lh1UQ2Yu+AqaFUwpDK8ZD0
y/auKZb8UjlBbyRJTvsx2odxq031JTXQSMcgbKOzpjzz/PlAFQe1b9Wz0oa8xCtB
BjFKzWgcIX6PCfEQPRtr0B+2vBktsETp79usye1c35uYslsqdI+NeExgVNjIQQYD
52epFatqAXfJn6rIz2rLG9Ejhq1/ot/t8Ar2V3L/SlfSUIcK9kbZZ+XSIC0gYAgY
kUyLCXkiRqGUcMIVOGtAeRQi0VOD+opdZCdNthUiuhQzU1kq0wzCRM879C1R2umk
X7MChsKeO/C00z1Zkk7ptB4hwt20KR8GcvzY2//WnnBGLojhcYxfX1bNT/Z9aJeN
F74o0VqNXOw/e3EBOvgahQSrfEf/l+RyQ1xpGHFNX78RVppqRWsi+BY5MT2q/a8n
+n4i8DUihIeEhzU9L2lT/mKhS9UWK07dzqYvvXz9vlOahRAaOlYMQxzCI5yFux+x
nU6V+xBStDmLTxFqpouE6W5egpekOmlsduS2IvI3CvP/6CAjiS2phK5XjJZmjQSy
cn53lYkR4CsKqzflQMDz
=+2zr
-----END PGP SIGNATURE-----

--53TzBEXPl5+8hjUY--
