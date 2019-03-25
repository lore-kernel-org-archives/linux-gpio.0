From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2] genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
Date: Mon, 25 Mar 2019 11:10:26 -0700
Message-ID: <20190325181026.247796-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-gpio@vger.kernel.org

This function returns an error if a child irqchip calls
irq_chip_set_wake_parent() but its parent irqchip has the
IRQCHIP_SKIP_SET_WAKE flag set. Let's return 0 for success here instead
because there isn't anything to do.

This keeps the behavior consistent with how set_irq_wake_real() is
implemented. That function returns 0 when the irqchip has the
IRQCHIP_SKIP_SET_WAKE flag set. It doesn't attempt to walk the chain of
parents and set irq wake on any chips that don't have the flag set
either. If the intent is to call the .irq_set_wake() callback of the
parent irqchip, then we expect irqchip implementations to omit the
IRQCHIP_SKIP_SET_WAKE flag and implement an .irq_set_wake() function
that calls irq_chip_set_wake_parent().

This fixes a problem on my Qualcomm sdm845 device where I can't set wake
on any GPIO interrupts after I apply work in progress wakeup irq patches
to the GPIO driver. The chain of chips looks like this:

 ARM GIC (skip) -> QCOM PDC (skip) -> QCOM GPIO

The GPIO controller is a child of the QCOM PDC irqchip which is a child
of the ARM GIC irqchip. The QCOM PDC irqchip has the
IRQCHIP_SKIP_SET_WAKE flag set, and so does the grandparent ARM GIC.

The GPIO driver doesn't know if the parent needs to set wake or not, so
it unconditionally calls irq_chip_set_wake_parent() causing this
function to return a failure because the parent irqchip (PDC) doesn't
have the .irq_set_wake() callback set. Returning 0 instead makes
everything work and irqs from the GPIO controller can be configured for
wakeup.

Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 - Rewrote commit text
 - Changed to only look at parent flags instead of walking parent chain

 kernel/irq/chip.c | 4 ++++
 1 file changed, 4 insertions(+)

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
 
-- 
Sent by a computer through tubes
