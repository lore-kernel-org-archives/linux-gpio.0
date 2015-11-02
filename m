From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 13:06:33 +0000
Message-ID: <20151102130633.GH20228@sirena.org.uk>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
 <20151102124737.GG20228@sirena.org.uk>
 <20151102125347.GA12752@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Z7/5fzWRHDJ0o7Q"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44651 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbbKBNGl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 08:06:41 -0500
Content-Disposition: inline
In-Reply-To: <20151102125347.GA12752@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>


--+Z7/5fzWRHDJ0o7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 01:53:47PM +0100, Johan Hovold wrote:
> On Mon, Nov 02, 2015 at 12:47:37PM +0000, Mark Brown wrote:

> > A memset() should be enough, if not then we have problems with any
> > dynamically allocated struct device.

> And how would you know that it is safe to memset that struct device?
> There can still be references to it. And driver core explicitly forbids
> this (see device_add() for example).

My point here is that the memset() of something that was passed in
externally isn't really a problem, it's the suspicious lack of
integration with a release function (hence my question about why the
driver core isn't complaining when the device gets registered).  The
comment is more of a concern than the memset() itself.

> Dynamically allocated struct device are not the problem as then you're
> not *reusing* the same device structure.

You may end up doing exactly that depending on what you get back from
the allocator of course.  The point is to make sure that that the driver
model called release(), dynamically allocating and freeing in the
release function is the easiest way to do this but it's not magic.

--+Z7/5fzWRHDJ0o7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWN1/YAAoJECTWi3JdVIfQAEgH/j2FL+APzg64cPdCdlUVcSib
z6biu/gNuMYZQt15V8uldQircn0E5kUbQodl5HaIMMLltmG2hbRVSV6mMsqJ34Lg
dDK0GTqYV+AtWeCMmsKkEYI1jsP7pr1wJj5w6C+yRKSWHcLUoaGh2pUmAPMckt4g
PiIADNudw/1I9+04qXP1+d5miBqewtz/q3M4fsFRpsKUAAG7QbHDykURV9a3ErKh
k+1quF+P8jqtAUyrqtxMy8SVn35dIzGTAdWKUm2a3UHj0N8C0gxxHb4WjKY8BjoG
KCIxEsnorhsG7SD1v5bBjRGiNAlX5pl41Dlk7QZxvyVz0q+7BNmx+YC1RvMRIRA=
=J0o3
-----END PGP SIGNATURE-----

--+Z7/5fzWRHDJ0o7Q--
