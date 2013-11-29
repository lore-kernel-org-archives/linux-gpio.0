From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 19:56:06 +0100
Message-ID: <20131129185606.GK16823@kw.sim.vm.gnt>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2YJj5f1P6Th4nBRw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:32809 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754315Ab3K2TFo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 14:05:44 -0500
Content-Disposition: inline
In-Reply-To: <1385597895-26418-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org


--2YJj5f1P6Th4nBRw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 12:18:15AM +0000, Bruno Randolf wrote:
> This patch adds support for the first eight GPIOs found on the SMSC "Supe=
r I/O"
> chips SCH311x.
>=20
> This chip is used on Atom based embedded boards (e.g. "Advantec MIO-2261"=
) and
> actually has more GPIO lines, but they are not connected on the board I h=
ave
> access to.
>=20
> The chip detection and I/O functions are copied from sch311x_wdt.c

Hi Bruno,

Here are few comments.

>=20
> Signed-off-by: Bruno Randolf <br1@einfach.org>
> ---
>  drivers/gpio/Kconfig        |  10 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-sch311x.c | 315 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 326 insertions(+)
>  create mode 100644 drivers/gpio/gpio-sch311x.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b6ed304..3d6bc8d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -237,6 +237,16 @@ config GPIO_SAMSUNG
>  	  Legacy GPIO support. Use only for platforms without support for
>  	  pinctrl.
> =20
> +config GPIO_SCH311X
> +	tristate "SMSC SCH311x SuperI/O GPIO"
> +	depends on X86
> +	help
> +	  Driver to enable the GPIOs found on SMSC SMSC SCH3112, SCH3114 and
> +	  SCH3116 "Super I/O" chipsets.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gpio-sch311x.
> +
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 98e23eb..b63c11f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -65,6 +65,7 @@ obj-$(CONFIG_GPIO_RCAR)		+=3D gpio-rcar.o
>  obj-$(CONFIG_GPIO_SAMSUNG)	+=3D gpio-samsung.o
>  obj-$(CONFIG_ARCH_SA1100)	+=3D gpio-sa1100.o
>  obj-$(CONFIG_GPIO_SCH)		+=3D gpio-sch.o
> +obj-$(CONFIG_GPIO_SCH311X)	+=3D gpio-sch311x.o
>  obj-$(CONFIG_GPIO_SODAVILLE)	+=3D gpio-sodaville.o
>  obj-$(CONFIG_GPIO_SPEAR_SPICS)	+=3D gpio-spear-spics.o
>  obj-$(CONFIG_GPIO_STA2X11)	+=3D gpio-sta2x11.o
> diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
> new file mode 100644
> index 0000000..1ca7450
> --- /dev/null
> +++ b/drivers/gpio/gpio-sch311x.c
> @@ -0,0 +1,315 @@
> +/*
> + * GPIO driver for the SMSC SCH311x Super-I/O chips
> + *
> + * Copyright (C) 2013 Bruno Randolf <br1@einfach.org>
> + *
> + * SuperIO functions and chip detection:
> + * (c) Copyright 2008 Wim Van Sebroeck <wim@iguana.be>.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c-gpio.h>
> +
> +#define DRV_NAME	"gpio-sch311x"
> +
> +/*
> + * Note: This driver only supports the first 8 GPIOs of the chip.
> + */
> +
> +
> +/* Runtime registers */
> +
> +#define GP1	0x4B	/* GP10-17 data register */
> +
> +static unsigned int sch311x_gpio_conf[] =3D {
> +	{ 0x23,		/* GP10 config register */
        ^
Does this even compile ?

> +	0x24,		/* GP11 config register */
> +	0x25,		/* GP12 config register */
> +	0x26,		/* GP13 config register */
> +	0x27,		/* GP14 config register */
> +	0x29,		/* GP15 config register */
> +	0x2a,		/* GP16 config register */
> +	0x2b,		/* GP17 config register */
> +};
> +
> +#define SCH311X_GPIO_CONF_IN		0x01
> +#define SCH311X_GPIO_CONF_OUT		0x00
> +#define SCH311X_GPIO_CONF_INV		0x02
> +#define SCH311X_GPIO_CONF_OPEN_DRAIN	0x80
> +
> +static int sch311x_ioports[] =3D { 0x2e, 0x4e, 0x162e, 0x164e, 0x00 };
> +
> +/* internal variables */
> +static struct platform_device *sch311x_gpio_pdev;
> +static struct platform_device *i2c_gpio_pdev;
> +
> +static struct {
> +	unsigned short runtime_reg;	/* Runtime Register base address */
> +	spinlock_t lock;		/* lock for io operations */
> +} sch311x_gpio_data;
> +
> +
> +/*
> + *	Super-IO functions
> + */
> +
> +static inline void sch311x_sio_enter(int sio_config_port)
> +{

As a Super-I/O is a multifunction device, I think you should request
the Super-I/O port here, using request_muxed_region() for example.

This is a collaborative way to prevent against concurrent accesses.

> +	outb(0x55, sio_config_port);
> +}
> +
> +static inline void sch311x_sio_exit(int sio_config_port)
> +{
> +	outb(0xaa, sio_config_port);

Then, you may need to release the Super-I/O port here.

> +}
> +
> +static inline int sch311x_sio_inb(int sio_config_port, int reg)
> +{
> +	outb(reg, sio_config_port);
> +	return inb(sio_config_port + 1);
> +}
> +
> +static inline void sch311x_sio_outb(int sio_config_port, int reg, int va=
l)
> +{
> +	outb(reg, sio_config_port);
> +	outb(val, sio_config_port + 1);
> +}
> +
> +
> +/*
> + *	GPIO functions
> + */
> +
> +static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +	unsigned char data =3D inb(sch311x_gpio_data.runtime_reg + GP1);
> +	return ((data >> offset) & 1);
> +}
> +
> +static void __sch311x_gpio_set(unsigned offset, int value)
> +{
> +	unsigned char data;
> +	data =3D inb(sch311x_gpio_data.runtime_reg + GP1);
> +	if (value)
> +		data |=3D 1 << offset;
> +	else
> +		data &=3D ~(1 << offset);
> +	outb(data, sch311x_gpio_data.runtime_reg + GP1);
> +}
> +
> +static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset, in=
t value)
> +{
> +	spin_lock(&sch311x_gpio_data.lock);
> +
> +	 __sch311x_gpio_set(offset, value);
> +
> +	spin_unlock(&sch311x_gpio_data.lock);
> +}
> +
> +static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned of=
fset)
> +{
> +	spin_lock(&sch311x_gpio_data.lock);
> +
> +	outb(SCH311X_GPIO_CONF_IN, sch311x_gpio_data.runtime_reg + sch311x_gpio=
_conf[offset]);
> +
> +	spin_unlock(&sch311x_gpio_data.lock);
> +	return 0;
> +}
> +
> +static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned o=
ffset, int value)
> +{
> +	spin_lock(&sch311x_gpio_data.lock);
> +
> +#if 0
> +	/* configure as "push/pull": output voltage is 3.3V */
> +	outb(SCH311X_GPIO_CONF_OUT, sch311x_gpio_data.runtime_reg + sch311x_gpi=
o_conf[offset]);
> +#else
> +	/* configure as "open drain": output voltage is 5V on an unconnected PI=
N */
> +	outb(SCH311X_GPIO_CONF_OUT | SCH311X_GPIO_CONF_OPEN_DRAIN,
> +	     sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
> +#endif
> +	__sch311x_gpio_set(offset, value);
> +
> +	spin_unlock(&sch311x_gpio_data.lock);
> +	return 0;
> +}
> +
> +static struct gpio_chip sc_gpio_chip =3D {
> +	.label			=3D "sch311x_gpio",
> +	.owner			=3D THIS_MODULE,
> +	.direction_input	=3D sch311x_gpio_direction_in,
> +	.get			=3D sch311x_gpio_get,
> +	.direction_output	=3D sch311x_gpio_direction_out,
> +	.set			=3D sch311x_gpio_set,
> +	.can_sleep		=3D 0,
> +	.base			=3D 0,
> +	.ngpio			=3D 8,
> +};
> +
> +static int sch311x_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int err, i;
> +
> +	spin_lock_init(&sch311x_gpio_data.lock);
> +
> +	if (!request_region(sch311x_gpio_data.runtime_reg + GP1, 1, DRV_NAME)) {
> +		dev_err(dev, "Failed to request region 0x%04x-0x%04x.\n",
> +			sch311x_gpio_data.runtime_reg + GP1,
> +			sch311x_gpio_data.runtime_reg + GP1);
> +		err =3D -EBUSY;
> +		goto exit;
> +	}
> +
> +	for (i=3D0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
> +		if (!request_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[=
i], 1, DRV_NAME)) {
> +			dev_err(dev, "Failed to request region 0x%04x-0x%04x.\n",
> +				sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i],
> +				sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i]);
> +			err =3D -EBUSY;
> +			goto exit_release_region;
> +		}

