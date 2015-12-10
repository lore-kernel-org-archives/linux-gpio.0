From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 165/182] mfd: sm501: use gpiochip data pointer
Date: Thu, 10 Dec 2015 10:35:38 +0000
Message-ID: <20151210103538.GL17876@x1>
References: <1449668873-6354-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:34938 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752559AbbLJKfn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:35:43 -0500
Received: by mail-wm0-f43.google.com with SMTP id u63so17673426wmu.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:35:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668873-6354-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ben Dooks <ben@fluff.org.uk>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Ben Dooks <ben@fluff.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/mfd/sm501.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index c646784c5a7d..65cd0d2a822a 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -879,11 +879,6 @@ static int sm501_register_display(struct sm501_d=
evdata *sm,
> =20
>  #ifdef CONFIG_MFD_SM501_GPIO
> =20
> -static inline struct sm501_gpio_chip *to_sm501_gpio(struct gpio_chip=
 *gc)
> -{
> -	return container_of(gc, struct sm501_gpio_chip, gpio);
> -}
> -
>  static inline struct sm501_devdata *sm501_gpio_to_dev(struct sm501_g=
pio *gpio)
>  {
>  	return container_of(gpio, struct sm501_devdata, gpio);
> @@ -892,7 +887,7 @@ static inline struct sm501_devdata *sm501_gpio_to=
_dev(struct sm501_gpio *gpio)
>  static int sm501_gpio_get(struct gpio_chip *chip, unsigned offset)
> =20
>  {
> -	struct sm501_gpio_chip *smgpio =3D to_sm501_gpio(chip);
> +	struct sm501_gpio_chip *smgpio =3D gpiochip_get_data(chip);
>  	unsigned long result;
> =20
>  	result =3D smc501_readl(smgpio->regbase + SM501_GPIO_DATA_LOW);
> @@ -923,7 +918,7 @@ static void sm501_gpio_ensure_gpio(struct sm501_g=
pio_chip *smchip,
>  static void sm501_gpio_set(struct gpio_chip *chip, unsigned offset, =
int value)
> =20
>  {
> -	struct sm501_gpio_chip *smchip =3D to_sm501_gpio(chip);
> +	struct sm501_gpio_chip *smchip =3D gpiochip_get_data(chip);
>  	struct sm501_gpio *smgpio =3D smchip->ourgpio;
>  	unsigned long bit =3D 1 << offset;
>  	void __iomem *regs =3D smchip->regbase;
> @@ -948,7 +943,7 @@ static void sm501_gpio_set(struct gpio_chip *chip=
, unsigned offset, int value)
> =20
>  static int sm501_gpio_input(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct sm501_gpio_chip *smchip =3D to_sm501_gpio(chip);
> +	struct sm501_gpio_chip *smchip =3D gpiochip_get_data(chip);
>  	struct sm501_gpio *smgpio =3D smchip->ourgpio;
>  	void __iomem *regs =3D smchip->regbase;
>  	unsigned long bit =3D 1 << offset;
> @@ -974,7 +969,7 @@ static int sm501_gpio_input(struct gpio_chip *chi=
p, unsigned offset)
>  static int sm501_gpio_output(struct gpio_chip *chip,
>  			     unsigned offset, int value)
>  {
> -	struct sm501_gpio_chip *smchip =3D to_sm501_gpio(chip);
> +	struct sm501_gpio_chip *smchip =3D gpiochip_get_data(chip);
>  	struct sm501_gpio *smgpio =3D smchip->ourgpio;
>  	unsigned long bit =3D 1 << offset;
>  	void __iomem *regs =3D smchip->regbase;
> @@ -1039,7 +1034,7 @@ static int sm501_gpio_register_chip(struct sm50=
1_devdata *sm,
>  	gchip->base   =3D base;
>  	chip->ourgpio =3D gpio;
> =20
> -	return gpiochip_add(gchip);
> +	return gpiochip_add_data(gchip, chip);
>  }
> =20
>  static int sm501_register_gpio(struct sm501_devdata *sm)

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
