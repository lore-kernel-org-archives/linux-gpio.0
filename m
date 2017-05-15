From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCHv3 02/14] pinctrl: mcp23s08: add pinconf support
Date: Mon, 15 May 2017 14:34:46 +0200
Message-ID: <20170515123445.k6cxhd6cnpv3bwpq@earth>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
 <20170515092438.13076-3-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iozvwpk5wn7ouzq5"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758595AbdEOMeu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 08:34:50 -0400
Content-Disposition: inline
In-Reply-To: <20170515092438.13076-3-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org


--iozvwpk5wn7ouzq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 15, 2017 at 11:24:26AM +0200, Sebastian Reichel wrote:
> mcp23xxx device have configurable 100k pullup resistors. This adds
> support for enabling them using pinctrl's pinconf interface.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

I just noticed, that I forgot to add:

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

-- Sebastian

> ---
>  drivers/pinctrl/Kconfig            |   1 +
>  drivers/pinctrl/pinctrl-mcp23s08.c | 199 +++++++++++++++++++++++++++++++=
+-----
>  2 files changed, 176 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index b5aa50c51633..1dabd1d79c1d 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -153,6 +153,7 @@ config PINCTRL_MCP23S08
>  	select GPIOLIB_IRQCHIP
>  	select REGMAP_I2C if I2C
>  	select REGMAP_SPI if SPI_MASTER
> +	select GENERIC_PINCONF
>  	help
>  	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
>  	  I/O expanders.
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 2a57d024481d..d957c4bbc8c1 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -24,6 +24,9 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_device.h>
>  #include <linux/regmap.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> =20
>  /**
>   * MCP types supported by driver
> @@ -77,6 +80,9 @@ struct mcp23s08 {
> =20
>  	struct regmap		*regmap;
>  	struct device		*dev;
> +
> +	struct pinctrl_dev	*pctldev;
> +	struct pinctrl_desc	pinctrl_desc;
>  };
> =20
>  static const struct regmap_config mcp23x08_regmap =3D {
> @@ -96,6 +102,158 @@ static const struct regmap_config mcp23x17_regmap =
=3D {
>  	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,
>  };
> =20
> +static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int=
 *val)
> +{
> +	return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
> +}
> +
> +static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned in=
t val)
> +{
> +	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
> +}
> +
> +static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
> +		       unsigned int pin, bool enabled)
> +{
> +	u16 val  =3D enabled ? 0xffff : 0x0000;
> +	u16 mask =3D BIT(pin);
> +	return regmap_update_bits(mcp->regmap, reg << mcp->reg_shift,
> +				  mask, val);
> +}
> +
> +static int mcp_update_cache(struct mcp23s08 *mcp)
> +{
> +	int ret, reg, i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mcp->cache); i++) {
> +		ret =3D mcp_read(mcp, i, &reg);
> +		if (ret < 0)
> +			return ret;
> +		mcp->cache[i] =3D reg;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pinctrl_pin_desc mcp23x08_pins[] =3D {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +};
> +
> +static const struct pinctrl_pin_desc mcp23x17_pins[] =3D {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +	PINCTRL_PIN(14, "gpio14"),
> +	PINCTRL_PIN(15, "gpio15"),
> +};
> +
> +static int mcp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	return 0;
> +}
> +
> +static const char *mcp_pinctrl_get_group_name(struct pinctrl_dev *pctlde=
v,
> +						unsigned int group)
> +{
> +	return NULL;
> +}
> +
> +static int mcp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +					unsigned int group,
> +					const unsigned int **pins,
> +					unsigned int *num_pins)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static const struct pinctrl_ops mcp_pinctrl_ops =3D {
> +	.get_groups_count =3D mcp_pinctrl_get_groups_count,
> +	.get_group_name =3D mcp_pinctrl_get_group_name,
> +	.get_group_pins =3D mcp_pinctrl_get_group_pins,
> +#ifdef CONFIG_OF
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map =3D pinconf_generic_dt_free_map,
> +#endif
> +};
> +
> +static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *config)
> +{
> +	struct mcp23s08 *mcp =3D pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	unsigned int data, status;
> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		ret =3D mcp_read(mcp, MCP_GPPU, &data);
> +		if (ret < 0)
> +			return ret;
> +		status =3D (data & BIT(pin)) ? 1 : 0;
> +		break;
> +	default:
> +		dev_err(mcp->dev, "Invalid config param %04x\n", param);
> +		return -ENOTSUPP;
> +	}
> +
> +	*config =3D 0;
> +
> +	return status ? 0 : -EINVAL;
> +}
> +
> +static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *configs, unsigned int num_configs)
> +{
> +	struct mcp23s08 *mcp =3D pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param;
> +	u32 arg, mask;
> +	u16 val;
> +	int ret =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		param =3D pinconf_to_config_param(configs[i]);
> +		arg =3D pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			val =3D arg ? 0xFFFF : 0x0000;
> +			mask =3D BIT(pin);
> +			ret =3D mcp_set_bit(mcp, MCP_GPPU, pin, arg);
> +			break;
> +		default:
> +			dev_err(mcp->dev, "Invalid config param %04x\n", param);
> +			return -ENOTSUPP;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct pinconf_ops mcp_pinconf_ops =3D {
> +	.pin_config_get =3D mcp_pinconf_get,
> +	.pin_config_set =3D mcp_pinconf_set,
> +	.is_generic =3D true,
> +};
> +
>  /*----------------------------------------------------------------------=
*/
> =20
>  #ifdef CONFIG_SPI_MASTER
> @@ -158,30 +316,6 @@ static const struct regmap_bus mcp23sxx_spi_regmap =
=3D {
> =20
>  #endif /* CONFIG_SPI_MASTER */
> =20
> -static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int=
 *val)
