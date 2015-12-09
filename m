From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 104/182] pinctrl: pistachio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:09 +0100
Message-ID: <1449667929-2705-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33121 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754181AbbLINcP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:15 -0500
Received: by lbbkw15 with SMTP id kw15so30039371lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index fd5148d106a3..856f736cb1a6 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -842,14 +842,9 @@ static inline void pctl_writel(struct pistachio_pinctrl *pctl, u32 val, u32 reg)
 	writel(val, pctl->base + reg);
 }
 
-static inline struct pistachio_gpio_bank *gc_to_bank(struct gpio_chip *gc)
-{
-	return container_of(gc, struct pistachio_gpio_bank, gpio_chip);
-}
-
 static inline struct pistachio_gpio_bank *irqd_to_bank(struct irq_data *d)
 {
-	return gc_to_bank(irq_data_get_irq_chip_data(d));
+	return gpiochip_get_data(irq_data_get_irq_chip_data(d));
 }
 
 static inline u32 gpio_readl(struct pistachio_gpio_bank *bank, u32 reg)
@@ -992,7 +987,7 @@ static int pistachio_pinmux_enable(struct pinctrl_dev *pctldev,
 
 	range = pinctrl_find_gpio_range_from_pin(pctl->pctldev, pg->pin);
 	if (range)
-		gpio_disable(gc_to_bank(range->gc), pg->pin - range->pin_base);
+		gpio_disable(gpiochip_get_data(range->gc), pg->pin - range->pin_base);
 
 	return 0;
 }
@@ -1173,14 +1168,14 @@ static struct pinctrl_desc pistachio_pinctrl_desc = {
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	return !(gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset));
 }
 
 static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 reg;
 
 	if (gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset))
@@ -1194,7 +1189,7 @@ static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void pistachio_gpio_set(struct gpio_chip *chip, unsigned offset,
 			       int value)
 {
-	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	gpio_mask_writel(bank, GPIO_OUTPUT, offset, !!value);
 }
@@ -1202,7 +1197,7 @@ static void pistachio_gpio_set(struct gpio_chip *chip, unsigned offset,
 static int pistachio_gpio_direction_input(struct gpio_chip *chip,
 					  unsigned offset)
 {
-	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	gpio_mask_writel(bank, GPIO_OUTPUT_EN, offset, 0);
 	gpio_enable(bank, offset);
@@ -1213,7 +1208,7 @@ static int pistachio_gpio_direction_input(struct gpio_chip *chip,
 static int pistachio_gpio_direction_output(struct gpio_chip *chip,
 					   unsigned offset, int value)
 {
-	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	pistachio_gpio_set(chip, offset, value);
 	gpio_mask_writel(bank, GPIO_OUTPUT_EN, offset, 1);
@@ -1303,7 +1298,7 @@ static int pistachio_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct pistachio_gpio_bank *bank = gc_to_bank(gc);
+	struct pistachio_gpio_bank *bank = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned int pin;
@@ -1390,7 +1385,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 
 		bank->gpio_chip.parent = pctl->dev;
 		bank->gpio_chip.of_node = child;
-		ret = gpiochip_add(&bank->gpio_chip);
+		ret = gpiochip_add_data(&bank->gpio_chip, bank);
 		if (ret < 0) {
 			dev_err(pctl->dev, "Failed to add GPIO chip %u: %d\n",
 				i, ret);
-- 
2.4.3

