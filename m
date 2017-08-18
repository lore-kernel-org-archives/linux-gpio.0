From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 2/7] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Fri, 18 Aug 2017 10:28:05 +0100
Message-ID: <6100c1d2-537e-7cb0-0f38-18c0f6b78aa6@arm.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <1503017616-3252-3-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:60388 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdHRJ2I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Aug 2017 05:28:08 -0400
In-Reply-To: <1503017616-3252-3-git-send-email-david.daney@cavium.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 18/08/17 01:53, David Daney wrote:
> Follow-on patch for gpio-thunderx uses a irqdomain hierarchy which
> requires slightly different flow handlers, add them to chip.c which
> contains most of the other flow handlers.  Make these conditionally
> compiled based on CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Nit: $SUBJECT doesn't reflect the new function names.

> ---
>  include/linux/irq.h |   2 +
>  kernel/irq/Kconfig  |   4 ++
>  kernel/irq/chip.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index d2d54379..d4728bf 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -568,6 +568,8 @@ static inline int irq_set_parent(int irq, int parent_irq)
>  extern int irq_chip_pm_get(struct irq_data *data);
>  extern int irq_chip_pm_put(struct irq_data *data);
>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> +extern void handle_fasteoi_ack_irq(struct irq_desc *desc);
> +extern void handle_fasteoi_mask_irq(struct irq_desc *desc);
>  extern void irq_chip_enable_parent(struct irq_data *data);
>  extern void irq_chip_disable_parent(struct irq_data *data);
>  extern void irq_chip_ack_parent(struct irq_data *data);
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index 27c4e77..aada687 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -68,6 +68,10 @@ config IRQ_DOMAIN_HIERARCHY
>  	bool
>  	select IRQ_DOMAIN
>  
> +# Support for hierarchical fasteoi+edge and fasteoi+level handlers
> +config IRQ_FASTEOI_HIERARCHY_HANDLERS
> +	bool
> +
>  # Generic IRQ IPI support
>  config GENERIC_IRQ_IPI
>  	bool
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 6514f07..2395898 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1092,6 +1092,112 @@ void irq_cpu_offline(void)
>  }
>  
>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> +
> +#ifdef CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS
> +/**
> + *	handle_fasteoi_ack_irq - irq handler for edge hierarchy
> + *	stacked on transparent controllers
> + *
> + *	@desc:	the interrupt description structure for this irq
> + *
> + *	Like handle_fasteoi_irq(), but for use with hierarchy where
> + *	the irq_chip also needs to have its ->irq_ack() function
> + *	called.
> + */
> +void handle_fasteoi_ack_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
> +	raw_spin_lock(&desc->lock);
> +
> +	if (!irq_may_run(desc))
> +		goto out;
> +
> +	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
> +
> +	/*
> +	 * If its disabled or no action available
> +	 * then mask it and get out of here:
> +	 */
> +	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
> +		desc->istate |= IRQS_PENDING;
> +		mask_irq(desc);
> +		goto out;
> +	}
> +
> +	kstat_incr_irqs_this_cpu(desc);
> +	if (desc->istate & IRQS_ONESHOT)
> +		mask_irq(desc);
> +
> +	/* Start handling the irq */
> +	desc->irq_data.chip->irq_ack(&desc->irq_data);
> +
> +	preflow_handler(desc);
> +	handle_irq_event(desc);
> +
> +	cond_unmask_eoi_irq(desc, chip);
> +
> +	raw_spin_unlock(&desc->lock);
> +	return;
> +out:
> +	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
> +		chip->irq_eoi(&desc->irq_data);
> +	raw_spin_unlock(&desc->lock);
> +}
> +EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
> +
> +/**
> + *	handle_fasteoi_mask_irq - irq handler for level hierarchy
> + *	stacked on transparent controllers
> + *
> + *	@desc:	the interrupt description structure for this irq
> + *
> + *	Like handle_fasteoi_irq(), but for use with hierarchy where
> + *	the irq_chip also needs to have its ->irq_mask_ack() function
> + *	called.
> + */
> +void handle_fasteoi_mask_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
> +	raw_spin_lock(&desc->lock);
> +	mask_ack_irq(desc);
> +
> +	if (!irq_may_run(desc))
> +		goto out;
> +
> +	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
> +
> +	/*
> +	 * If its disabled or no action available
> +	 * then mask it and get out of here:
> +	 */
> +	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
> +		desc->istate |= IRQS_PENDING;
> +		mask_irq(desc);
> +		goto out;
> +	}
> +
> +	kstat_incr_irqs_this_cpu(desc);
> +	if (desc->istate & IRQS_ONESHOT)
> +		mask_irq(desc);
> +
> +	preflow_handler(desc);
> +	handle_irq_event(desc);
> +
> +	cond_unmask_eoi_irq(desc, chip);
> +
> +	raw_spin_unlock(&desc->lock);
> +	return;
> +out:
> +	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
> +		chip->irq_eoi(&desc->irq_data);
> +	raw_spin_unlock(&desc->lock);
> +}
> +EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
> +
> +#endif /* CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS */
> +
>  /**
>   * irq_chip_enable_parent - Enable the parent interrupt (defaults to unmask if
>   * NULL)
> 

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
