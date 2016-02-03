From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: phy: generic: use forward declarations instead of #includes
Date: Wed, 03 Feb 2016 20:18:02 +0200
Message-ID: <87io25psit.fsf@ti.com>
References: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com> <20160202200237.11646.40985.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:34086 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933435AbcBCSSI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 13:18:08 -0500
In-Reply-To: <20160202200237.11646.40985.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Bjorn Helgaas <bhelgaas@google.com> writes:
> In include/linux/usb/usb_phy_generic.h, use a forward declaration for
> struct gpio_desc instead of including linux/gpio/consumer.h.
>
> Of the files that include usb_phy_generic.h, only
> drivers/usb/phy/phy-generic.c uses the gpiod_*() interfaces from
> linux/gpio/consumer.h, so include consumer.h explicitly there.
>
> This is a little more efficient and ensures that users of the gpiod
> interfaces include linux/gpio/consumer.h directly rather than getting it
> accidentally via linux/usb/usb_phy_generic.h.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/usb/phy/phy-generic.c       |    1 +
>  include/linux/usb/usb_phy_generic.h |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
> index 5320cb8..2c1349e 100644
> --- a/drivers/usb/phy/phy-generic.c
> +++ b/drivers/usb/phy/phy-generic.c
> @@ -36,6 +36,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>=20=20
>  #include "phy-generic.h"
> diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_=
phy_generic.h
> index c13632d5..45c20060 100644
> --- a/include/linux/usb/usb_phy_generic.h
> +++ b/include/linux/usb/usb_phy_generic.h
> @@ -2,7 +2,8 @@
>  #define __LINUX_USB_NOP_XCEIV_H
>=20=20
>  #include <linux/usb/otg.h>
> -#include <linux/gpio/consumer.h>
> +
> +struct gpio_desc;

then someone decides to rename struct gpio_desc and this just becomes
yet another place to fix. Why is this any better than just including the
header ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWskRaAAoJEIaOsuA1yqREaB8QAJKQ6g3jVKDmEYe96ePDpYuY
u7Rx1MR1O8nur1ebc4M/YvsiZ7FMS7vLpQcyBGytOPzfZSLQQeBy+a9TOC5f1V2K
jqK84BgzcFHL/oyqRYAB4DD2snnVH6gguNn6rWp1OPDXW8XTfmH1KmGhb8+KFgpz
MFrGHeBp4L5lOaGjEdfWeyanOdWxWjJwqPSj0u5XzRweW7/lUJbimwmpicKu920z
sJOg729xrf/jfPrAVwHUdazidUp+U0zvL0J3sso37eSwo3K4cmzvKvW3dhXgxXuJ
C20ihRDBxXLcbvFbSwfEAWWXz7GZnPn4IJj3EbXnshZPFv1TrJdzyg7pNuD8X1nU
PAcDfC+eNXO6PzUMTTWj1p2s7s30LSxH//qwqM2GYAVA5i/AfAwKxoiWdX25rGZ5
y1o9ABX3XdiPpYplefG+yjFFb6RUslYUy1nUaJxpnuO93/PG0WUSHc4PQHuJvV+Z
qHRK/lP5Ri9xt+glcNtAg/dBdz/DycAkTSxwz2EOAFU0ga9NkUfHk1SsK8a01AZq
XprBMxWs0yaYMDp44x9doKF5ZmVrFo6ZFuHiY6WBMVxfkwGnFfJW8YCFEfYymFEu
psuSsBBBpZx46gKmoRqygEfur8QAY5GyDmEmH4T6DfVzkvJRgWqKiaNrWQzkFVX/
bldHemRnWwy6uXhs35iw
=aoMB
-----END PGP SIGNATURE-----
--=-=-=--
