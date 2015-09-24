From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Thu, 24 Sep 2015 09:40:51 +0200
Message-ID: <20150924074051.GY32203@pengutronix.de>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8pjODCYYz+3zRe3"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:48707 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754729AbbIXHky (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 03:40:54 -0400
Content-Disposition: inline
In-Reply-To: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>


--Z8pjODCYYz+3zRe3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 23, 2015 at 04:27:33PM -0700, Linus Walleij wrote:
> This refactors the changes to the GPIO line naming mechanism to
> not have so widespread effects, instead we conclude the patch series
> by having created a name attribute in the GPIO descriptor, that need
> not be globally unique, and it will be initialized from the old
> .names array in struct gpio_chip if it exists, then used in the legacy
> sysfs code like the array was used previously.
>=20
> The associated changes to name lines from the device tree are
> controversial and need to stand alone from this. Resulting changes:
>=20
> 1. Remove the export and the header for the gpio_name_to_desc() as so
> far the only use is inside gpiolib.c. Staticize gpio_name_to_desc()
> and move it above the only function using it.

It is used in gpiolib-of.c as well. So I think it should be in
drivers/gpio/gpiolib.h.

>=20
> 2. Only print a warning if there are two GPIO lines with the same name.
> The reason is to preserve current behaviour: before the previous
> changes to the naming mechanism this would not reject probing the
> driver, instead the error would occur when trying to export the line
> in sysfs, so restore this behaviour, but print a friendly warning
> if names collide.

In gpiolib-of.c is the codepath that adds descriptor names from DT. That
uses a warning currently but does not assign the name.

Best Regards,

Markus

>=20
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Markus Pargmann <mpa@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c        | 72 +++++++++++++++++++++----------------=
------
>  include/linux/gpio/consumer.h |  1 -
>  2 files changed, 35 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 764845c3a4b2..efe8a1072ed0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -90,38 +90,6 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
>  EXPORT_SYMBOL_GPL(gpio_to_desc);
> =20
>  /**
> - * Convert a GPIO name to its descriptor
> - */
> -struct gpio_desc *gpio_name_to_desc(const char * const name)
> -{
> -	struct gpio_chip *chip;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&gpio_lock, flags);
> -
> -	list_for_each_entry(chip, &gpio_chips, list) {
> -		int i;
> -
> -		for (i =3D 0; i !=3D chip->ngpio; ++i) {
> -			struct gpio_desc *gpio =3D &chip->desc[i];
> -
> -			if (!gpio->name)
> -				continue;
> -
> -			if (!strcmp(gpio->name, name)) {
> -				spin_unlock_irqrestore(&gpio_lock, flags);
> -				return gpio;
> -			}
> -		}
> -	}
> -
> -	spin_unlock_irqrestore(&gpio_lock, flags);
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(gpio_name_to_desc);
> -
> -/**
>   * Get the GPIO descriptor corresponding to the given hw number for this=
 chip.
>   */
>  struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
> @@ -250,6 +218,37 @@ static int gpiochip_add_to_list(struct gpio_chip *ch=
ip)
>  	return err;
>  }
> =20
> +/**
> + * Convert a GPIO name to its descriptor
> + */
> +static struct gpio_desc *gpio_name_to_desc(const char * const name)
> +{
> +	struct gpio_chip *chip;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gpio_lock, flags);
> +
> +	list_for_each_entry(chip, &gpio_chips, list) {
> +		int i;
> +
> +		for (i =3D 0; i !=3D chip->ngpio; ++i) {
> +			struct gpio_desc *gpio =3D &chip->desc[i];
> +
> +			if (!gpio->name)
> +				continue;
> +
> +			if (!strcmp(gpio->name, name)) {
> +				spin_unlock_irqrestore(&gpio_lock, flags);
> +				return gpio;
> +			}
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&gpio_lock, flags);
> +
> +	return NULL;
> +}
> +
>  /*
>   * Takes the names from gc->names and checks if they are all unique. If =
they
>   * are, they are assigned to their gpio descriptors.
> @@ -268,11 +267,10 @@ static int gpiochip_set_desc_names(struct gpio_chip=
 *gc)
>  		struct gpio_desc *gpio;
> =20
>  		gpio =3D gpio_name_to_desc(gc->names[i]);
> -		if (gpio) {
> -			dev_err(gc->dev, "Detected name collision for GPIO name '%s'\n",
> -				gc->names[i]);
> -			return -EEXIST;
> -		}
> +		if (gpio)
> +			dev_warn(gc->dev, "Detected name collision for "
> +				 "GPIO name '%s'\n",
> +				 gc->names[i]);
>  	}
> =20
>  	/* Then add all names to the GPIO descriptors */
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 366a3fdbdbea..a879e3e62379 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -130,7 +130,6 @@ int gpiod_to_irq(const struct gpio_desc *desc);
>  /* Convert between the old gpio_ and new gpiod_ interfaces */
>  struct gpio_desc *gpio_to_desc(unsigned gpio);
>  int desc_to_gpio(const struct gpio_desc *desc);
> -struct gpio_desc *gpio_name_to_desc(const char *name);
> =20
>  /* Child properties interface */
>  struct fwnode_handle;
> --=20
> 2.4.3
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Z8pjODCYYz+3zRe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA6kDAAoJEEpcgKtcEGQQvCgQAI/iF7D4ojZ1jHrHpsFRNWeA
5QuJl9NR44pc9js9V+qOp8nP0A2iv2PLO979xywBy004CtXVAOv1l9mkSAsnxYpJ
wAAkVBiUU3Y94h+RxxFxqWg4K+7/eaMy8RzdQccfYjNC+1rNYHUic4Sh0pa/ctc+
MdU+RdZdXhIHizHZXElvvlh8pqphCGA0ICydOHPlKYvaAw4zX2SS86+WK2YZ5VtD
euR2dbGPYYWTrqn2VrGiDTmepoL38kUcUznW2fHlxAnBG8nYH72pE9fnem1AI8OX
uoUIp+8WCCMMEuMCOFO7u206FSeGSHaw5/iRWaFAdW+uXk+Umbzp/hnA6MoBI7tI
xBZ7U34ShYu3dVMwU8pU/ji1qEwzqenjvnlo6u7pLl9ixmGeWWRYpyfsKCL7fqmE
0ZdYqDI2ZwzetKDx53D7v5hh3fXrzKblDDoExHwsAZDPWDwltvvw0slWivkx3HRi
a6AFwE+eRzt9orzGpV8Ay+PQNxJv7QXXcYrpcNW9ClPYqn8hmrhCI62xSrlgSROj
X+7W8eiCTWSezxntTHid9Zu6D5AbKAQ8T7qc497g5Aw6pmgCsneITX8dTp5039i9
LnuesYqTntWRTA4gdotHroBs2Qhu+FHM1CFGovhSRvhDxff8S0tv5vdRBgdXq/c5
sWResDIizaF21DvhyQJR
=KoCx
-----END PGP SIGNATURE-----

--Z8pjODCYYz+3zRe3--
