From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] gpio: 74x164: Remove non-DT support
Date: Thu, 12 Dec 2013 10:11:56 +0000
Message-ID: <20131212101156.GD11044@sirena.org.uk>
References: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
 <CACRpkdb_EVaOnkqkhmRJB12N_W4ghQyYVD+iriD26bjpvh9-Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47820 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab3LLKMV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 05:12:21 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb_EVaOnkqkhmRJB12N_W4ghQyYVD+iriD26bjpvh9-Xg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2013 at 09:17:02AM +0100, Linus Walleij wrote:

> Broonie: is it OK that I apply this patch deleting <linux/spi/74x164.h>
> to the GPIO tree? Apparently it's only platform data for the GPIO.

> (Tentatively applied, waiting for Marks ACK.)

Acked-by: Mark Brown <broonie@linaro.org>

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSqYvpAAoJELSic+t+oim9uQUP/3CFFMBgcFg8TtXHxRSI9EqH
7Qf2rsfovFL1s/kpMvkkbWg49KwEBUkmmJ5E4pbHKL3Xm4BF8KwHiD2P29bKN+zO
ng1iHmCWJKqpEnV9qY0//wArJAf/bHqyaHGTeSdajkezt4vVyHmwC63pXjc898yO
dKqC4o4hW9VGktCzIWMRGXXa2ojjoYP3WXj0zBUSk+hORufgXksSijVVldXE7wdE
lkfjUPRMXhhCy1FGnhJVwKtBEaUoH87UdtcIES7gZmzQnn6hDoWDblfN7FSma0It
j8ol3vcsWxdRP+jMaeXqNYjZXaiYRE/+XNcdguSt4yWKxWnDGmUDYyKci2ho9N/a
0G3FH2RUuh5WGNUGpci0+5y+lwHEvRnwcMIDqYVQHpQDfeh8KSmpCLOl6OxzoWkZ
gqPH7tB+DT97p4WRjljXZfXN/8+F2/U4nzTCwQBQmwGl2qOksCLRdt2hulTdJI2D
VJ/eXcE7c8RZrHliYffXo+tT4eyQTuNlq6GLxWOsUFChPctm6MS3lF0vMlxdepA4
n2as0rYnrHTeqaNQp7HkFrYzq7PLTIK3hDeHM3HCFGoUXiXyl7UrOqdbPJ5Lk3jf
0zcCYX05BDOO5sKGIW45hWEtCdZlqe1LOGai73pI40B3jcSqJH5nB8ee079IVeVl
m7JoejZx8D+QeNswkli8
=2ecm
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
