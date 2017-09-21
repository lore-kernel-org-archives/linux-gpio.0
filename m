From: Kyle Roeschley <kyle.roeschley@ni.com>
Subject: [PATCH] pinctrl: intel: Mask interrupts on driver probe
Date: Thu, 21 Sep 2017 14:20:03 -0500
Message-ID: <20170921192003.17324-1-kyle.roeschley@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:52319 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751666AbdIUTUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Sep 2017 15:20:07 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Powering off the system on Apollo Lake does not clear the interrupt
enable registers for the GPIOs. To avoid an interrupt storm on driver
probe, clear all interrupt enables before enabling our interrupt line.

Signed-off-by: Kyle Roeschley <kyle.roeschley@ni.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 43 +++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 71df0f70b61f..f08006417aed 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1043,6 +1043,26 @@ static struct irq_chip intel_gpio_irqchip = {
 	.flags = IRQCHIP_MASK_ON_SUSPEND,
 };
 
+static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
+{
+	size_t i;
+
+	for (i = 0; i < pctrl->ncommunities; i++) {
+		const struct intel_community *community;
+		void __iomem *base;
+		unsigned gpp;
+
+		community = &pctrl->communities[i];
+		base = community->regs;
+
+		for (gpp = 0; gpp < community->ngpps; gpp++) {
+			/* Mask and clear all interrupts */
+			writel(0, base + community->ie_offset + gpp * 4);
+			writel(0xffff, base + GPI_IS + gpp * 4);
+		}
+	}
+}
+
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	int ret;
@@ -1068,6 +1088,9 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		return ret;
 	}
 
+	/* Mask all interrupts */
+	intel_gpio_irq_init(pctrl);
+
 	/*
 	 * We need to request the interrupt here (instead of providing chip
 	 * to the irq directly) because on some platforms several GPIO
@@ -1341,26 +1364,6 @@ int intel_pinctrl_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(intel_pinctrl_suspend);
 
-static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
-{
-	size_t i;
-
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *community;
-		void __iomem *base;
-		unsigned gpp;
-
-		community = &pctrl->communities[i];
-		base = community->regs;
-
-		for (gpp = 0; gpp < community->ngpps; gpp++) {
-			/* Mask and clear all interrupts */
-			writel(0, base + community->ie_offset + gpp * 4);
-			writel(0xffff, base + GPI_IS + gpp * 4);
-		}
-	}
-}
-
 int intel_pinctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-- 
2.14.1

