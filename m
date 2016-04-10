From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] gpio: sx150x: move platform data into driver
Date: Sun, 10 Apr 2016 07:27:12 +0200
Message-ID: <20160410052711.GA1388@katana>
References: <1460192173-8995-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42642 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbcDJF1Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 10 Apr 2016 01:27:25 -0400
Content-Disposition: inline
In-Reply-To: <1460192173-8995-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Wei Chen <Wei.Chen@csr.com>, Peter Rosin <peda@axentia.se>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2016 at 10:56:13AM +0200, Linus Walleij wrote:
> The sx150x has some platform data definition in <linux/i2c/sx150x.h>
> but this file is only included from the driver in the whole kernel
> so move its contents into the driver.
>=20
> Cc: Wei Chen <Wei.Chen@csr.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Wolfram: I assume you're OK with me stealing this file.

Actually happy that you are doing that :)

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXCeQvAAoJEBQN5MwUoCm2ox4P/RgsnCi23WdLspkgBEyv1ueT
ek4P0pBqprYSWGO05Uf4XOwdT1TDa/tOAH4Hz5OQ0ZrvUBRSpxZoFVhNX26HMQA+
YKKxifQTXc+aZcG4tOXpOTsSoItwyD7wbgI2r7jm1q3GiATewuSzwKpcX4ifkXhQ
i4e7VR0kPTkwaGZjE/ktPJKoYBWLUhUELJsf4kuPf+YSqCjOBkSauZF7a9qCS72d
I+DXSRD3pNyqQbFsha5FVKHcZxlta2iHSp1A8Wnb6eG702GkPfeVcGrsozuT+3DS
3o+ZJBLMheG8s0p9l6oRr6pgnxa9RGYUrYtSW/UjCzUj9y+Ttpwj8Y+xRzrvqI5I
G501gwV8isI/rk0ORoJJvctDihw82zJfoTGzAIAl07unYg/JVsMVBt2f+8vVp4uw
uywwHC+VHRkIne8RreuVpMd62d4Umr8clbnQCRxwUiJNvj+sm1B+cI592BLnexTE
3t6OYo+B+9Ia6s83QvkyDwSGG6wvbIEe6d2+dLwgDbRThYKYYoNu5Z6/sq3wrnTF
aGzFHdGT7rrSiwUmzgIGZfXx2zBk8Ui9FlEp7C8f+V9mGHAO7rX5LICiR1nnkltI
bH7Ei2qPLLkzQK2k9ZQPyRIjuwp/fcsx1w0LhwuxICVBBRtoktIBTKcFq0Wze2sA
9xC+mEN83s/RHXw5dehi
=NfAA
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
