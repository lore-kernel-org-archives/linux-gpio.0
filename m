From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 2/2] gpio-f7188x: filter non-export gpio for F81866
Date: Tue, 12 Jan 2016 16:36:36 +0100
Message-ID: <20160112153636.GA7731@kw.sim.vm.gnt>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
 <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:42967 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752311AbcALPgk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 Jan 2016 10:36:40 -0500
Content-Disposition: inline
In-Reply-To: <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Hung <hpeter@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2016 at 03:41:39PM +0800, Peter Hung wrote:
> Dont export gpios which not enabled by motherboard manufacturer.
>=20
> Signed-off-by: Peter Hung <hpeter+linux_kernel@gmail.com>

Hi Peter,

> ---
>  drivers/gpio/gpio-f7188x.c | 153 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 153 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index a6a9641..f7fe7aa 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -38,6 +38,12 @@
>  #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
>  #define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
> =20
> +#define F81866_PORT_SEL_REG	0x27
> +#define F81866_MULTI_FUN1_REG	0x28
> +#define F81866_MULTI_FUN3_REG	0x29
> +#define F81866_MULTI_FUN4_REG	0x2B
> +#define F81866_GPIO_EN_REG	0x2C
> +
>  enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
> =20
>  static const char * const f7188x_names[] =3D {
> @@ -93,6 +99,15 @@ static inline void superio_outb(int base, int reg, int=
 val)
>  	outb(val, base + 1);
>  }
> =20
> +static inline void superio_mask_outb(int base, int reg, int mask, int va=
l)
> +{
> +	u8 tmp;
> +
> +	tmp =3D superio_inb(base, reg);
> +	tmp =3D (tmp & ~mask) | (val & mask);
> +	superio_outb(base, reg, tmp);
> +}
> +
>  static inline int superio_enter(int base)
>  {
>  	/* Don't step on other drivers' I/O space by accident. */
> @@ -304,6 +319,125 @@ static void f7188x_gpio_set(struct gpio_chip *chip,=
 unsigned offset, int value)
>  	superio_exit(sio->addr);
>  }
> =20
> +static int f81866_verify_gpioset(int base, int set)
> +{
> +	int err;
> +	u8 tmp;
> +
> +	err =3D superio_enter(base);
> +	if (err)
> +		return err;
> +
> +	err =3D -ENODEV;
> +
> +	switch (set) {
> +	case 0:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
> +				BIT(0), 0);
> +		tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +		if ((tmp & 0x1f) !=3D 0x1f)
> +			break; /* one in GPIO00~GPIO04 is not enable */
> +
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +		if ((tmp & 0xc) !=3D 0x0)
> +			break;
> +
> +		err =3D 0; /* GPIO0x set is all enabled */
> +		break;
> +	case 1:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
> +				BIT(0), BIT(2));
> +		tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +		if ((tmp & 0xef) !=3D 0xef)
> +			break; /* one in GPIO10~GPIO17 is not enable */
> +
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +		if ((tmp & 0x03) !=3D 0x00)
> +			break; /* one in GPIO12~GPIO13 is not enable */
> +
> +		err =3D 0; /* GPIO1x set is all enabled */
> +		break;
> +	case 2:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
> +				BIT(0), BIT(3));
> +		tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +		if ((tmp & 0xff) !=3D 0xff)
> +			break; /* one in GPIO20~GPIO27 is not enable */
> +
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +		if ((tmp & 0x08) !=3D 0x00)
> +			break; /* GPIO20 is not enable */
> +
> +		err =3D 0; /* GPIO2x set is all enabled */
> +		break;
> +	case 3:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), 0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +		if ((tmp & 0x30) !=3D 0x00)
> +			break; /* GPIO3x is not enable */
> +
> +		err =3D 0; /* GPIO3x set is all enabled */
> +		break;
> +	case 4:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), 0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +		if ((tmp & 0xc0) !=3D 0x00)
> +			break; /* GPIO4x is not enable */
> +
> +		err =3D 0; /* GPIO4x set is all enabled */
> +		break;
> +	case 5:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2),
> +				0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +		if ((tmp & 0x43) !=3D 0x40)
> +			break; /* GPIO5x is not enable */
> +
> +		err =3D 0; /* GPIO5x set is all enabled */
> +		break;
> +	case 6:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
> +				BIT(0), 0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +		if ((tmp & 0x4c) !=3D 0x40)
> +			break; /* GPIO60~64 is not enable */
> +
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN4_REG);
> +		if ((tmp & 0xe0) !=3D 0xe0)
> +			break; /* GPIO65~67 is not enable */
> +
> +		err =3D 0; /* GPIO6x set is all enabled */
> +		break;
> +	case 7:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
> +				BIT(0), 0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +		if ((tmp & 0x20) !=3D 0x20)
> +			break; /* GPIO7x is not enable */
> +
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN4_REG);
> +		if ((tmp & 0x01) !=3D 0x00)
> +			break; /* GPIO70 is not enable */
> +
> +		err =3D 0; /* GPIO7x set is all enabled */
> +		break;
> +	case 8:
> +		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2),
> +				0);
> +		tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +		if ((tmp & 0x20) !=3D 0x20)
> +			break; /* GPIO8x is not enable */
> +
> +		err =3D 0; /* GPIO8x set is all enabled */
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	superio_exit(base);
> +	return err;
> +}
> +
>  /*
>   * Platform device and driver.
>   */
> @@ -351,6 +485,15 @@ static int f7188x_gpio_probe(struct platform_device =
*pdev)
>  	for (i =3D 0; i < data->nr_bank; i++) {
>  		struct f7188x_gpio_bank *bank =3D &data->bank[i];
> =20
> +		/*
> +		 * Dont export GPIO sysfs if pin set is not enable by MB
> +		 * manufacturer.

What does MB stands for ?

> +		 */
> +		if (sio->type =3D=3D f81866 && f81866_verify_gpioset(sio->addr, i))
> +			continue;

This whole filtering mechanism relies on the fact that the multiplexing
configuration has been correctly applied by the BIOS (if applied at
all). But I wonder if it is often the case. For example, I have several
boards for which it is not true. And to make the GPIOs available, I need
first to fix the multiplexing pin configuration of the Super I/O.

Maybe it would be more correct to rely on the hardware description of a
board (Device Tree or ACPI) to decide which GPIO bank can be enabled or
not.

Simon

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlaVHYQACgkQgtp0PDeOcDri+gCeNMfgtievVSHzgKcr0nG062Ex
zuwAn1BumRXClfZCUlZ4wKI15rc2gTiT
=0BH6
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
