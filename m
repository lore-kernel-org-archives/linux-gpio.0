From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v2] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Thu, 13 Dec 2018 18:20:26 +0000
Message-ID: <20181213182026.GX10669@sirena.org.uk>
References: <20181211140555.GA5872@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QQ0dNM4HnH4+xgqD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181211140555.GA5872@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org


--QQ0dNM4HnH4+xgqD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 04:05:55PM +0200, Matti Vaittinen wrote:

> One specific question hit me while doing this. Why does the regmap-irq
> core do default trigger type configuration? I did leave this in the
> patch - but to me it is strange. For me it would be unexpected that the
> HW default trigger level is changed by common code. I would understand
> if change was done by some board specific code, or code specific to a
> chip - but 'core' doing this seems wrong to me. Should it be removed?

I can't remember and can't find any record of any discussion of it which
is odd, might've been on IRC or something.  Let's just remove it and see
what breaks, since we generally provide the type along with the request
for the interrupt I'm not sure how often the default actually gets used. =
=20
Possibly safer as a second patch though in case there is a good reason
that I missed so we can easily revert it.

Unfortunately this also collides with a change I applied earlier on from
Bartosz which supports chips that use masks instead of a separate type
register to handle types so it'll need respinning, sorry about that.  It
does look safe to me but it's possible I missed something.  Equally it
only seems to be some quite old Tegra systems using the max77620 so
perhaps mainline usage of affected devices is limited anyway...

--QQ0dNM4HnH4+xgqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwSoukACgkQJNaLcl1U
h9DTUgf+Nn/sT9v2nc1Owok4i4RdYdocHxSUnJ98ZZVLknBIFd01JLu5p3W067IC
h/X5zmu2oF0E6VSvIiBmzhYW+qMKwRp8zakpHyrU7kYvWCtbesLJvFlFt4+MXuqw
94Q/WbdEb51JtlqhUioi7Flj53bBByDQPKVaXzAHoP8AznfFoOMNYzcLOruEQS9S
UpwPYl4oppkIzUXHz22b+vxfvCxmkba8LTegos7rkFwEm+ASzC/D2815dGZ2/geq
HpEtvwuxamN9aLwUFuxjZKmsM/kDOXD/QLZpBwDhMgk4q/rlqS+mWcjnj7Kvivmx
lmgUYY2Cs6m0TjmiLtzzMAj1EANPTg==
=KWEc
-----END PGP SIGNATURE-----

--QQ0dNM4HnH4+xgqD--
