From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Fri, 21 Aug 2015 19:52:16 +0200
Message-ID: <20150821175216.GE1729@kw.sim.vm.gnt>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
 <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:37222 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751647AbbHURuX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 21 Aug 2015 13:50:23 -0400
Content-Disposition: inline
In-Reply-To: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-gpio@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>


--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 08:03:26PM +0200, Vincent Pelletier wrote:

Hi Vincent,

This patch breaks GPIO support for the Super-I/Os f71882fg and f71889f.

> For some (unclear to me) reason, superio_enter/superio_exit, although
> calling request_muxed_region/release_region (respectively), are not
> sufficient on an multi-processor system to guarantee serialised access,
> leading to the following errors:
> [ 1210.586990] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1211.227414] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1211.867890] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1212.508299] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1213.148734] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1213.789172] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>
> [ 1214.429607] Trying to free nonexistent resource <000000000000002e-0000=
00000000002f>

I am quite surprised by this warnings. Although I have been using this
driver intensively with the f71882fg and f71889f Super-I/Os on a large
range of boards, I have never experimented such warnings.

IMHO, understand *clearly* the issue could be a good start in order to
fix it efficiently.

Please, could you describe a setup (as simple as possible) allowing to
reproduce the issue ? I'll try it on my side.

>=20
> Disabling all but one core make the error disappear, and re-enabling it
> make it reappear.
>=20
> Loaded modules for this SuperIO chip on this system are:
>   8250_fintek (not actively used)
>   fintek_cir (not actively used)
>   f71882fg (polled every 2 seconds from userland)
>   gpio_f7188x
>=20
> Loaded modules using GPIO functionality:
>   gpio_keys_polled (20ms polling period)
>   leds_gpio (usb-host and 500ms timer triggers)

Please try to make the module list needed to reproduce the issue as
short as possible. Ideally only gpio_f7188x would be needed.

>=20
> This change replaces frequent superio_enter/superio_exit and accesses via=
 the
> common GPIO IO region (0x2e..0x2f or 0x4e..0x4f) with mutex locking and
> accesses via GPIO-dedicated IO region (pre-configured on chip).

Unfortunately the f71882fg and f71889f Super-I/Os don't provide an
I/O region dedicated to GPIOs. If it was the case, I would have used
this way. But for this Super-I/O models, the GPIOs have to be configured
through the global registers. That's why your patch breaks support with
this models. However, accordingly to the datasheet, this feature seems
to be supported by the f71869a model.

Thanks,

Simon

