From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 2/5] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Mon, 14 Aug 2017 12:25:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708141221440.1865@nanos>
References: <1502319099-2782-1-git-send-email-david.daney@cavium.com> <1502319099-2782-3-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:45468 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752222AbdHNKZH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2017 06:25:07 -0400
In-Reply-To: <1502319099-2782-3-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 9 Aug 2017, David Daney wrote:
>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY

Can we please make them conditional in order not to bloat all kernels with
it? Like we do for handle_edge_eoi_irq() ?

>  /**
> + *	handle_fasteoi_edge_irq - irq handler for edge hierarchy
> + *	stacked on transparent controllers
> + *
> + *	@desc:	the interrupt description structure for this irq
> + *
> + *	Like handle_fasteoi_irq(), but for use with hierarchy where
> + *	the irq_chip also needs to have its ->irq_ack() function
> + *	called.
> + */
> +void handle_fasteoi_edge_irq(struct irq_desc *desc)
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

Hmm. That's quite different to the way we handle edge interrupts
normally. See handle_edge_irq() and handle_edge_eoi_irq().

Thanks,

	tglx
