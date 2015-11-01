From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Sun, 1 Nov 2015 11:41:44 +0900
Message-ID: <20151101024144.GF28319@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CAAVeFu+FfgM7tUa0_mWaqQfDiKp2o5TT+ggyAK+yRW4cgHemsw@mail.gmail.com>
 <CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jrtu/q73HMxJslgu"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44211 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069AbbKBIxs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 03:53:48 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--Jrtu/q73HMxJslgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2015 at 08:47:14PM +0100, Linus Walleij wrote:
> On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

> > * For all the justified hate that sysfs got, it had the advantage of
> > being directly accessible using only the shell. If we replace it with
> > a character device interface, I think we will need a "libgpio" (that
> > provides easy access to C programs) and "gpio-tools" (simple
> > command-line tools that provide functionality similar to the sysfs
> > interface). Are we ready to start and maintain these? Granted, it
> > should not be too much work, but it's still an extra.

> I think the raw ioctl()s will be simple enough and intend to use
> the tools/gpio/* as proper examples. If we need
> tools/gpio/swiss-army-knife.c we will add it too.

> ALSA and fbdev and MESA and libusb spawned huge userspace
> libs, but I hope this ioctl() ABI will be simple enough that apps
> can use it directly without a lib. But what do I know.

That only works for very C like languages, for other languages (things
like scripting languages in particular) you're going to need a library
for the language to bind to in order to be usable.

> > How these will be shaped will of course depend on how individual GPIOs
> > are represented in user-space. Security will be a concern, so let's
> > make sure we don't return global integer descriptors for these. ;)

> First-come-first-gets-to-use-it seems to be how chardevs etc
> are handled. I imagine there will be ONE program using the gpiochip,
> else userspace have to come up with an arbitration daemon too.

That's another thing pointing to a library then...

--Jrtu/q73HMxJslgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWNXvnAAoJECTWi3JdVIfQkssH/2GwxixKxaDGMcVn59GgYPZY
fMX1ibQ+IyrUT0PqHX0mdmDVKmKEPPKePLIW43zWwL+mbG5MkWRew71PiCnliteq
JRtN6EMm2nrfzISJxKoN9HotHa1JKypijig9bb0ApIO3f7pDpdRMkiOxqSxL2iFX
JAwQVgZkxVVnkEgtBfeUS/3CxUQVqyLCIMxLftmnYaodYQ49d0IxgcmIexRnMTiR
kuqEH9KP1OljMyKi2PP+MZQu9l8j7WqLq4/unmf0Xv59h8UymPFbJyUlbGCAU6wX
RRZ1n+0B438kMmWtPj8SqWEeMXH8czqhLLrDhYoLCgAvInnev41YiR47Fx/9SZM=
=4aW6
-----END PGP SIGNATURE-----

--Jrtu/q73HMxJslgu--
