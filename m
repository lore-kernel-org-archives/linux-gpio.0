From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] gpio: mcp23s08: Select REGMAP/REGMAP_I2C to fix build
 error
Date: Thu, 2 Feb 2017 14:56:35 +0100
Message-ID: <20170202135634.p7lebviiadcfagvy@earth>
References: <20170202101306.24976-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d3avsknhrbelroam"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750851AbdBBN4m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Feb 2017 08:56:42 -0500
Content-Disposition: inline
In-Reply-To: <20170202101306.24976-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org


--d3avsknhrbelroam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 02, 2017 at 06:13:06PM +0800, Axel Lin wrote:
> This driver now using devm_regmap_init/devm_regmap_init_i2c, so it needs
> to select REGMAP/REGMAP_I2C accordingly.
>=20
> Fixes: ("3d84fdb3f0b5 gpio: mcp23s08: use regmap")
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 2d77392..28e6219 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1213,6 +1213,8 @@ config GPIO_MCP23S08
>  	tristate "Microchip MCP23xxx I/O expander"
>  	depends on OF_GPIO
>  	select GPIOLIB_IRQCHIP
> +	select REGMAP_I2C if I2C
> +	select REGMAP if SPI_MASTER
>  	help
>  	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
>  	  I/O expanders.

Acked-By: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--d3avsknhrbelroam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAliTOo8ACgkQ2O7X88g7
+pqOVg/5AQcMca4698UAWl0kH+EvRZZ/tMN1P0y1GDILid4RDiIcuJdQRY5cD9RJ
M/QQ9J/OL6FntIQcehutuhCIRfFpZm6tFPWoar5mHXaq4seLMC8bpSOuyQ/pWZNL
Be+0ayNo1vhX5xyk9sM+2zOR7O60jVeX+xOjZTGJh7B0CEqXGGvoRUoGpitknyjH
BHLgg2m1t8SEzDq/tHg3ZLAhV0W2pce1f6mS1oVtObXl6pYu9zSqj75RS0n59B+/
2ysHw4V1vXRh0av96gWtbDa9134EwyOR8elYZHegqJurRQBmHMLNB6Omn+p1WZRt
HOgsRkPbKsY9OQGG87wAJHI54b1u9LOtcieHdnWO9Q8leJrCQuA1SdpC9OlGdjqm
NaktGZoNLLMXXy9Hn2bKvOC8UeAs91YYKQwvKmVJ8N4K4PKsWattsXMut9Nq5Uxq
vlQWVWqz9fV4siuGKt1MhsQiooxyCi6BzlluQw1JjW+nWN6M2Pmk3w/EyQg7H/dl
zMEdOkp2Ez5hqyUaJtvzFTufV/FUHqH82+s7OK50dGK2OHvSl1kRYGSEeCjGHTbf
581bUMofyNChy0F5RjDOCHW9eQTNPXUmDJD/vJap9PArXsxwKCRkJqiEppak5MPE
+eRR7QBOGkEJknBMTMMOgMAvxbjHC9Vgwy7ZaU08UYOssv1lklw=
=2nfT
-----END PGP SIGNATURE-----

--d3avsknhrbelroam--
