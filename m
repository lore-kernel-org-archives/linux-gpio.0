From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 032/182] gpio: lynxpoint: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:13 +0100
Message-ID: <1449667033-31266-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36148 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598AbbLINRT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:19 -0500
Received: by lbblt2 with SMTP id lt2so29889758lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-lynxpoint.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 6a48ffd6e0db..13107772be4f 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -97,7 +97,7 @@ struct lp_gpio {
 static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 				 int reg)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	int reg_offset;
 
 	if (reg == LP_CONFIG1 || reg == LP_CONFIG2)
@@ -112,7 +112,7 @@ static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 
 static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 	unsigned long acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
@@ -137,7 +137,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 
 	/* disable input sensing */
@@ -149,7 +149,7 @@ static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 static int lp_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = container_of(gc, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 value;
@@ -191,7 +191,7 @@ static int lp_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -207,7 +207,7 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -221,7 +221,7 @@ static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int lp_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned offset, int value)
 {
-	struct lp_gpio *lg = container_of(chip, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -238,7 +238,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct lp_gpio *lg = container_of(gc, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin, mask;
 	unsigned long reg, ena, pending;
@@ -273,7 +273,7 @@ static void lp_irq_mask(struct irq_data *d)
 static void lp_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = container_of(gc, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
@@ -286,7 +286,7 @@ static void lp_irq_enable(struct irq_data *d)
 static void lp_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = container_of(gc, struct lp_gpio, chip);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
@@ -370,7 +370,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = false;
 	gc->parent = dev;
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, lg);
 	if (ret) {
 		dev_err(dev, "failed adding lp-gpio chip\n");
 		return ret;
-- 
2.4.3

