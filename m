From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: set parent irq on chained handlers
Date: Fri, 26 Sep 2014 15:20:23 +0300
Message-ID: <54255A07.9060708@ti.com>
References: <1411732349-19178-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:34873 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753529AbaIZMUa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 08:20:30 -0400
In-Reply-To: <1411732349-19178-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>

On 09/26/2014 02:52 PM, Linus Walleij wrote:
> If the IRQ from the parent is nested the IRQ may need to be
> resent under certain conditions. Currently the chained IRQ
> handler in gpiolib does not handle connecting nested IRQs

Seems there is still some misunderstanding ( - chained vs nested IRQs

> but it is conceptually correct to indicate the actual parent
> IRQ.
>=20
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>

+ Reported-by: Lothar Wa=DFmann <LW@karo-electronics.de>

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 550e575c6ffb..9362b5b817af 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -398,17 +398,30 @@ void gpiochip_set_chained_irqchip(struct gpio_c=
hip *gpiochip,
>   				  int parent_irq,
>   				  irq_flow_handler_t parent_handler)
>   {
> +	unsigned int offset;
> +
>   	if (gpiochip->can_sleep) {
>   		chip_err(gpiochip, "you cannot have chained interrupts on a chip =
that may sleep\n");
>   		return;
>   	}


This function can't be called by gpio-pca953x.c driver  (

> +	if (!gpiochip->irqdomain) {
> +		chip_err(gpiochip, "called %s before setting up irqchip\n",
> +			 __func__);
> +		return;
> +	}
>  =20
>   	irq_set_chained_handler(parent_irq, parent_handler);
> +
>   	/*
>   	 * The parent irqchip is already using the chip_data for this
>   	 * irqchip, so our callbacks simply use the handler_data.
>   	 */
>   	irq_set_handler_data(parent_irq, gpiochip);
> +
> +	/* Set the parent IRQ for all affected IRQs */
> +	for (offset =3D 0; offset < gpiochip->ngpio; offset++)
> +		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
> +			       parent_irq);
>   }
>   EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
>  =20
>=20

May be some simple helper can be added instead:
 void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
   				  int parent_irq)
  {
 	unsigned int offset;
=20
   	if (!gpiochip->can_sleep && !chip->irq_not_threaded) {
   		chip_err(gpiochip, "you cannot have nested interrupts on a chip th=
at can't sleep\n");
   		return;
   	}

	if (!gpiochip->irqdomain) {
		chip_err(gpiochip, "called %s before setting up irqchip\n",
			 __func__);
		return;
	}
=20

	/* Set the parent IRQ for all affected IRQs */
	for (offset =3D 0; offset < gpiochip->ngpio; offset++)
		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
			       parent_irq);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
=20
regards,
-grygorii
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
