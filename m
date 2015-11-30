From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [RFC PATCH] gpiolib: fix oops, if gpio name is NULL
Date: Mon, 30 Nov 2015 10:51:25 +0100
Message-ID: <1681441.GQgjGhYvLn@adelgunde>
References: <1447245413-32209-1-git-send-email-vz@mleia.com> <1556500.sdcUFi7dPa@adelgunde> <565AF32E.2020307@mleia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2596408.6Q0bHURmG4"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:58042 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628AbbK3Jvf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 04:51:35 -0500
In-Reply-To: <565AF32E.2020307@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


--nextPart2596408.6Q0bHURmG4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Sunday 29 November 2015 14:44:30 Vladimir Zapolskiy wrote:
> Hi Linus,
>=20
> On 17.11.2015 13:50, Markus Pargmann wrote:
> > Hi Vladimir,
> >=20
> > On Tuesday 17 November 2015 13:20:40 Vladimir Zapolskiy wrote:
> >> Hi Markus,
> >>
> >> On 17.11.2015 11:24, Markus Pargmann wrote:
> >>> Hi,
> >>>
> >>> On Wednesday 11 November 2015 14:36:53 Vladimir Zapolskiy wrote:
> >>>> Commit c0017ed71966 ("gpio: Introduce gpio descriptor 'name'") c=
auses
> >>>> OOPS on boot on LPC32xx boards:
> >>>>
> >>>>     Unable to handle kernel NULL pointer dereference at virtual =
address 00000000
> >>>>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0+ #707
> >>>>     Hardware name: LPC32XX SoC (Flattened Device Tree)
> >>>>     task: c381baa0 ti: c381e000 task.ti: c381e000
> >>>>     PC is at strcmp+0x10/0x40
> >>>>     LR is at gpiochip_add+0x3d0/0x4d4
> >>>>     pc : [<>]    lr : [<>]    psr: a0000093
> >>>>     sp : c381fd60  ip : c381fd70  fp : c381fd6c
> >>>>
> >>>>     [snip]
> >>>>
> >>>>     Backtrace:
> >>>>     [<>] (strcmp) from [<>] (gpiochip_add+0x3d0/0x4d4)
> >>>>     [<>] (gpiochip_add) from [<>] (lpc32xx_gpio_probe+0x44/0x60)=

> >>>>     [<>] (lpc32xx_gpio_probe) from [<>] (platform_drv_probe+0x40=
/0x8c)
> >>>>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x1=
10/0x294)
> >>>>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0=
x94)
> >>>>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98=
)
> >>>>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
> >>>>     [<>] (driver_attach) from [<>] (bus_add_driver+0xd4/0x1f0)
> >>>>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
> >>>>     [<>] (driver_register) from [<>] (__platform_driver_register=
+0x38/0x4c)
> >>>>     [<>] (__platform_driver_register) from [<>] (lpc32xx_gpio_dr=
iver_init+0x18/0x20)
> >>>>     [<>] (lpc32xx_gpio_driver_init) from [<>] (do_one_initcall+0=
x108/0x1c8)
> >>>>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c=
/0x1d4)
> >>>>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec=
)
> >>>>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
> >>>>
> >>>> This is caused by the fact that at the moment some GPIO names ar=
e set
> >>>> to NULL, there is a hole in linear representation of one GPI ban=
k, see
> >>>> drivers/gpio/gpio-lpc32xx.c / gpi_p3_names[] for details.
> >>>>
> >>>> The same problem most probably affects also gpio-cs5535.c, see
> >>>> cs5535_gpio_names[].
> >>>>
> >>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> >>>> ---
> >>>> Linus, Markus,
> >>>>
> >>>> I understand that LPC32xx GPIO driver is ugly (hopefully this
> >>>> will be changed in future), but please account this problem.
> >>>>
> >>>> I don't ask for inclusion of this change, because my own analysi=
s is
> >>>> not done completely.
> >>>>
> >>>> Also please review, the same problem probably affects gpio-cs553=
5.c
> >>>> as well, see cs5535_gpio_names[].
> >>>
> >>> Thanks for this hint. But I think these patches for gpio_name_to_=
desc won't get
> >>> mainline any time soon as this depends on the chardev interface a=
nd how it will
> >>> look like.
> >>>
> >>
> >> sorry for misunderstanding, what do mean by "these patches"?
> >>
> >> I see two options here, one is to fix or revert your c0017ed71966 =
due to
> >> caused regressions, another one is to update affected GPIO drivers=

