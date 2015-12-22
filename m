From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 21/54] gpio: tx1090-pdc: Be sure to clamp return value
Date: Tue, 22 Dec 2015 21:11:03 +0000
Message-ID: <20151222211103.GI9801@jhogan-linux.le.imgtec.org>
References: <1450794444-23461-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:4786 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933779AbbLVVLF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 16:11:05 -0500
Content-Disposition: inline
In-Reply-To: <1450794444-23461-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 03:27:24PM +0100, Linus Walleij wrote:
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
>  drivers/gpio/gpio-tz1090-pdc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pd=
c.c
> index 0a01c8736aff..b08b22b1b111 100644
> --- a/drivers/gpio/gpio-tz1090-pdc.c
> +++ b/drivers/gpio/gpio-tz1090-pdc.c
> @@ -113,7 +113,7 @@ static int tz1090_pdc_gpio_direction_output(struct gp=
io_chip *chip,
>  static int tz1090_pdc_gpio_get(struct gpio_chip *chip, unsigned int offs=
et)
>  {
>  	struct tz1090_pdc_gpio *priv =3D to_pdc(chip);
> -	return pdc_read(priv, REG_SOC_GPIO_STATUS) & BIT(offset);
> +	return !!(pdc_read(priv, REG_SOC_GPIO_STATUS) & BIT(offset));
>  }
> =20
>  static void tz1090_pdc_gpio_set(struct gpio_chip *chip, unsigned int off=
set,
> --=20
> 2.4.3
>=20

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWebxnAAoJEGwLaZPeOHZ6+n4P/i7f5aHrQae5UOCdsrfQIpl7
6XaUYDhOkOdNmDpZwFfHSnxej+iBpHyDDgFNZpoP4h2GiZGCLj8xSP3s4mQ27wvS
CIIzrvg8r/+dPD5NIfi8v8AzCm963oBIZ0+URk/d1aVtrwLqQfTLxiwRT9bRFCTI
CbLsJJ6eU378DserLUnYqvfKkwWis/6iTLtP2SPx0QTyhDTteWBzge4yBXlSha7l
aAM/GpfXphAqo4fyfLKXKiyfJXIKqNZLXXjFr6qUjFFma2Q2MueAUsebkvXJznOz
ItvE458O5YuZwpZfGlyEZvEP1PdazYCUJlLDD4d3CEdzSsBS5kMjqWD9cUFz3n/I
stHNTGRDlE+qKN2VWaasmGRZnetGB2Qm569PW3DeXLN57yHo2Z7rCIH1n/fy1ZoP
moFFCQeiROZ2/AiuSOh7JWa3LpgEeN4Po4xT5HJAOO7rML1j87gqukGuX3kqU9X9
Wt/UWdI/HuGRlXy5qs0AbdI2n31oH/ILmGEz5lKslJtUheOVG641ykwJLRBR5hav
HkCkuuGc05GxHfJ1jEBD7SSYi2Ivd06WauZ5mpY5NW6V5n+lTJe2k7D+CzBwujlV
/UkaQxILX2Mu2cnvqFlDtcpnG772tWsOyLckhjQsGzoLTduqnn6wgX2+lIQ3Xkof
xf76LJlu0tGyu4+vrcQc
=we7p
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