>=20
> Code inspired from hwmon/f71882fg .
>=20
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> ---
>  drivers/gpio/gpio-f7188x.c | 126 ++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 80 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index dbda843..2915f8d 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -16,6 +16,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/gpio.h>
> +#include <linux/mutex.h>
> +#include <linux/acpi.h>
> =20
>  #define DRVNAME "gpio-f7188x"
> =20
> @@ -26,11 +28,17 @@
>  #define SIO_DEVID		0x20	/* Device ID (2 bytes) */
>  #define SIO_DEVREV		0x22	/* Device revision */
>  #define SIO_MANID		0x23	/* Fintek ID (2 bytes) */
> +#define SIO_ENABLE		0x30	/* Logical device enable */
> +#define SIO_ADDR		0x60	/* Logical device address (2 bytes) */
> =20
>  #define SIO_LD_GPIO		0x06	/* GPIO logical device */
>  #define SIO_UNLOCK_KEY		0x87	/* Key to enable Super-I/O */
>  #define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
> =20
> +#define REGION_LENGTH		8
> +#define ADDR_REG_OFFSET		5
> +#define DATA_REG_OFFSET		6
> +
>  #define SIO_FINTEK_ID		0x1934	/* Manufacturer ID */
>  #define SIO_F71869_ID		0x0814	/* F71869 chipset ID */
>  #define SIO_F71869A_ID		0x1007	/* F71869A chipset ID */
> @@ -47,8 +55,9 @@ static const char * const f7188x_names[] =3D {
>  };
> =20
>  struct f7188x_sio {
> -	int addr;
> +	u16 addr;
>  	enum chips type;
> +	struct mutex lock;
>  };
> =20
>  struct f7188x_gpio_bank {
> @@ -118,6 +127,22 @@ static inline void superio_exit(int base)
>  	release_region(base, 2);
>  }
> =20
> +static u8 f7188x_read8(struct f7188x_sio *data, u8 reg)
> +{
> +	u8 val;
> +
> +	outb(reg, data->addr + ADDR_REG_OFFSET);
> +	val =3D inb(data->addr + DATA_REG_OFFSET);
> +
> +	return val;
> +}
> +
> +static void f7188x_write8(struct f7188x_sio *data, u8 reg, u8 val)
> +{
> +	outb(reg, data->addr + ADDR_REG_OFFSET);
> +	outb(val, data->addr + DATA_REG_OFFSET);
> +}
> +
>  /*
>   * GPIO chip.
>   */
> @@ -192,47 +217,35 @@ static struct f7188x_gpio_bank f71889_gpio_bank[] =
=3D {
> =20
>  static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned off=
set)
>  {
> -	int err;
>  	struct f7188x_gpio_bank *bank =3D
>  		container_of(chip, struct f7188x_gpio_bank, chip);
>  	struct f7188x_sio *sio =3D bank->data->sio;
>  	u8 dir;
> =20
> -	err =3D superio_enter(sio->addr);
> -	if (err)
> -		return err;
> -	superio_select(sio->addr, SIO_LD_GPIO);
> -
> -	dir =3D superio_inb(sio->addr, gpio_dir(bank->regbase));
> +	mutex_lock(&sio->lock);
> +	dir =3D f7188x_read8(sio, gpio_dir(bank->regbase));
>  	dir &=3D ~(1 << offset);
> -	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
> -
> -	superio_exit(sio->addr);
> +	f7188x_write8(sio, gpio_dir(bank->regbase), dir);
> +	mutex_unlock(&sio->lock);
> =20
>  	return 0;
>  }
> =20
>  static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
> -	int err;
>  	struct f7188x_gpio_bank *bank =3D
>  		container_of(chip, struct f7188x_gpio_bank, chip);
>  	struct f7188x_sio *sio =3D bank->data->sio;
>  	u8 dir, data;
> =20
> -	err =3D superio_enter(sio->addr);
> -	if (err)
> -		return err;
> -	superio_select(sio->addr, SIO_LD_GPIO);
> -
> -	dir =3D superio_inb(sio->addr, gpio_dir(bank->regbase));
> +	mutex_lock(&sio->lock);
> +	dir =3D f7188x_read8(sio, gpio_dir(bank->regbase));
>  	dir =3D !!(dir & (1 << offset));
>  	if (dir)
> -		data =3D superio_inb(sio->addr, gpio_data_out(bank->regbase));
> +		data =3D f7188x_read8(sio, gpio_data_out(bank->regbase));
>  	else
> -		data =3D superio_inb(sio->addr, gpio_data_in(bank->regbase));
> -
> -	superio_exit(sio->addr);
> +		data =3D f7188x_read8(sio, gpio_data_in(bank->regbase));
> +	mutex_unlock(&sio->lock);
> =20
>  	return !!(data & 1 << offset);
>  }
> @@ -240,54 +253,42 @@ static int f7188x_gpio_get(struct gpio_chip *chip, =
unsigned offset)
>  static int f7188x_gpio_direction_out(struct gpio_chip *chip,
>  				     unsigned offset, int value)
>  {
> -	int err;
>  	struct f7188x_gpio_bank *bank =3D
>  		container_of(chip, struct f7188x_gpio_bank, chip);
>  	struct f7188x_sio *sio =3D bank->data->sio;
>  	u8 dir, data_out;
> =20
> -	err =3D superio_enter(sio->addr);
> -	if (err)
> -		return err;
> -	superio_select(sio->addr, SIO_LD_GPIO);
> -
> -	data_out =3D superio_inb(sio->addr, gpio_data_out(bank->regbase));
> +	mutex_lock(&sio->lock);
> +	data_out =3D f7188x_read8(sio, gpio_data_out(bank->regbase));
>  	if (value)
>  		data_out |=3D (1 << offset);
>  	else
>  		data_out &=3D ~(1 << offset);
> -	superio_outb(sio->addr, gpio_data_out(bank->regbase), data_out);
> +	f7188x_write8(sio, gpio_data_out(bank->regbase), data_out);
> =20
> -	dir =3D superio_inb(sio->addr, gpio_dir(bank->regbase));
> +	dir =3D f7188x_read8(sio, gpio_dir(bank->regbase));
>  	dir |=3D (1 << offset);
> -	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
> -
> -	superio_exit(sio->addr);
> +	f7188x_write8(sio, gpio_dir(bank->regbase), dir);
> +	mutex_unlock(&sio->lock);
> =20
>  	return 0;
>  }
> =20
>  static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int=
 value)
