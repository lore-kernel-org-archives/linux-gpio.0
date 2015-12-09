From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 115/182] pinctrl: sirf-atlas7: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:33 +0100
Message-ID: <1449668013-3246-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:33974 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451AbbLINdi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:38 -0500
Received: by lbbcs9 with SMTP id cs9so29982143lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Barry Song <baohua@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 1850dc1b3863..3a95ffdbaa72 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -355,11 +355,6 @@ struct atlas7_gpio_chip {
 	struct atlas7_gpio_bank banks[0];
 };
 
-static inline struct atlas7_gpio_chip *to_atlas7_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct atlas7_gpio_chip, chip);
-}
-
 /**
  * @dev: a pointer back to containing device
  * @virtbase: the offset to the controller in virtual memory
@@ -5600,7 +5595,7 @@ static int __atlas7_gpio_to_pin(struct atlas7_gpio_chip *a7gc, u32 gpio)
 static void atlas7_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(gc);
 	struct atlas7_gpio_bank *bank;
 	void __iomem *ctrl_reg;
 	u32 val, pin_in_bank;
@@ -5638,7 +5633,7 @@ static void __atlas7_gpio_irq_mask(struct atlas7_gpio_chip *a7gc, int idx)
 static void atlas7_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&a7gc->lock, flags);
@@ -5651,7 +5646,7 @@ static void atlas7_gpio_irq_mask(struct irq_data *d)
 static void atlas7_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(gc);
 	struct atlas7_gpio_bank *bank;
 	void __iomem *ctrl_reg;
 	u32 val, pin_in_bank;
@@ -5675,7 +5670,7 @@ static int atlas7_gpio_irq_type(struct irq_data *d,
 				unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(gc);
 	struct atlas7_gpio_bank *bank;
 	void __iomem *ctrl_reg;
 	u32 val, pin_in_bank;
@@ -5744,7 +5739,7 @@ static struct irq_chip atlas7_gpio_irq_chip = {
 static void atlas7_gpio_handle_irq(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(gc);
 	struct atlas7_gpio_bank *bank = NULL;
 	u32 status, ctrl;
 	int pin_in_bank = 0, idx;
@@ -5812,7 +5807,7 @@ static void __atlas7_gpio_set_input(struct atlas7_gpio_chip *a7gc,
 static int atlas7_gpio_request(struct gpio_chip *chip,
 				unsigned int gpio)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	int ret;
 	unsigned long flags;
 
@@ -5840,7 +5835,7 @@ static int atlas7_gpio_request(struct gpio_chip *chip,
 static void atlas7_gpio_free(struct gpio_chip *chip,
 				unsigned int gpio)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&a7gc->lock, flags);
@@ -5856,7 +5851,7 @@ static void atlas7_gpio_free(struct gpio_chip *chip,
 static int atlas7_gpio_direction_input(struct gpio_chip *chip,
 					unsigned int gpio)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&a7gc->lock, flags);
@@ -5893,7 +5888,7 @@ static void __atlas7_gpio_set_output(struct atlas7_gpio_chip *a7gc,
 static int atlas7_gpio_direction_output(struct gpio_chip *chip,
 				unsigned int gpio, int value)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&a7gc->lock, flags);
@@ -5908,7 +5903,7 @@ static int atlas7_gpio_direction_output(struct gpio_chip *chip,
 static int atlas7_gpio_get_value(struct gpio_chip *chip,
 					unsigned int gpio)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	struct atlas7_gpio_bank *bank;
 	u32 val, pin_in_bank;
 	unsigned long flags;
@@ -5928,7 +5923,7 @@ static int atlas7_gpio_get_value(struct gpio_chip *chip,
 static void atlas7_gpio_set_value(struct gpio_chip *chip,
 				unsigned int gpio, int value)
 {
-	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(chip);
+	struct atlas7_gpio_chip *a7gc = gpiochip_get_data(chip);
 	struct atlas7_gpio_bank *bank;
 	void __iomem *ctrl_reg;
 	u32 ctrl, pin_in_bank;
@@ -6015,7 +6010,7 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	chip->parent = &pdev->dev;
 
 	/* Add gpio chip to system */
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, a7gc);
 	if (ret) {
 		dev_err(&pdev->dev,
 		"%s: error in probe function with status %d\n",
-- 
2.4.3

