From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 3 Nov 2015 08:50:52 +0000
Message-ID: <20151103085052.GN20228@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
 <20151101024144.GF28319@sirena.org.uk>
 <2109736.Oi4ERkUO0L@adelgunde>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muT+E17Lr9urPYYJ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45754 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752857AbbKCIvE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 03:51:04 -0500
Content-Disposition: inline
In-Reply-To: <2109736.Oi4ERkUO0L@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Amit Kucheria <amit.kucheria@linaro.org>


--muT+E17Lr9urPYYJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2015 at 08:39:13AM +0100, Markus Pargmann wrote:

> I think we need real gpio userspace tools for such a chardev interface and not
> only a library. On the one hand there are all the kernel/userspace developers
> that just want to test stuff. On the other hand there are really a lot of
> people that are using small embedded devices (e.g. beaglebone, raspberry pi,
> ...) for really simple applications like using GPIOs to control something. I am
> sure many of them are just using some really simple bash code to reach their
> goals.

There's already some work going on on producing tooling for the maker
community which is currently working with the existing interfaces,
attempting to abstract them for users to handle things like base board
differences - I believe that's part of the motivation behind this work.

--muT+E17Lr9urPYYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOHVrAAoJECTWi3JdVIfQFm0H/jLgC/2Wmh+gFDUcqDLwTuSq
/ax2eoX05iMMb0Me9/ApHzcEGnSWogcJ6CPtHdy8ZdqrJCXOU96v1KA5RjZHdVRA
CNNuUIVNzZfU8Iq0FlUzTBnLGT5ojujXgePn0oCvW5lnaUIWDHyaQkQbvo3D/f91
+7/EVgVZmbB+xnG+Lii0vMooSkvnKGXIURS9RrN/EIiUOuBr+gV85tF01lpoFChl
wwexyKnx6J8R2yZBBYFRfXyi9dYeD14pkqLyceOdmseS0dmCnqEsTI13i1sB48kX
jxyOntnLoNuVhkkP71vbbNTTO0zlIGR8tDWeow8Wv2TBjyhRSgeJGWUN+ZR6quY=
=nBln
-----END PGP SIGNATURE-----

--muT+E17Lr9urPYYJ--
