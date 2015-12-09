From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 026/182] gpio: intel-mid: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:21 +0100
Message-ID: <1449666981-30980-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:33979 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINQ0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:26 -0500
Received: by lbbcs9 with SMTP id cs9so29689358lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: David Cohen <david.a.cohen@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-intel-mid.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 1c46a7ef2680..6b7957a1f0b0 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -78,15 +78,10 @@ struct intel_mid_gpio {
 	struct pci_dev			*pdev;
 };
 
-static inline struct intel_mid_gpio *to_intel_gpio_priv(struct gpio_chip *gc)
-{
-	return container_of(gc, struct intel_mid_gpio, chip);
-}
-
 static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned offset,
 			      enum GPIO_REG reg_type)
 {
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(chip);
+	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	unsigned nreg = chip->ngpio / 32;
 	u8 reg = offset / 32;
 
@@ -96,7 +91,7 @@ static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned offset,
 static void __iomem *gpio_reg_2bit(struct gpio_chip *chip, unsigned offset,
 				   enum GPIO_REG reg_type)
 {
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(chip);
+	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	unsigned nreg = chip->ngpio / 32;
 	u8 reg = offset / 16;
 
@@ -138,7 +133,7 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(chip);
+	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
 	u32 value;
 	unsigned long flags;
@@ -161,7 +156,7 @@ static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int intel_gpio_direction_output(struct gpio_chip *chip,
 			unsigned offset, int value)
 {
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(chip);
+	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
 	unsigned long flags;
 
@@ -185,7 +180,7 @@ static int intel_gpio_direction_output(struct gpio_chip *chip,
 static int intel_mid_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(gc);
+	struct intel_mid_gpio *priv = gpiochip_get_data(gc);
 	u32 gpio = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 value;
@@ -304,7 +299,7 @@ MODULE_DEVICE_TABLE(pci, intel_gpio_ids);
 static void intel_mid_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct intel_mid_gpio *priv = to_intel_gpio_priv(gc);
+	struct intel_mid_gpio *priv = gpiochip_get_data(gc);
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, gpio, mask;
@@ -406,7 +401,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	spin_lock_init(&priv->lock);
 
 	pci_set_drvdata(pdev, priv);
-	retval = gpiochip_add(&priv->chip);
+	retval = gpiochip_add_data(&priv->chip, priv);
 	if (retval) {
 		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
 		return retval;
-- 
2.4.3

