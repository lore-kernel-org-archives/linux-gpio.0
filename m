From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v7 3/5] irqdomain: Add irq_domain_{push,pop}_irq()
 functions.
Date: Tue, 15 Aug 2017 11:00:19 -0700
Message-ID: <84b23b62-0813-34eb-5afc-da21597d218f@caviumnetworks.com>
References: <1502319099-2782-1-git-send-email-david.daney@cavium.com>
 <1502319099-2782-4-git-send-email-david.daney@cavium.com>
 <d87a6ff4-5b06-3883-f24a-b1ce5afb09e9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d87a6ff4-5b06-3883-f24a-b1ce5afb09e9@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 08/15/2017 06:50 AM, Marc Zyngier wrote:
> Hi David,
> 
> On 09/08/17 23:51, David Daney wrote:
[...]
>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> index f1f2514..629f770 100644
>> --- a/kernel/irq/irqdomain.c
>> +++ b/kernel/irq/irqdomain.c
>> @@ -1448,6 +1448,184 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
>>   	return ret;
>>   }
>>   
>> +/* The irq_data was moved, fix the revmap to refer to the new location */
>> +static void irq_domain_fix_revmap(struct irq_data *d)
>> +{
>> +	void **slot;
>> +
>> +	if (d->hwirq < d->domain->revmap_size)
>> +		return; /* Not using radix tree. */
>> +
>> +	/* Fix up the revmap. */
>> +	mutex_lock(&revmap_trees_mutex);
>> +	slot = radix_tree_lookup_slot(&d->domain->revmap_tree, d->hwirq);
>> +	if (slot)
>> +		radix_tree_replace_slot(&d->domain->revmap_tree, slot, d);
> 
> radix_tree_replace_slot already deals with non-existing entries, so the
> initial radix_tree_lookup_slot call is superfluous.

This comment I don't understand.  To replace an element in the tree, you 
must know the slot.  I see no alternative to calling 
radix_tree_lookup_slot().  If I am mistaken, it would be helpful to know 
in a little more detail how you think it should be done.


> 
>> +	mutex_unlock(&revmap_trees_mutex);
>> +}
>> +
>> +/**
>> + * irq_domain_push_irq() - Push a domain in to the top of a hierarchy.
>> + * @domain:	Domain to push.
>> + * @virq:	Irq to push the domain in to.
>> + * @arg:	Passed to the irq_domain_ops alloc() function.
>> + *
>> + * For an already existing irqdomain hierarchy, as might be obtained
>> + * via a call to pci_enable_msix(), add an additional domain to the
>> + * head of the processing chain.  Must be called before request_irq()
>> + * has been called.
>> + */
>> +int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
>> +{
>> +	struct irq_data *child_irq_data;
>> +	struct irq_data *root_irq_data = irq_get_irq_data(virq);
>> +	struct irq_desc *desc;
>> +	int rv = 0;
>> +
>> +	/*
>> +	 * Check that no action has been set, which indicates the virq
>> +	 * is in a state where this function doesn't have to deal with
>> +	 * races between interrupt handling and maintaining the
>> +	 * hierarchy.  This will catch gross misuse.  Attempting to
>> +	 * make the check race free would require holding locks across
>> +	 * calls to struct irq_domain_ops->alloc(), which could lead
>> +	 * to deadlock, so we just do a simple check before starting.
>> +	 */
>> +	desc = irq_to_desc(virq);
>> +	if (!desc)
>> +		return -EINVAL;
>> +	if (WARN_ON(desc->action))
>> +		return -EBUSY;
>> +
>> +	if (domain == NULL)
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(!domain->ops->alloc))
>> +		return -EINVAL;
> 
> I'd rather you use irq_domain_is_hierarchy() instead. Same effect, but
> less likely to break in the long run.

Good idea, I will do it.

> 
>> +
>> +	if (!root_irq_data)
>> +		return -EINVAL;
>> +
>> +	child_irq_data = kzalloc_node(sizeof(*child_irq_data), GFP_KERNEL,
>> +				      irq_data_get_node(root_irq_data));
>> +	if (!child_irq_data)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&irq_domain_mutex);
>> +
>> +	/* Copy the original irq_data. */
>> +	*child_irq_data = *root_irq_data;
>> +
>> +	irq_domain_fix_revmap(child_irq_data);
> 
> What is the benefit of updating the revmap early?

The idea was to have it be valid for the ops->alloc() call, but ...

> We don't do that in
> the pop case. Can't we do it in one go once the allocation has succeeded?

... the code in  irqdomain.c that calls ops->alloc() doesn't have revmap 
established at the call site, so I agree that this can go after the 
allocation so we don't have to undo it on failure.

> 
>> +
>> +	/*
>> +	 * Overwrite the root_irq_data, which is embedded in struct
>> +	 * irq_desc, with values for this domain.
>> +	 */
>> +	root_irq_data->parent_data = child_irq_data;
>> +	root_irq_data->domain = domain;
>> +	root_irq_data->mask = 0;
>> +	root_irq_data->hwirq = 0;
>> +	root_irq_data->chip = NULL;
>> +	root_irq_data->chip_data = NULL;
>> +	rv = domain->ops->alloc(domain, virq, 1, arg);
> 
> That'd be irq_domain_alloc_irqs_hierarchy().
> 

