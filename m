From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 166/182] mfd: tc6393xb: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:35:21 +0000
Message-ID: <20151210103521.GK17876@x1>
References: <1449668880-6404-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:33814 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752875AbbLJKfZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:35:25 -0500
Received: by mail-wm0-f45.google.com with SMTP id v187so25989094wmv.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:35:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668880-6404-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/mfd/tc6393xb.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
> index 8c84a513016b..a5253f9a5089 100644
> --- a/drivers/mfd/tc6393xb.c
> +++ b/drivers/mfd/tc6393xb.c
> @@ -24,7 +24,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/tmio.h>
>  #include <linux/mfd/tc6393xb.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> =20
>  #define SCR_REVID	0x08		/* b Revision ID	*/
> @@ -434,7 +434,7 @@ static struct mfd_cell tc6393xb_cells[] =3D {
>  static int tc6393xb_gpio_get(struct gpio_chip *chip,
>  		unsigned offset)
>  {
> -	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> +	struct tc6393xb *tc6393xb =3D gpiochip_get_data(chip);
> =20
>  	/* XXX: does dsr also represent inputs? */
>  	return tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
> @@ -444,7 +444,7 @@ static int tc6393xb_gpio_get(struct gpio_chip *ch=
ip,
>  static void __tc6393xb_gpio_set(struct gpio_chip *chip,
>  		unsigned offset, int value)
>  {
> -	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> +	struct tc6393xb *tc6393xb =3D gpiochip_get_data(chip);
>  	u8  dsr;
> =20
>  	dsr =3D tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8));
> @@ -459,7 +459,7 @@ static void __tc6393xb_gpio_set(struct gpio_chip =
*chip,
>  static void tc6393xb_gpio_set(struct gpio_chip *chip,
>  		unsigned offset, int value)
>  {
> -	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> +	struct tc6393xb *tc6393xb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&tc6393xb->lock, flags);
> @@ -472,7 +472,7 @@ static void tc6393xb_gpio_set(struct gpio_chip *c=
hip,
>  static int tc6393xb_gpio_direction_input(struct gpio_chip *chip,
>  			unsigned offset)
>  {
> -	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> +	struct tc6393xb *tc6393xb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
>  	u8 doecr;
> =20
> @@ -490,7 +490,7 @@ static int tc6393xb_gpio_direction_input(struct g=
pio_chip *chip,
>  static int tc6393xb_gpio_direction_output(struct gpio_chip *chip,
>  			unsigned offset, int value)
>  {
> -	struct tc6393xb *tc6393xb =3D container_of(chip, struct tc6393xb, g=
pio);
> +	struct tc6393xb *tc6393xb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
>  	u8 doecr;
> =20
> @@ -517,7 +517,7 @@ static int tc6393xb_register_gpio(struct tc6393xb=
 *tc6393xb, int gpio_base)
>  	tc6393xb->gpio.direction_input =3D tc6393xb_gpio_direction_input;
>  	tc6393xb->gpio.direction_output =3D tc6393xb_gpio_direction_output;
> =20
> -	return gpiochip_add(&tc6393xb->gpio);
> +	return gpiochip_add_data(&tc6393xb->gpio, tc6393xb);
>  }
> =20
>  /*------------------------------------------------------------------=
--------*/

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
