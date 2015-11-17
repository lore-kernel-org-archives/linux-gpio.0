From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [RFC PATCH] gpiolib: fix oops, if gpio name is NULL
Date: Tue, 17 Nov 2015 10:24:51 +0100
Message-ID: <35337129.pBjQytIvzF@adelgunde>
References: <1447245413-32209-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2530859.XqCpG3apNZ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:33944 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414AbbKQJYz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 04:24:55 -0500
In-Reply-To: <1447245413-32209-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


--nextPart2530859.XqCpG3apNZ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Wednesday 11 November 2015 14:36:53 Vladimir Zapolskiy wrote:
> Commit c0017ed71966 ("gpio: Introduce gpio descriptor 'name'") causes=

> OOPS on boot on LPC32xx boards:
>=20
>     Unable to handle kernel NULL pointer dereference at virtual addre=
ss 00000000
>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0+ #707
>     Hardware name: LPC32XX SoC (Flattened Device Tree)
>     task: c381baa0 ti: c381e000 task.ti: c381e000
>     PC is at strcmp+0x10/0x40
>     LR is at gpiochip_add+0x3d0/0x4d4
>     pc : [<>]    lr : [<>]    psr: a0000093
>     sp : c381fd60  ip : c381fd70  fp : c381fd6c
>=20
>     [snip]
>=20
>     Backtrace:
>     [<>] (strcmp) from [<>] (gpiochip_add+0x3d0/0x4d4)
>     [<>] (gpiochip_add) from [<>] (lpc32xx_gpio_probe+0x44/0x60)
>     [<>] (lpc32xx_gpio_probe) from [<>] (platform_drv_probe+0x40/0x8c=
)
>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x110/0x=
294)
>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x94)
>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
>     [<>] (driver_attach) from [<>] (bus_add_driver+0xd4/0x1f0)
>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
>     [<>] (driver_register) from [<>] (__platform_driver_register+0x38=
/0x4c)
>     [<>] (__platform_driver_register) from [<>] (lpc32xx_gpio_driver_=
init+0x18/0x20)
>     [<>] (lpc32xx_gpio_driver_init) from [<>] (do_one_initcall+0x108/=
0x1c8)
>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0x1d=
4)
>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
>=20
> This is caused by the fact that at the moment some GPIO names are set=

> to NULL, there is a hole in linear representation of one GPI bank, se=
e
> drivers/gpio/gpio-lpc32xx.c / gpi_p3_names[] for details.
>=20
> The same problem most probably affects also gpio-cs5535.c, see
> cs5535_gpio_names[].
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
> Linus, Markus,
>=20
> I understand that LPC32xx GPIO driver is ugly (hopefully this
> will be changed in future), but please account this problem.
>=20
> I don't ask for inclusion of this change, because my own analysis is
> not done completely.
>=20
> Also please review, the same problem probably affects gpio-cs5535.c
> as well, see cs5535_gpio_names[].

Thanks for this hint. But I think these patches for gpio_name_to_desc w=
on't get
mainline any time soon as this depends on the chardev interface and how=
 it will
look like.

Best Regards,

Markus

>=20
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a18f00f..2a91f32 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -233,7 +233,7 @@ static struct gpio_desc *gpio_name_to_desc(const =
char * const name)
>  =09=09for (i =3D 0; i !=3D chip->ngpio; ++i) {
>  =09=09=09struct gpio_desc *gpio =3D &chip->desc[i];
> =20
> -=09=09=09if (!gpio->name)
> +=09=09=09if (!gpio->name || !name)
>  =09=09=09=09continue;
> =20
>  =09=09=09if (!strcmp(gpio->name, name)) {
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2530859.XqCpG3apNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWSvJjAAoJEEpcgKtcEGQQSGsQALl4qH37/hV9bOE3HcP80j7r
QApulvTL8d9iRufBKJ36bwhKXbelg13UrHFqAeiwQO9I21U6oSRF6eSMakHd/RD9
OSMSAluPVHDk+yY2ZK2ZmXVXMQtqpnvz4Zvkbp2i+7CvQc4Zg1vaFA07GwBHFlGt
jVj9UUUhDVZySq08+gb7uL5D2U9AiGFChN2k3kCcDaa04lkV5/yrKs3MhxEP9hvm
OFPjHJZZ5elkMuZq5iEGJnxu5oFE7xuHv8Uoa9iLSq0wbLDDzfbVu6lobw07VDLh
xdOR93WVrZIJPRxW9PL/v/vqooaW/OYti3IPRvRzbBqBPgMboRrogBgAKTWaJA5D
yZ0brZBwuzT+YTPMcRcnKTArrOg+0iA2UPMWB4o7R4MpszyBHUx2WbguHPepP5J6
QhKpGzKgPzhQJOjt3hXohOvR8AJAyKq3hl4DRCnXZKXWHEJNLm6bsOxdrIULv8Ed
XXqnYnQp9+re2JJcuWByZCmKWi1+PCANda31Ls0e1HpyZxHS5sYKJY7f4ZEHesFr
AsffBlOISbOqe4/yuIw/E4lHYmoxrj2mW4k3GcKBy2mdaGGy/ndP1k1WRBd5ockv
lqcyQdkVjwmmafKxCy5wsFEBD946Z0ApqbG5AHIUUFlcfGEalrGhwTVzWqk/ECbv
To/oertbxYIatWBKGkhc
=Z4HA
-----END PGP SIGNATURE-----

--nextPart2530859.XqCpG3apNZ--

