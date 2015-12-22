From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 20/54] gpio: tz1090: Be sure to clamp return value
Date: Tue, 22 Dec 2015 21:10:22 +0000
Message-ID: <20151222211021.GH9801@jhogan-linux.le.imgtec.org>
References: <1450794266-23370-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:56626 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933779AbbLVVKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 16:10:24 -0500
Content-Disposition: inline
In-Reply-To: <1450794266-23370-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 03:24:26PM +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: James Hogan <james.hogan@imgtec.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  drivers/gpio/gpio-tz1090.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
> index 79ef6e1ce568..a4a822542ac1 100644
> --- a/drivers/gpio/gpio-tz1090.c
> +++ b/drivers/gpio/gpio-tz1090.c
> @@ -214,7 +214,7 @@ static int tz1090_gpio_get(struct gpio_chip *chip, un=
signed int offset)
>  {
>  	struct tz1090_gpio_bank *bank =3D to_bank(chip);
> =20
> -	return tz1090_gpio_read_bit(bank, REG_GPIO_DIN, offset);
> +	return !!tz1090_gpio_read_bit(bank, REG_GPIO_DIN, offset);
>  }
> =20
>  /*
> --=20
> 2.4.3
>=20

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWebw9AAoJEGwLaZPeOHZ6I68QAKc662Zg3Xga+usD4sOyZG4T
mTGXCRdo31Rq/2qtU3lqsq7P0IYmQtKJpkr/7/rajj8jb5exqjQMYNy/4ZaBD8ZC
FUeBztAHSuNn7Kc+/F/q1gdztTyx1FXdxKRqcvzu0WjnrhOKw6CZ375mRrpGrNpA
2pIyaKxGyAjPekuhl+YahXQ5KvzRmdF7OR5yTe6iyoiU6enYZkKSK5XaqBJlDvFh
BZTByh3dLQ1oAjUKbxZJRxQ63MGnVSI08j2SSsBOjk5y0a/CBMdLV+V5B4A2dGMW
4AcDWP9a0CGXhFSwEGiHzVrPNk6gr1xd259qaWvMkWsi9hZrIJ1Vxy8P0fbmT/W7
KoWMRCV86rvcP5oFd1fu0X1uUm1s2SjuRdWSvVYdZYpjrlKDhnsQCrkC3g6lEjrh
hsyIST8hbERy2RJV1QGO2VlIS5Aj/xDX0K0Tyz5tC7Sy+He/iHk7GzBfxUpIakKv
PsmoW3BGTgLfqc7dCZwRD3IGhC/MZKt/Fm9VO3VLLM1wXsp7EnqAKEYgtnKZ8Pcm
MBphB7/L5hwRH9MOu1fPx1lbpBSqSThP9gErjdl2iTV1eGSNLUkyZxuUxvWPm830
AG5dBjka86tPoFsUIlPqS10BnicSfqCMgljKB3WrB1ir3aiKl5i8+aP88LcDzRfb
+z2YdsrkneTkCPr7GhAq
=43FI
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
