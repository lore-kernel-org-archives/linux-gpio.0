From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 12:47:37 +0000
Message-ID: <20151102124737.GG20228@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44589 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753056AbbKBMro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 07:47:44 -0500
Content-Disposition: inline
In-Reply-To: <20151102124323.GA12503@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 01:43:23PM +0100, Johan Hovold wrote:
> On Mon, Nov 02, 2015 at 12:25:14PM +0000, Mark Brown wrote:

> > > First of all, you must never register the same device structure twice.

> > Well, you can unregister and reregister (and it is reasonable practice
> > to make sure that the struct isn't full of noise) - we usually allocate
> > things out of kzalloc().

> Actually, no. It's an explicitly forbidden practise to reregister the
> same struct device.

A memset() should be enough, if not then we have problems with any
dynamically allocated struct device.

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWN1toAAoJECTWi3JdVIfQ1B4H/1TAijty8msedBADIgSIojVy
SXFOryNSScEnkzBism7o2rxqRGU70v7LnxLjvJiZG+j6ONywuFrbRslZZ6n8sJyh
52bP7hxDWDbuRJnLh4h42zVUulcm/kx5kju9uqUpdOWnygpdkAJ2kuWEdPRP/QZR
ZTkXPQjlEQK8Kq/aMePoJ888HtOuN3JyDiBEAkwQRVn+4ypi+DBYA8Y7bcGE/b05
vj3Zu95jBJXzg7H/1GImP0/x6xHTUm+FkRIPwoENBQE50S6XLIzgKZiuuIr5/voB
xLEus9QcghqUJc4SXc6txp3uhVVV7D2J/evMl3QeENgXQobTdXCm3ZcVR14Jm8M=
=tYnz
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
