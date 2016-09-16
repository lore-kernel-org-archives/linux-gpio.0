From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Requesting as a GPIO a pin already used through pinctrl
Date: Fri, 16 Sep 2016 15:58:08 +0200
Message-ID: <20160916135808.GA17518@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:40564 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1756478AbcIPN6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2016 09:58:10 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I just came across an interesting issue on our Allwinner SoCs.

We have, like most of the SoCs these days, a bunch of boards that go
through pinctrl to ensure their exclusive usage for a particular
device. If a second pinctrl user comes in and tries to request one of
those pins, it gets an error. Everything works fine.

However, things are getting weird when you have that requested pin
assigned to one device, and you try to export the GPIO on that pin
(through sysfs for example, but given the implementation, I think that
it would work alike by calling gpiod_request).

In this case, you get no error, and the GPIO is indeed exported,
allowing the user to change the direction and / or value of the pin,
taking away that pin from its device.

It seems from a look at the code that the request and
gpio_request_enable callbacks in the pinmux_ops, called in
pin_request, were meant to prevent such a thing.

But looking at all the drivers around, no one seems to take that case
into consideration, and this has been confirmed on an AT91 (which uses
an entirely different driver).

I have the feeling that the core should prevent that, making sure that
the gpiod_request returns EBUSY in such a case, but I'm not really
sure whether it's the case or not, and if it is, where that check is
happening.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX2/pwAAoJEBx+YmzsjxAgWVgP/jOsjEZ1JpPash3l/0uWSADu
9G9YgB7ipQRUwt5Bugbt2NNljYiVm8AlDGSI0JeqRCxKkMS5A8+sXszdinw/XjFg
aDIXpMx6VEGctRWRZQAS6mz+H5q6Cbb7u9qPVrWhFu9LBqeESVFlZ1hupg354Tov
nZBtYO7knsi+LJk8Zuczg/sCxbgHWD61qarYTGBQ0hYLs7HuXbKkJpbMaPlJS6pf
N473DCmIZZEGsMxLrvqNz0nEU8s3sHsHEy7Jmr2QE/yAr15IbrRyzL6R4q7Ey1Tz
1VAqxqsP5CU1euTl2n4+F3POhWEbuCxdXB6WAqjjdQ+ppjDW+uk6MoeJqlV8UYjy
4sqNnNFpUD/B5IHHdHWOFnLewcozMUvNNrnlcLhNf8BrlycmhHfu8ZYzXWwtC1An
uW/E63u+aZ9pMUmmIB3SD5BGACE57Y2O0oRhg0UOb8At3VJRIE6HckFws2aao2Qw
MbPD2QRgNhw6e3cIOCPLJYtlVE8D7hHrwGYE5FwoLoQd9nKoJjtduVn9LeAnA2Bm
sbwYpC8CwYfLhnKhfRsJHzGTimfnt5gAmhlP96NwvgK/2buYgVbPLS3PbR2Lyxv8
7nSbbRDHxCNCzvjBv0Jo3UAAeVT7npOvPHiHKWW9AAIhPHUbvHLisDHU18OT0898
KWC4SRuV9AVL71qQXxXo
=GFyH
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