It seems to me that all the sch311x_gpio_conf registers are contiguous,
except for address 0x27. Then, maybe you can transform this loop into a
single request_region() call ?

The same remark applies to the release_region() calls.

> +	}
> +
> +	sc_gpio_chip.dev =3D &pdev->dev;
> +	err =3D gpiochip_add(&sc_gpio_chip);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", err);
> +		goto exit_release_region2;
> +	}
> +
> +	dev_info(dev, "SMSC SCH311x GPIO registered.\n");
> +
> +	return 0;
> +
> +exit_release_region2:
> +	for (i=3D0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
> +		release_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i], 1=
);
> +	}
> +exit_release_region:
> +	release_region(sch311x_gpio_data.runtime_reg + GP1, 1);
> +	sch311x_gpio_data.runtime_reg =3D 0;
> +exit:
> +	return err;
> +}
> +
> +static int sch311x_gpio_remove(struct platform_device *pdev)
> +{
> +	int i;
> +
> +	release_region(sch311x_gpio_data.runtime_reg + GP1, 1);
> +	for (i=3D0; i < ARRAY_SIZE(sch311x_gpio_conf); i++) {
> +		release_region(sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[i], 1=
);
> +	}
> +	sch311x_gpio_data.runtime_reg =3D 0;
> +
> +	return gpiochip_remove(&sc_gpio_chip);
> +}
> +
> +static struct platform_driver sch311x_gpio_driver =3D {
> +	.driver.name	=3D DRV_NAME,
> +	.driver.owner	=3D THIS_MODULE,
> +	.probe		=3D sch311x_gpio_probe,
> +	.remove		=3D sch311x_gpio_remove,
> +};
> +
> +
> +/*
> + *	Init & exit routines
> + */
> +
> +static int __init sch311x_detect(int sio_config_port, unsigned short *ad=
dr)
> +{
> +	int err =3D 0, reg;
> +	unsigned short base_addr;
> +	unsigned char dev_id;
> +
> +	sch311x_sio_enter(sio_config_port);

Don't you need to check the vendor ID here ?

> +
> +	/* Check device ID. We currently know about:
> +	 * SCH3112 (0x7c), SCH3114 (0x7d), and SCH3116 (0x7f). */
> +	reg =3D sch311x_sio_inb(sio_config_port, 0x20);
> +	if (!(reg =3D=3D 0x7c || reg =3D=3D 0x7d || reg =3D=3D 0x7f)) {
> +		err =3D -ENODEV;
> +		goto exit;
> +	}
> +	dev_id =3D reg =3D=3D 0x7c ? 2 : reg =3D=3D 0x7d ? 4 : 6;

Outch :)

