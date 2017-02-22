From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Wed, 22 Feb 2017 10:44:57 -0800
Message-ID: <20170222184457.qa2up57mnsxifst2@sirena.org.uk>
References: <20170213011355.GA13075@dtor-ws>
 <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mdd7wjvxodazbmvm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39612 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754507AbdBVSqF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 13:46:05 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--mdd7wjvxodazbmvm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2017 at 05:06:35PM +0100, Linus Walleij wrote:

> For optional regulators, if I understand correctly, these are
> *electrically optional* as in: a voltage input pin on a chip that
> the chip can very well live without. The regulator may be there,
> it may not, it may affect the function of the chip but it's still OK
> without it.

> For this reason regulators will return an error if an optional regulator
> is not present, and the code is expected to deal with it.

Yes.

> It is a common misconception that the "optional" part of the
> regulator API call means "software optional". It is not the semantic
> of this call.

> It is also tagged __must_check and return an error when compiled
> out. They return -ENODEV, see <linux/regulator/consumer.h>

Right.  Dmitry actually sent a patch a few weeks ago proposing a change
in this behaviour for the regulator API which I didn't apply.  I'm
mainly worried that this would the already encourage common broken
patterns with people just not writing error handling code properly and
the incorrect software optional assumption you mention above.  The
expectation is that the majority of drivers with optional regulators
will need to do some explicit handling whenever they would interact with
the regulator.

--mdd7wjvxodazbmvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlit3CgACgkQJNaLcl1U
h9B9FQf0DlMiv6zrLIa8ZJQRoBWXSHgGiCpMj4LUdsAhdP/VaXAe9KIqu20LFdgd
Xi5zFPjuZtL+J6O2X7qlNdK5bc50G/8XMrjozKlaC72W7EXG9qzm9hfjzu1mhzCO
lkxzhPnjI/68IPMmeE3PEp8VksRGKzpJWV/o1N/aLuhBRUf+vJ5cj62CxRp/LiuD
SXl5y09TuEGZZzwOMoI8zy1hB8MOtrfJc6dh8FfESZskhb7ujb+EbQ3TIYlb4fAi
DUMO579w/vm5u3OGftHZDgh4li3t4QVkIaZXQoIkcr1cuiRLxyLSfOa9uyKBwzAH
FjJUnAugMa5EaG9FpUrL4UdulLwm
=LVTK
-----END PGP SIGNATURE-----

--mdd7wjvxodazbmvm--
