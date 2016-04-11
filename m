From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] gpio: wm831x: use the new open drain callback
Date: Mon, 11 Apr 2016 11:59:02 +0100
Message-ID: <20160411105902.GC3351@sirena.org.uk>
References: <1460293939-14181-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59704 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbcDKK7J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2016 06:59:09 -0400
Content-Disposition: inline
In-Reply-To: <1460293939-14181-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, patches@opensource.wolfsonmicro.com, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 10, 2016 at 03:12:19PM +0200, Linus Walleij wrote:

> +	int reg = WM831X_GPIO1_CONTROL + offset;
> +
> +	if (mode == LINE_MODE_OPEN_DRAIN)
> +		return wm831x_set_bits(wm831x, reg,
> +				       WM831X_GPN_OD_MASK, WM831X_GPN_OD);
> +
> +	if (mode == LINE_MODE_PUSH_PULL)
> +		return wm831x_set_bits(wm831x, reg,
> +				       WM831X_GPN_OD_MASK, 0);
> +
> +	return -ENOTSUPP;

This looks like it'd be better written as a switch statement (it's more
natural and less error prone).

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXC4N1AAoJECTWi3JdVIfQDU8H/AwqdAe1ww5FuFjdNl+PqHdS
YbfQtJFdCekAUBlp7YGqM4mUqxA9w13K08ndn/YhAC2sNl/bAkw/Z/WyIIVRmOGK
YiYL5DMxWh2IDbcZQAUyYfPEBsx6GfiRGvYPZlmqWbWePIRpBgRl82BVsV2+OI89
hPRJoF0E/mHvEUNk/hROZ6R4ZGF3TXAbqYV2U3es+oeNbEOVkQ7xPgTiZzgIvf8a
FpcaSX2K+LPubyGDD+QCDe5qOf7E6h8qpAJzQhGHfv8pF7pidISdFMbeeASVCbwy
iNVoJmPrOIZ3sB/DVhUyRlU1vfffUz3CIe1h9wCL/26+ovN2+Dp4qrluPODB8wk=
=zGS1
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
