From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 093/182] pinctrl: cherryview: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:30:43 +0100
Message-ID: <1449667843-1997-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36813 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754444AbbLINar (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:30:47 -0500
Received: by lfs39 with SMTP id 39so34417582lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:30:46 -0800 (PST)
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index dac8ec46aeb4..4251e0747a3a 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -181,8 +181,6 @@ struct chv_pinctrl {
 	struct chv_pin_context *saved_pin_context;
 };
 
-#define gpiochip_to_pinctrl(c) container_of(c, struct chv_pinctrl, chip)
-
 #define ALTERNATE_FUNCTION(p, m, i)		\
 	{					\
 		.pin = (p),			\
@@ -1157,7 +1155,7 @@ static unsigned chv_gpio_offset_to_pin(struct chv_pinctrl *pctrl,
 
 static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	int pin = chv_gpio_offset_to_pin(pctrl, offset);
 	unsigned long flags;
 	u32 ctrl0, cfg;
@@ -1176,7 +1174,7 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned pin = chv_gpio_offset_to_pin(pctrl, offset);
 	unsigned long flags;
 	void __iomem *reg;
@@ -1199,7 +1197,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned pin = chv_gpio_offset_to_pin(pctrl, offset);
 	u32 ctrl0, direction;
 	unsigned long flags;
@@ -1240,7 +1238,7 @@ static const struct gpio_chip chv_gpio_chip = {
 static void chv_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	int pin = chv_gpio_offset_to_pin(pctrl, irqd_to_hwirq(d));
 	u32 intr_line;
 
@@ -1257,7 +1255,7 @@ static void chv_gpio_irq_ack(struct irq_data *d)
 static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	int pin = chv_gpio_offset_to_pin(pctrl, irqd_to_hwirq(d));
 	u32 value, intr_line;
 	unsigned long flags;
@@ -1302,7 +1300,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 	 */
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_NONE) {
 		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-		struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+		struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 		unsigned offset = irqd_to_hwirq(d);
 		int pin = chv_gpio_offset_to_pin(pctrl, offset);
 		irq_flow_handler_t handler;
@@ -1334,7 +1332,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned offset = irqd_to_hwirq(d);
 	int pin = chv_gpio_offset_to_pin(pctrl, offset);
 	unsigned long flags;
@@ -1407,7 +1405,7 @@ static struct irq_chip chv_gpio_irqchip = {
 static void chv_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
+	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	u32 intr_line;
@@ -1439,7 +1437,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->parent = pctrl->dev;
 	chip->base = -1;
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed to register gpiochip\n");
 		return ret;
-- 
2.4.3

