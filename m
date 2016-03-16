From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH v2 2/2] pinctrl:Intel: implement gpio_irq_enable
Date: Thu, 17 Mar 2016 02:15:26 +0800
Message-ID: <1458152126-2333-2-git-send-email-qipeng.zha@intel.com>
References: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:19657 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966035AbcCPKKN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Mar 2016 06:10:13 -0400
In-Reply-To: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, Qi Zheng <qi.zheng@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

From: Qi Zheng <qi.zheng@intel.com>

There is unexpected gpio interrupt after irq_enable. If not
implemeted gpio_irq_enable callback, irq_enable calls irq_unmask
instead. But if there was interrupt set before the irq_enable,
unmask it may trigger the unexpected interrupt. By implementing
the gpio_irq_enable callback, do interrupt status ack, the issue
has gone.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

---
change in v2:
 remove one blank line.
---
 drivers/pinctrl/intel/pinctrl-intel.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index c216cb3..6c2c816f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -665,6 +665,35 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 	spin_unlock(&pctrl->lock);
 }
 
+static void intel_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct intel_community *community;
+	unsigned pin = irqd_to_hwirq(d);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+
+	community = intel_get_community(pctrl, pin);
+	if (community) {
+		unsigned padno = pin_to_padno(community, pin);
+		unsigned gpp_size = community->gpp_size;
+		unsigned gpp_offset = padno % gpp_size;
+		unsigned gpp = padno / gpp_size;
+		u32 value;
+
+		/* Clear interrupt status first to avoid unexpected interrupt */
+		writel(BIT(gpp_offset), community->regs + GPI_IS + gpp * 4);
+
+		value = readl(community->regs + community->ie_offset + gpp * 4);
+		value |= BIT(gpp_offset);
+		writel(value, community->regs + community->ie_offset + gpp * 4);
+	}
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
 static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -853,6 +882,7 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 
 static struct irq_chip intel_gpio_irqchip = {
 	.name = "intel-gpio",
+	.irq_enable = intel_gpio_irq_enable,
 	.irq_ack = intel_gpio_irq_ack,
 	.irq_mask = intel_gpio_irq_mask,
 	.irq_unmask = intel_gpio_irq_unmask,
-- 
1.8.3.2

