From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] genirq: Respect IRQCHIP_SKIP_SET_WAKE in
 irq_chip_set_wake_parent()
Date: Thu, 21 Mar 2019 10:26:26 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903211007310.1777@nanos.tec.linutronix.de>
References: <20190315200759.139479-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315200759.139479-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, 15 Mar 2019, Stephen Boyd wrote:

> This function returns an error if a child interrupt controller calls
> irq_chip_set_wake_parent() but that parent interrupt controller has the
> IRQCHIP_SKIP_SET_WAKE flag. Let's return 0 for success instead because
> there isn't anything to do.
> 
> There's also the possibility that a parent indicates that we should skip
> it, but the grandparent has an .irq_set_wake callback. Let's iterate
> through the parent chain as long as the IRQCHIP_SKIP_SET_WAKE flag isn't
> set so we can find the first parent that needs to handle the wake
> configuration. This fixes a problem on my Qualcomm sdm845 device where
> I'm trying to enable wake on an irq from the gpio controller that's a
> child of the qcom pdc interrupt controller. The qcom pdc interrupt
> controller has the IRQCHIP_SKIP_SET_WAKE flag set, and so does the
> grandparent (ARM GIC), causing this function to return a failure because
> the parent controller doesn't have the .irq_set_wake callback set.

It took me some time to distangle that changelog.... and I don't think that
this is the right thing to do.

set_irq_wake_real() returns 0 when the topmost chip has SKIP_SET_WAKE set.

So let's assume we have the following chains:

  chip A -> chip B 

  chip A -> chip B -> chip C

chip A has SKIP_SET_WAKE not set
chip B has SKIP_SET_WAKE set
chip C has SKIP_SET_WAKE not set and invokes irq_chip_set_wake_parent()

Now assume we have interrupt X connected to chip B and interrupt Y
connected to chip C.

If irq_set_wake() is called for interrupt X, then the function returns
without trying to invoke the set_wake() callback of chip A.

If irq_set_wake() is called for interrupt Y, irq_chip_set_wake_parent() is
invoked from chip C which then skips chip B, but tries to invoke the
callback on chip A.

That's inconsistent and changes the existing behaviour. So IMO, the right
thing to do is to return 0 from irq_chip_set_wake_parent() when the parent
has SKIP_SET_WAKE set and not to try to follow the whole chain. That should
fix your problem nicely w/o changing behaviour.

Thanks,

	tglx

----
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 3faef4a77f71..51128bea3846 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1449,6 +1449,10 @@ int irq_chip_set_vcpu_affinity_parent(struct irq_data *data, void *vcpu_info)
 int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
 {
 	data = data->parent_data;
+
+	if (data->chip->flags & IRQCHIP_SKIP_SET_WAKE)
+		return 0;
+
 	if (data->chip->irq_set_wake)
 		return data->chip->irq_set_wake(data, on);
 
