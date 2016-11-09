From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: intel: Configure pin as GPIO input when used directly through irqchip
Date: Wed,  9 Nov 2016 13:22:31 +0200
Message-ID: <20161109112231.122700-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:29140 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752611AbcKILWf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Nov 2016 06:22:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

If a pin is used directly through irqchip without requesting it first as
GPIO, it might be in wrong mode (for example input buffer disabled). This
means the user may never get any interrupts.

Fix this by configuring the pin as GPIO input when its type is first set in
irq_set_type().

Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Since we probably need to do this for cherryview and baytrail pinctrl
drivers as well, I'm thinking is this something that the GPIO core could do
automatically?

 drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 01443762e570..a1a5e2a77f9e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -353,6 +353,23 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	return 0;
 }
 
+/* Called with pctrl->lock held */
+static void intel_gpio_set_gpio_mode(struct intel_pinctrl *pctrl,
+				     void __iomem *padcfg0)
+{
+	u32 value;
+
+	/* Put the pad into GPIO mode */
+	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
+	/* Disable SCI/SMI/NMI generation */
+	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
+	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
+	/* Disable TX buffer and enable RX (this will be input) */
+	value &= ~PADCFG0_GPIORXDIS;
+	value |= PADCFG0_GPIOTXDIS;
+	writel(value, padcfg0);
+}
+
 static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
 				     unsigned pin)
@@ -360,29 +377,26 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg0;
 	unsigned long flags;
-	u32 value;
+	int ret = 0;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	if (!intel_pad_usable(pctrl, pin)) {
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
-	/* Put the pad into GPIO mode */
-	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
-	/* Disable SCI/SMI/NMI generation */
-	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
-	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
-	/* Disable TX buffer and enable RX (this will be input) */
-	value &= ~PADCFG0_GPIORXDIS;
-	value |= PADCFG0_GPIOTXDIS;
-	writel(value, padcfg0);
+	if (!padcfg0) {
+		ret = -EINVAL;
+		goto out;
+	}
 
+	/* Set to GPIO input */
+	intel_gpio_set_gpio_mode(pctrl, padcfg0);
+out:
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-
-	return 0;
+	return ret;
 }
 
 static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -762,8 +776,10 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	value = readl(reg);
+	/* Make sure the pin is GPIO input */
+	intel_gpio_set_gpio_mode(pctrl, reg);
 
+	value = readl(reg);
 	value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
-- 
2.9.3

