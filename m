From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 11:47:04 +0200
Message-ID: <20151005094704.GG19355@pengutronix.de>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:41941 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167AbbJEJrH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 05:47:07 -0400
Content-Disposition: inline
In-Reply-To: <20151004133742.GO4284@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>


--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2015 at 03:37:42PM +0200, Johan Hovold wrote:
> On Wed, Sep 23, 2015 at 04:27:33PM -0700, Linus Walleij wrote:
> > This refactors the changes to the GPIO line naming mechanism to
> > not have so widespread effects, instead we conclude the patch series
> > by having created a name attribute in the GPIO descriptor, that need
> > not be globally unique, and it will be initialized from the old
> > .names array in struct gpio_chip if it exists, then used in the legacy
> > sysfs code like the array was used previously.
> >=20
> > The associated changes to name lines from the device tree are
> > controversial and need to stand alone from this. Resulting changes:
> >=20
> > 1. Remove the export and the header for the gpio_name_to_desc() as so
> > far the only use is inside gpiolib.c. Staticize gpio_name_to_desc()
> > and move it above the only function using it.
> >=20
> > 2. Only print a warning if there are two GPIO lines with the same name.
> > The reason is to preserve current behaviour: before the previous
> > changes to the naming mechanism this would not reject probing the
> > driver, instead the error would occur when trying to export the line
> > in sysfs, so restore this behaviour, but print a friendly warning
> > if names collide.
>=20
> This looks good (apart from the checkpatch warning for the warning
> message string).
>=20
> You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
> name instead of gpiochip names array") however as this is an ABI change. =
=20
> Otherwise pins with a name in DT will now be exported using the gpio name
> rather than number as they used to be. [ The current behaviour is
> maintained by exporting names from chip->names for hard coded names
> only. ]

Even for GPIOs from DT it is not a ABI change. The only GPIOs that have
a GPIO name at the moment are using the GPIO hogging mechanism. But
hogged GPIOs can't be exported to userspace so there is no difference
for these.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEkcYAAoJEEpcgKtcEGQQYDYP/3JYOt+cepVYdvzTE67TVP3M
40K9kUwWpkReyDQNYpydCKcuYrhZcUQBbzWpSvAIHyNyro33Ugk6ohHzDsmxEgTe
FE36vgXH/SH3M2suYsCLSyAnUYwBDAfkUugsn7Z0y8ZBs/BuU4oiw4gczUjCb7mM
Q+5/9JEjrgXmCl/xkd5Ipc3MnvUKCPaU2UX9Uwp9KK4Ybx9TDF7Sq1GHGXz3ntBb
G5IL+pp7sZqyDNy05RTL5LH01oaWm3W0S8ABxQiSs8AlkzVg56iit1M5YVAL4RvE
hBqxw903HuTvIaX2mh80t+qs1SF/GTa10LpcjMmKYtm92l7xJspC959DgWqwxEgU
paUn/eqrCFQaf70hQBUEYD7nYmAtf3Sf7MoA1w8U48V8tfmoOBueap+ECZuw/Zna
BbHgi6Tkp9giCPHS2uHHenklC+8am6AiDsJOv1AMsScYGkaXMhUKELU/Ok1NE+qy
NBMCbLufhLdPKbn8cFiqwNUWCAd9HMGtD6mDvnQOxDcq3dnXs6DbhEfviapPoAUc
FLC1cGJCzFVMX7CULy8+7+VPBAdyLdUyF3X4bxKrZRVx4PugsdnsB0pg1wy6bUK8
q+IbV3erLKqOouFrj0PvZYYLWKTuA6wdRedE3LVQhvw1PfxC0O6QeIa6kYOR3q2c
hO7Fs9jrMn3pS4kmNy5d
=ABwe
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--
