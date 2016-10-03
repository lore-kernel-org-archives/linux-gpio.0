From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] gpio/board.txt: point to gpiod_set_value
Date: Mon, 3 Oct 2016 10:43:46 +0200
Message-ID: <20161003084346.GA2749@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, corbet@lwn.net, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


gpiod_set_value() is preffered interface these days, so add a
pointer. Also fix a missing ).

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index 86d3fa9..589e789 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -6,7 +6,7 @@ Note that it only applies to the new descriptor-based inter=
face. For a
 description of the deprecated integer-based GPIO interface please refer to
 gpio-legacy.txt (actually, there is no real mapping possible with the old
 interface; you just fetch an integer from somewhere and request the
-corresponding GPIO.
+corresponding GPIO).
=20
 Platforms that make use of GPIOs must select ARCH_REQUIRE_GPIOLIB (if GPIO=
 usage
 is mandatory) or ARCH_WANT_OPTIONAL_GPIOLIB (if GPIO support can be omitte=
d) in
@@ -165,3 +165,6 @@ signals to 1, i.e. enabling the LEDs. And for the "powe=
r" GPIO, which is mapped
 as active-low, its actual signal will be 0 after this code. Contrary to th=
e legacy
 integer GPIO interface, the active-low property is handled during mapping =
and is
 thus transparent to GPIO consumers.
+
+Set of functions such as gpiod_set_value() is available to work with
+this interface.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyGkIACgkQMOfwapXb+vK5swCgg0Ne+qmNnilGgF08Su5oXYOZ
5FAAni0Fab6jt2ACD5xeaAjyXBb/IlF7
=ozYh
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
