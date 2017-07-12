From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: constify gpio_chip structure
Date: Wed, 12 Jul 2017 12:13:16 -0700
Message-ID: <877ezdh3jn.fsf@eliezer.anholt.net>
References: <20170711180339.GA17806@embeddedgus>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711180339.GA17806@embeddedgus>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"Gustavo A. R. Silva" <garsilva@embeddedor.com> writes:

> This structure is only used to copy into other structure, so declare
> it as const.
>
> This issue was detected using Coccinelle and the following semantic patch:

Acked-by: Eric Anholt <eric@anholt.net>

> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/=
pinctrl-bcm2835.c
> index 2308831..7203f35 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -353,7 +353,7 @@ static int bcm2835_gpio_direction_output(struct gpio_=
chip *chip,
>  	return pinctrl_gpio_direction_output(chip->base + offset);
>  }
>=20=20
> -static struct gpio_chip bcm2835_gpio_chip =3D {
> +static const struct gpio_chip bcm2835_gpio_chip =3D {
>  	.label =3D MODULE_NAME,
>  	.owner =3D THIS_MODULE,
>  	.request =3D gpiochip_generic_request,
> --=20
> 2.5.0

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllmdMwACgkQtdYpNtH8
nujrBw//Wu0Vzjvywk83+sBYa6g9f0m26C3xHKjPzLxFzMI1d1OZkZLrXJ0BV7yt
44v3mC63t1tswWSiQZyr+jUUmyxknWTBFrZ2LibmMPkfZ3Ub8kTzR+KsMMND1k+E
Hcg/akWgare55an1jPWC6iWU592WNWRa3hfBq8BHoG2nGftZNk9c2chUJvR2+Hvp
Grp2b11ElIyPA+C72D1A1De0N5qRUNpNqQwO+C+knLhzqj+xJz9TAUIuGZQcjESM
VF0TU+KGIooWljOhLRbTG+VM4AFTeVKlWJnDUxDz4PD52lmklXZp6QSScZVz74ys
tIcYGWCD3L/GFHanuLf2+nABHySPZWASEvURY47oUXPDa82fup45+63KaCy3ATsW
bcOscT1bo2T2RXS0Qh8bLUiMqPsywEVEomUisUjnc6kvsirxfaqznNvEipOJBSYc
Qi6yqdDAjEllEYqBL50tbpyXhaIEdLFMYx8UZY+iNd5qVBqswuA60wkiDZ9CNXe6
rXMFvEx1CeSd7eRlk1ovgHix6uS1JqhV19fycGmJjHShlazoO1JU6LvtAIgopjYP
SwK+qE6vzlwTu4L9WkUi3rOI/GfRfPDWRcLQTRswN31VX62JjS0rEJ+NpZ2j/gDY
KVleijhEnnV8xi0gI8unaJz3RTzbX+kaEiri4ki7DncGEmZmo2U=
=tlDz
-----END PGP SIGNATURE-----
--=-=-=--
