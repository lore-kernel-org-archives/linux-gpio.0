From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: lynxpoint: lock IRQs when starting them
Date: Wed, 20 Nov 2013 20:29:12 +0200
Message-ID: <528CFF78.9080703@ti.com>
References: <1384958549-23722-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:53610 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998Ab3KTScb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2013 13:32:31 -0500
In-Reply-To: <1384958549-23722-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>

Hi Linus,

On 11/20/2013 04:42 PM, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpio-lynxpoint.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
> index f1ca9d5880b6..8c7634250aff 100644
> --- a/drivers/gpio/gpio-lynxpoint.c
> +++ b/drivers/gpio/gpio-lynxpoint.c
> @@ -301,6 +301,24 @@ static void lp_irq_disable(struct irq_data *d)
>   	spin_unlock_irqrestore(&lg->lock, flags);
>   }
>   
> +static unsigned int lp_irq_startup(struct irq_data *d)
> +{
> +	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
> +
> +	if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
> +		dev_err(lg->chip.dev,
> +			"unable to lock HW IRQ %lu for IRQ\n",
> +			irqd_to_hwirq(d));
> +	return 0;
> +}
> +
> +static void lp_irq_shutdown(struct irq_data *d)
> +{
> +	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
> +
> +	gpio_unlock_as_irq(&lg->chip, irqd_to_hwirq(d));
> +}

Seems, such changes may be risky, because .irq_startup()
and irq_enable()/irq_umask() are mutually exclusive, at least at IRQ request time.
request_threaded_irq()->__setup_irq()->irq_startup()

More over, IRQ core assumes that IRQ is enabled, unmasked and ready for use after
.irq_startup() call. You can check functions irq/chip.c->irq_startup() for more info.

So, .irq_enable() functionality need to be duplicated in .irq_startup() at least.

if you agree - above comment is valid for most of similar recent patches ;)

> +
>   static struct irq_chip lp_irqchip = {
>   	.name = "LP-GPIO",
>   	.irq_mask = lp_irq_mask,
> @@ -308,6 +326,8 @@ static struct irq_chip lp_irqchip = {
>   	.irq_enable = lp_irq_enable,
>   	.irq_disable = lp_irq_disable,
>   	.irq_set_type = lp_irq_type,
> +	.irq_startup = lp_irq_startup,
> +	.irq_shutdown = lp_irq_shutdown,
>   	.flags = IRQCHIP_SKIP_SET_WAKE,
>   };
>   
> 

Regards,
-grygorii
