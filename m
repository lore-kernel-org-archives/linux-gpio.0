From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Wed, 26 Oct 2016 17:49:28 +0200
Message-ID: <20161026154928.hu6rjalw7syrvbvg@lukather>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
 <20160923210549.GY8719@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nv4nw6w2j6st3oio"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:53555 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S935887AbcJZWKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 18:10:25 -0400
Content-Disposition: inline
In-Reply-To: <20160923210549.GY8719@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mark.rutland@arm.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>


--nv4nw6w2j6st3oio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 24, 2016 at 12:05:49AM +0300, Maxime Ripard wrote:
> On Fri, Sep 23, 2016 at 03:22:53PM +0200, Linus Walleij wrote:
> > > However, it does have an unexpected side-effect. On our DT, for the
> > > GPIOs, we also set up a pinctrl node (which seem to be along the lines
> > > of the doc recommandations, section "Drivers needing both pin control
> > > and GPIOs").
> > >
> > > However, when pinctrl_select_default is called by the core, which in
> > > turns ends up calling pinmux_enable_setting, which builds the owner
> > > name using the dev_name. However, when we call gpiod_request, it ends
> > > up in pinmux_request_gpio, which build the owner string using the
> > > pinctrl device name and the pin number.
> > >
> > > This results in a mismatch of owners, and the gpiod_request fails,
> > > while the device really is the same.
> >=20
> > Yeah, needing both GPIO and pinctrl on the same pin kind of
> > implies that the subsystems are poking at the same hardware and
> > that is !=3Dstrict.
>=20
> My understanding was that GPIO and pinctrl were pretty much
> orthogonal, a pinctrl property would set up the muxing, and mark the
> pin as in use, while the GPIO property would just say what we use the
> pin for. In a way, that was similar to what any other controller would
> behave. You would mark the pins as exclusive, mux them, and leave the
> controller deal with its pin.
>=20
> Anyway, I'll remove those properties from our DTs, and add the .strict
> flag.

So I discussed that with Mark at ELCE.

In order not to break the DT, we looked at the code of pin_request
(which is the one using the strict flag), and went to the conclusion
that it needs to be amended to check the owner based on the device
structure pointer.

Which would need just to add an extra parameter to the pin_request
function, right?

It should be quite easy, because there's basically two users of that
function: pinmux_request_gpio, and pinmux_enable_setting, which in
turn are called by pinmux_request_gpio and pinctrl_select_state,
respectively. Which are exported, and used in a significant number of
callers.

=2E.. None of them having access to the struct device
directly. pinctrl_select_state is used in 13 different
drivers. pinctrl_request_gpio by 16 of them, but in a gpio hook
(gpio_request) that do not have the calling device structure.

Which means that in order to avoid removing one property from a DT to
fix an actual bug that can cause real stability issues to Linux, we
end up reworking the gpiolib API and fixing all the users.

Mark, Rob, do you really think this is a reasonable request?
Especially when the feature in question was added more than 2 years
after our driver, leaving us no chance to actually benefit from it
without breaking that ABI?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nv4nw6w2j6st3oio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYENCCAAoJEBx+YmzsjxAg9+IP/0py6ETrKJqobl0kovOw1Dq1
geJxiQLyVNHL8iXxX0ImDFWeqjBUj588sFmr53liQFw0x+prgOP1hbLZW46OOGki
SUywl1iFRKlGt+hE5YPg5lG/9MQ9+ElBz48brncUoJO6QD3JA/1sqWsilqxs1Rtm
T5NxlJESBqNv2PBptCTZNz0BNDpUdj78pZ2PxZZQ9FcFluWQ2qfMGEtXxxRShhXM
iGz+Pr5W/aT6/i9XXrkjf1EZr4EicNe8Wv+u8U5bz+8OZLFJJQKBtK1tnhtj/9tq
yKYaEAYefLjR+A24txDsYjMD0i28cjncuV28EXuQeELeuafIvcxkumrdxTRnr864
oSqU+yN5AfGcJqns58A/TVTqqI2CIQzfdWUJ2m5nBAA4TK6v0XEDdSL1XZZ5mEXM
8woNWn02RQDTlK+jzggnvVckcEJk+TaHJQiHao03fGn3R+Us0+eYjTZOeJVXGC8q
I9Il6emQwmM9LeCQhqhvm0zXQpmPCx+HPvnt+VZ1efVEDQG4bSX0OZNzIUpdsWIu
cdEckyCpUwXendiNdylzs8Ioanelwd3xHH5ud4F6KD8VL8g4nwDoFhXuaTw1Utdg
0r7AadymZyEOTGjxjAO++hu4tSo/CpX1rIwSE3TNdTb6eQPpWOpaG1Oe4i47c6ND
cgmYs9LKsTYIO35AicnE
=zLUv
-----END PGP SIGNATURE-----

--nv4nw6w2j6st3oio--
