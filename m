From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: lock adnp IRQs when enabling them
Date: Tue, 26 Nov 2013 15:15:38 +0200
Message-ID: <52949EFA.3060903@ti.com>
References: <1385460324-30777-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:57891 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114Ab3KZNT0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 08:19:26 -0500
In-Reply-To: <1385460324-30777-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>

On 11/26/2013 12:05 PM, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
>
> Only compile tested on the lpc32xx.
>
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Cc: Thierry Reding <thierry.reding@avionic-design.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Use the .enable() callback from the irq_chip
> - Call .unmask() from the .enable() callback to satisfy semantics.
> ---
>   drivers/gpio/gpio-adnp.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
> index b204033acaeb..3988ebc5a40e 100644
> --- a/drivers/gpio/gpio-adnp.c
> +++ b/drivers/gpio/gpio-adnp.c
> @@ -408,6 +408,25 @@ static void adnp_irq_bus_unlock(struct irq_data *data)
>   	mutex_unlock(&adnp->irq_lock);
>   }
>
> +static void adnp_irq_enable(struct irq_data *data)
> +{
> +	struct adnp *adnp = irq_data_get_irq_chip_data(data);
> +
> +	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq))
> +		dev_err(adnp->gpio.dev,
> +			"unable to lock HW IRQ %lu for IRQ\n",
> +			data->hwirq);
> +	/* Satisfy the .enable semantics by unmasking the line */
> +	adnp_irq_unmask(data);
> +}
> +
> +static void adnp_irq_disable(struct irq_data *data)
> +{
> +	struct adnp *adnp = irq_data_get_irq_chip_data(data);
> +
> +	gpio_unlock_as_irq(&adnp->gpio, data->hwirq);
> +}
> +
>   static struct irq_chip adnp_irq_chip = {
>   	.name = "gpio-adnp",
>   	.irq_mask = adnp_irq_mask,
> @@ -415,6 +434,8 @@ static struct irq_chip adnp_irq_chip = {
>   	.irq_set_type = adnp_irq_set_type,
>   	.irq_bus_lock = adnp_irq_bus_lock,
>   	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
> +	.irq_enable = adnp_irq_enable,
> +	.irq_disable = adnp_irq_disable,

.irq_startup/irq_shutdown ?

>   };
>
>   static int adnp_irq_map(struct irq_domain *domain, unsigned int irq,
>

