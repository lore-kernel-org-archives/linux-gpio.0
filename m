From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] regulator/overview.txt: Use ".." for ranges, instead of "->"
Date: Mon, 3 Oct 2016 10:45:31 +0200
Message-ID: <20161003084531.GA2811@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, corbet@lwn.net, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Using "->" to indicate range is not too common, switch to ".."

Signed-off-by: Pavel Machek <pavel@ucw.cz>

--- a/Documentation/power/regulator/overview.txt
+++ b/Documentation/power/regulator/overview.txt
@@ -90,7 +90,7 @@ Some terms used in this document:-
                    operating parameters and is specified in the regulator
                    datasheet. i.e.
=20
-                     - voltage output is in the range 800mV -> 3500mV.
+                     - voltage output is in the range 800mV .. 3500mV.
                      - regulator current output limit is 20mA @ 5V but is
                        10mA @ 10V.
=20
@@ -99,8 +99,8 @@ Some terms used in this document:-
                    power domain to a particular power range. i.e.
=20
                      - Domain-1 voltage is 3300mV
-                     - Domain-2 voltage is 1400mV -> 1600mV
-                     - Domain-3 current limit is 0mA -> 20mA.
+                     - Domain-2 voltage is 1400mV .. 1600mV
+                     - Domain-3 current limit is 0mA .. 20mA.
=20
                    Consumer Level: This is defined by consumer drivers
                    dynamically setting voltage or current limit levels.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyGqsACgkQMOfwapXb+vLMHQCgj0fu9N5MmE9SI9FsmzOkI/mq
OZcAoLsNA3DkAjAYm6R953aVWRXknp2o
=Vlq3
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
