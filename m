From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH] pinctrl: intel: fix bug of register offset calculation
Date: Mon, 23 Nov 2015 19:28:13 +0800
Message-ID: <1448278093-16515-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40679 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753258AbbKWDYA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 22 Nov 2015 22:24:00 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qi.zheng@intel.com, qipeng.zha@intel.com

From: zhengq <qi.zheng@intel.com>

The group size for registers PADCFGLOCK, HOSTSW_OWN,
GPI_IS, GPI_IE, are not always 24. Add a parameter to let
the platform has the chance to reset the value.
Also fix the bug of register PAD_OWN offset calculation.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c |  1 +
 drivers/pinctrl/intel/pinctrl-intel.c   | 57 +++++++++++++++++++++------------
 drivers/pinctrl/intel/pinctrl-intel.h   |  3 ++
 3 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index e42d5d4..5979d38 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -28,6 +28,7 @@
 		.padcfglock_offset = BXT_PADCFGLOCK,	\
 		.hostown_offset = BXT_HOSTSW_OWN,	\
 		.ie_offset = BXT_GPI_IE,		\
+		.gpp_size = 32,                         \
 		.pin_base = (s),			\
 		.npins = ((e) - (s) + 1),		\
 	}
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 392e28d..d1e790a 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -37,6 +37,7 @@
 #define PADOWN_BITS			4
 #define PADOWN_SHIFT(p)			((p) % 8 * PADOWN_BITS)
 #define PADOWN_MASK(p)			(0xf << PADOWN_SHIFT(p))
+#define PADOWN_GPP(p)			((p)/8)
 
 /* Offset from pad_regs */
 #define PADCFG0				0x000
@@ -108,6 +109,14 @@ struct intel_pinctrl {
 #define gpiochip_to_pinctrl(c)	container_of(c, struct intel_pinctrl, chip)
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
 
+static unsigned intel_npads_in_gpp(const struct intel_community *community)
+{
+	if (!community || !community->gpp_size)
+		return NPADS_IN_GPP;
+	else
+		return community->gpp_size;
+}
+
 static struct intel_community *intel_get_community(struct intel_pinctrl *pctrl,
 						   unsigned pin)
 {
@@ -142,7 +151,7 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl, unsigned pin,
 static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	const struct intel_community *community;
-	unsigned padno, gpp, gpp_offset, offset;
+	unsigned padno, gpp, offset;
 	void __iomem *padown;
 
 	community = intel_get_community(pctrl, pin);
@@ -152,9 +161,8 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 		return true;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
-	gpp_offset = padno % NPADS_IN_GPP;
-	offset = community->padown_offset + gpp * 16 + (gpp_offset / 8) * 4;
+	gpp = PADOWN_GPP(padno);
+	offset = community->padown_offset + gpp * 4;
 	padown = community->regs + offset;
 
 	return !(readl(padown) & PADOWN_MASK(padno));
@@ -163,7 +171,7 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
 static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	const struct intel_community *community;
-	unsigned padno, gpp, offset;
+	unsigned padno, gpp, offset, gpp_size;
 	void __iomem *hostown;
 
 	community = intel_get_community(pctrl, pin);
@@ -173,17 +181,18 @@ static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned pin)
 		return false;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
+	gpp_size = intel_npads_in_gpp(community);
+	gpp = padno / gpp_size;
 	offset = community->hostown_offset + gpp * 4;
 	hostown = community->regs + offset;
 
-	return !(readl(hostown) & BIT(padno % NPADS_IN_GPP));
+	return !(readl(hostown) & BIT(padno % gpp_size));
 }
 
 static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned pin)
 {
 	struct intel_community *community;
-	unsigned padno, gpp, offset;
+	unsigned padno, gpp, offset, gpp_size;
 	u32 value;
 
 	community = intel_get_community(pctrl, pin);
@@ -193,7 +202,8 @@ static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned pin)
 		return false;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
+	gpp_size = intel_npads_in_gpp(community);
+	gpp = padno / gpp_size;
 
 	/*
 	 * If PADCFGLOCK and PADCFGLOCKTX bits are both clear for this pad,
@@ -202,12 +212,12 @@ static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned pin)
 	 */
 	offset = community->padcfglock_offset + gpp * 8;
 	value = readl(community->regs + offset);
