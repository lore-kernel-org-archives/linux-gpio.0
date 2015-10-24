From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Sat, 24 Oct 2015 20:09:13 +0200
Message-ID: <20151024180913.GB22220@pengutronix.de>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:56539 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752089AbbJXSJQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2015 14:09:16 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:
> GPIO chips have been around for years, but were never real devices,
> instead they were piggy-backing on a parent device (such as a
> platform_device or amba_device) but this was always optional.
> GPIO chips could also exist without any device at all, with its
> struct device *dev pointer being set to null.
>=20
> When sysfs was in use, a mock device would be created, with the
> optional parent assigned, or just floating orphaned with NULL
> as parent.
>=20
> For a proper userspace ABI we need gpiochips to *always have a
> populated struct device, so add this in the gpio_chip struct.
> The name "dev" is unfortunately already take so we use "device"
> to name it.
>=20
> If sysfs is active, it will use this device as parent, and the
> former parent device "dev" will be set as parent of the new
> "device" struct member.
>=20
> From this point on, gpiochips are devices.
>=20
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Michael Welling <mwelling@ieee.org>
> Cc: Markus Pargmann <mpa@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c |  2 +-
>  drivers/gpio/gpiolib.c       | 44 ++++++++++++++++++++++++++++++++++++++=
+-----
>  include/linux/gpio/driver.h  |  9 +++++++--
>  3 files changed, 47 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index b57ed8e55ab5..7e5bc5736e47 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -605,7 +605,7 @@ int gpiod_export(struct gpio_desc *desc, bool directi=
on_may_change)
>  	if (chip->names && chip->names[offset])
>  		ioname =3D chip->names[offset];
> =20
> -	dev =3D device_create_with_groups(&gpio_class, chip->dev,
> +	dev =3D device_create_with_groups(&gpio_class, &chip->device,
>  					MKDEV(0, 0), data, gpio_groups,
>  					ioname ? ioname : "gpio%u",
>  					desc_to_gpio(desc));
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6798355c61c6..0ab4f75b7f8e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/idr.h>
> =20
>  #include "gpiolib.h"
> =20
> @@ -42,6 +43,9 @@
>  #define	extra_checks	0
>  #endif
> =20
> +/* Device and char device-related information */
> +static DEFINE_IDA(gpio_ida);
> +
>  /* gpio_lock prevents conflicts during gpio_desc[] table updates.
>   * While any GPIO is requested, its gpio_chip is not removable;
>   * each GPIO's "requested" flag serves as a lock and refcount.
> @@ -52,7 +56,6 @@ static DEFINE_MUTEX(gpio_lookup_lock);
>  static LIST_HEAD(gpio_lookup_list);
>  LIST_HEAD(gpio_chips);
> =20
> -
>  static void gpiochip_free_hogs(struct gpio_chip *chip);
>  static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
> =20
> @@ -300,7 +303,7 @@ int gpiochip_add(struct gpio_chip *chip)
>  {
>  	unsigned long	flags;
>  	int		status =3D 0;
> -	unsigned	id;
> +	unsigned	i;
>  	int		base =3D chip->base;
>  	struct gpio_desc *descs;
> =20
> @@ -308,6 +311,28 @@ int gpiochip_add(struct gpio_chip *chip)
>  	if (!descs)
>  		return -ENOMEM;
> =20
> +	/*
> +	 * The "dev" member of gpiochip is the parent, and the actual
> +	 * device is named "device" for historical reasons.
> +	 *
> +	 * We memset the struct to zero to avoid reentrance issues.
> +	 */
> +	memset(&chip->device, 0, sizeof(chip->device));
> +	if (chip->dev) {
> +		chip->device.parent =3D chip->dev;
> +		chip->device.of_node =3D chip->dev->of_node;
> +	} else {
> +#ifdef CONFIG_OF_GPIO
> +	/* If the gpiochip has an assigned OF node this takes precedence */
> +	if (chip->of_node)
> +		chip->device.of_node =3D chip->of_node;

This is in the else case. I think this should be indented an additional
level.

Best Regards,

Markus

> +#endif
> +	}
> +	chip->id =3D ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
> +	dev_set_name(&chip->device, "gpiochip%d", chip->id);
> +	device_initialize(&chip->device);
> +	dev_set_drvdata(&chip->device, chip);
> +
>  	spin_lock_irqsave(&gpio_lock, flags);
> =20
>  	if (base < 0) {
> @@ -326,8 +351,8 @@ int gpiochip_add(struct gpio_chip *chip)
>  		goto err_free_descs;
>  	}
> =20
> -	for (id =3D 0; id < chip->ngpio; id++) {
> -		struct gpio_desc *desc =3D &descs[id];
> +	for (i =3D 0; i < chip->ngpio; i++) {
> +		struct gpio_desc *desc =3D &descs[i];
> =20
>  		desc->chip =3D chip;
> =20
> @@ -361,16 +386,22 @@ int gpiochip_add(struct gpio_chip *chip)
> =20
>  	acpi_gpiochip_add(chip);
> =20
> -	status =3D gpiochip_sysfs_register(chip);
> +	status =3D device_add(&chip->device);
>  	if (status)
>  		goto err_remove_chip;
> =20
> +	status =3D gpiochip_sysfs_register(chip);
> +	if (status)
> +		goto err_remove_device;
> +
>  	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
>  		chip->base, chip->base + chip->ngpio - 1,
>  		chip->label ? : "generic");
> =20
>  	return 0;
> =20
> +err_remove_device:
> +	device_del(&chip->device);
>  err_remove_chip:
>  	acpi_gpiochip_remove(chip);
>  	gpiochip_free_hogs(chip);
> @@ -381,6 +412,7 @@ err_remove_from_list:
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  	chip->desc =3D NULL;
>  err_free_descs:
> +	ida_simple_remove(&gpio_ida, chip->id);
>  	kfree(descs);
> =20
>  	/* failures here can mean systems won't boot... */
> @@ -426,6 +458,8 @@ void gpiochip_remove(struct gpio_chip *chip)
>  	if (requested)
>  		dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
> =20
> +	device_del(&chip->device);
> +	ida_simple_remove(&gpio_ida, chip->id);
>  	kfree(chip->desc);
>  	chip->desc =3D NULL;
>  }
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index d1baebf350d8..cf3028eccc4b 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -1,6 +1,7 @@
>  #ifndef __LINUX_GPIO_DRIVER_H
>  #define __LINUX_GPIO_DRIVER_H
> =20
> +#include <linux/device.h>
>  #include <linux/types.h>
>  #include <linux/module.h>
>  #include <linux/irq.h>
> @@ -8,8 +9,8 @@
>  #include <linux/irqdomain.h>
>  #include <linux/lockdep.h>
>  #include <linux/pinctrl/pinctrl.h>
> +#include <linux/cdev.h>
> =20
> -struct device;
>  struct gpio_desc;
>  struct of_phandle_args;
>  struct device_node;
> @@ -20,7 +21,9 @@ struct seq_file;
>  /**
>   * struct gpio_chip - abstract a GPIO controller
>   * @label: for diagnostics
> - * @dev: optional device providing the GPIOs
> + * @id: numerical ID number for the GPIO chip
> + * @device: the GPIO device struct.
> + * @dev: optional parent device (hardware) providing the GPIOs
>   * @cdev: class device used by sysfs interface (may be NULL)
>   * @owner: helps prevent removal of modules exporting active GPIOs
>   * @list: links gpio_chips together for traversal
> @@ -89,6 +92,8 @@ struct seq_file;
>   */
>  struct gpio_chip {
>  	const char		*label;
> +	int			id;
> +	struct device		device;
>  	struct device		*dev;
>  	struct device		*cdev;
>  	struct module		*owner;
> --=20
> 2.4.3
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWK8lJAAoJEEpcgKtcEGQQA9AP/1YXn46LKnNx5xDD2QskKmxc
Cq6vLpyhGGUjxJP79T6JrgQwLVHKlHVCWqbYM8tRO7IWTSF0GyLGWdT0ko9lPSob
KwWCYrw8u/2+pMfS7VjlGUl8v+2+rtKzEAUg0kZZ2Yc1TCP7wm4Z5EbtFGhwcQCr
SDP1VQyQtwdUB0KQwxvj8p1rrF6icgC/gT1aINCjl1dHnCQyNO6a14UGbx3m3V/0
/5w7sPY4HxqLmL4Ac/Zor4cdvSw3PiGx4h7DGU5nRG5JTdgN9wSYZ7nUa9fOkHFX
IifKP9e63827HcCGAQlsOiC8ZnRbGdOcu5TE+YrR2HCUy1DBUt9B3V4DcDAYT0qs
1dOq9Z+zEJUNto+LQGd2Rf40N/x9Zf3SjSnhqU98L/qe1qbCTAhpMohaGyrgfXaK
wV1gdbq5b+q3EuivNVHRK62idyo1VFeTrXCqMAaa49oaBa+MmE1boVPpsI7d+CCL
7rVwIpBDiB8+6F0DNFQIibGIKNoy6PhTZ35hn3JxbI2N4+Sr0TiFY0GP5+SbGUks
bQcmr0ttPvAIknnOFiszgE1k+DU/Lo921filewCzQYliufXN+V9cE68J/bvvivuq
JdZAmA9BZ3vpNdc52fBrrTARH5cPzIvqBQOaI5bbEXOQRmfkvLoyp6hQ+20lf1BZ
5VwwQHL2GnK12fKfUpAT
=MY0O
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
