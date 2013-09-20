From: "Markus Mayer" <mmayer@broadcom.com>
Subject: Re: [PATCH v2] gpio: bcm-kona: only use set_irq_flags() on ARM
Date: Fri, 20 Sep 2013 14:26:32 -0700
Message-ID: <523CBD88.30805@broadcom.com>
References: <1379711978-10973-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:3447 "EHLO mms3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752949Ab3ITV00 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 20 Sep 2013 17:26:26 -0400
In-Reply-To: <1379711978-10973-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 13-09-20 02:19 PM, Linus Walleij wrote:
> As per the pattern from other GPIO drivers, use set_irq_flags()
> on ARM only, use irq_set_noprobe() on other archs.
>
> Also rename the argument "virq" to just "irq", this IRQ isn't
> any more "virtual" than any other Linux IRQ number, we use
> "hwirq" for the actual hw-numbers, "virq" is just bogus.
>
> Cc: Markus Mayer <mmayer@broadcom.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Forgot a second place the code was using set_irq_flags()...
> ---
>   drivers/gpio/gpio-bcm-kona.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index f7d932a..c0751a8 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -468,18 +468,22 @@ MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
>    */
>   static struct lock_class_key gpio_lock_class;
>
> -static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int virq,
> +static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int irq,
>   				 irq_hw_number_t hwirq)
>   {
>   	int ret;
>
> -	ret = irq_set_chip_data(virq, d->host_data);
> +	ret = irq_set_chip_data(irq, d->host_data);
>   	if (ret < 0)
>   		return ret;
> -	irq_set_lockdep_class(virq, &gpio_lock_class);
> -	irq_set_chip_and_handler(virq, &bcm_gpio_irq_chip, handle_simple_irq);
> -	irq_set_nested_thread(virq, 1);
> -	set_irq_flags(virq, IRQF_VALID);
> +	irq_set_lockdep_class(irq, &gpio_lock_class);
> +	irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip, handle_simple_irq);
> +	irq_set_nested_thread(irq, 1);
> +#ifdef CONFIG_ARM
> +	set_irq_flags(irq, IRQF_VALID);
> +#else
> +	irq_set_noprobe(irq);
> +#endif
>
>   	return 0;
>   }
> @@ -598,7 +602,11 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
>   		irq_set_lockdep_class(irq, &gpio_lock_class);
>   		irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip,
>   					 handle_simple_irq);
> +#ifdef CONFIG_ARM
>   		set_irq_flags(irq, IRQF_VALID);
> +#else
> +		irq_set_noprobe(irq);
> +#endif
>   	}
>   	for (i = 0; i < kona_gpio->num_bank; i++) {
>   		bank = &kona_gpio->banks[i];
>

Thanks for the fix.

Reviewed-by: Markus Mayer <mmayer@broadcom.com>



