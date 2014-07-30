From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Wed, 30 Jul 2014 11:41:30 +0100
Message-ID: <20140730104130.GO17528@sirena.org.uk>
References: <25983307.ZjJOfz2Kpg@pcimr>
 <3862339.n8jYhAjBf6@pcimr>
 <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com>
 <5291550.Rzt9KR357U@pcimr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WnTNnZ8qPt9DEgcx"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34437 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbaG3Klw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 06:41:52 -0400
Content-Disposition: inline
In-Reply-To: <5291550.Rzt9KR357U@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>


--WnTNnZ8qPt9DEgcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 11:12:30AM +0200, Rojhalat Ibrahim wrote:

Please fix your mailer to word wrap within paragraphs.

> I could not find any other in-kernel driver that might benefit from the new feature, either.

> So I guess you are right: There are no users for this.

The usual users for this are devices like LCD panels or other parallel
buses.

--WnTNnZ8qPt9DEgcx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2MvXAAoJELSic+t+oim91DMP/j539leel7i6nFIfv2I38ZWI
+BsQkIdAIMNaj89/ocZJk/PSm9g0qSGs+EVK8I9zoE2v/rhL/PsLTZFJbZAMjgPZ
OZuRNI88/+L0JMkzY+A8NxxWPOrGue+GtAQ+vbvf0cxFDcOKRoWkgUSJNrYXc5/Y
TXQv9OmG3gKPxt+myhSqyqgJpwO9fo2inWA8sQxl+mIIWCvpohqOTPNX2m8yUgLe
dOWEmj3YhWwE1+EWiXU1IqYisnpstt2190yeYUpL3v1Qj+tHCDLONi5r2YD/TpNj
5Ujqv71RFCP1RrrKyvVYT+0d1u9T573pbrLhs5tYv2hDXVZN+0269ATmOoZJfVEk
nig5zG7DKg2/zvUecdfZ/GIXOY+RoH+jXX36TWR3iOoG8QMEPYz3qkrA8Pj9TUOt
5cb0nWOPlZ20HH9uikTKA/VJmFvqXe+rUHmJDHfOa/tJIweibaWDixz4EeL1vlxT
KQXwc/e9y6EM5yeXJJG9RFhe4N8ewEZtQXYsUNhSU2X3Skzlib5qvKAjAoXQZZA1
+hJc5Jh5IkbNMeGo/gEeZ/jCgZ8zjHO05ieeS3xoK0cyzaaJc1ak7hiOYtWb7ne+
jPMy1zX3tgEhhZtmJ2XnlFZPHWUVqYPOTKgjgDpnLPkCuvjoRA6WxX+lO0OdH2C8
W4i5jF4FF4v/iZCTmR9p
=VHXo
-----END PGP SIGNATURE-----

--WnTNnZ8qPt9DEgcx--
