From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 6/8] drivers/pinctrl: make sunxi/pinctrl-sun[4-9]*
 explicitly non-modular
Date: Mon, 29 Feb 2016 23:14:28 -0800
Message-ID: <20160301071428.GK8418@lukather>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
 <1456778924-20730-7-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x1F0m3RQhDZyj8sd"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57316 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751113AbcCAHOd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 02:14:33 -0500
Content-Disposition: inline
In-Reply-To: <1456778924-20730-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 03:48:42PM -0500, Paul Gortmaker wrote:
> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
>=20
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get the exact same change, so they are handled in batch.
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
> We also delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>=20
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>
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

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1UFUAAoJEBx+YmzsjxAgOlcQALLyp8KzULCwUs6e6XJnL5zO
kOJINP3l6i1O4RslT5UtduLZojwKlrsLvUXgl/+CfVBhnvqZEDmWqCoiv5K3NWEw
IKjqom9qqg9Wl54JK9kTQOOq5/mfFYFhDLn5vs8JN6j+tP0vhXGhIn7LAEWfmPv4
ZW5b0ukI2O9EjGOQPGSgZgbER6ApVLOClSp0mj3HbNE6FA5nsFeVBJIqjrTvROEN
MWMEpGPXwtv0tc49y8q2m8y4udCHeSsiUxnlstc6CCE41sWCYKqXL0QSl47AMAq1
HQb0xq4LG1BrSW8r4EHRY/EP5umqgtvPAsMMPF2mZAtoYNJZBXstxe3arHfBm+nw
xY/MH3j9T6+tLg/DmCQe7S+d+fZL4C3OAKYwYCMwlibW6Ks+2Ylr7XeSF2CPNsih
EpBYQXWdk+z/7uhMAkzpbx1yaAXhAJKGkm6JJls9U3HDwK3hfdQ2OxDHV7+HZwrp
IE6RIgxiyGC+XM+9vzOERne1tigPFkko48NiXE60Z24+lEUvxrCgH2utwoVF2SeI
3wqaUyCBK7pfbgVe4YzpP976RljjFDs5ziiK0AQGtll88CaLbZpkrujAI/V06fSc
MkkL7C0UZ3tnnOtUCh4tyP9TUDt2vL+mkPnjtrsenQxpylUhSx0SfMCrp4i2QYI4
aM8AVr+9SjeHHm2Wx5pB
=SKNt
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--
