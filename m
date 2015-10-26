From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Mon, 26 Oct 2015 11:18:10 +0900
Message-ID: <20151026021810.GB28319@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35681 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752364AbbJZCSU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2015 22:18:20 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2015 at 10:32:24AM +0200, Linus Walleij wrote:
> OK so this is it, I had no patience waiting for users to come up
> with this new ABI, and the requests for a way for userspace to
> use GPIOs properly is coming up again and again. So I created the
> basics for it, so we can then build on top of this to get things
> right. I want to get these very first things right before we go
> wild with setting/getting pin values etc.

This all makes sense to me modulo the (fairly minor) comments that have
already been made.

> We add ONE ioctl() to get information on the gpiochip. Now we can
> do this (example from ux500):

I guess a basic set/get API is going to be need to deprecate the sysfs
ABI.

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLY1hAAoJECTWi3JdVIfQL2MH+wRwdzRQPPH5IXlZPIg1dz5T
GxKR78VHybTdTup0VBNDI4ebwAX3acOJ8XzvkLQ+TZ+xkqvmfzQgJ+1KojV9hdP4
Muh/SQgBqZ6So8TCsgHIV0UDfGSt46/UsB9t8xNTrJngjo7hFindDG/6OstFQUAg
w0kABDEsspFKB4yoQjGk9GT6jS7teW9I15eQsgFhrpvbauE8nR4sBZDZgN5ePZ/H
TEHO469uucbF3fGfy7H3puajb73KqavBg9JpvEQBslmA19mMp7cCcuCpZyZ0TvJ6
9gencrAFebLvziY+PUADx9oNthKDhFl2dkJxWETicRyCbpDfOqBH7nFvgim09gk=
=xCGn
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
