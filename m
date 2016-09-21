From: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
Subject: [PATCH] pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts
Date: Wed, 21 Sep 2016 16:03:22 -0700
Message-ID: <1474499002-76446-1-git-send-email-nilesh.bacchewar@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:6617 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753111AbcIUXB7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Sep 2016 19:01:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On some Intel BXT platform, wake-up from suspend-to-idle on pressing
power-button is not working. Its noticed that gpio-keys driver marking the
second level IRQ/power-button as wake capable but Intel pintctrl
driver is missing to mark GPIO chip/controller IRQ which first level IRQ
as wake cable if its GPIO pin IRQ is wakeble. So, though the first level
IRQ gets generated on power-button press, since it is not marked as
wake capable resume/wake-up flow is not happening.
Intel pintctrl/GPIO driver need to mark GPIO chip/controller IRQ (first
level IRQ) as wake capable iff GPIO pin's IRQ (second level IRQ) is marked
as wake cable.

Signed-off-by: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 257cab1..ad19592 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -86,6 +86,7 @@ struct intel_pinctrl_context {
  * @communities: All communities in this pin controller
  * @ncommunities: Number of communities in this pin controller
  * @context: Configuration saved over system sleep
+ * @irq: pinctrl/GPIO chip irq number
  */
 struct intel_pinctrl {
 	struct device *dev;
@@ -97,6 +98,7 @@ struct intel_pinctrl {
 	struct intel_community *communities;
 	size_t ncommunities;
 	struct intel_pinctrl_context context;
+	int irq;
 };
 
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
@@ -793,38 +795,12 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
-	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
-	unsigned padno, gpp, gpp_offset;
-	unsigned long flags;
-	u32 gpe_en;
-
-	community = intel_get_community(pctrl, pin);
-	if (!community)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	padno = pin_to_padno(community, pin);
-	gpp = padno / community->gpp_size;
-	gpp_offset = padno % community->gpp_size;
-
-	/* Clear the existing wake status */
-	writel(BIT(gpp_offset), community->regs + GPI_GPE_STS + gpp * 4);
-
-	/*
-	 * The controller will generate wake when GPE of the corresponding
-	 * pad is enabled and it is not routed to SCI (GPIROUTSCI is not
-	 * set).
-	 */
-	gpe_en = readl(community->regs + GPI_GPE_EN + gpp * 4);
 	if (on)
-		gpe_en |= BIT(gpp_offset);
+		enable_irq_wake(pctrl->irq);
 	else
-		gpe_en &= ~BIT(gpp_offset);
-	writel(gpe_en, community->regs + GPI_GPE_EN + gpp * 4);
-
-	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+		disable_irq_wake(pctrl->irq);
 
 	dev_dbg(pctrl->dev, "%sable wake for pin %u\n", on ? "en" : "dis", pin);
 	return 0;
-- 
1.9.1

