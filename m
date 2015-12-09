From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 048/182] gpio: pca953x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:32 +0100
Message-ID: <1449667172-32024-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34956 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINTh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:37 -0500
Received: by lfdl133 with SMTP id l133so33874151lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Toby Smith <toby@tismith.id.au>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: Toby Smith <toby@tismith.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pca953x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2eaf235a39e5..deef862fc87a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -107,11 +107,6 @@ struct pca953x_chip {
 	unsigned long driver_data;
 };
 
-static inline struct pca953x_chip *to_pca(struct gpio_chip *gc)
-{
-	return container_of(gc, struct pca953x_chip, gpio_chip);
-}
-
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
@@ -214,7 +209,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
@@ -243,7 +238,7 @@ exit:
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
@@ -293,7 +288,7 @@ exit:
 
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u32 reg_val;
 	int ret, offset = 0;
 
@@ -321,7 +316,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
@@ -374,7 +369,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 static void pca953x_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask[d->hwirq / BANK_SZ] &= ~(1 << (d->hwirq % BANK_SZ));
 }
@@ -382,7 +377,7 @@ static void pca953x_irq_mask(struct irq_data *d)
 static void pca953x_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
 }
@@ -390,7 +385,7 @@ static void pca953x_irq_unmask(struct irq_data *d)
 static void pca953x_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->irq_lock);
 }
@@ -398,7 +393,7 @@ static void pca953x_irq_bus_lock(struct irq_data *d)
 static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 new_irqs;
 	int level, i;
 
@@ -421,7 +416,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pca953x_chip *chip = to_pca(gc);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	int bank_nb = d->hwirq / BANK_SZ;
 	u8 mask = 1 << (d->hwirq % BANK_SZ);
 
@@ -721,7 +716,7 @@ static int pca953x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = gpiochip_add(&chip->gpio_chip);
+	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (ret)
 		return ret;
 
-- 
2.4.3

