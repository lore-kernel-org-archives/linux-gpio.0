From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio: intel-mid: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 13:00:46 -0700
Message-ID: <525858EE.3070002@linux.intel.com>
References: <1381512495-6917-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:3430 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758857Ab3JKUCO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Oct 2013 16:02:14 -0400
In-Reply-To: <1381512495-6917-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

Hi Linus,

On 10/11/2013 10:28 AM, Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus.

Sounds a good change. Thanks.

>
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: David Cohen <david.a.cohen@linux.intel.com>

> ---
>   drivers/gpio/gpio-intel-mid.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
> index 612b54d..be803af 100644
> --- a/drivers/gpio/gpio-intel-mid.c
> +++ b/drivers/gpio/gpio-intel-mid.c
> @@ -353,15 +353,15 @@ static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
>   	}
>   }
>
> -static int intel_gpio_irq_map(struct irq_domain *d, unsigned int virq,
> -			    irq_hw_number_t hw)
> +static int intel_gpio_irq_map(struct irq_domain *d, unsigned int irq,
> +			    irq_hw_number_t hwirq)
>   {
>   	struct intel_mid_gpio *priv = d->host_data;
>
> -	irq_set_chip_and_handler_name(virq, &intel_mid_irqchip,
> +	irq_set_chip_and_handler_name(irq, &intel_mid_irqchip,
>   				      handle_simple_irq, "demux");
> -	irq_set_chip_data(virq, priv);
> -	irq_set_irq_type(virq, IRQ_TYPE_NONE);
> +	irq_set_chip_data(irq, priv);
> +	irq_set_irq_type(irq, IRQ_TYPE_NONE);
>
>   	return 0;
>   }
>