-	if (value & BIT(pin % NPADS_IN_GPP))
+	if (value & BIT(pin % gpp_size))
 		return true;
 
 	offset = community->padcfglock_offset + 4 + gpp * 8;
 	value = readl(community->regs + offset);
-	if (value & BIT(pin % NPADS_IN_GPP))
+	if (value & BIT(pin % gpp_size))
 		return true;
 
 	return false;
@@ -663,8 +673,9 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 	community = intel_get_community(pctrl, pin);
 	if (community) {
 		unsigned padno = pin_to_padno(community, pin);
-		unsigned gpp_offset = padno % NPADS_IN_GPP;
-		unsigned gpp = padno / NPADS_IN_GPP;
+		unsigned gpp_size = intel_npads_in_gpp(community);
+		unsigned gpp_offset = padno % gpp_size;
+		unsigned gpp = padno / gpp_size;
 
 		writel(BIT(gpp_offset), community->regs + GPI_IS + gpp * 4);
 	}
@@ -685,8 +696,9 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 	community = intel_get_community(pctrl, pin);
 	if (community) {
 		unsigned padno = pin_to_padno(community, pin);
-		unsigned gpp_offset = padno % NPADS_IN_GPP;
-		unsigned gpp = padno / NPADS_IN_GPP;
+		unsigned gpp_size = intel_npads_in_gpp(community);
+		unsigned gpp_offset = padno % gpp_size;
+		unsigned gpp = padno / gpp_size;
 		void __iomem *reg;
 		u32 value;
 
@@ -772,7 +784,7 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
-	unsigned padno, gpp, gpp_offset;
+	unsigned padno, gpp, gpp_offset, gpp_size;
 	u32 gpe_en;
 
 	community = intel_get_community(pctrl, pin);
@@ -780,8 +792,9 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 		return -EINVAL;
 
 	padno = pin_to_padno(community, pin);
-	gpp = padno / NPADS_IN_GPP;
-	gpp_offset = padno % NPADS_IN_GPP;
+	gpp_size = intel_npads_in_gpp(community);
+	gpp = padno / gpp_size;
+	gpp_offset = padno % gpp_size;
 
 	/* Clear the existing wake status */
 	writel(BIT(gpp_offset), community->regs + GPI_GPE_STS + gpp * 4);
@@ -807,6 +820,7 @@ static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 {
 	struct gpio_chip *gc = &pctrl->chip;
 	irqreturn_t ret = IRQ_NONE;
+	unsigned gpp_size = intel_npads_in_gpp(community);
 	int gpp;
 
 	for (gpp = 0; gpp < community->ngpps; gpp++) {
@@ -819,14 +833,14 @@ static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 		/* Only interrupts that are enabled */
 		pending &= enabled;
 
-		for_each_set_bit(gpp_offset, &pending, NPADS_IN_GPP) {
+		for_each_set_bit(gpp_offset, &pending, gpp_size) {
 			unsigned padno, irq;
 
 			/*
 			 * The last group in community can have less pins
 			 * than NPADS_IN_GPP.
 			 */
-			padno = gpp_offset + gpp * NPADS_IN_GPP;
+			padno = gpp_offset + gpp * gpp_size;
 			if (padno >= community->npins)
 				break;
 
@@ -1002,7 +1016,8 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 		community->regs = regs;
 		community->pad_regs = regs + padbar;
-		community->ngpps = DIV_ROUND_UP(community->npins, NPADS_IN_GPP);
+		community->ngpps = DIV_ROUND_UP(community->npins,
+						intel_npads_in_gpp(community));
 	}
 
 	irq = platform_get_irq(pdev, 0);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 4ec8b57..b602157 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -55,6 +55,8 @@ struct intel_function {
  *                  ACPI).
  * @ie_offset: Register offset of GPI_IE from @regs.
  * @pin_base: Starting pin of pins in this community
+ * @gpp_size: Maximum number of pads in each group, such as PADCFGLOCK,
+ *            HOSTSW_OWN,  GPI_IS, GPI_IE, etc.
  * @npins: Number of pins in this community
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
@@ -68,6 +70,7 @@ struct intel_community {
 	unsigned hostown_offset;
 	unsigned ie_offset;
 	unsigned pin_base;
+	unsigned gpp_size;
 	size_t npins;
 	void __iomem *regs;
 	void __iomem *pad_regs;
-- 
1.8.3.2

