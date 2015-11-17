From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [RFC PATCH] gpiolib: fix oops, if gpio name is NULL
Date: Tue, 17 Nov 2015 12:50:42 +0100
Message-ID: <1556500.sdcUFi7dPa@adelgunde>
References: <1447245413-32209-1-git-send-email-vz@mleia.com> <35337129.pBjQytIvzF@adelgunde> <564B0D88.4000301@mleia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart17058580.2XjtrtOViC"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:35367 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbKQLuu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 06:50:50 -0500
In-Reply-To: <564B0D88.4000301@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


--nextPart17058580.2XjtrtOViC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Vladimir,

On Tuesday 17 November 2015 13:20:40 Vladimir Zapolskiy wrote:
> Hi Markus,
>=20
> On 17.11.2015 11:24, Markus Pargmann wrote:
> > Hi,
> >=20
> > On Wednesday 11 November 2015 14:36:53 Vladimir Zapolskiy wrote:
> >> Commit c0017ed71966 ("gpio: Introduce gpio descriptor 'name'") cau=
ses
> >> OOPS on boot on LPC32xx boards:
> >>
> >>     Unable to handle kernel NULL pointer dereference at virtual ad=
dress 00000000
> >>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0+ #707
> >>     Hardware name: LPC32XX SoC (Flattened Device Tree)
> >>     task: c381baa0 ti: c381e000 task.ti: c381e000
> >>     PC is at strcmp+0x10/0x40
> >>     LR is at gpiochip_add+0x3d0/0x4d4
> >>     pc : [<>]    lr : [<>]    psr: a0000093
> >>     sp : c381fd60  ip : c381fd70  fp : c381fd6c
> >>
> >>     [snip]
> >>
> >>     Backtrace:
> >>     [<>] (strcmp) from [<>] (gpiochip_add+0x3d0/0x4d4)
> >>     [<>] (gpiochip_add) from [<>] (lpc32xx_gpio_probe+0x44/0x60)
> >>     [<>] (lpc32xx_gpio_probe) from [<>] (platform_drv_probe+0x40/0=
x8c)
> >>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x110=
/0x294)
> >>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x9=
4)
> >>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
> >>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
> >>     [<>] (driver_attach) from [<>] (bus_add_driver+0xd4/0x1f0)
> >>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
> >>     [<>] (driver_register) from [<>] (__platform_driver_register+0=
x38/0x4c)
> >>     [<>] (__platform_driver_register) from [<>] (lpc32xx_gpio_driv=
er_init+0x18/0x20)
> >>     [<>] (lpc32xx_gpio_driver_init) from [<>] (do_one_initcall+0x1=
08/0x1c8)
> >>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0=
x1d4)
> >>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
> >>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
> >>
> >> This is caused by the fact that at the moment some GPIO names are =
set
> >> to NULL, there is a hole in linear representation of one GPI bank,=
 see
> >> drivers/gpio/gpio-lpc32xx.c / gpi_p3_names[] for details.
> >>
> >> The same problem most probably affects also gpio-cs5535.c, see
> >> cs5535_gpio_names[].
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> >> ---
> >> Linus, Markus,
> >>
> >> I understand that LPC32xx GPIO driver is ugly (hopefully this
> >> will be changed in future), but please account this problem.
> >>
> >> I don't ask for inclusion of this change, because my own analysis =
is
> >> not done completely.
> >>
> >> Also please review, the same problem probably affects gpio-cs5535.=
c
> >> as well, see cs5535_gpio_names[].
> >=20
> > Thanks for this hint. But I think these patches for gpio_name_to_de=
sc won't get
> > mainline any time soon as this depends on the chardev interface and=
 how it will
> > look like.
> >=20
>=20
> sorry for misunderstanding, what do mean by "these patches"?
>=20
> I see two options here, one is to fix or revert your c0017ed71966 due=
 to
> caused regressions, another one is to update affected GPIO drivers
> removing discontinuity in GPIO enumeration inside a bank.

Sorry, seems I was on a wrong kernel version when checking this morning=
. Linus
removed lots of my patches from his tree after some correct comments so=
 I
thought this patch was removed as well.

As it is mainline your patch looks good to me. Perhaps a comment on why=
 we need
to check for !name at this point would be good.

Best Regards,

Markus

>=20
> With best wishes,
> Vladimir
>=20
> >>
> >>  drivers/gpio/gpiolib.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >> index a18f00f..2a91f32 100644
> >> --- a/drivers/gpio/gpiolib.c
> >> +++ b/drivers/gpio/gpiolib.c
> >> @@ -233,7 +233,7 @@ static struct gpio_desc *gpio_name_to_desc(con=
st char * const name)
> >>  =09=09for (i =3D 0; i !=3D chip->ngpio; ++i) {
> >>  =09=09=09struct gpio_desc *gpio =3D &chip->desc[i];
> >> =20
> >> -=09=09=09if (!gpio->name)
> >> +=09=09=09if (!gpio->name || !name)
> >>  =09=09=09=09continue;
> >> =20
> >>  =09=09=09if (!strcmp(gpio->name, name)) {
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

--nextPart17058580.2XjtrtOViC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWSxSXAAoJEEpcgKtcEGQQC8AP/2DeMQr1P/4wgsCjCvkILhkH
iMOtFrWGM9uUXlG6aiCRwljL9WFlYaIeherdO1TF2izDvpUPEMd9qKQVmH2nTXPQ
uR0YnCtyBEGhdEEbS2eAbdi57kIv+N92w0iUuKSycxQExuHkMX24Vl0ax4bCsjWW
rWuHcGWju23RP0EqWZUJb2OtSrGCbzJCjGap3cmE26cAMA5gJ18HduDed8OR/jOQ
YL44beOElg+WakyAUcdHYFalk9/1rQXWFPQ3c6ZCilLXfy3F11BGlUB14G8chFhA
6SLi20yhDYd1SqbnBx17914m8ASKgeeBzrG9tx7aU5u/BmXSJkVWc2RlaqCLNTuM
3QiUWWcXn6l+TYa/tnh5PoqQT/Fl+ivKcNr3FoWNpr2R+7j76x1zufQJZOsBmdxj
6h6SGwC8eO+o5Q1UNHwtBIIQPYOINtzG8W6e1zoCOS4bfH1/ELpPEr7kXxaiJEoU
Zzle4eI0NnBs7YgJhpTq0+ouo7F7A8iOocvRICYJwuJX3jAGJqf74Zf5YbaQCy3Q
BvqS7+aYbobxFNKFxMWOzFDEOC/e3KsMl5Psd6lM9fgfotdxSHop/DIEJgbdyBd4
18CQckKevCzcMkPZb+ci7Ei5VOIn1z+aZ89GAr35UQud6kKuzKiY0o8qr2uVRqlm
insshq6PQq4oD9erRRG8
=v345
-----END PGP SIGNATURE-----

--nextPart17058580.2XjtrtOViC--

