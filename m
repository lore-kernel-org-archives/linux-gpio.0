From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Wed, 21 Sep 2016 22:51:28 +0300
Message-ID: <20160921195128.GG8719@lukather>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Ca5z/wkVxIQXz1GF"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:41479 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751635AbcIUTva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 15:51:30 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>


--Ca5z/wkVxIQXz1GF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thanks for your reply.

On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:
> On Fri, Sep 16, 2016 at 3:58 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > However, things are getting weird when you have that requested pin
> > assigned to one device, and you try to export the GPIO on that pin
> > (through sysfs for example,
>=20
> DON'T use sysfs. Use the new chardev ABI which is by the way enabled
> by default.
>=20
> (But you will face the same issue there I guess.)

Yeah, well, we could re-do the discussion on ksummit-discuss :)

> > but given the implementation, I think that
> > it would work alike by calling gpiod_request).
>=20
> Yes
>=20
> > In this case, you get no error, and the GPIO is indeed exported,
> > allowing the user to change the direction and / or value of the pin,
> > taking away that pin from its device.
>=20
> If and only if the pin controller does not specify .strict in
> struct pinmux_ops.
>=20
> > I have the feeling that the core should prevent that, making sure that
> > the gpiod_request returns EBUSY in such a case, but I'm not really
> > sure whether it's the case or not, and if it is, where that check is
> > happening.
>=20
> - Did you try specifying .strict for the pinmux?
>=20
> - Did you read Documentation/pinctrl.txt, section titled
>   "GPIO mode pitfalls"?

Sigh. Sorry for that, I should learn to read the documentation. This
is obviously the right thing to do.

However, it does have an unexpected side-effect. On our DT, for the
GPIOs, we also set up a pinctrl node (which seem to be along the lines
of the doc recommandations, section "Drivers needing both pin control
and GPIOs").

However, when pinctrl_select_default is called by the core, which in
turns ends up calling pinmux_enable_setting, which builds the owner
name using the dev_name. However, when we call gpiod_request, it ends
up in pinmux_request_gpio, which build the owner string using the
pinctrl device name and the pin number.

This results in a mismatch of owners, and the gpiod_request fails,
while the device really is the same.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Ca5z/wkVxIQXz1GF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX4uTAAAoJEBx+YmzsjxAg/RoP/3N0JUJabUqvXEENVaAhJQPB
AllZoeu8TdKliM3DGfTuSil+oNlWSe3K/B7Yh/vmJPeAYn8EVrBqCw3ZOIC5LB6v
Y5i2991vcdvIjPs5KGTgQoHatEnTxkKW9h6+s2OBPTToOTaI29aypinPcmK4G6r0
54VoljyKbM82UMIGB2l4TNTEKwCqB2/2oTDXxr3SWBqOUPTZ0T/v/ISlfHKxuSgR
V5fHF3QRgaecuNSJV6BjMKN6hXvFgdYw2caYweh0tEzKD2V56JUaij5dVLYPP/yz
kNYnJ0hunCSQ2ohGHZ3laOZZ/Ytqpmqy2POFbow4Ri1/AkzruqlgUdcvXUAvbM/r
ukQ7NYNq4jBWgw62AcOG2eSbHS+pFz0vsihG2FB5mSafUBZMLaqOglaqt8mQLkNv
ET7bEb8V/8MkkRQymhqHUCeGBVKdTdKwdrRDVrAznaASPkac+ThL8I3vDKZQNVJw
37vPVptNpgBz0JVJvwedpqfjVUIBI+T88Psp39c9q6wX3uwVu++/mbbit7X6Jzji
f8GOMe5QAYCafcKJISFEIMHGHGzxaHIwkdY0k/wnpXjqklEJEQT2DY3YokALd4E3
WQ7gct2PifPGlgfJWqnLsaAyPTCuWtUVIRexvg+tSmf1m4TS8Gv/nyHzw1BAblH0
KPY8AuLwrSLMEb+Sa0Nh
=O6t7
-----END PGP SIGNATURE-----

--Ca5z/wkVxIQXz1GF--
