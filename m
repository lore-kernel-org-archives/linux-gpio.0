From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: guard sub-directory with
 CONFIG_PINCTRL_SUNXI
Date: Mon, 25 Jan 2016 10:27:03 +0100
Message-ID: <20160125092703.GK7908@lukather>
References: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/rDaUNvWv5XYRSKj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--/rDaUNvWv5XYRSKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 12:32:09AM +0900, Masahiro Yamada wrote:
> CONFIG_PINCTRL_SUNXI is more suitable than CONFIG_ARCH_SUNXI
> to guard the drivers/pinctrl/sunxi/ directory.
> (I renamed CONFIG_PINCTRL_SUNXI_COMMON to CONFIG_PINCTRL_SUNXI.)
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/rDaUNvWv5XYRSKj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWpepnAAoJEBx+YmzsjxAgrecP+wXGKKRbMgASpCly9vpF8g6M
Gpwkzbanv+/UcTmSz7pkYM4zkFwh3mgDT7tM+XQ2vuTiAFL5rSJ4+C8tZNrCo0aB
6owiS2DNx/UqmkqCMJxEhu6hfDdaNZNAImqxAX7k6xJvwoC2sNCDMDunpMEp/KLs
TiIlnwEh6s2Dq7hwp/LhL0rVLtvFUGV9x2FkAJA6hrlCj3q4O5FdlzaeAPttPFqG
MDaFML58z+W3dPdtBrs4yoPKdghPxOnLgj+mMPhi9Ohhs54Bwei+aV6bPjjbaibL
N1/Nk0nNF3xp/AeKRdPy2KepARlechlpSvPZL/L9DBC6OB1XJsDMx9wWN7eTp6Yw
s5VTdSCClveQB+p+wso0uK85vUAqoIpipvGCPxOQoGXehQuU2X2U2ER/jpk3Uwpo
iTj3AWvqx+DVWcw7Qx4D2FvhZ3K52wsrCpw5Q7PosYCJT0Ey35poQDFXlJvI1Wk4
omUOctNMTrp64/Ba5e84cnWXvjrpVVZtsvjm6jSpqu3Qazq1f9jgeZsHuYDQI1m1
6iYdo9UpOSyvJJ/SisVPxTWSwsAvc7Dft0nYuDSyzhFJNlZN+L6qWo521+Rc8uzC
9tpyFbI12pbl2gJv7M6ivO/nCMsH+Aq2fDrp9BJn2uhN7ldpQuNnXoQLaTY25M/O
P2kKUiVOvTWrPFgt5Sme
=fhpR
-----END PGP SIGNATURE-----

--/rDaUNvWv5XYRSKj--
