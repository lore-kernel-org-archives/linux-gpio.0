From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 12:25:14 +0000
Message-ID: <20151102122514.GE20228@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44531 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490AbbKBMZ1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 07:25:27 -0500
Content-Disposition: inline
In-Reply-To: <20151102103116.GE8676@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 11:31:16AM +0100, Johan Hovold wrote:
> On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:

> > +	/*
> > +	 * The "dev" member of gpiochip is the parent, and the actual
> > +	 * device is named "device" for historical reasons.
> > +	 *
> > +	 * We memset the struct to zero to avoid reentrance issues.
> > +	 */
> > +	memset(&chip->device, 0, sizeof(chip->device));

> This is an indication of a larger problem.

> First of all, you must never register the same device structure twice.

Well, you can unregister and reregister (and it is reasonable practice
to make sure that the struct isn't full of noise) - we usually allocate
things out of kzalloc().

> And the larger problem is: With the current interface where a struct
> gpio_chip is passed and registered, how would you prevent the device
> from going away while in use?

Hrm, indeed.  Why aren't there complaints about a missing release
function there?

> You grab a reference to the chip->device when opening the node (in a
> later patch), but it is not used to manage the life time of struct
> gpio_chip.

That's a slightly separate thing and even with a different
implementation of the file we still have to assume that the driver core
might hold a reference to the device for longer (for example as a result
of sysfs interactions).

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWN1YpAAoJECTWi3JdVIfQzFgH+gI4Q9ifpMifD3wtEzrwQFyp
L52x9/WgXV/xLHOrXYFgXG4J1TeO/9azvJJWKg5Motgx7c9frJe+N4W1o/RfzMHG
BzBc8nLqeBOfRn2Y3GpS10g2h2IEb1t+a4bqRIa5brl/DmEPLRq+OsqSOiQjzn+T
k6mKV8G0nXHAC4Kq4ye565B7mGdHDZ6AIlu2ejVCoZcNuN9Qh+K3kIi19dstv+oH
uyMaZtC/io0jN8bF7F8ExPrt0oKHOkrJintB3Hi2P3BBdR5gQCTO+3WvDLux5hz1
tpNLXEuJp4I1ycgFc6qIOqYarI8J7+FowfueBiinM+SfEOCfamj2LNSmgs1Ut8c=
=Z83T
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--
