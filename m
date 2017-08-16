From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v7 2/5] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Wed, 16 Aug 2017 08:59:20 -0700
Message-ID: <5d9b51c1-a2bd-9932-8917-a743854192db@caviumnetworks.com>
References: <1502319099-2782-1-git-send-email-david.daney@cavium.com>
 <1502319099-2782-3-git-send-email-david.daney@cavium.com>
 <alpine.DEB.2.20.1708141221440.1865@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1708141221440.1865@nanos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, David Daney <david.daney@cavium.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 08/14/2017 03:25 AM, Thomas Gleixner wrote:
> On Wed, 9 Aug 2017, David Daney wrote:
>>   #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> 
> Can we please make them conditional in order not to bloat all kernels with
> it? Like we do for handle_edge_eoi_irq() ?


Yes.  Because these are initially used by exactly one driver, I could 
just make it conditional on that driver being enabled.

Alternately, I could invent a new Kconfig symbol to gate these and 
select that when the driver is enabled.

Do you have a preference?

> 
>>   /**
>> + *	handle_fasteoi_edge_irq - irq handler for edge hierarchy
>> + *	stacked on transparent controllers
>> + *
>> + *	@desc:	the interrupt description structure for this irq
>> + *
>> + *	Like handle_fasteoi_irq(), but for use with hierarchy where
>> + *	the irq_chip also needs to have its ->irq_ack() function
>> + *	called.
>> + */
>> +void handle_fasteoi_edge_irq(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *chip = desc->irq_data.chip;
>> +
>> +	raw_spin_lock(&desc->lock);
>> +
>> +	if (!irq_may_run(desc))
>> +		goto out;
>> +
>> +	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
>> +
>> +	/*
>> +	 * If its disabled or no action available
>> +	 * then mask it and get out of here:
>> +	 */
>> +	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
>> +		desc->istate |= IRQS_PENDING;
>> +		mask_irq(desc);
>> +		goto out;
>> +	}
>> +
>> +	kstat_incr_irqs_this_cpu(desc);
>> +	if (desc->istate & IRQS_ONESHOT)
>> +		mask_irq(desc);
>> +
>> +	/* Start handling the irq */
>> +	desc->irq_data.chip->irq_ack(&desc->irq_data);
>> +
>> +	preflow_handler(desc);
>> +	handle_irq_event(desc);
> 
> Hmm. That's quite different to the way we handle edge interrupts
> normally. See handle_edge_irq() and handle_edge_eoi_irq().

Yes, these are not standard edge interrupts.  If they were, I wouldn't 
need new handlers.

For this particular irqdomain hierarchy, I need exactly 
handle_fasteoi_irq() semantics with the addition of a call to the 
chip->irq_ack() function *before* the handler is called.  I chose to 
"clone" and enhance handle_fasteoi_irq(), rather than adding hooks with 
runtime checks to the existing handle_fasteoi_irq().  There is code 
bloat this way, but a smaller risk of breaking other things.

Any additional "stuff" that is not needed to cover this use case would 
just be adding dead code.  In the future, if there is a need to enable 
more users of these functions, I would not object to doing more.

Thanks,
David Daney


> 
> Thanks,
> 
> 	tglx
> 
