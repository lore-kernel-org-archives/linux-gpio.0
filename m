From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 7/8] drivers/pinctrl: make sunxi/pinctrl-sun9i-a80-r.c
 explicitly non-modular
Date: Mon, 29 Feb 2016 23:14:49 -0800
Message-ID: <20160301071449.GL8418@lukather>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
 <1456778924-20730-8-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eWbcAUUbgrfSEG1c"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57338 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750820AbcCAHOx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 02:14:53 -0500
Content-Disposition: inline
In-Reply-To: <1456778924-20730-8-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--eWbcAUUbgrfSEG1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 03:48:43PM -0500, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
>=20
> drivers/pinctrl/sunxi/Kconfig:config PINCTRL_SUN9I_A80_R
> drivers/pinctrl/sunxi/Kconfig:  def_bool MACH_SUN9I
>=20
> ...meaning that it currently is not being built as a module by anyone.
>=20
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>=20
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>=20
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>=20
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--eWbcAUUbgrfSEG1c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1UFpAAoJEBx+YmzsjxAg09sP/A6wJi3fvR5tnztkZWAPG1yc
gBL8pmY7yabEZKXFbSO/TN8DJ8uEkQ50yNQB6jWl9POFRLaoRcG0aeu/US+K7TnB
unhWI5DwlZvp14wCZpTHB9ft+pO/v8AlXq7oTdvmbt8/oeYrAU6sucy0VaOGoiMj
CNIfCxSIu9aAi/Fxs1AqGATs9/Z4zdydzKvvr9g4kEaNVMmrJ5nkeeHLtiYuufKw
VD4SmAtYJm+TUSp8LLRedx/78Zc+XBMVpdxs7aGWWQkLnL7owgQneHBNYf4NsZi4
1td0tAZOkIohFYp9S2LThZTDwO75oBk+6M+R1aV5DyjAVqEqMeEeNrxsqtsIld6i
fvT6/HbMzM/dQESUcYg0978zrqMs3rOJ99mwpSArDOFzjnR1DGfOh64Ga+HwIUb8
r4HIgd03TEO3ToqllH1zjgKN/yrX9OF2m/20zbVTYPLB88Lr2FPGkFh6RoXL4bdg
esgpMra/mAOnebFv0AcUIv9uiQxPcFX0t80LKuWxzyBlHX4h30zjpla/BP2AGUll
zqX5Styu7ASgvfC3QSQ0Bb8LHf884x+4w8X8oqs8mmj9fU6igNQ6aauG5QtAIxU0
P/BX9CKJwDn4LwXnFrl4OKHV6lAR5qZXQxtHU1nXXOoGvBQt2gHYHac3BYAuiKGD
M535fSc3z20zgbHMwy1g
=yrjj
-----END PGP SIGNATURE-----

--eWbcAUUbgrfSEG1c--
