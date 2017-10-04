From: Chris Gorman <chrisjohgorman@gmail.com>
Subject: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio irqs mapping
Date: Wed,  4 Oct 2017 12:07:34 -0400
Message-ID: <1507133254-5054-1-git-send-email-chrisjohgorman@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36029 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751120AbdJDQHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2017 12:07:44 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

From: Grygorii Strashko <grygorii.strashko@ti.com>

New GPIO IRQs are allocated and mapped dynamically by default when
GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
This causes issues on some Intel platforms [1] with broken BIOS which
hardcodes Linux IRQ numbers in their ACPI tables instead of GPIO number.

On such platforms cherryview-pinctrl driver should allocate and map all
GPIO IRQs at probe time.
Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
can be seen at boot log.

NOTE. It still may fail if boot sequence will changed and any new interrupt
controller will be probed before cherryview-pinctrl.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Tested-by: Chris Gorman <chrisjohgorman@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 04e929f..fadbca9 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1577,6 +1577,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	struct gpio_chip *chip = &pctrl->chip;
 	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
 	int ret, i, offset;
+	int irq_base;
 
 	*chip = chv_gpio_chip;
 
@@ -1622,7 +1623,18 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
-	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
+	if (!need_valid_mask) {
+		irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
+						chip->ngpio, NUMA_NO_NODE);
+		if (irq_base < 0) {
+			dev_err(pctrl->dev, "Failed to allocate IRQ numbers\n");
+			return irq_base;
+		}
+	} else {
+		irq_base = 0;
+	}
+
+	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, irq_base,
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add IRQ chip\n");
-- 
2.10.1

