From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 168/182] mfd: ucb1x00: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:34:43 +0000
Message-ID: <20151210103443.GI17876@x1>
References: <1449668897-6498-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37536 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbLJKer (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:34:47 -0500
Received: by wmww144 with SMTP id w144so18436712wmw.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:34:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668897-6498-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/mfd/ucb1x00-core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index a6ec7cc0fac6..84d0757b8c5d 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c
> @@ -28,7 +28,7 @@
>  #include <linux/mutex.h>
>  #include <linux/mfd/ucb1x00.h>
>  #include <linux/pm.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> =20
>  static DEFINE_MUTEX(ucb1x00_mutex);
>  static LIST_HEAD(ucb1x00_drivers);
> @@ -109,7 +109,7 @@ unsigned int ucb1x00_io_read(struct ucb1x00 *ucb)
> =20
>  static void ucb1x00_gpio_set(struct gpio_chip *chip, unsigned offset=
, int value)
>  {
> -	struct ucb1x00 *ucb =3D container_of(chip, struct ucb1x00, gpio);
> +	struct ucb1x00 *ucb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&ucb->io_lock, flags);
> @@ -126,7 +126,7 @@ static void ucb1x00_gpio_set(struct gpio_chip *ch=
ip, unsigned offset, int value)
> =20
>  static int ucb1x00_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct ucb1x00 *ucb =3D container_of(chip, struct ucb1x00, gpio);
> +	struct ucb1x00 *ucb =3D gpiochip_get_data(chip);
>  	unsigned val;
> =20
>  	ucb1x00_enable(ucb);
> @@ -138,7 +138,7 @@ static int ucb1x00_gpio_get(struct gpio_chip *chi=
p, unsigned offset)
> =20
>  static int ucb1x00_gpio_direction_input(struct gpio_chip *chip, unsi=
gned offset)
>  {
> -	struct ucb1x00 *ucb =3D container_of(chip, struct ucb1x00, gpio);
> +	struct ucb1x00 *ucb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&ucb->io_lock, flags);
> @@ -154,7 +154,7 @@ static int ucb1x00_gpio_direction_input(struct gp=
io_chip *chip, unsigned offset)
>  static int ucb1x00_gpio_direction_output(struct gpio_chip *chip, uns=
igned offset
>  		, int value)
>  {
> -	struct ucb1x00 *ucb =3D container_of(chip, struct ucb1x00, gpio);
> +	struct ucb1x00 *ucb =3D gpiochip_get_data(chip);
>  	unsigned long flags;
>  	unsigned old, mask =3D 1 << offset;
> =20
> @@ -181,7 +181,7 @@ static int ucb1x00_gpio_direction_output(struct g=
pio_chip *chip, unsigned offset
> =20
>  static int ucb1x00_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct ucb1x00 *ucb =3D container_of(chip, struct ucb1x00, gpio);
> +	struct ucb1x00 *ucb =3D gpiochip_get_data(chip);
> =20
>  	return ucb->irq_base > 0 ? ucb->irq_base + offset : -ENXIO;
>  }
> @@ -579,7 +579,7 @@ static int ucb1x00_probe(struct mcp *mcp)
>  		ucb->gpio.direction_input =3D ucb1x00_gpio_direction_input;
>  		ucb->gpio.direction_output =3D ucb1x00_gpio_direction_output;
>  		ucb->gpio.to_irq =3D ucb1x00_to_irq;
> -		ret =3D gpiochip_add(&ucb->gpio);
> +		ret =3D gpiochip_add_data(&ucb->gpio, ucb);
>  		if (ret)
>  			goto err_gpio_add;
>  	} else

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