> -{
> -	return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
> -}
> -
> -static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned in=
t val)
> -{
> -	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
> -}
> -
> -static int mcp_update_cache(struct mcp23s08 *mcp)
> -{
> -	int ret, reg, i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(mcp->cache); i++) {
> -		ret =3D mcp_read(mcp, i, &reg);
> -		if (ret < 0)
> -			return ret;
> -		mcp->cache[i] =3D reg;
> -	}
> -
> -	return 0;
> -}
> -
>  /*----------------------------------------------------------------------=
*/
> =20
>  /* A given spi_device can represent up to eight mcp23sxx chips
> @@ -682,6 +816,23 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, =
struct device *dev,
>  		if (ret)
>  			goto fail;
>  	}
> +
> +	mcp->pinctrl_desc.name =3D "mcp23xxx-pinctrl";
> +	mcp->pinctrl_desc.pctlops =3D &mcp_pinctrl_ops;
> +	mcp->pinctrl_desc.confops =3D &mcp_pinconf_ops;
> +	mcp->pinctrl_desc.npins =3D mcp->chip.ngpio;
> +	if (mcp->pinctrl_desc.npins =3D=3D 8)
> +		mcp->pinctrl_desc.pins =3D mcp23x08_pins;
> +	else if (mcp->pinctrl_desc.npins =3D=3D 16)
> +		mcp->pinctrl_desc.pins =3D mcp23x17_pins;
> +	mcp->pinctrl_desc.owner =3D THIS_MODULE;
> +
> +	mcp->pctldev =3D devm_pinctrl_register(dev, &mcp->pinctrl_desc, mcp);
> +	if (IS_ERR(mcp->pctldev)) {
> +		ret =3D PTR_ERR(mcp->pctldev);
> +		goto fail;
> +	}
> +
>  fail:
>  	if (ret < 0)
>  		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
> --=20
> 2.11.0
>=20

--iozvwpk5wn7ouzq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkZoGMACgkQ2O7X88g7
+ppu8Q/8CmdKTyvgRQRC3OTKpwtDRZwvVtKzdewy65FBRnTgqwMOYvh11y1jD8Yn
gii+AQiZW/gT+pUNQ38VDvNCUA4TqEetUbQ3CxKe8hmjGDjnvZZAJJAmPe76e0YV
RIsaMmnGTCvULdgljmBc52dvm/6O26x2CDJ5LOno77QY3mxBz9nFjzNjlO8V8uYa
wGJz95tMhwOTuoCrLYmm41hVn9reCPef6IbCK6pvaMMjcQQVJrj9aAriZOh68g5E
pV02p5Btyll69PfJJe9VKrSrHyiqae5/1L2YO2n7S6uKdB64lv+HawB/KvgfzeYu
4FtKEfgBo8jCbMqdivBoNO+V15fNIxvykTtvTo9V4ZduYP263vJ3V/B7yOwf7jyj
b95ZVNKlS7DSMZeA29F2gIOwmwmpIthPzqify0MbGiGyKudlOMObMsRKmwvxLPgf
XHZ+WCzUi/nSrRMXIsngYNs4rjSzRd8x6eIaSN9g31Vxp12KwVQOhn2qREIjM7dS
1QRCUPLN4vRPTp31WNB6dXuGq+Uit88KtP006Oyzk2ydtE7jLmVg9wHbPslltQ6W
E3B7QywAMA37eNMcbMzKi06YU3mEqVT84jczDSztgKXGlsXYOzZYgR9aZGAgpu4p
iPlyIruymnqKFO8VaGG38sVNb46/wLaw4GVQHS5I6cqxP09dalU=
=VqRq
-----END PGP SIGNATURE-----

--iozvwpk5wn7ouzq5--
