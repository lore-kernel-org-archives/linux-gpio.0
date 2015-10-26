From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 26 Oct 2015 11:12:46 +0900
Message-ID: <20151026021246.GA28319@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <CAAVeFuLMqCE81c8_e009uu1bYypmbagHS1DnPkZ1vxcuU=ukQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35667 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752364AbbJZCM7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2015 22:12:59 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuLMqCE81c8_e009uu1bYypmbagHS1DnPkZ1vxcuU=ukQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 25, 2015 at 04:06:26PM +0900, Alexandre Courbot wrote:
> On Thu, Oct 22, 2015 at 5:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> > If sysfs is active, it will use this device as parent, and the
> > former parent device "dev" will be set as parent of the new
> > "device" struct member.

> Why not rename "dev" to "parent" so "dev" becomes what we expect it to
> be? The two members being of the same type, keeping it that way seems
> error-prone to me.

Indeed, that's going to be hard to follow with nothing in the names that
says which is which.  Another option that some subsystems use is to add
the subsystem specific device with a name like gpio_dev that indicates
it's the subsystem version of the device.

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLYwdAAoJECTWi3JdVIfQirwH/3j5ri6B0XVkV77jbWymq/Xl
6mZLHc1j893WFsF+pOKZmijHKk34G0uuMZPnKDooz/6NlOKiJjf3iLZafX4BK6bF
7GE5WdvzMIGnMEzUDeRG+LEJdf5ca+qln2xrNxuXVQdmjZlr34PR5MIqsKDSoqvz
d6gw6Y4tj3n5MtkBuIuy/1e1dpNTOgxXb4XqicBuWVGF+pR5A9JaxrARZWNMol2T
tiojcShvv96woF1pNpHjiypiWfLTVhhB6E/5rEca06Ec9be+XCkOelDAW7q+1p+s
wETSX7f0uoxTOa/Z34qolHolmZNecr9jRG17bMcdgbPOBJrhCUaNyk+3Rkq241s=
=kjNf
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
