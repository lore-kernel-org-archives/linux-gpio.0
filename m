From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: lp3943: Drop pin_used and
 lp3943_gpio_request/lp3943_gpio_free
Date: Wed, 9 Mar 2016 12:37:03 +0700
Message-ID: <20160309053703.GO13692@x1>
References: <1456751299.25756.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34515 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752422AbcCIFhN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 00:37:13 -0500
Received: by mail-pf0-f180.google.com with SMTP id 129so31048581pfw.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 21:37:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1456751299.25756.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Milo Kim <milo.kim@ti.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Mon, 29 Feb 2016, Axel Lin wrote:

> The implementation of lp3943_gpio_request/lp3943_gpio_free test pin_u=
sed
> for tracing the pin usage. However, gpiolib already checks FLAG_REQUE=
STED
> flag for the same purpose. So remove the redundant implementation.
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-lp3943.c | 22 ----------------------
>  include/linux/mfd/lp3943.h |  6 ------
>  2 files changed, 28 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
> index 1c8e2ae..9d26ad4 100644
> --- a/drivers/gpio/gpio-lp3943.c
> +++ b/drivers/gpio/gpio-lp3943.c
> @@ -45,26 +45,6 @@ struct lp3943_gpio {
>  	u16 input_mask;		/* 1 =3D GPIO is input direction, 0 =3D output */
>  };
> =20
> -static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offs=
et)
> -{
> -	struct lp3943_gpio *lp3943_gpio =3D gpiochip_get_data(chip);
> -	struct lp3943 *lp3943 =3D lp3943_gpio->lp3943;
> -
> -	/* Return an error if the pin is already assigned */
> -	if (test_and_set_bit(offset, &lp3943->pin_used))
> -		return -EBUSY;
> -
> -	return 0;
> -}
> -
> -static void lp3943_gpio_free(struct gpio_chip *chip, unsigned offset=
)
> -{
> -	struct lp3943_gpio *lp3943_gpio =3D gpiochip_get_data(chip);
> -	struct lp3943 *lp3943 =3D lp3943_gpio->lp3943;
> -
> -	clear_bit(offset, &lp3943->pin_used);
> -}
> -
>  static int lp3943_gpio_set_mode(struct lp3943_gpio *lp3943_gpio, u8 =
offset,
>  				u8 val)
>  {
> @@ -177,8 +157,6 @@ static int lp3943_gpio_direction_output(struct gp=
io_chip *chip, unsigned offset,
>  static const struct gpio_chip lp3943_gpio_chip =3D {
>  	.label			=3D "lp3943",
>  	.owner			=3D THIS_MODULE,
> -	.request		=3D lp3943_gpio_request,
> -	.free			=3D lp3943_gpio_free,
>  	.direction_input	=3D lp3943_gpio_direction_input,
>  	.get			=3D lp3943_gpio_get,
>  	.direction_output	=3D lp3943_gpio_direction_output,
> diff --git a/include/linux/mfd/lp3943.h b/include/linux/mfd/lp3943.h
> index 3490db7..d3a73811 100644
> --- a/include/linux/mfd/lp3943.h
> +++ b/include/linux/mfd/lp3943.h
> @@ -94,18 +94,12 @@ struct lp3943_reg_cfg {
>   * @regmap: Used for I2C communication on accessing registers
>   * @pdata: LP3943 platform specific data
>   * @mux_cfg: Register configuration for pin MUX
> - * @pin_used: Bit mask for output pin used.
> - *	      This bitmask is used for pin assignment management.
> - *	      1 =3D pin used, 0 =3D available.
> - *	      Only LSB 16 bits are used, but it is unsigned long type
> - *	      for atomic bitwise operations.
>   */
>  struct lp3943 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	struct lp3943_platform_data *pdata;
>  	const struct lp3943_reg_cfg *mux_cfg;
> -	unsigned long pin_used;
>  };
> =20
>  int lp3943_read_byte(struct lp3943 *lp3943, u8 reg, u8 *read);

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
