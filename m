From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into request/release
 resources methods
Date: Thu, 26 Feb 2015 14:32:02 +0100
Message-ID: <54EF2052.6030909@atmel.com>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: linux-gpio@vger.kernel.org

Le 08/02/2015 19:23, Boris Brezillon a =E9crit :
> The gpiochip_lock_as_irq call can fail and return an error, while the
> irq_startup is not expected to fail (returns an unsigned int which is=
 not
> checked by irq core code).
>=20
> irq_request/release_resources functions have been created to address =
this
> problem.
>=20
> Move gpiochip_lock/unlock_as_irq calls into
> irq_request/release_resources functions to prevent using a gpio as an=
 irq
> if the gpiochip_lock_as_irq call failed.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

If it can speed up things:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Linus,
can we schedule this fix during the 4.0-rc phase?

Bye,

> ---
>  drivers/pinctrl/pinctrl-at91.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl=
-at91.c
> index f4cd0b9..a481406 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1477,28 +1477,25 @@ static void gpio_irq_ack(struct irq_data *d)
>  	/* the interrupt is already cleared before by reading ISR */
>  }
> =20
> -static unsigned int gpio_irq_startup(struct irq_data *d)
> +static int gpio_irq_request_res(struct irq_data *d)
>  {
>  	struct at91_gpio_chip *at91_gpio =3D irq_data_get_irq_chip_data(d);
>  	unsigned	pin =3D d->hwirq;
>  	int ret;
> =20
>  	ret =3D gpiochip_lock_as_irq(&at91_gpio->chip, pin);
> -	if (ret) {
> +	if (ret)
>  		dev_err(at91_gpio->chip.dev, "unable to lock pind %lu IRQ\n",
>  			d->hwirq);
> -		return ret;
> -	}
> -	gpio_irq_unmask(d);
> -	return 0;
> +
> +	return ret;
>  }
> =20
> -static void gpio_irq_shutdown(struct irq_data *d)
> +static void gpio_irq_release_res(struct irq_data *d)
>  {
>  	struct at91_gpio_chip *at91_gpio =3D irq_data_get_irq_chip_data(d);
>  	unsigned	pin =3D d->hwirq;
> =20
> -	gpio_irq_mask(d);
>  	gpiochip_unlock_as_irq(&at91_gpio->chip, pin);
>  }
> =20
> @@ -1577,8 +1574,8 @@ void at91_pinctrl_gpio_resume(void)
>  static struct irq_chip gpio_irqchip =3D {
>  	.name		=3D "GPIO",
>  	.irq_ack	=3D gpio_irq_ack,
> -	.irq_startup	=3D gpio_irq_startup,
> -	.irq_shutdown	=3D gpio_irq_shutdown,
> +	.irq_request_resources =3D gpio_irq_request_res,
> +	.irq_release_resources =3D gpio_irq_release_res,
>  	.irq_disable	=3D gpio_irq_mask,
>  	.irq_mask	=3D gpio_irq_mask,
>  	.irq_unmask	=3D gpio_irq_unmask,
>=20


--=20
Nicolas Ferre
