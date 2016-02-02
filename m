From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] USB: PHY: minor include cleanups
Date: Tue, 2 Feb 2016 20:43:37 +0000
Message-ID: <20160202204337.GD4455@sirena.org.uk>
References: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+b2GFy/wpzNn/yIF"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59931 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932865AbcBBUoF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 15:44:05 -0500
Content-Disposition: inline
In-Reply-To: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Felipe Balbi <balbi@ti.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org


--+b2GFy/wpzNn/yIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2016 at 02:02:30PM -0600, Bjorn Helgaas wrote:
> Remove some gpio and regulator #includes when they can be replaced by
> trivial forward struct declarations.  Also move a linux/gpio/consumer.h
> #include from a header to the single .c files that uses it.

Please don't CC me on patches just for simple work on users of the
regulator API - if there's some regulator specific input needed then of
course that's fine but if it's just normal API user stuff there's no
need.

--+b2GFy/wpzNn/yIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWsRT4AAoJECTWi3JdVIfQ2qIH/Rtl3MAeIqSOVxFCybHAU5YU
6x3x5X6AeP8mriOGpjLlrXRRoy0/6sTEH7OxxAVnuyxVAfKIshflk2g2lMR1LJkj
sBfNdWg1RbuB412J3mpLziSyN9jb0zvapjgitUcL3klA/BFcflY3aP/4r6Yn9RnI
wNBJEWeqOrkrHuTEILc6RZ+KqsEbpmHl0muHFG3m2o1pIdnBLUB/9FfUhvmNZCZR
nd9iYg6XSUXkpgQcaqfI97+vByZ9R1nhHAm23QlF1LBXaT5QPnBlcC2FTobnjYRk
oN+oHDa8cmOL84UXXAE2LwOrG4/DisGtcxnmglmM9XkTH7JdDPvJFvi8tAqaS7g=
=KI9c
-----END PGP SIGNATURE-----

--+b2GFy/wpzNn/yIF--
