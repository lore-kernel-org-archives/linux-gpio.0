From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH] pinctrl: mcp23s08: improve I2C Kconfig dependency
Date: Tue, 30 May 2017 12:27:08 +0200
Message-ID: <20170530102708.ssfstr7epbgq5jmp@earth>
References: <20170530091314.891224-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tmxtiehmeu54xd5f"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48946 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbdE3K1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 06:27:12 -0400
Content-Disposition: inline
In-Reply-To: <20170530091314.891224-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--tmxtiehmeu54xd5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 30, 2017 at 11:11:28AM +0200, Arnd Bergmann wrote:
> With "SPI_MASTER=3Dy && I2C=3Dm", we can build mcp23s08 as a built-in dri=
ver,
> which then results in a link failure:
>=20
> drivers/pinctrl/built-in.o: In function `mcp23s08_probe_one.isra.0':
> :(.text+0x7910): undefined reference to `__devm_regmap_init_i2c'
> drivers/pinctrl/built-in.o: In function `mcp23s08_init':
> :(.init.text+0x110): undefined reference to `i2c_register_driver'
> drivers/pinctrl/built-in.o: In function `mcp23s08_exit':
> :(.exit.text+0x3c): undefined reference to `i2c_del_driver'
>=20
> To avoid the problem, this adds another dependency on I2C that enforces
> mcp23s08 to be a loadable module whenever the I2C core is a module.
>=20
> Fixes: 64ac43e6fa28 ("gpio: mcp23s08: move to pinctrl")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  drivers/pinctrl/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index becda8f47e9e..ab4630ea305c 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -149,6 +149,7 @@ config PINCTRL_FALCON
>  config PINCTRL_MCP23S08
>  	tristate "Microchip MCP23xxx I/O expander"
>  	depends on SPI_MASTER || I2C
> +	depends on I2C || I2C=3Dn
>  	select GPIOLIB_IRQCHIP
>  	select REGMAP_I2C if I2C
>  	select REGMAP_SPI if SPI_MASTER
> --=20
> 2.9.0
>=20

--tmxtiehmeu54xd5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlktSPUACgkQ2O7X88g7
+pqkmA//dP1Iki7BsNK2oxDc6OmZopzXSnUmAxZUuU8PSELH12j9QwsYE/dAvoJZ
Y4pdvcF4UXnt1NHW4Jy2pouGHDrYTHrefrQkoZ7pGkqmyualWvu2yVZ3hfa3voSt
Mykop6JSm/7lxP1YIwTHD8Kxqwvqt430pSpBXcTnQp45a/NqyxT8rLdxCWV3cZhH
VXeECGLR4f2IU1m4Au6CLkFoWujaupbcSQ2zGO/vkz3Fje3I5dr9bzALVaLWU3dK
7jzBXA0VTX38jSdHYkEiAe1IWE8f5QSxpZ9jD2AftVuI8QaaxghIBbo35nSU3DP/
99vsKYhaR5ELohgkNU0ztI5l8ZZ9z258nx6DpQ4EqUdTE5L4IHiwbdWNHio13Aae
jgcvP3nj7Gj9jgNlj3Jg1b1SiVK1tgmc2lGzE5KRb+OpUWXxZclAE+CVLkE98R7m
UgR0rES6+aakCkElWt5Tj9qM1YQyHxnhiEwlyWUtUXYjV4XjN52NGnyb5x8CSN9s
gmLjZhoPl1uVvZdXEqYDi9IZ9wAKKkRAeBvC/9arlr9JqRpb9l07WMK/rkL3x2Zo
XwxmNoDXXA9xiEzCSBq/WZBMRHqDtVuJj7nNUsqpdglM8H4DLuDlJxL2lFnTDq5P
PWd9A9zfBZZXJZz910uT/KQRWAcMhYS0C1KNV/FQC0L+NAFNogw=
=jBR6
-----END PGP SIGNATURE-----

--tmxtiehmeu54xd5f--
