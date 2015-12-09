From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 023/182] gpio: dln2: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:50 +0100
Message-ID: <1449666950-30831-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36515 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINP4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:56 -0500
Received: by lbblt2 with SMTP id lt2so29866054lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:54 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Octavian Purdila <octavian.purdila@intel.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dln2.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index e541af03dd45..e11a7d126e74 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -153,7 +153,7 @@ static int dln2_gpio_pin_set_out_val(struct dln2_gpio *dln2,
 
 static int dln2_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	struct dln2_gpio_pin req = {
 		.pin = cpu_to_le16(offset),
 	};
@@ -194,14 +194,14 @@ out_disable:
 
 static void dln2_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	dln2_gpio_pin_cmd(dln2, DLN2_GPIO_PIN_DISABLE, offset);
 }
 
 static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	if (test_bit(offset, dln2->output_enabled))
 		return GPIOF_DIR_OUT;
@@ -211,7 +211,7 @@ static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	int dir;
 
 	dir = dln2_gpio_get_direction(chip, offset);
@@ -226,7 +226,7 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	dln2_gpio_pin_set_out_val(dln2, offset, value);
 }
@@ -234,7 +234,7 @@ static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
 				   unsigned dir)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	struct dln2_gpio_pin_val req = {
 		.pin = cpu_to_le16(offset),
 		.value = dir,
@@ -262,7 +262,7 @@ static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	int ret;
 
 	ret = dln2_gpio_pin_set_out_val(dln2, offset, value);
@@ -275,7 +275,7 @@ static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 static int dln2_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 				  unsigned debounce)
 {
-	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	__le32 duration = cpu_to_le32(debounce);
 
 	return dln2_transfer_tx(dln2->pdev, DLN2_GPIO_SET_DEBOUNCE,
@@ -302,7 +302,7 @@ static int dln2_gpio_set_event_cfg(struct dln2_gpio *dln2, unsigned pin,
 static void dln2_irq_unmask(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
-	struct dln2_gpio *dln2 = container_of(gc, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(irqd);
 
 	set_bit(pin, dln2->unmasked_irqs);
@@ -311,7 +311,7 @@ static void dln2_irq_unmask(struct irq_data *irqd)
 static void dln2_irq_mask(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
-	struct dln2_gpio *dln2 = container_of(gc, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(irqd);
 
 	clear_bit(pin, dln2->unmasked_irqs);
@@ -320,7 +320,7 @@ static void dln2_irq_mask(struct irq_data *irqd)
 static int dln2_irq_set_type(struct irq_data *irqd, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
-	struct dln2_gpio *dln2 = container_of(gc, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(irqd);
 
 	switch (type) {
@@ -349,7 +349,7 @@ static int dln2_irq_set_type(struct irq_data *irqd, unsigned type)
 static void dln2_irq_bus_lock(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
-	struct dln2_gpio *dln2 = container_of(gc, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 
 	mutex_lock(&dln2->irq_lock);
 }
@@ -357,7 +357,7 @@ static void dln2_irq_bus_lock(struct irq_data *irqd)
 static void dln2_irq_bus_unlock(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
-	struct dln2_gpio *dln2 = container_of(gc, struct dln2_gpio, gpio);
+	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(irqd);
 	int enabled, unmasked;
 	unsigned type;
@@ -479,7 +479,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dln2);
 
-	ret = gpiochip_add(&dln2->gpio);
+	ret = gpiochip_add_data(&dln2->gpio, dln2);
 	if (ret < 0) {
 		dev_err(dev, "failed to add gpio chip: %d\n", ret);
 		goto out;
-- 
2.4.3

