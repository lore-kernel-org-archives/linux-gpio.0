From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 008/182] gpio: adnp: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:13:44 +0100
Message-ID: <1449666824-30112-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:34864 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317AbbLINNt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:13:49 -0500
Received: by lbpu9 with SMTP id u9so29515104lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:13:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b8a1ac133390..fb5b47b69f14 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -36,11 +36,6 @@ struct adnp {
 	u8 *irq_low;
 };
 
-static inline struct adnp *to_adnp(struct gpio_chip *chip)
-{
-	return container_of(chip, struct adnp, gpio);
-}
-
 static int adnp_read(struct adnp *adnp, unsigned offset, uint8_t *value)
 {
 	int err;
@@ -72,7 +67,7 @@ static int adnp_write(struct adnp *adnp, unsigned offset, uint8_t value)
 
 static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct adnp *adnp = to_adnp(chip);
+	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
 	u8 value;
@@ -106,7 +101,7 @@ static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
 
 static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct adnp *adnp = to_adnp(chip);
+	struct adnp *adnp = gpiochip_get_data(chip);
 
 	mutex_lock(&adnp->i2c_lock);
 	__adnp_gpio_set(adnp, offset, value);
@@ -115,7 +110,7 @@ static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct adnp *adnp = to_adnp(chip);
+	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
 	u8 value;
@@ -150,7 +145,7 @@ out:
 static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
-	struct adnp *adnp = to_adnp(chip);
+	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
 	int err;
@@ -187,7 +182,7 @@ out:
 
 static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct adnp *adnp = to_adnp(chip);
+	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int num_regs = 1 << adnp->reg_shift, i, j;
 	int err;
 
@@ -270,7 +265,7 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
 	chip->of_node = chip->parent->of_node;
 	chip->owner = THIS_MODULE;
 
-	err = gpiochip_add(chip);
+	err = gpiochip_add_data(chip, adnp);
 	if (err)
 		return err;
 
@@ -340,7 +335,7 @@ static irqreturn_t adnp_irq(int irq, void *data)
 static void adnp_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct adnp *adnp = to_adnp(gc);
+	struct adnp *adnp = gpiochip_get_data(gc);
 	unsigned int reg = d->hwirq >> adnp->reg_shift;
 	unsigned int pos = d->hwirq & 7;
 
@@ -350,7 +345,7 @@ static void adnp_irq_mask(struct irq_data *d)
 static void adnp_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct adnp *adnp = to_adnp(gc);
+	struct adnp *adnp = gpiochip_get_data(gc);
 	unsigned int reg = d->hwirq >> adnp->reg_shift;
 	unsigned int pos = d->hwirq & 7;
 
@@ -360,7 +355,7 @@ static void adnp_irq_unmask(struct irq_data *d)
 static int adnp_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct adnp *adnp = to_adnp(gc);
+	struct adnp *adnp = gpiochip_get_data(gc);
 	unsigned int reg = d->hwirq >> adnp->reg_shift;
 	unsigned int pos = d->hwirq & 7;
 
@@ -390,7 +385,7 @@ static int adnp_irq_set_type(struct irq_data *d, unsigned int type)
 static void adnp_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct adnp *adnp = to_adnp(gc);
+	struct adnp *adnp = gpiochip_get_data(gc);
 
 	mutex_lock(&adnp->irq_lock);
 }
@@ -398,7 +393,7 @@ static void adnp_irq_bus_lock(struct irq_data *d)
 static void adnp_irq_bus_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct adnp *adnp = to_adnp(gc);
+	struct adnp *adnp = gpiochip_get_data(gc);
 	unsigned int num_regs = 1 << adnp->reg_shift, i;
 
 	mutex_lock(&adnp->i2c_lock);
-- 
2.4.3

