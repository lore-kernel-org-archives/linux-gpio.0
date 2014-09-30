From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: handle also nested irqchips in the chained handler
 set-up
Date: Tue, 30 Sep 2014 10:53:21 +0300
Message-ID: <542A6171.6010908@ti.com>
References: <1411735327-30733-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:37532 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830AbaI3HxZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Sep 2014 03:53:25 -0400
In-Reply-To: <1411735327-30733-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>

Hi Linus,

On 09/26/2014 03:42 PM, Linus Walleij wrote:
> To unify how we connect cascaded IRQ chips to parent IRQs, if
> NULL us passed as handler to the gpiochip_set_chained_irqchip()
> function, assume the chips is nested rather than chained, and
> we still get the parent set up correctly by way of this function
> call.
>
> Alter the drivers for tc3589x and stmpe to use this to set up
> their chained handlers as a demonstration of the usage.
>

Wouldn't it be better to squash gpiolib changes in
previous patch (or vice versa)?:
   "[PATCH] gpio: set parent irq on chained handlers"
   http://comments.gmane.org/gmane.linux.kernel.gpio/4147

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   Documentation/gpio/driver.txt |  3 ++-
>   drivers/gpio/gpio-stmpe.c     | 18 ++++++++++++------
>   drivers/gpio/gpio-tc3589x.c   |  5 +++++
>   drivers/gpio/gpiolib.c        | 34 +++++++++++++++++++---------------
>   4 files changed, 38 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
> index 23b751a10d7b..31e0b5db55d8 100644
> --- a/Documentation/gpio/driver.txt
> +++ b/Documentation/gpio/driver.txt
> @@ -124,7 +124,8 @@ symbol:
>   * gpiochip_set_chained_irqchip(): sets up a chained irq handler for a
>     gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
>     data. (Notice handler data, since the irqchip data is likely used by the
> -  parent irqchip!) This is for the chained type of chip.
> +  parent irqchip!) This is for the chained type of chip. This is also used
> +  to set up a nested irqchip if NULL is passed as handler.
>
>   To use the helpers please keep the following in mind:
>

[...]

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9362b5b817af..6e00c82be142 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -385,13 +385,14 @@ static struct gpio_chip *find_chip_by_name(const char *name)
>    */
>
>   /**
> - * gpiochip_add_chained_irqchip() - adds a chained irqchip to a gpiochip
> - * @gpiochip: the gpiochip to add the irqchip to
> - * @irqchip: the irqchip to add to the gpiochip
> + * gpiochip_set_chained_irqchip() - sets a chained irqchip to a gpiochip
> + * @gpiochip: the gpiochip to set the irqchip chain to
> + * @irqchip: the irqchip to chain to the gpiochip
>    * @parent_irq: the irq number corresponding to the parent IRQ for this
>    * chained irqchip
>    * @parent_handler: the parent interrupt handler for the accumulated IRQ
> - * coming out of the gpiochip
> + * coming out of the gpiochip. If the interrupt is nested rather than
> + * cascaded, pass NULL in this handler argument
>    */
>   void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
>   				  struct irq_chip *irqchip,
> @@ -400,23 +401,26 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
>   {
>   	unsigned int offset;
>
> -	if (gpiochip->can_sleep) {
> -		chip_err(gpiochip, "you cannot have chained interrupts on a chip that may sleep\n");
> -		return;
> -	}
>   	if (!gpiochip->irqdomain) {
>   		chip_err(gpiochip, "called %s before setting up irqchip\n",
>   			 __func__);
>   		return;
>   	}
>
> -	irq_set_chained_handler(parent_irq, parent_handler);
> -
> -	/*
> -	 * The parent irqchip is already using the chip_data for this
> -	 * irqchip, so our callbacks simply use the handler_data.
> -	 */
> -	irq_set_handler_data(parent_irq, gpiochip);
> +	if (parent_handler) {
> +		if (gpiochip->can_sleep) {
> +			chip_err(gpiochip,
> +				 "you cannot have chained interrupts on a "
> +				 "chip that may sleep\n");
> +			return;
> +		}
> +		irq_set_chained_handler(parent_irq, parent_handler);
> +		/*
> +		 * The parent irqchip is already using the chip_data for this
> +		 * irqchip, so our callbacks simply use the handler_data.
> +		 */
> +		irq_set_handler_data(parent_irq, gpiochip);
> +	}
>
>   	/* Set the parent IRQ for all affected IRQs */
>   	for (offset = 0; offset < gpiochip->ngpio; offset++)
>

Regards,
-grygorii

