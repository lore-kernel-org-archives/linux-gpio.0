From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: make bool drivers explicitly non-modular
Date: Wed, 2 Nov 2016 14:41:35 +0100
Message-ID: <20161102134135.yznnlq2givbizziw@lukather>
References: <20161030000030.9394-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eewes25i6go2okyw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:39283 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752586AbcKBNli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2016 09:41:38 -0400
Content-Disposition: inline
In-Reply-To: <20161030000030.9394-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maxime Coquelin <maxime.coquelin@st.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--eewes25i6go2okyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2016 at 08:00:30PM -0400, Paul Gortmaker wrote:
> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
>=20
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get essentially the same change, so they are handled in batch.
>=20
> Changes are (1) use builtin_platform_driver, (2) use init.h header
> (3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
> and (5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.
>=20
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>=20
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>=20
> We do delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>=20
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Fabian Frederick <fabf@skynet.be>
> Cc: Maxime Coquelin <maxime.coquelin@st.com>
> Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Cc: Mylene Josserand <mylene.josserand@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eewes25i6go2okyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGe0PAAoJEBx+YmzsjxAgy3QQAJ3Mij93Y8twIb4kocbEnULO
UI5aiQBm1Jhx7ttjRz8gseRic6ZOHop71cEMmdkkChcZE3cyaDwI2HZeztUzGwfH
wJ3xwtYx+y/sb0d2wpvINfvCKqgLGiRMD6SSs1an2Jexl1dkPz7ff4iHPUlWjQ4d
bAI5r6qmuC0uMFXcMyPr1Mc/H0sPSP3TqOXqin6FJI0PbVH3bUxVKk+4c/18JV5e
qzmNzPeo9GKHa0DhEE8vDv9AWh6Fx+75k0rJtKKPJqIhQy6Z35lN1r1Zi2wykCnn
ifW+uIOSHm1JlbdaaoCfu/GXLBOqxFcWH+ytu5PIbcNi8bA3HF9hNoc1kRoNxwD6
iYOQtNxgpLoHmPg4fQ07gn4uYd/9LXL6aOAb6fjyDWcwyijInQRyQShzG5wZA5tm
s3Xzn3ULWTuVYflsvgjdJogsla13i+fb6IUneepnNnghSaxsGgW8IQM7Ub9dZIrO
8vMER6yZQuhRhj5A09F6YgMDWuO+Xeav5v9zBu5E03Uivoz9cVd0c5TQEnOPdsqI
u+JilYQERdm2goExsnc9+XQ0j+1mrbLu1WwJfVMT8jXQA1ttuLPicmJCK8bQpbww
Gq4ta8SNbr90Bd+QnpGnPCEGtMlYd+CKiFejbbdCIWrjRO0DeVOhkeuJVgyJADkO
MbJu/8mRKFe+bk9dJVZB
=5Tin
-----END PGP SIGNATURE-----

--eewes25i6go2okyw--
