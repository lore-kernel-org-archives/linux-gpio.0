From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of gpio_chip request/free
Date: Mon, 14 Sep 2015 07:18:04 -0700
Message-ID: <87zj0pjd9f.fsf@eliezer.anholt.net>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org> <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:60757 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752396AbbINOSL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2015 10:18:11 -0400
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>He

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jonas Gorski <jogo@openwrt.org> writes:
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/=
pinctrl-bcm2835.c
> index 8efa235..a1ea565 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -330,16 +330,6 @@ static inline void bcm2835_pinctrl_fsel_set(
>  	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
>  }
>=20=20
> -static int bcm2835_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void bcm2835_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned=
 offset)
>  {
>  	return pinctrl_gpio_direction_input(chip->base + offset);
> @@ -375,8 +365,8 @@ static int bcm2835_gpio_to_irq(struct gpio_chip *chip=
, unsigned offset)
>  static struct gpio_chip bcm2835_gpio_chip =3D {
>  	.label =3D MODULE_NAME,
>  	.owner =3D THIS_MODULE,
> -	.request =3D bcm2835_gpio_request,
> -	.free =3D bcm2835_gpio_free,
> +	.request =3D gpiochip_generic_request,
> +	.free =3D gpiochip_generic_free,
>  	.direction_input =3D bcm2835_gpio_direction_input,
>  	.direction_output =3D bcm2835_gpio_direction_output,
>  	.get =3D bcm2835_gpio_get,

For the bcm2835 part,

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV9tcdAAoJELXWKTbR/J7oCvwP/R4Pb8IhztwXz/zY1oyhjjs7
HpSHVz5V09uInMhbGREV8OUlIzAUvJRBkOVwlV80TWG4RizEtSRqR9vJtpRGXl3O
VVX2LHSbLlt2dAnXMxnnrd0wPqEr3TN6BnYXKSlWxXfmhoiS70puD/TTWJdCRMZt
1KZso0t9RLP8IuFwT3OQN7tXVHXXTSjKHCAB6Zdkcu8lB+zFBA/xhhM6XDeC/puP
0bfuZnxPsy/n733Qu4mAI1LVif8m4LEICcHYq2hWpmi6hxgQonZR0MdDgHSF4rFV
8alPWfOjWxZ63seKRzdoMJtMrplkMXe2nEV8vX/b2vSeYexvLvV3Xr0ZFenvlhIe
fZSSpN8kGCfLpbUsyqW3OR7l9SAEBK7z6ddHRZ43YUk0hVesbf6S4CUtzYtpF4Rv
Z8rX78zUeyapuFNbGcfwtMDhEcP6VAinSn+UJDfi+zReKyY/ENs2epYhp9KCeyWL
Y7yWlwQlP35GS0tHdx1rSCfsq4rOClcaJb+bsG2ChHzlsLDt/JxHyqTdLnr7AlzB
0zLBoT2YAC+ZZEo3LxRL6HiPRXLXsphvbCxNLyy1p/nyI7jXwSNVpThcXw5arp8K
rFvo18f2RRK3K85/5QatfUyoarLsDYXIFEINh/FU2/1/5rEK8ThDyuke19AiTb3I
YgUm4lOxNA5QEE7sR7Qr
=Cva/
-----END PGP SIGNATURE-----
--=-=-=--