>  {
> -	int err;
>  	struct f7188x_gpio_bank *bank =3D
>  		container_of(chip, struct f7188x_gpio_bank, chip);
>  	struct f7188x_sio *sio =3D bank->data->sio;
>  	u8 data_out;
> =20
> -	err =3D superio_enter(sio->addr);
> -	if (err)
> -		return;
> -	superio_select(sio->addr, SIO_LD_GPIO);
> -
> -	data_out =3D superio_inb(sio->addr, gpio_data_out(bank->regbase));
> +	mutex_lock(&sio->lock);
> +	data_out =3D f7188x_read8(sio, gpio_data_out(bank->regbase));
>  	if (value)
>  		data_out |=3D (1 << offset);
>  	else
>  		data_out &=3D ~(1 << offset);
> -	superio_outb(sio->addr, gpio_data_out(bank->regbase), data_out);
> -
> -	superio_exit(sio->addr);
> +	f7188x_write8(sio, gpio_data_out(bank->regbase), data_out);
> +	mutex_unlock(&sio->lock);
>  }
> =20
>  /*
> @@ -326,6 +327,7 @@ static int f7188x_gpio_probe(struct platform_device *=
pdev)
>  		return -ENODEV;
>  	}
>  	data->sio =3D sio;
> +	mutex_init(&sio->lock);
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> @@ -372,6 +374,7 @@ static int f7188x_gpio_remove(struct platform_device =
*pdev)
>  static int __init f7188x_find(int addr, struct f7188x_sio *sio)
>  {
>  	int err;
> +	u16 logical_device_address;
>  	u16 devid;
> =20
>  	err =3D superio_enter(addr);
> @@ -403,12 +406,25 @@ static int __init f7188x_find(int addr, struct f718=
8x_sio *sio)
>  		pr_info(DRVNAME ": Unsupported Fintek device 0x%04x\n", devid);
>  		goto err;
>  	}
> -	sio->addr =3D addr;
> +	superio_select(addr, SIO_LD_GPIO);
> +
> +	if (!(superio_inb(addr, SIO_ENABLE) & 0x01)) {
> +		pr_warn("Device not activated\n");
> +		goto err;
> +	}
> +
> +	logical_device_address =3D superio_inw(addr, SIO_ADDR);
> +	if (logical_device_address =3D=3D 0) {
> +		pr_warn("Base address not set\n");
> +		goto err;
> +	}
> +	logical_device_address &=3D ~(REGION_LENGTH - 1);	/* Ignore 3 LSB */
> +	sio->addr =3D logical_device_address;
>  	err =3D 0;
> =20
>  	pr_info(DRVNAME ": Found %s at %#x, revision %d\n",
>  		f7188x_names[sio->type],
> -		(unsigned int) addr,
> +		(unsigned int) logical_device_address,
>  		(int) superio_inb(addr, SIO_DEVREV));
> =20
>  err:
> @@ -421,12 +437,28 @@ static struct platform_device *f7188x_gpio_pdev;
>  static int __init
>  f7188x_gpio_device_add(const struct f7188x_sio *sio)
>  {
> +	struct resource res =3D {
> +		.start	=3D sio->addr,
> +		.end	=3D sio->addr + REGION_LENGTH - 1,
> +		.flags	=3D IORESOURCE_IO,
> +	};
>  	int err;
> =20
>  	f7188x_gpio_pdev =3D platform_device_alloc(DRVNAME, -1);
>  	if (!f7188x_gpio_pdev)
>  		return -ENOMEM;
> =20
> +	res.name =3D f7188x_gpio_pdev->name;
> +	err =3D acpi_check_resource_conflict(&res);
> +	if (err)
> +		goto err;
> +
> +	err =3D platform_device_add_resources(f7188x_gpio_pdev, &res, 1);
> +	if (err) {
> +		pr_err("Device resource addition failed\n");
> +		goto err;
> +	}
> +
>  	err =3D platform_device_add_data(f7188x_gpio_pdev,
>  				       sio, sizeof(*sio));
>  	if (err) {
> @@ -467,6 +499,8 @@ static int __init f7188x_gpio_init(void)
>  	int err;
>  	struct f7188x_sio sio;
> =20
> +	memset(&sio, 0, sizeof(sio));
> +
>  	if (f7188x_find(0x2e, &sio) &&
>  	    f7188x_find(0x4e, &sio))
>  		return -ENODEV;
> --=20
> 2.5.0

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlXXZVAACgkQgtp0PDeOcDqtxACcDnK3UptHKMM8k6ERreBDPwiX
l7cAniln4Hg1eoHxCHGd4eyuo4QjFnx7
=WyN3
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--
