From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 2/3] pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain
Date: Tue, 20 Sep 2016 15:15:22 +0300
Message-ID: <20160920121523.170293-3-mika.westerberg@linux.intel.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It turns out that for north and southwest communities, they can only
generate GPIO interrupts for lower 8 interrupts (IntSel value). The upper
part (8-15) can only generate GPEs (General Purpose Events).

Now the reason why EC events such as pressing hotkeys does not work if we
mask all the interrupts is that in order to generate either interrupts or
GPEs the INTMASK register must have that particular interrupt unmasked. In
case of GPEs the CPU does not trigger normal interrupt (and thus the GPIO
driver does not see it) but instead it causes SCI (System Control
Interrupt) to be triggered with the GPE in question set.

To make this all work as expected we only add those GPIOs to the IRQ domain
that can actually generate interrupts (IntSel value 0-7) and skip others.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 34 +++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 0fe8fad25e4d..d23be3a2fb35 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -134,6 +134,7 @@ struct chv_gpio_pinrange {
  * @gpio_ranges: An array of GPIO ranges in this community
  * @ngpio_ranges: Number of GPIO ranges
  * @ngpios: Total number of GPIOs in this community
+ * @nirqs: Total number of IRQs this community can generate
  */
 struct chv_community {
 	const char *uid;
@@ -146,6 +147,7 @@ struct chv_community {
 	const struct chv_gpio_pinrange *gpio_ranges;
 	size_t ngpio_ranges;
 	size_t ngpios;
+	size_t nirqs;
 };
 
 struct chv_pin_context {
@@ -396,6 +398,12 @@ static const struct chv_community southwest_community = {
 	.gpio_ranges = southwest_gpio_ranges,
 	.ngpio_ranges = ARRAY_SIZE(southwest_gpio_ranges),
 	.ngpios = ARRAY_SIZE(southwest_pins),
+	/*
+	 * Southwest community can benerate GPIO interrupts only for the
+	 * first 8 interrupts. The upper half (8-15) can only be used to
+	 * trigger GPEs.
+	 */
+	.nirqs = 8,
 };
 
 static const struct pinctrl_pin_desc north_pins[] = {
@@ -479,6 +487,12 @@ static const struct chv_community north_community = {
 	.gpio_ranges = north_gpio_ranges,
 	.ngpio_ranges = ARRAY_SIZE(north_gpio_ranges),
 	.ngpios = ARRAY_SIZE(north_pins),
+	/*
+	 * North community can benerate GPIO interrupts only for the first
+	 * 8 interrupts. The upper half (8-15) can only be used to trigger
+	 * GPEs.
+	 */
+	.nirqs = 8,
 };
 
 static const struct pinctrl_pin_desc east_pins[] = {
@@ -521,6 +535,7 @@ static const struct chv_community east_community = {
 	.gpio_ranges = east_gpio_ranges,
 	.ngpio_ranges = ARRAY_SIZE(east_gpio_ranges),
 	.ngpios = ARRAY_SIZE(east_pins),
+	.nirqs = 16,
 };
 
 static const struct pinctrl_pin_desc southeast_pins[] = {
@@ -646,6 +661,7 @@ static const struct chv_community southeast_community = {
 	.gpio_ranges = southeast_gpio_ranges,
 	.ngpio_ranges = ARRAY_SIZE(southeast_gpio_ranges),
 	.ngpios = ARRAY_SIZE(southeast_pins),
+	.nirqs = 16,
 };
 
 static const struct chv_community *chv_communities[] = {
@@ -1497,7 +1513,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	pending = readl(pctrl->regs + CHV_INTSTAT);
-	for_each_set_bit(intr_line, &pending, 16) {
+	for_each_set_bit(intr_line, &pending, pctrl->community->nirqs) {
 		unsigned irq, offset;
 
 		offset = pctrl->intr_lines[intr_line];
@@ -1520,6 +1536,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
 	chip->base = -1;
+	chip->irq_need_valid_mask = true;
 
 	ret = gpiochip_add_data(chip, pctrl);
 	if (ret) {
@@ -1539,6 +1556,21 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		offset += range->npins;
 	}
 
+	/* Do not add GPIOs that can only generate GPEs to the IRQ domain */
+	for (i = 0; i < pctrl->community->npins; i++) {
+		const struct pinctrl_pin_desc *desc;
+		u32 intsel;
+
+		desc = &pctrl->community->pins[i];
+
+		intsel = readl(chv_padreg(pctrl, desc->number, CHV_PADCTRL0));
+		intsel &= CHV_PADCTRL0_INTSEL_MASK;
+		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
+
+		if (intsel >= pctrl->community->nirqs)
+			clear_bit(i, chip->irq_valid_mask);
+	}
+
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
-- 
2.9.3
