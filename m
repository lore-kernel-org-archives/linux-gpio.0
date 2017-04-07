From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: f7188x: Add F71889A GPIO support.
Date: Fri, 7 Apr 2017 22:56:30 +0200
Message-ID: <20170407205630.GD16384@kw.sim.vm.gnt>
References: <20170407004205.45btnkgk7k5jv3td@tha-monstah.mydomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:49690 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753613AbdDGVEe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Apr 2017 17:04:34 -0400
Content-Disposition: inline
In-Reply-To: <20170407004205.45btnkgk7k5jv3td@tha-monstah.mydomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marty Plummer <netz.kernel@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2017 at 07:42:06PM -0500, Marty Plummer wrote:
> Add F71889A GPIO support.
>=20
> Fintek F71889A is a SuperIO. It contains HWMON/GPIO/Serial Ports.
>=20
> Datasheet:
> http://www.alldatasheet.com/datasheet-pdf/pdf/459076/FINTEK/F71889A.html
>=20
> Its virtually identical to the F71889F superio as far as gpios go.
> One oddity is GPIO2 at index 0xD0; the datasheet only lists gpio's 7-5,
> but it logically seems that it should continue down to 0. I'm not sure
> if the driver can handle gpios that are shifted away from index 0 as it
> currently stands.
>=20
> Signed-off-by: Marty Plummer <netz.kernel@gmail.com>

Hi Marty,

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

Simon

> ---
>  drivers/gpio/gpio-f7188x.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index 56bd76c33767..c013ff5deb70 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -37,14 +37,16 @@
>  #define SIO_F71869A_ID		0x1007	/* F71869A chipset ID */
>  #define SIO_F71882_ID		0x0541	/* F71882 chipset ID */
>  #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
> +#define SIO_F71889A_ID		0x1005	/* F71889A chipset ID */
>  #define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
> =20
> -enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
> +enum chips { f71869, f71869a, f71882fg, f71889a, f71889f, f81866 };
> =20
>  static const char * const f7188x_names[] =3D {
>  	"f71869",
>  	"f71869a",
>  	"f71882fg",
> +	"f71889a",
>  	"f71889f",
>  	"f81866",
>  };
> @@ -187,6 +189,17 @@ static struct f7188x_gpio_bank f71882_gpio_bank[] =
=3D {
>  	F7188X_GPIO_BANK(40, 4, 0xB0),
>  };
> =20
> +static struct f7188x_gpio_bank f71889a_gpio_bank[] =3D {
> +	F7188X_GPIO_BANK(0, 7, 0xF0),
> +	F7188X_GPIO_BANK(10, 7, 0xE0),
> +	F7188X_GPIO_BANK(20, 8, 0xD0),
> +	F7188X_GPIO_BANK(30, 8, 0xC0),
> +	F7188X_GPIO_BANK(40, 8, 0xB0),
> +	F7188X_GPIO_BANK(50, 5, 0xA0),
> +	F7188X_GPIO_BANK(60, 8, 0x90),
> +	F7188X_GPIO_BANK(70, 8, 0x80),
> +};
> +
>  static struct f7188x_gpio_bank f71889_gpio_bank[] =3D {
>  	F7188X_GPIO_BANK(0, 7, 0xF0),
>  	F7188X_GPIO_BANK(10, 7, 0xE0),
> @@ -382,6 +395,9 @@ static int f7188x_gpio_probe(struct platform_device *=
pdev)
>  		data->nr_bank =3D ARRAY_SIZE(f71882_gpio_bank);
>  		data->bank =3D f71882_gpio_bank;
>  		break;
> +	case f71889a:
> +		data->nr_bank =3D ARRAY_SIZE(f71889a_gpio_bank);
> +		data->bank =3D f71889a_gpio_bank;
>  	case f71889f:
>  		data->nr_bank =3D ARRAY_SIZE(f71889_gpio_bank);
>  		data->bank =3D f71889_gpio_bank;
> @@ -443,6 +459,9 @@ static int __init f7188x_find(int addr, struct f7188x=
_sio *sio)
>  	case SIO_F71882_ID:
>  		sio->type =3D f71882fg;
>  		break;
> +	case SIO_F71889A_ID:
> +		sio->type =3D f71889a;
> +		break;
>  	case SIO_F71889_ID:
>  		sio->type =3D f71889f;
>  		break;
> @@ -538,6 +557,6 @@ static void __exit f7188x_gpio_exit(void)
>  }
>  module_exit(f7188x_gpio_exit);
> =20
> -MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71=
882FG, F71889F and F81866");
> +MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71=
882FG, F71889A, F71889F and F81866");
>  MODULE_AUTHOR("Simon Guinot <simon.guinot@sequanux.org>");
>  MODULE_LICENSE("GPL");
> --=20
> 2.12.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljn/P4ACgkQgtp0PDeOcDqfxQCggeXVoSUTGVqlQV7XsXSzzbF/
tSUAn0iYUiwPeUlPHBtjMvuBOi12PzmO
=dSUf
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
