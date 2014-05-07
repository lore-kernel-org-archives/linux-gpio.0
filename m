From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 6/7] gpio: xilinx: Make of_device_id array const
Date: Wed, 07 May 2014 13:25:05 +0200
Message-ID: <536A1811.2090404@monstr.eu>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com> <022c01cf69d3$e43d6b00$acb84100$%han@samsung.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KrTen81UfpwSUH4olhcUQCPIqWIpTwONR"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:64298 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755468AbaEGLZI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 07:25:08 -0400
Received: by mail-qg0-f43.google.com with SMTP id 63so886260qgz.30
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2014 04:25:08 -0700 (PDT)
In-Reply-To: <022c01cf69d3$e43d6b00$acb84100$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KrTen81UfpwSUH4olhcUQCPIqWIpTwONR
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/07/2014 11:08 AM, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions
> handle it as const.
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/gpio/gpio-xilinx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 792a05a..1248186 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -289,7 +289,7 @@ static int xgpio_of_probe(struct device_node *np)
>  	return 0;
>  }
> =20
> -static struct of_device_id xgpio_of_match[] =3D {
> +static const struct of_device_id xgpio_of_match[] =3D {
>  	{ .compatible =3D "xlnx,xps-gpio-1.00.a", },
>  	{ /* end of list */ },
>  };
>=20

Reviewed-by: Michal Simek <monstr@monstr.eu>

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--KrTen81UfpwSUH4olhcUQCPIqWIpTwONR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNqGBEACgkQykllyylKDCH61ACfcED6wdUSjfEVeyN7izgHQXEt
+gwAoJJ+iVNnpCDnSPu+3N4HB70uq6cl
=OxZK
-----END PGP SIGNATURE-----

--KrTen81UfpwSUH4olhcUQCPIqWIpTwONR--
