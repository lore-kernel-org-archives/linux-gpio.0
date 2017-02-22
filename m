From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Wed, 22 Feb 2017 10:49:13 -0800
Message-ID: <20170222184913.dvl5vdipm6vnqvw4@sirena.org.uk>
References: <20170213011355.GA13075@dtor-ws>
 <CACRpkdb+KKKwZEBW0o24KRGmxgSEbf9Op5OL8JK1tVvfvR6pGw@mail.gmail.com>
 <20170222182725.GA24044@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sbdpuoyvmrxsn53a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170222182725.GA24044@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--sbdpuoyvmrxsn53a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2017 at 10:27:25AM -0800, Dmitry Torokhov wrote:

> The point is that they return the same value when regulator is not
> present and when regulator support is compiled out. GPIOLIB returns NULL
> and -ENOSYS respectively, and I contend that this is wrong and needs to
> be resolved first.

FWIW this makes sense to me.

--sbdpuoyvmrxsn53a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlit3SgACgkQJNaLcl1U
h9BFJQf/X6ERYY6iPGjZhSyfL9AcnmhrY9CVN0RS0rvCKehCwMlo6PE05n7G3aOV
e2bGhLT85hQVnRRdYof7LGSPBtihfjYV0gohA+rQZHp+V/dEuAfsUIdtDK2JF+ah
qo2Z/ynFUs2Pr6hiIn93rplvHeQ1hp190aM5pqaLiQG+Z5LGWSDVmqY6MpjO+y1F
KNT31sQzCEQe0Fkm7nWuFpq6YmOoL2eNBYTR/O8n98gJ+CwemHDrJcU8gcdSMnQz
AkGKokOib3A6CL/GoM+OxpLcnkrVVFZGMmgl1Ctqo0jCGy6X/Tq1CofAxV5inOgo
XEf6rQDg1k2gfIsLkj76Xag3ZQsS2A==
=OZjV
-----END PGP SIGNATURE-----

--sbdpuoyvmrxsn53a--
