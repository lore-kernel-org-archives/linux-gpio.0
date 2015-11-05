From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 5 Nov 2015 10:29:51 +0000
Message-ID: <20151105102951.GO1717@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
 <CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
 <20151105094411.GD7561@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UOYwgDhKKQYesrzQ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48169 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031961AbbKEKau (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 05:30:50 -0500
Content-Disposition: inline
In-Reply-To: <20151105094411.GD7561@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--UOYwgDhKKQYesrzQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2015 at 10:44:11AM +0100, Johan Hovold wrote:
> On Wed, Nov 04, 2015 at 11:48:47AM +0100, Linus Walleij wrote:

> > Thinking about it maybe it's simplest to just make ->dev a pointer
> > and kzalloc() it at gpiochip_add().

> > That should solve this.

> You'd avoid ever reregistering the same struct device, but that would
> not solve the bigger life-time issue by itself.

You'd need to do something like have the file reference things via
something attached to that device and then ensure that it's made safe
(eg, by setting a pointer to NULL and then checking for that on use)
when removing the device.

--UOYwgDhKKQYesrzQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOy+eAAoJECTWi3JdVIfQCrYH/0Zrv+Izs6FvmhcUMI0QfztC
a7ARAGne+bSHB0dUWYhutTdPNtGy349N2Z3p3utDsN0sfg7vjDn2ZvcHGMKxbC4Z
N9vDDdGmpVBIqLeMcx/yXPRpieAlPQqP2praqnMKNTNPPvHKdAzvSn1MMiZfGNfy
9bgPdWvbsOjRUoHygf5w8r11UDJg1Ukn76DBv8bcRniQlOa4uw59qL03oIbMooiG
x+DVhIphpxdCI12A2WIucMstrmyCrR7vm0r8+eCLVlTF6fcUVDF78eInfu5w0y9b
swQhi7lydRrKkD5tSm498SOw0shDeUPXJdtkl9FprIlDCF7gBhLE6gCntcmsVdc=
=mStt
-----END PGP SIGNATURE-----

--UOYwgDhKKQYesrzQ--
