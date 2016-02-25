From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 3/4] ARM: dts: sun8i-h3: Add R_PIO controller node to
 the dtsi
Date: Thu, 25 Feb 2016 11:34:05 -0800
Message-ID: <20160225193405.GN4736@lukather>
References: <1456146208-13890-1-git-send-email-k@japko.eu>
 <1456146208-13890-4-git-send-email-k@japko.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FetH82qe0Z6y/zI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:54220 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933377AbcBYTeh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 14:34:37 -0500
Content-Disposition: inline
In-Reply-To: <1456146208-13890-4-git-send-email-k@japko.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com


--5FetH82qe0Z6y/zI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 02:03:27PM +0100, Krzysztof Adamski wrote:
> Add the corresponding device node for R_PIO on H3 to the dtsi. Support
> for the controller was added in earlier commit.
>=20
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Applied with Linus Ack.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5FetH82qe0Z6y/zI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWz1ctAAoJEBx+YmzsjxAgY3UP/3fnfhfAKOkX5/2I/9vIyDPR
AnVKCNH2CQAL5fPYQXlOJKsiPAe1s59pIpoMYWRMnBMK7wXu68gb4jNQcur0dMQA
Bx3If8J3HOwgShQ2MvcMoFgdMyEXTgmhd7Z/604KYP7SsV4ck8FhBz0yOXi3/4Vx
tMIfFmGkXOMZkz+6+kYi4nPCAk/ilsUzM10pQm8JTZjxWsHyQ3qKrsS8vOqO2NIS
kS2Ciq2uWdyHT5knS55oDG9FzCH5rXSbBU0DIIfJSInvsXI8bcqNQYBPfH6ZLv44
35emYLF9vIP4iaivKvLX8V8pWWeA5WGPoygdV3/ro35HKFBl3pCbccDmslvUFChb
kGrtAUcjRHWEgpsIbHcPZf8XgNvuA3OFlsk8dO5nfiK1HFVCFiSQLdfz+MhzljL7
GCX5h1jOStem+n8GXhsi1jm7JlIAhLTi91ddLL0EIvtegfVggGiq8W3hgI9lxsBX
40K9ZORFEWfGaU+7n3ew+miwHKoUO8lknELiR49Fk/SkJj4wY+K45Lmch57Zpfm4
G2JMSFdN4cFQEH97j8COSvGAq02EPqr5BPn2yPH6nEEQWRk3VuYvGsZvlUusxYHU
31tWyuLDottJzU0ePEK2NtgFJUj3CbQe17MnoOJzTv9VGMAGlE5AV9VxNpulv0Zn
HFCFhaSeC3nOrtncrsAO
=ewSC
-----END PGP SIGNATURE-----

--5FetH82qe0Z6y/zI--