Yes.

> Overall, I'm a bit concerned that alloc() is allowed to be recursive
> itself. Hopefully nobody will do that, but you never know. A possible
> way of trapping this would be to only set parent_data *after* the
> allocation has been done.

I will try it.

> 
> Another concern is that I never see domain->parent being checked. It
> should match child_irq_data->domain, so that you can never push a domain
> on an interrupt that is not part of the parent domain.

I will add a check for this.


> 
>> +	if (rv) {
>> +		/* Restore the original irq_data. */
>> +		*root_irq_data = *child_irq_data;
>> +		irq_domain_fix_revmap(root_irq_data);
>> +		goto error;
>> +	}
>> +
>> +	if (root_irq_data->hwirq < domain->revmap_size) {
>> +		domain->linear_revmap[root_irq_data->hwirq] = virq;
>> +	} else {
>> +		mutex_lock(&revmap_trees_mutex);
>> +		radix_tree_insert(&domain->revmap_tree,
>> +				  root_irq_data->hwirq, root_irq_data);
>> +		mutex_unlock(&revmap_trees_mutex);
>> +	}
> 
> We already have this exact code twice (in irq_domain_insert_irq and
> irq_domain_associate). How about making it a helper?

OK.

> 
>> +error:
>> +	mutex_unlock(&irq_domain_mutex);
>> +
>> +	return rv;
>> +}
>> +EXPORT_SYMBOL_GPL(irq_domain_push_irq);
>> +
>> +/**
>> + * irq_domain_pop_irq() - Remove a domain from the top of a hierarchy.
>> + * @domain:	Domain to remove.
>> + * @virq:	Irq to remove the domain from.
>> + *
>> + * Undo the effects of a call to irq_domain_push_irq().  Must be
>> + * called either before request_irq() or after free_irq().
>> + */
>> +int irq_domain_pop_irq(struct irq_domain *domain, int virq)
>> +{
>> +	struct irq_data *root_irq_data = irq_get_irq_data(virq);
>> +	struct irq_data *child_irq_data;
>> +	struct irq_data *tmp_irq_data;
>> +	struct irq_desc *desc;
>> +
>> +	/*
>> +	 * Check that no action is set, which indicates the virq is in
>> +	 * a state where this function doesn't have to deal with races
>> +	 * between interrupt handling and maintaining the hierarchy.
>> +	 * This will catch gross misuse.  Attempting to make the check
>> +	 * race free would require holding locks across calls to
>> +	 * struct irq_domain_ops->free(), which could lead to
>> +	 * deadlock, so we just do a simple check before starting.
>> +	 */
>> +	desc = irq_to_desc(virq);
>> +	if (!desc)
>> +		return -EINVAL;
>> +	if (WARN_ON(desc->action))
>> +		return -EBUSY;
>> +
>> +	if (domain == NULL)
>> +		return -EINVAL;
>> +
>> +	if (!root_irq_data)
>> +		return -EINVAL;
>> +
>> +	tmp_irq_data = irq_domain_get_irq_data(domain, virq);
>> +
>> +	/* We can only "pop" if this domain is at the top of the list */
>> +	if (WARN_ON(root_irq_data != tmp_irq_data))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(root_irq_data->domain != domain))
>> +		return -EINVAL;
>> +
>> +	child_irq_data = root_irq_data->parent_data;
>> +	if (WARN_ON(!child_irq_data))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&irq_domain_mutex);
>> +
>> +	root_irq_data->parent_data = NULL;
>> +
>> +	if (root_irq_data->hwirq >= domain->revmap_size) {
>> +		mutex_lock(&revmap_trees_mutex);
>> +		radix_tree_delete(&domain->revmap_tree, root_irq_data->hwirq);
>> +		mutex_unlock(&revmap_trees_mutex);ops->alloc()
>> +	}
> 
> What about clearing it from the revmap if it fits there? Also, this code
> already exists in irq_domain_disassociate and irq_domain_remove_irq, and
> making that a helper is overdue.

I will investigate doing something like that.


> 
>> +
>> +	if (domain->ops->free)
>> +		domain->ops->free(domain, virq, 1);
> 
> Use irq_domain_free_irqs_hierarchy(), making it conditional in that helper.

OK


> 
>> +
>> +	/* Restore the original irq_data. */
>> +	*root_irq_data = *child_irq_data;
>> +
>> +	irq_domain_fix_revmap(root_irq_data);
>> +
>> +	mutex_unlock(&irq_domain_mutex);
>> +
>> +	kfree(child_irq_data);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(irq_domain_pop_irq);
>> +
>>   /**
>>    * irq_domain_free_irqs - Free IRQ number and associated data structures
>>    * @virq:	base IRQ number
>>
> 
> Thanks,
> 
> 	M.
> 