> +
> +	/* Select logical device A (runtime registers) */
> +	sch311x_sio_outb(sio_config_port, 0x07, 0x0a);

How behaves the Super-I/O if an another driver selects a different
logical device later ? Is that OK ?

> +
> +	/* Check if Logical Device Register is currently active */
> +	if ((sch311x_sio_inb(sio_config_port, 0x30) & 0x01) =3D=3D 0)
> +		pr_info("Seems that LDN 0x0a is not active...\n");

Maybe you can enable it ?

Regards,

Simon

> +
> +	/* Get the base address of the runtime registers */
> +	base_addr =3D (sch311x_sio_inb(sio_config_port, 0x60) << 8) |
> +			   sch311x_sio_inb(sio_config_port, 0x61);
> +	if (!base_addr) {
> +		pr_err("Base address not set\n");
> +		err =3D -ENODEV;
> +		goto exit;
> +	}
> +	*addr =3D base_addr;
> +
> +	pr_info("Found an SMSC SCH311%d chip at 0x%04x\n", dev_id, base_addr);
> +
> +exit:
> +	sch311x_sio_exit(sio_config_port);
> +	return err;
> +}
> +
> +static int __init sch311x_gpio_init(void)
> +{
> +	int err, i, found =3D 0;
> +	unsigned short addr =3D 0;
> +
> +	for (i =3D 0; !found && sch311x_ioports[i]; i++)
> +		if (sch311x_detect(sch311x_ioports[i], &addr) =3D=3D 0)
> +			found++;
> +
> +	if (!found)
> +		return -ENODEV;
> +
> +	sch311x_gpio_data.runtime_reg =3D addr;
> +
> +	err =3D platform_driver_register(&sch311x_gpio_driver);
> +	if (err)
> +		return err;
> +
> +	sch311x_gpio_pdev =3D platform_device_register_simple(DRV_NAME, addr, N=
ULL, 0);
> +
> +	if (IS_ERR(sch311x_gpio_pdev)) {
> +		err =3D PTR_ERR(sch311x_gpio_pdev);
> +		goto unreg_platform_driver;
> +	}
> +
> +	return 0;
> +
> +unreg_platform_driver:
> +	platform_driver_unregister(&sch311x_gpio_driver);
> +	return err;
> +}
> +
> +static void __exit sch311x_gpio_exit(void)
> +{
> +	platform_device_unregister(sch311x_gpio_pdev);
> +	platform_driver_unregister(&sch311x_gpio_driver);
> +}
> +
> +module_init(sch311x_gpio_init);
> +module_exit(sch311x_gpio_exit);
> +
> +MODULE_AUTHOR("Bruno Randolf <br1@einfach.org>");
> +MODULE_DESCRIPTION("SMSC SCH311x GPIO Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-sch311x");
> --=20
> 1.8.3.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--2YJj5f1P6Th4nBRw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKY40YACgkQgtp0PDeOcDrEqgCePG/TCULNLPGta9we/mjc/k1+
l6EAnRpUasiuo7l9xaZaBruE1wow1LWo
=cped
-----END PGP SIGNATURE-----

--2YJj5f1P6Th4nBRw--
