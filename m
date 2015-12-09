From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 063/182] gpio: sx150x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:14 +0100
Message-ID: <1449667394-32767-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34906 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINXT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:19 -0500
Received: by lfdl133 with SMTP id l133so33946473lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sx150x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index cf12d8e3ce3e..43bc4406d4f6 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -160,11 +160,6 @@ static const struct of_device_id sx150x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
-struct sx150x_chip *to_sx150x(struct gpio_chip *gc)
-{
-	return container_of(gc, struct sx150x_chip, gpio_chip);
-}
-
 static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
 {
 	s32 err = i2c_smbus_write_byte_data(client, reg, val);
@@ -301,7 +296,7 @@ static int sx150x_io_output(struct sx150x_chip *chip, unsigned offset, int val)
 
 static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct sx150x_chip *chip = to_sx150x(gc);
+	struct sx150x_chip *chip = gpiochip_get_data(gc);
 	int status = -EINVAL;
 
 	if (!offset_is_oscio(chip, offset)) {
@@ -315,7 +310,7 @@ static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
 {
-	struct sx150x_chip *chip = to_sx150x(gc);
+	struct sx150x_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
 	if (offset_is_oscio(chip, offset))
@@ -327,7 +322,7 @@ static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
 
 static int sx150x_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct sx150x_chip *chip = to_sx150x(gc);
+	struct sx150x_chip *chip = gpiochip_get_data(gc);
 	int status = -EINVAL;
 
 	if (!offset_is_oscio(chip, offset)) {
@@ -342,7 +337,7 @@ static int sx150x_gpio_direction_output(struct gpio_chip *gc,
 					unsigned offset,
 					int val)
 {
-	struct sx150x_chip *chip = to_sx150x(gc);
+	struct sx150x_chip *chip = gpiochip_get_data(gc);
 	int status = 0;
 
 	if (!offset_is_oscio(chip, offset)) {
@@ -355,7 +350,7 @@ static int sx150x_gpio_direction_output(struct gpio_chip *gc,
 
 static void sx150x_irq_mask(struct irq_data *d)
 {
-	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
+	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned n = d->hwirq;
 
 	chip->irq_masked |= (1 << n);
@@ -364,7 +359,7 @@ static void sx150x_irq_mask(struct irq_data *d)
 
 static void sx150x_irq_unmask(struct irq_data *d)
 {
-	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
+	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned n = d->hwirq;
 
 	chip->irq_masked &= ~(1 << n);
@@ -373,7 +368,7 @@ static void sx150x_irq_unmask(struct irq_data *d)
 
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
+	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned n, val = 0;
 
 	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
@@ -428,14 +423,14 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 
 static void sx150x_irq_bus_lock(struct irq_data *d)
 {
-	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
+	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
 	mutex_lock(&chip->lock);
 }
 
 static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct sx150x_chip *chip = to_sx150x(irq_data_get_irq_chip_data(d));
+	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned n;
 
 	if (chip->irq_update == NO_UPDATE_PENDING)
@@ -647,7 +642,7 @@ static int sx150x_probe(struct i2c_client *client,
 	if (rc < 0)
 		return rc;
 
-	rc = gpiochip_add(&chip->gpio_chip);
+	rc = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (rc)
 		return rc;
 
-- 
2.4.3

