From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Mon, 26 Oct 2015 10:34:48 +0900
Message-ID: <20151026013448.GY29919@sirena.org.uk>
References: <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mUolEm2oNas7DxE"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35625 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751216AbbJZBfC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2015 21:35:02 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


--4mUolEm2oNas7DxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2015 at 10:32:27AM +0200, Linus Walleij wrote:

> +	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {

> +		return 0;
> +	}
> +	return -EINVAL;

A switch statement might be more scalable as more ioctl()s are added?

--4mUolEm2oNas7DxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLYM3AAoJECTWi3JdVIfQN0IH/A6SHyg+Srnm+FoDhlfe3wVM
mZBEVbux1Be9+WHiPsSNSfxV5Wmooy2PC+b56YnLREkw1kbIGDQKmlI431/R6R2Y
P+jo59WgLj8DkZfgdwd41NQ2goK9WNbmvHMgo+9pz+zEjhXfOYtsbWFRKL8rcEp8
qgcoZ0XSDI24MfOpAiFcCR+reVuZoEngwO/AWQvD2wnrvy0u81XfjCr+H3uLqPvy
oLTC41IxOgAxjzdBpwL6FKBb3uREfUC5ar4MeNCdUHo6Et/UR3+5SXrGYJMoXGg/
Qnh6OWCWfSKF3GtFmDMw6ImwO+QxiQ1H1Uu6D+l6sXhwkJXPUo8Dzd3sRSkSfl0=
=ZyJa
-----END PGP SIGNATURE-----

--4mUolEm2oNas7DxE--
