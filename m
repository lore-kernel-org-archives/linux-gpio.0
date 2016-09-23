From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Sat, 24 Sep 2016 00:05:49 +0300
Message-ID: <20160923210549.GY8719@lukather>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="V3GHqwm1rrtpHsCJ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:40685 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753235AbcIWVFw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 17:05:52 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>


--V3GHqwm1rrtpHsCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 03:22:53PM +0200, Linus Walleij wrote:
> > However, it does have an unexpected side-effect. On our DT, for the
> > GPIOs, we also set up a pinctrl node (which seem to be along the lines
> > of the doc recommandations, section "Drivers needing both pin control
> > and GPIOs").
> >
> > However, when pinctrl_select_default is called by the core, which in
> > turns ends up calling pinmux_enable_setting, which builds the owner
> > name using the dev_name. However, when we call gpiod_request, it ends
> > up in pinmux_request_gpio, which build the owner string using the
> > pinctrl device name and the pin number.
> >
> > This results in a mismatch of owners, and the gpiod_request fails,
> > while the device really is the same.
>=20
> Yeah, needing both GPIO and pinctrl on the same pin kind of
> implies that the subsystems are poking at the same hardware and
> that is !=3Dstrict.

My understanding was that GPIO and pinctrl were pretty much
orthogonal, a pinctrl property would set up the muxing, and mark the
pin as in use, while the GPIO property would just say what we use the
pin for. In a way, that was similar to what any other controller would
behave. You would mark the pins as exclusive, mux them, and leave the
controller deal with its pin.

Anyway, I'll remove those properties from our DTs, and add the .strict
flag.

> I have had some half-finished thoughts here, for example to add
> more callbacks from GPIO to pinctrl for things like open drain
> and biasing, so that GPIO would be a "pure" front-end with a pinctrl
> back-end. It ends up duplicating a lot of stuff from pinctrl in GPIO,
> but since people will inevitably want to do things like biasing
> from the GPIO chardev I might have to bite the bullet and do it
> that way.
>=20
> Other ideas welcome.

If we don't have access to the calling device structure, I'm not sure
how we could fix that properly.

On your more mid-term view of things and where the chardev interface
should be going, I definitely second at least having things like
biasing, strength, and all the configuration really, exposed. There's
a lot of people that actually want to enable biasing and we don't
really have a good solution for that.

One way would be to use the DT overlays, but that seems more of a hack
than anything else.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--V3GHqwm1rrtpHsCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX5ZktAAoJEBx+YmzsjxAgN1sQAIXsCSfoo64S8eHFY1QYcfIF
0sRJR0Eul58K4kJMvFIDrvvGbz5FyJMKl7/ekd7tx62QyswXGTx71FHamresulqJ
NGDczSHbO5yrN8REBZGUEXfHWq4o7tEsymNrNmZ4lYSIJrWo+Vf4LMCeQMpTeOtX
1+hGa0Np8goI7smxEHFy2k3CDiYw4dcNcMiHMcAMOj374ad204Ae8j3PXNvYP9VU
ZGr+pXfgZUMzbaF0z/bUXHXrioGFb7AZ/BpgHpF6DSvMX2SV1QWe41n1qp9jpBFO
QsZFt92SJDrGUkXLjvRhKIyNpJi9e7GOoewnm3D7C3fTKeIRNb7zTXMCg4XizuUr
28j6q462WdEoXWgfZ2XzU1AVmHu0kW7dLlol8FGztWEsKOfICi42TqEpMQ9X9HVg
kY9c0vd6L0n4EdVrREtGfvQtfcBzEwHq7pNbEMh+aF5xHKDF/EQPU2mwfyItbktY
Ff5H81GeK7GJdTSqTva5j85cdNzZEsqDkGjSSVE9L1W/nMsG5soAMqHqZwkJKchk
QE3KFegKmc2+boL/SeGvyDQBBZYsI64iXq/8ZgcTyOCSo7IwDgqcyZtB5X7kNjOr
dKuGTN1xX5BfO5u5VcBFOJyqbwdsQ5MVqe/N2qiIviPqEuywT0lekHvdPxV6Dn8M
gbUSob1a1hAWl/KctkXG
=c2uc
-----END PGP SIGNATURE-----

--V3GHqwm1rrtpHsCJ--
