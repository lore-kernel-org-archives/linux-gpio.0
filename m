From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 3/5] irqdomain: Add irq_domain_{push,pop}_irq() functions.
Date: Tue, 15 Aug 2017 20:02:02 +0100
Message-ID: <861socy7rp.fsf@arm.com>
References: <1502319099-2782-1-git-send-email-david.daney@cavium.com>
        <1502319099-2782-4-git-send-email-david.daney@cavium.com>
        <d87a6ff4-5b06-3883-f24a-b1ce5afb09e9@arm.com>
        <84b23b62-0813-34eb-5afc-da21597d218f@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:56164 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751576AbdHOTCG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Aug 2017 15:02:06 -0400
In-Reply-To: <84b23b62-0813-34eb-5afc-da21597d218f@caviumnetworks.com> (David
        Daney's message of "Tue, 15 Aug 2017 11:00:19 -0700")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 15 2017 at 11:00:19 am BST, David Daney <ddaney@caviumnetworks.com> wrote:
> On 08/15/2017 06:50 AM, Marc Zyngier wrote:
>> Hi David,
>>
>> On 09/08/17 23:51, David Daney wrote:
> [...]
>>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>>> index f1f2514..629f770 100644
>>> --- a/kernel/irq/irqdomain.c
>>> +++ b/kernel/irq/irqdomain.c
>>> @@ -1448,6 +1448,184 @@ int __irq_domain_alloc_irqs(struct
> irq_domain *domain, int irq_base,
>>>   	return ret;
>>>   }
>>>   +/* The irq_data was moved, fix the revmap to refer to the new
>>> location */
>>> +static void irq_domain_fix_revmap(struct irq_data *d)
>>> +{
>>> +	void **slot;
>>> +
>>> +	if (d->hwirq < d->domain->revmap_size)
>>> +		return; /* Not using radix tree. */
>>> +
>>> +	/* Fix up the revmap. */
>>> +	mutex_lock(&revmap_trees_mutex);
>>> +	slot = radix_tree_lookup_slot(&d->domain->revmap_tree, d->hwirq);
>>> +	if (slot)
>>> +		radix_tree_replace_slot(&d->domain->revmap_tree, slot, d);
>>
>> radix_tree_replace_slot already deals with non-existing entries, so the
>> initial radix_tree_lookup_slot call is superfluous.
>
> This comment I don't understand.  To replace an element in the tree,
> you must know the slot.  I see no alternative to calling
> radix_tree_lookup_slot().  If I am mistaken, it would be helpful to
> know in a little more detail how you think it should be done.

Nah, you're right. I'm just grossly mistaken. Ignore this.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
