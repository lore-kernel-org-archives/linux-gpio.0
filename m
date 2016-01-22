From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH V2 1/1] gpio-f7188x: Add F81866 GPIO supports
Date: Fri, 22 Jan 2016 09:58:23 +0100
Message-ID: <20160122085823.GA4976@kw.sim.vm.gnt>
References: <1453447413-25290-1-git-send-email-hpeter+linux_kernel@gmail.com>
 <1453447413-25290-2-git-send-email-hpeter+linux_kernel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41020 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbcAVI61 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Jan 2016 03:58:27 -0500
Content-Disposition: inline
In-Reply-To: <1453447413-25290-2-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Hung <hpeter@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 03:23:33PM +0800, Peter Hung wrote:
> Add F81866 GPIO supports
>=20
> Fintek F81866 is a SuperIO. It contains HWMON/GPIO/Serial Ports.
> and it has totally 72(9x8 sets) gpio pins.
>=20
> Here is the PDF spec:
> http://www.alldatasheet.com/datasheet-pdf/pdf/459085/FINTEK/F81866AD-I.ht=
ml
>=20
> The control method is the same with F7188x, but we should care the address
> of GPIO8x.
>=20
> GPIO address is below:
>     GPIO0x based: 0xf0
>     GPIO1x based: 0xe0
>     GPIO2x based: 0xd0
>     GPIO3x based: 0xc0
>     GPIO4x based: 0xb0
>     GPIO5x based: 0xa0
>     GPIO6x based: 0x90
>     GPIO7x based: 0x80
>     GPIO8x based: 0x88 <-- not 0x70.
>=20
> Signed-off-by: Peter Hung <hpeter+linux_kernel@gmail.com>
> ---
>  drivers/gpio/Kconfig       |  4 ++--
>  drivers/gpio/gpio-f7188x.c | 27 ++++++++++++++++++++++++---
>  2 files changed, 26 insertions(+), 5 deletions(-)

Hi Peter,

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks,

Simon

>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index cb212eb..c1ad573 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -513,10 +513,10 @@ config GPIO_104_IDI_48
>  	  via the idi_48_irq module parameter.
> =20
>  config GPIO_F7188X
> -	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
> +	tristate "F71869, F71869A, F71882FG, F71889F and F81866 GPIO support"
>  	help
>  	  This option enables support for GPIOs found on Fintek Super-I/O
> -	  chips F71869, F71869A, F71882FG and F71889F.
> +	  chips F71869, F71869A, F71882FG, F71889F and F81866.
> =20
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called f7188x-gpio.
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index d62fd6b..0417798 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -1,5 +1,5 @@
>  /*
> - * GPIO driver for Fintek Super-I/O F71869, F71869A, F71882 and F71889
> + * GPIO driver for Fintek Super-I/O F71869, F71869A, F71882, F71889 and =
F81866
>   *
>   * Copyright (C) 2010-2013 LaCie
>   *
> @@ -36,14 +36,16 @@
>  #define SIO_F71869A_ID		0x1007	/* F71869A chipset ID */
>  #define SIO_F71882_ID		0x0541	/* F71882 chipset ID */
>  #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
> +#define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
> =20
> -enum chips { f71869, f71869a, f71882fg, f71889f };
> +enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
> =20
>  static const char * const f7188x_names[] =3D {
>  	"f71869",
>  	"f71869a",
>  	"f71882fg",
>  	"f71889f",
> +	"f81866",
>  };
> =20
>  struct f7188x_sio {
> @@ -190,6 +192,18 @@ static struct f7188x_gpio_bank f71889_gpio_bank[] =
=3D {
>  	F7188X_GPIO_BANK(70, 8, 0x80),
>  };
> =20
> +static struct f7188x_gpio_bank f81866_gpio_bank[] =3D {
> +	F7188X_GPIO_BANK(0, 8, 0xF0),
> +	F7188X_GPIO_BANK(10, 8, 0xE0),
> +	F7188X_GPIO_BANK(20, 8, 0xD0),
> +	F7188X_GPIO_BANK(30, 8, 0xC0),
> +	F7188X_GPIO_BANK(40, 8, 0xB0),
> +	F7188X_GPIO_BANK(50, 8, 0xA0),
> +	F7188X_GPIO_BANK(60, 8, 0x90),
> +	F7188X_GPIO_BANK(70, 8, 0x80),
> +	F7188X_GPIO_BANK(80, 8, 0x88),
> +};
> +
>  static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned off=
set)
>  {
>  	int err;
> @@ -318,6 +332,10 @@ static int f7188x_gpio_probe(struct platform_device =
*pdev)
>  		data->nr_bank =3D ARRAY_SIZE(f71889_gpio_bank);
>  		data->bank =3D f71889_gpio_bank;
>  		break;
> +	case f81866:
> +		data->nr_bank =3D ARRAY_SIZE(f81866_gpio_bank);
> +		data->bank =3D f81866_gpio_bank;
> +		break;
>  	default:
>  		return -ENODEV;
>  	}
> @@ -395,6 +413,9 @@ static int __init f7188x_find(int addr, struct f7188x=
_sio *sio)
>  	case SIO_F71889_ID:
>  		sio->type =3D f71889f;
>  		break;
> +	case SIO_F81866_ID:
> +		sio->type =3D f81866;
> +		break;
>  	default:
>  		pr_info(DRVNAME ": Unsupported Fintek device 0x%04x\n", devid);
>  		goto err;
> @@ -485,6 +506,6 @@ static void __exit f7188x_gpio_exit(void)
>  }
>  module_exit(f7188x_gpio_exit);
> =20
> -MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71=
882FG and F71889F");
> +MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71=
882FG, F71889F and F81866");
>  MODULE_AUTHOR("Simon Guinot <simon.guinot@sequanux.org>");
>  MODULE_LICENSE("GPL");
> --=20
> 1.9.1

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlah7y8ACgkQgtp0PDeOcDrXhgCeOUVUiBteD4HtdtEDOGEvH2A6
MfkAn0rvbPtlM6Wl/r3Nl4yZKnm5AeQp
=EWOD
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
