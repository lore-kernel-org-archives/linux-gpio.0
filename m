From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: lynxpoint: lock IRQs when starting them
Date: Tue, 26 Nov 2013 13:49:26 +0200
Message-ID: <20131126114926.GY2281@intel.com>
References: <1385461419-5979-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24464 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755814Ab3KZLmr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 06:42:47 -0500
Content-Disposition: inline
In-Reply-To: <1385461419-5979-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Nov 26, 2013 at 11:23:39AM +0100, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Explicitly call .enable()/.disable() callbacks from the
>   startup()/shutdown() callbacks to satisfy implicit semantics.
> ---
>  drivers/gpio/gpio-lynxpoint.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
> index a0804740a0b7..70831e4b2c8b 100644
> --- a/drivers/gpio/gpio-lynxpoint.c
> +++ b/drivers/gpio/gpio-lynxpoint.c
> @@ -301,6 +301,26 @@ static void lp_irq_disable(struct irq_data *d)
>  	spin_unlock_irqrestore(&lg->lock, flags);
>  }
>  
> +static unsigned int lp_irq_startup(struct irq_data *d)
> +{
> +	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
> +
> +	if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
> +		dev_err(lg->chip.dev,
> +			"unable to lock HW IRQ %lu for IRQ\n",
> +			irqd_to_hwirq(d));
> +	lp_irq_enable(d);

I may be missing something but doesn't this now end up calling
lp_irq_enable() twice? First in ->irq_startup() and then later on in
->irq_enable().
