From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 13:17:01 +0000
Message-ID: <20151102131701.GI20228@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
 <20151102124737.GG20228@sirena.org.uk>
 <20151102125347.GA12752@localhost>
 <20151102130633.GH20228@sirena.org.uk>
 <20151102131456.GC12503@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IR1Y5IvQhrKgS4e6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44690 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbbKBNRI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 08:17:08 -0500
Content-Disposition: inline
In-Reply-To: <20151102131456.GC12503@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--IR1Y5IvQhrKgS4e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 02:14:56PM +0100, Johan Hovold wrote:
> On Mon, Nov 02, 2015 at 01:06:33PM +0000, Mark Brown wrote:

> > > Dynamically allocated struct device are not the problem as then you're
> > > not *reusing* the same device structure.

> > You may end up doing exactly that depending on what you get back from
> > the allocator of course.

> But then the memory has already been released. You're not deregistering
> and reregistering the same device as in your example.

Depends on your definition of "same" :)  You might get the same address
back which has been known to confuse unhelpfully designed things.

--IR1Y5IvQhrKgS4e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWN2JMAAoJECTWi3JdVIfQslkH/RQfZJVrQEmN18bpRD1WotQ5
bgCMqwb9qxKTAPzSdGwlb10uxfOiLnQppUhdF+A3Rw8DdEH/Y8Yn2TEnAG2K3q8P
BGmPfQ++P/EDePryzFiHFviBVT7Sm/A16S+5bcoCg8wXtJoE9BW2BJeJvdTym/Zo
6G+yGzMR3CefGqlpNWuh6yMAwg73yvoecv/hTGKyuBdYVs/+L3Z95su4xI4kxrXG
UejraaMGjCvJpl34k8NzZv4sNIqHOq5SdfdlbgBqgo5hOTCp7cVv+n6VyTeiptPx
AihettXtvyb0qsuJx/bUiqyUxUM1YG6v+Kj8L1+GK98qcZr7wgSgIzyEJKYGWa0=
=+j+r
-----END PGP SIGNATURE-----

--IR1Y5IvQhrKgS4e6--
