From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] gpiolib: Downgrade set_debounce() missing operation
 warning
Date: Mon, 9 Sep 2013 10:26:32 +0100
Message-ID: <20130909092632.GS29403@sirena.org.uk>
References: <1378471128-3330-1-git-send-email-broonie@kernel.org>
 <CACRpkdYCj-UDhekZ7tZ9kbusrJArvegfaGtJq7ULhNKz5o1Euw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3dBJfKlFjfsS/piO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37834 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871Ab3IIJ0f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 05:26:35 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYCj-UDhekZ7tZ9kbusrJArvegfaGtJq7ULhNKz5o1Euw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>


--3dBJfKlFjfsS/piO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2013 at 09:47:17AM +0200, Linus Walleij wrote:

> A patch like this is already upstream, but thanks anyway!

Hrm, it hadn't found its way into -next on Friday but I see it's there
now.

--3dBJfKlFjfsS/piO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLZRFAAoJELSic+t+oim9k6wP/j4T1mDmjh20Uze1lm2z65kW
mVh37FSp5y8u98AtOZQZmigDrb+kI3cuNi72MFWamB4/ICHqkj91LIg7Iv/fsRzn
QcUcBJD7i3bucm4updZQgA3NU43a2g2ZzW1X146wKvsPSbd/4kx1PffpsUj4gESo
CyvQ4F/pWR/sLAKiErzjFqSNAw8DrzW3lVjsx8H9jw/1nRZUwKa8R42KAqAdtbbx
gwDF0crDTTqUocgSDqpgZott69uEYT7A40shk9xmcuEGN42mGsVDL9/gjL4XpGwq
/lS4+e0qFLXKiewPM+GdHFMK5qCRIY51P4oJIZAZ0y+KfBAawmG5L1nXHjwkm30r
fg5ab5oQo0zkPqd/HtDHqV9fndQUnIcnuKOPrNdEJ93nyE5RXergXhbvbeb+t63i
VkLnEJWNeZl+TDE4dOWhVrp7aAYTIugfjBmo4ZvGCHTWvlJkfefv5C9hSbFrOwVx
k+w5tprpGAVMCdDF3Vc9+QZo2U1OERuZlG6gUr1L+vKj8m9Aoo7alyQ/TWq8Zj3Y
jKf8RO0gB6ICFJxMzgIcVeWANBdU9nYMWBmFKbYTDvbnQAcP82yGF+n0KlRfWsu8
uhgF6qqA/xxQfu+ydEQ0rRsTjc+lRSkvTYzyCrhHwAmVF7GtW7SsVEcqPnuUTSG+
2N/HHgtdQDHwD/tpgmhS
=4rMn
-----END PGP SIGNATURE-----

--3dBJfKlFjfsS/piO--
