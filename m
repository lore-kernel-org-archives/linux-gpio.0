From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 094/182] pinctrl: intel: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:30:50 +0100
Message-ID: <1449667850-2059-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34120 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451AbbLINaz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:30:55 -0500
Received: by lffu14 with SMTP id u14so34285097lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:30:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 401c186244be..9597f57f07a0 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -105,7 +105,6 @@ struct intel_pinctrl {
 	struct intel_pinctrl_context context;
 };
 
-#define gpiochip_to_pinctrl(c)	container_of(c, struct intel_pinctrl, chip)
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
 
 static struct intel_community *intel_get_community(struct intel_pinctrl *pctrl,
@@ -598,7 +597,7 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
 
 static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	void __iomem *reg;
 
 	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
@@ -610,7 +609,7 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	void __iomem *reg;
 
 	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
@@ -654,7 +653,7 @@ static const struct gpio_chip intel_gpio_chip = {
 static void intel_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
 
@@ -675,7 +674,7 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned long flags;
@@ -715,7 +714,7 @@ static void intel_gpio_irq_unmask(struct irq_data *d)
 static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned long flags;
 	void __iomem *reg;
@@ -769,7 +768,7 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned padno, gpp, gpp_offset;
@@ -877,7 +876,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->chip.parent = pctrl->dev;
 	pctrl->chip.base = -1;
 
-	ret = gpiochip_add(&pctrl->chip);
+	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to register gpiochip\n");
 		return ret;
-- 
2.4.3

