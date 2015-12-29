From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 51/54] fbdev: via-gpio: Be sure to clamp return value
Date: Tue, 29 Dec 2015 14:17:19 +0200
Message-ID: <568279CF.3080300@ti.com>
References: <1450795781-28534-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="gcGavun6i4odvWHkjbTRgWDoUbjUmqV2a"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:55197 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751646AbbL2MR1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Dec 2015 07:17:27 -0500
In-Reply-To: <1450795781-28534-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

--gcGavun6i4odvWHkjbTRgWDoUbjUmqV2a
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/12/15 16:49, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Tomi: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/video/fbdev/via/via-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/v=
ia/via-gpio.c
> index 6f433b8cee12..3d3544036bc1 100644
> --- a/drivers/video/fbdev/via/via-gpio.c
> +++ b/drivers/video/fbdev/via/via-gpio.c
> @@ -142,7 +142,7 @@ static int via_gpio_get(struct gpio_chip *chip, uns=
igned int nr)
>  	gpio =3D cfg->active_gpios[nr];
>  	reg =3D via_read_reg(VIASR, gpio->vg_port_index);
>  	spin_unlock_irqrestore(&cfg->vdev->reg_lock, flags);
> -	return reg & (0x04 << gpio->vg_mask_shift);
> +	return !!(reg & (0x04 << gpio->vg_mask_shift));
>  }

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--gcGavun6i4odvWHkjbTRgWDoUbjUmqV2a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWgnnPAAoJEPo9qoy8lh71nhYQAK/US0/cBPOj/M7wukle7fYz
WLlfKfPcCQtZMoQ5yzOU5YL7vfFXAJCPZHh7FO4qfkYrOp9MonBbKjM8w4MFTBMq
RgAUySxyD8/+tEdlkaYUpnNHNJ2+DPGJgvKiA95Cvf6tc3sDPfugukgSpDFFFugU
53Uoi+CIqHdqPY8QBmXwQfRtR9JXzH2oTiXe7xm8mYtcgK69be5PkV7bEKo2eHFX
TjlEv94Sz0gFiqHKrPUtFaLpkM0LCPkd0YTpi+JS3NYL4/0BsX7rviuhrJvqg3cN
aBSAFTMl06BM8pVBrxc2fsNvTeMssI0PYHSUqiZTBdx1u9QEm6wRuvbaN9BNvu3D
v5Y8VZBD1MfK6pxSyobT6I+/W3YsiJYMQb8NZQPFvY8TOT/zufeC5BL2N32jLmdi
vqx+y85Zp0tAwzJCHEzIXkVwRBvPtkPi3jVjX4S9JorlGHUlO/eTXneXFzG47DFa
x2BmSffyBpfC9Zz4wYDD2JhzYVqwkkwjy/KG0KVXO9oYYrdAG/vDNDQBQKFhrhbT
Y8T3M9/W1moO7XEeo98Y6I6pn8w0BFU6IneR1Hdk2Cj9IY4JdRioXh9Y8xktsOpl
j/tlQnlpN4zmr5/3Qq/a/VxIOhKsUYRrsdblkGntLljfKahN24bAlI51Y+rDhLxR
VaK+Z+SjCCio3wJM+igs
=H+Kf
-----END PGP SIGNATURE-----

--gcGavun6i4odvWHkjbTRgWDoUbjUmqV2a--
