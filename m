From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] gpio: pcf857x: only use set_irq_flags() on ARM
Date: Wed, 18 Sep 2013 08:48:52 -0500
Message-ID: <20130918134852.GB21559@radagast>
References: <1379503051-27310-1-git-send-email-linus.walleij@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:50855 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218Ab3IRNtz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Sep 2013 09:49:55 -0400
Content-Disposition: inline
In-Reply-To: <1379503051-27310-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, George Cherian <george.cherian@ti.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Felipe Balbi <balbi@ti.com>

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 01:17:31PM +0200, Linus Walleij wrote:
> As per the pattern from other GPIO drivers, use set_irq_flags()
> on ARM only, use irq_set_noprobe() on other archs.
>=20
> Also rename the argument "virq" to just "irq", this IRQ isn't
> any more "virtual" than any other Linux IRQ number, we use
> "hwirq" for the actual hw-numbers, "virq" is just bogus.
>=20
> Cc: George Cherian <george.cherian@ti.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Felipe Balbi <balbi@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

FWIW:

Reviewed-by: Felipe Balbi <balbi@ti.com>

--=20
balbi

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSOa9EAAoJEIaOsuA1yqREhXQQAIRlHCI/dlVWFxFj+7J81NlI
+Z2cS7StsNKbUWVKjwwxzrC8/MFZAhnb0WufC7IA9tJZjzfvAIoquharGY0BXi67
wuUNfj3a7sosIEuSOco5VAK24yo4ZcD+IXwVnatBfe5SPh7YafMMDsX0F5K2OFD8
fe9zgI0uCEnuOvchcCU0MOfxkijsbY89POE3R0WJpAzYXlaMRHcC48ldg4tUcUvc
XfFaPi/QW0z0O21DBo/Ztt3PBzzh1QFli/FgjztDDIYWta22/Wn6956JH/spSD1T
iRQ8TliFYM0jXaQU0QqpP4Atp5TG9lMrCGGgC1l31dqkbY4UALsdMnLTV3eFRJVg
EPP2/fSAm5pjK6g07L0GhjBriYhSyoLsYNx3/QcNOENAhwiktiCX3avxeXA/GhHm
JzfnhqdCLbuOzUGlqakz2lbtuqMxl6H/iNF1TiFA2ZzYYgVquSHU+yZ9WILHRnaQ
C5Kjs1zMTyfbWCp4xCbZ5N+YRQK8zOAmiY+I8/UalkamETcy07evX8jnEuIe5j7M
WC5C7kY/d4ASSOYyTSUjP4PoPtO+WjsnUzCR5jBXH9yheXxWht6Lgds+f14m0uUe
w8JYXp/Cg0FR7IhiRjH7bbSfzWEc/Ekoo5CY65R925J6pXju7Niu0sk5l7i3eSef
RZpBOo1NN6mBh6z/aKjT
=TjOB
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
