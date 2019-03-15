From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
Date: Fri, 15 Mar 2019 13:07:59 -0700
Message-ID: <20190315200759.139479-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-gpio@vger.kernel.org

This function returns an error if a child interrupt controller calls
irq_chip_set_wake_parent() but that parent interrupt controller has the
IRQCHIP_SKIP_SET_WAKE flag. Let's return 0 for success instead because
there isn't anything to do.

There's also the possibility that a parent indicates that we should skip
it, but the grandparent has an .irq_set_wake callback. Let's iterate
through the parent chain as long as the IRQCHIP_SKIP_SET_WAKE flag isn't
set so we can find the first parent that needs to handle the wake
configuration. This fixes a problem on my Qualcomm sdm845 device where
I'm trying to enable wake on an irq from the gpio controller that's a
child of the qcom pdc interrupt controller. The qcom pdc interrupt
controller has the IRQCHIP_SKIP_SET_WAKE flag set, and so does the
grandparent (ARM GIC), causing this function to return a failure because
the parent controller doesn't have the .irq_set_wake callback set.

Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 kernel/irq/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 3faef4a77f71..280d612ba71b 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1448,7 +1448,13 @@ int irq_chip_set_vcpu_affinity_parent(struct irq_data *data, void *vcpu_info)
  */
 int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
 {
-	data = data->parent_data;
+	for (data = data->parent_data; data; data = data->parent_data)
+		if (!(data->chip->flags & IRQCHIP_SKIP_SET_WAKE))
+			break;
+
+	if (!data)
+		return 0;
+
 	if (data->chip->irq_set_wake)
 		return data->chip->irq_set_wake(data, on);
 
-- 
Sent by a computer through tubes
