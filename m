From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v1] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Mon, 3 Jul 2017 20:21:10 +0200
Message-ID: <20170703182110.4fj4slqzjhio6qzz@earth>
References: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vppuydrjnolcox3p"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53176 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbdGCSVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 14:21:14 -0400
Content-Disposition: inline
In-Reply-To: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>


--vppuydrjnolcox3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 03, 2017 at 08:45:30PM +0300, Andy Shevchenko wrote:
> i2c_smbus commands handle the correct byte order for smbus transactions
> internally. This will currently result in incorrect operation on big
> endian systems.
>=20
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

>  drivers/gpio/gpio-pca953x.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 4c9e21300a26..1b9dbf691ae7 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -187,10 +187,9 @@ static int pca953x_write_regs_8(struct pca953x_chip =
*chip, int reg, u8 *val)
> =20
>  static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 =
*val)
>  {
> -	__le16 word =3D cpu_to_le16(get_unaligned((u16 *)val));
> +	u16 word =3D get_unaligned((u16 *)val);
> =20
> -	return i2c_smbus_write_word_data(chip->client,
> -					 reg << 1, (__force u16)word);
> +	return i2c_smbus_write_word_data(chip->client, reg << 1, word);
>  }
> =20
>  static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 =
*val)
> @@ -241,8 +240,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *=
chip, int reg, u8 *val)
>  	int ret;
> =20
>  	ret =3D i2c_smbus_read_word_data(chip->client, reg << 1);
> -	val[0] =3D (u16)ret & 0xFF;
> -	val[1] =3D (u16)ret >> 8;
> +	put_unaligned(ret, (u16 *)val);
> =20
>  	return ret;
>  }
> --=20
> 2.11.0
>=20

--vppuydrjnolcox3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAllaixYACgkQ2O7X88g7
+prNmhAApSAPyAcNvcTSClB9HfAzpsxRRjwHLloOxy82oobz/3DibWGgmHEY22tY
06Mnvcxyefdx1AbJuVv8E9ZO9H1ymVJ9IVyORQ3xQbsz2QS2yqcdo5WtRDWCL2X1
XE+1+od6X/wThIEykXfmKVUUpclAbrGTf6pBqcV60bB/8UjYx3Ahp56W+NMH2ybs
JTRTVTxECVy/zJlVAjeuu1F5c9a2jo2C1cP3VySHfhgJ1niLd1ej1NTTB+t4Adm3
50MftV1P5erpr+Wh+GQK4/c4Kqkkg8Sc+Uo442k5SRWSMuFVmudppLMGdc6rbuwl
HIm6akcDXNBpiHuEX4z9Gpcb6cewzZIPonUAPoDC00Tq+NHuiBTvLcTKsBy5LmMr
WD1qi3dQnGM5QsrVCyTRNub/2s6Oia1BWsoqcNi46aYFzFJ5mDIzLwP/kPXlKBto
QtKjVKVFe8t1DvSxUEvqYcjAt6aLIiocGDAhyfhtKx9W+E2XVN5lbP5jurpRs1Tb
gTywUjMpPB0wk397lrBtD7XKJ7EtAQJlSV8mq3TN8fCp7QoPkl5COXvvw2pvuwog
YcMPIPxXj5M38BccNP8tpDaYEGKAjT14k0pINa1G1MweOOXPX/W9S7uu7Sj9xLE/
vjILxWWUqyRiEWXM08YOsF/BMB/2t01sKQfdWE6ws4ihx0pLpmU=
=mi7B
-----END PGP SIGNATURE-----

--vppuydrjnolcox3p--
