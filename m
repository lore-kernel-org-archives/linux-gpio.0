From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5] gpio: sx150x: use container_of() to get state container
Date: Thu, 27 Aug 2015 16:55:21 +0200
Message-ID: <1440687321-17095-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:33007 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752887AbbH0Oz1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 10:55:27 -0400
Received: by labns7 with SMTP id ns7so14357753lab.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 07:55:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Wei Chen <Wei.Chen@csr.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The state container of the sx150x GPIO driver is sometimes
extracted from the gpio_chip exploiting the fact that offsetof()
the struct gpio_chip inside the struct sx150x_chip is 0, so
the container_of() is in practice a noop. However if a member
is added to struct sx150_chip in front of struct gpio_chip, things
will break. Using proper container_of() avoids this problem.

Semantically this is a noop, the compiler will optimize it away,
but syntactically it makes me happier.

Cc: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sx150x.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 458d9d7952b8..39ea0572d2df 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -160,6 +160,11 @@ static const struct of_device_id sx150x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
+struct sx150x_chip *to_sx150x(struct gpio_chip *gc)
+{
+	return container_of(gc, struct sx150x_chip, gpio_chip);
+}
+
 static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
 {
 	s32 err = i2c_smbus_write_byte_data(client, reg, val);
@@ -296,11 +301,9 @@ static int sx150x_io_output(struct sx150x_chip *chip, unsigned offset, int val)
 
 static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct sx150x_chip *chip;
+	struct sx150x_chip *chip = to_sx150x(gc);
 	int status = -EINVAL;
 
-	chip = container_of(gc, struct sx150x_chip, gpio_chip);
-
 	if (!offset_is_oscio(chip, offset)) {
 		mutex_lock(&chip->lock);
 		status = sx150x_get_io(chip, offset);
@@ -312,9 +315,7 @@ static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
 {
-	struct sx150x_chip *chip;
-
-	chip = container_of(gc, struct sx150x_chip, gpio_chip);
+	struct sx150x_chip *chip = to_sx150x(gc);
 
 	mutex_lock(&chip->lock);
 	if (offset_is_oscio(chip, offset))
@@ -326,11 +327,9 @@ static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
 
 static int sx150x_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct sx150x_chip *chip;
+	struct sx150x_chip *chip = to_sx150x(gc);
 	int status = -EINVAL;
 
-	chip = container_of(gc, struct sx150x_chip, gpio_chip);
-
 	if (!offset_is_oscio(chip, offset)) {
 		mutex_lock(&chip->lock);
 		status = sx150x_io_input(chip, offset);
@@ -343,11 +342,9 @@ static int sx150x_gpio_direction_output(struct gpio_chip *gc,
 					unsigned offset,
 					int val)
 {
-	struct sx150x_chip *chip;
+	struct sx150x_chip *chip = to_sx150x(gc);
 	int status = 0;
 
-	chip = container_of(gc, struct sx150x_chip, gpio_chip);
-
 	if (!offset_is_oscio(chip, offset)) {
 		mutex_lock(&chip->lock);
 		status = sx150x_io_output(chip, offset, val);
@@ -358,7 +355,7 @@ static int sx150x_gpio_direction_output(struct gpio_chip *gc,
 
 static void sx150x_irq_mask(struct irq_data *d)
 {
-	struct sx150x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
 	unsigned n = d->hwirq;
 
 	chip->irq_masked |= (1 << n);
@@ -367,7 +364,7 @@ static void sx150x_irq_mask(struct irq_data *d)
 
 static void sx150x_irq_unmask(struct irq_data *d)
 {
-	struct sx150x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
 	unsigned n = d->hwirq;
 
 	chip->irq_masked &= ~(1 << n);
@@ -376,7 +373,7 @@ static void sx150x_irq_unmask(struct irq_data *d)
 
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct sx150x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
 	unsigned n, val = 0;
 
 	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
@@ -431,14 +428,14 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 
 static void sx150x_irq_bus_lock(struct irq_data *d)
 {
-	struct sx150x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
 
 	mutex_lock(&chip->lock);
 }
 
 static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct sx150x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
 	unsigned n;
 
 	if (chip->irq_update == NO_UPDATE_PENDING)
-- 
2.4.3

