From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH RFT 2/5] gpio: replace trivial implementations of
 request/free with generic one
Date: Mon, 14 Sep 2015 18:14:05 +0100
Message-ID: <20150914171405.GQ29072@jhogan-linux.le.imgtec.org>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rKoHqF+aPLVth8b2"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:51968 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752262AbbINRO5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2015 13:14:57 -0400
Content-Disposition: inline
In-Reply-To: <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>

--rKoHqF+aPLVth8b2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2015 at 03:21:35PM +0200, Jonas Gorski wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>=20
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/gpio/gpio-tz1090-pdc.c | 14 ++------------

For the tz1090-pdc bit:
Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pd=
c.c
> index ede7e40..3623d00 100644
> --- a/drivers/gpio/gpio-tz1090-pdc.c
> +++ b/drivers/gpio/gpio-tz1090-pdc.c
> @@ -137,16 +137,6 @@ static void tz1090_pdc_gpio_set(struct gpio_chip *ch=
ip, unsigned int offset,
>  	__global_unlock2(lstat);
>  }
> =20
> -static int tz1090_pdc_gpio_request(struct gpio_chip *chip, unsigned int =
offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void tz1090_pdc_gpio_free(struct gpio_chip *chip, unsigned int of=
fset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int tz1090_pdc_gpio_to_irq(struct gpio_chip *chip, unsigned int o=
ffset)
>  {
>  	struct tz1090_pdc_gpio *priv =3D to_pdc(chip);
> @@ -203,8 +193,8 @@ static int tz1090_pdc_gpio_probe(struct platform_devi=
ce *pdev)
>  	priv->chip.direction_output	=3D tz1090_pdc_gpio_direction_output;
>  	priv->chip.get			=3D tz1090_pdc_gpio_get;
>  	priv->chip.set			=3D tz1090_pdc_gpio_set;
> -	priv->chip.free			=3D tz1090_pdc_gpio_free;
> -	priv->chip.request		=3D tz1090_pdc_gpio_request;
> +	priv->chip.free			=3D gpiochip_generic_free;
> +	priv->chip.request		=3D gpiochip_generic_request;
>  	priv->chip.to_irq		=3D tz1090_pdc_gpio_to_irq;
>  	priv->chip.of_node		=3D np;
> =20

--rKoHqF+aPLVth8b2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJV9wBdAAoJEGwLaZPeOHZ6zu0P/0UGWy4hTivK7DUW3jpiIIbM
teMyaNPcWFykmwwGLR83jBHQnRxJAeLcbNHASsdOk9ytG5MYb4nfhsC7XYtWIjc5
M6VHGAEGEgfMYnzpCPRmnBsIBNQUpu0zTcBs4mqih5ziE3yuTxxJn2D1AlOhdpRK
LOi/noo9/kt8cMq7la3J8LZMXfCgeWNSOpRkIhJIw/YyqsKq7TWXmxNA5uIdgzHj
c+NTF/+iIfTTVmhSxzyawYDkfv7aFHQhzmj7oV+OKuOg+9m7jTp7F6cD/LU8UmZN
ts+ZAb4Fbjj1zuG9jblDpXaVV9L4kF251+Yb7IWg1fPfjlY3P+MJQW26Ew/B4YCI
4JGOnP36aiWEJI86ogRsgsHgw99aYTm6eJuCLQi8ayApzGGkbVVQK6gONaoN8BCh
ZUfeC05F0GjTz4hn80PI4YhL0nArb1JeBkCMXL7Z/KOOpDO7Zh2va09Kyp0Rzhrd
XLeRzPs68DUZ3ZjXvVtgdfQ9ycy7hZm12dbQ68wkaHhr5wuQMf6C9+erqBUISjIC
MAzz/9a34mGMcTXBn82yPMWZ58c9k/ZDic6ubp1RIWywVkxNRdQOvs3aXTd8PpmC
bazCp1o3XNec6/qi8LsxnKwGg14ycQN7uE6vEBEUGwpRfqSKvYQ3ekvxHaR3Qzzv
ez2IUsGVH28orNWA6T88
=CMqp
-----END PGP SIGNATURE-----

--rKoHqF+aPLVth8b2--
