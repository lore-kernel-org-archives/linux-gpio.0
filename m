From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain
Date: Thu, 15 Sep 2016 18:52:10 +0300
Message-ID: <20160915155210.94413-2-mika.westerberg@linux.intel.com>
References: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
 <20160915155210.94413-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:54359 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751302AbcIOPwR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Sep 2016 11:52:17 -0400
In-Reply-To: <20160915155210.94413-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

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

Reported-by: Phidias Chiang <phidias.chiang@canonical.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi Phidias and Anisse,

Can you try this series out? It should finally fix the EC event issue(s)
you have reported.

 drivers/pinctrl/intel/pinctrl-cherryview.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 0fe8fad25e4d..717ef1b00adb 100644
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
@@ -1539,6 +1555,21 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
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
+			clear_bit(i, chip->valid_mask);
+	}
+
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
-- 
2.9.3

