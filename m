From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] gpio: max732x: use an inline function for container cast
Date: Fri, 30 Jan 2015 12:03:44 +0000
Message-ID: <yw1xd25wbhlr.fsf@unicorn.mansr.com>
References: <1422614754-5391-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:56129 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752796AbbA3MDw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 07:03:52 -0500
In-Reply-To: <1422614754-5391-1-git-send-email-linus.walleij@linaro.org>
	(Linus Walleij's message of "Fri, 30 Jan 2015 11:45:54 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Semen Protsenko <semen.protsenko@globallogic.com>

Linus Walleij <linus.walleij@linaro.org> writes:

> Cast the struct gpio_chip into a max732x_chip using an inline
> macro and move the assignment to the variable declaration
> to save lines and simplify things.
>
> Cc: Semen Protsenko <semen.protsenko@globallogic.com>
> Cc: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Mans Rullgard <mans@mansr.com>

> --- drivers/gpio/gpio-max732x.c | 25 ++++++++++--------------- 1 file
> changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.=
c
> index 745698d977a5..a095b2393fe9 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -161,6 +161,11 @@ struct max732x_chip {
>  #endif
>  };
>
> +static inline struct max732x_chip *to_max732x(struct gpio_chip *gc)
> +{
> +	return container_of(gc, struct max732x_chip, gpio_chip);
> +}
> +
>  static int max732x_writeb(struct max732x_chip *chip, int group_a, ui=
nt8_t val)
>  {
>  	struct i2c_client *client;
> @@ -199,12 +204,10 @@ static inline int is_group_a(struct max732x_chi=
p *chip, unsigned off)
>
>  static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off=
)
>  {
> -	struct max732x_chip *chip;
> +	struct max732x_chip *chip =3D to_max732x(gc);
>  	uint8_t reg_val;
>  	int ret;
>
> -	chip =3D container_of(gc, struct max732x_chip, gpio_chip);
> -
>  	ret =3D max732x_readb(chip, is_group_a(chip, off), &reg_val);
>  	if (ret < 0)
>  		return 0;
> @@ -215,12 +218,10 @@ static int max732x_gpio_get_value(struct gpio_c=
hip *gc, unsigned off)
>  static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off=
, int mask,
>  				  int val)
>  {
> -	struct max732x_chip *chip;
> +	struct max732x_chip *chip =3D to_max732x(gc);
>  	uint8_t reg_out;
>  	int ret;
>
> -	chip =3D container_of(gc, struct max732x_chip, gpio_chip);
> -
>  	mutex_lock(&chip->lock);
>
>  	reg_out =3D (off > 7) ? chip->reg_out[1] : chip->reg_out[0];
> @@ -261,11 +262,9 @@ static void max732x_gpio_set_multiple(struct gpi=
o_chip *gc,
>
>  static int max732x_gpio_direction_input(struct gpio_chip *gc, unsign=
ed off)
>  {
> -	struct max732x_chip *chip;
> +	struct max732x_chip *chip =3D to_max732x(gc);
>  	unsigned int mask =3D 1u << off;
>
> -	chip =3D container_of(gc, struct max732x_chip, gpio_chip);
> -
>  	if ((mask & chip->dir_input) =3D=3D 0) {
>  		dev_dbg(&chip->client->dev, "%s port %d is output only\n",
>  			chip->client->name, off);
> @@ -285,11 +284,9 @@ static int max732x_gpio_direction_input(struct g=
pio_chip *gc, unsigned off)
>  static int max732x_gpio_direction_output(struct gpio_chip *gc,
>  		unsigned off, int val)
>  {
> -	struct max732x_chip *chip;
> +	struct max732x_chip *chip =3D to_max732x(gc);
>  	unsigned int mask =3D 1u << off;
>
> -	chip =3D container_of(gc, struct max732x_chip, gpio_chip);
> -
>  	if ((mask & chip->dir_output) =3D=3D 0) {
>  		dev_dbg(&chip->client->dev, "%s port %d is input only\n",
>  			chip->client->name, off);
> @@ -361,9 +358,7 @@ static void max732x_irq_update_mask(struct max732=
x_chip *chip)
>
>  static int max732x_gpio_to_irq(struct gpio_chip *gc, unsigned off)
>  {
> -	struct max732x_chip *chip;
> -
> -	chip =3D container_of(gc, struct max732x_chip, gpio_chip);
> +	struct max732x_chip *chip =3D to_max732x(gc);
>
>  	if (chip->irq_domain) {
>  		return irq_create_mapping(chip->irq_domain,
> --=20
> 1.9.3
>

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