> >> removing discontinuity in GPIO enumeration inside a bank.
> >=20
> > Sorry, seems I was on a wrong kernel version when checking this mor=
ning. Linus
> > removed lots of my patches from his tree after some correct comment=
s so I
> > thought this patch was removed as well.
>=20
> Linus, should I resend this fix for v4.4 or is it good enough for
> application?
>=20
> > As it is mainline your patch looks good to me. Perhaps a comment on=
 why we need
> > to check for !name at this point would be good.
>=20
> There is such a description in the commit message, why this check is =
needed.

I meant a code comment. But that's not too important.

Best Regards,

Markus

>=20
> With best wishes,
> Vladimir
>=20
> > Best Regards,
> >=20
> > Markus
> >=20
> >>
> >> With best wishes,
> >> Vladimir
> >>
> >>>>
> >>>>  drivers/gpio/gpiolib.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >>>> index a18f00f..2a91f32 100644
> >>>> --- a/drivers/gpio/gpiolib.c
> >>>> +++ b/drivers/gpio/gpiolib.c
> >>>> @@ -233,7 +233,7 @@ static struct gpio_desc *gpio_name_to_desc(c=
onst char * const name)
> >>>>  =09=09for (i =3D 0; i !=3D chip->ngpio; ++i) {
> >>>>  =09=09=09struct gpio_desc *gpio =3D &chip->desc[i];
> >>>> =20
> >>>> -=09=09=09if (!gpio->name)
> >>>> +=09=09=09if (!gpio->name || !name)
> >>>>  =09=09=09=09continue;
> >>>> =20
> >>>>  =09=09=09if (!strcmp(gpio->name, name)) {
> >>>>
> >>>
> >>
> >=20
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

--nextPart2596408.6Q0bHURmG4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWXBwkAAoJEEpcgKtcEGQQU5YQAITMFI/BHS9z3sJLJ6tfLU4j
+rf8ijBrYGZFV7SeBbEa8U6pt/I4rQsgervoBI77ZkHTp5OedJj6SzNWWEsMXjMz
Yp0bs7Q2vBl+UI+YGGyic7d96lin53xCNzLD+cYWHUbsDN9aFy6IYg99vTuzm4Gc
EI/32XiMAVkjtC7jTcIiv96mu4Cl4lf9Xf3yACeDAU0rZSXW5BEZXNlsdw9suc45
S8HfIuUPDvfuBt9uGNsW7BWNJjGI4XCzSQduC+78/INNb1Mj5lzi10KdE1kBAZUj
X8umGWGdbbUtrC1thvd7yN6NhuOXYFU94WuJW6ybCKQy8Z0zD77gRSmqk6ELLmMN
gve0JyFEXbfKLC9WhThDU5qaT1tG1fGbLnHGXNWmjX8+Ban1xD73j0duPLuxUK2r
Pj1M5zvxiYM8OAn/gwjSWPUXXtJ+z9c6rNyN8pgcIPoN2lctQveF56mbYHEOdkva
AAsGrIqoqEDHTrf5IM2z5rEdSeZ1SR2cgfcX0xIl1MHROmXYDL3t2Co7YGC+eXXj
f8rjCoiRaN+CYyxEU9ZvgiQs2+UkzyJZWs8daAG0dS/pHZchb99CwvvbeUNvsVaQ
+5BzVq2GSX8iZ+22ESUalrEVq5Wz5sOnHDcKTc5ZPCdwvw8ZxCDAEjJxIf9T66b+
f31KZUljQMMxMeDuVuPD
=oioa
-----END PGP SIGNATURE-----

--nextPart2596408.6Q0bHURmG4--

