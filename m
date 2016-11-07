From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [BUG] pinctrl: sunxi: sunxi-pinctrl fail to load with
 CONFIG_DEBUG_TEST_DRIVER_REMOVE
Date: Mon, 7 Nov 2016 10:56:12 +0100
Message-ID: <20161107095612.ih5ns24m2qiwujy5@lukather>
References: <20161107081832.GA23580@Red>
 <CAGb2v65MHBUwWzcqwPYDtFNxgGnMECUMjHdZNOv6YPP4HVzwTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="74kmqyxmd57efq5s"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:42330 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750898AbcKGJ4Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 04:56:25 -0500
Content-Disposition: inline
In-Reply-To: <CAGb2v65MHBUwWzcqwPYDtFNxgGnMECUMjHdZNOv6YPP4HVzwTw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>


--74kmqyxmd57efq5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 05:48:43PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, Nov 7, 2016 at 4:18 PM, LABBE Corentin
> <clabbe.montjoie@gmail.com> wrote:
> > Hello
> >
> > With CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy pinctrl-sunxi fail to load on =
the second try.
> >
> > [    3.900061] sun8i-h3-pinctrl 1c20800.pinctrl: initialized sunXi PIO =
driver
> > [    3.916251] gpio gpiochip1: GPIO integer space overlap, cannot add c=
hip
> > [    3.923016] gpiochip_add_data: GPIOs 0..223 (1c20800.pinctrl) failed=
 to register
> > [    3.931099] sun8i-h3-pinctrl: probe of 1c20800.pinctrl failed with e=
rror -16
> > [    3.944709] sun8i-h3-r-pinctrl 1f02c00.pinctrl: initialized sunXi PI=
O driver
> > [    3.960796] gpio gpiochip2: GPIO integer space overlap, cannot add c=
hip
> > [    3.967594] gpiochip_add_data: GPIOs 352..383 (1f02c00.pinctrl) fail=
ed to register
> > [    3.975633] sun8i-h3-r-pinctrl: probe of 1f02c00.pinctrl failed with=
 error -16
> >
> > Without it, all subsequent drivers fail to load.
> > Tested on Orange PI PC board.
>=20
> I don't think the pinctrl drivers were designed to be removed.
> And I thought the lack of a .remove callback in the driver blocks
> the core from removing the device? Maybe I remember wrong...

Using a builtin_platform_driver should be enough to prevent it to be
removed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--74kmqyxmd57efq5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIE+4AAoJEBx+YmzsjxAgpEgP/iPU/jympbhO4gAJO5p4ua31
dm2vG39pfABTR1VKusTokkA4KvTebInQOV8f9gMSLT8ATsq2h1DE7gDcHKj0sk8Y
Fo81AYRciP3VW8sskLXLtyG8pgJXEbMzOnTNlePYOiYFYve3//Fm5XrdzfuKMcKI
444M9xRarMTR2rvnf0w1eGXtpZN9ZQVFZp/M1zhZgJhUEleyaSiEydjh93oc7Ov8
pMoJ1RGo6bGSucg8M01tamL91dTsUNg5pc3rkQTjNrD1omh3AV9P1RMOnAfZRWwN
7VH3kMripYs9mawGAqSyIjF5yezKS6NzCHR5Evjwb48NqRVmvE0D/5p9fVKXZf8a
g8gh9ZPh3xuDZmtKa2CrR63w60SpAQZYt95FVgt9gUq/QTn2XKLx34h9EuavPqlG
b3GvcaXgZDcTF7FWE6V6BE5NrssmADAn8ZbXTVFGL2MSeno3ZoPVO2YTdwZsWR0H
Ld6FF4cG0HyQ0vO+2AJT4OkmS+6XX/thiTssFosSWSU718cYgVAowHUmwx2uR2Qn
iIIgb5BgdBzp4tRQe/NB5Df49jiT7FKjF8BHIbB14EcEGqcF16NUdqRLySYKV45d
8v1mHYZQ26VAZ8bg5qFD5GRr/ctF+vyH4DX+TSFBaCO2omLPD9lZltPRFVyhm6ra
7UBMda7OUZ/rQFaBDBBO
=HZTC
-----END PGP SIGNATURE-----

--74kmqyxmd57efq5s--
