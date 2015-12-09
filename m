From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 065/182] gpio: tb10x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:30 +0100
Message-ID: <1449667410-418-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:34289 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753331AbbLINXf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:35 -0500
Received: by lbbcs9 with SMTP id cs9so29809486lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Christian Ruppert <christian.ruppert@abilis.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Christian Ruppert <christian.ruppert@abilis.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 1a7c3efae5d8..5eaec20ddbc7 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -87,14 +87,9 @@ static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
 	spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
-static inline struct tb10x_gpio *to_tb10x_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct tb10x_gpio, gc);
-}
-
 static int tb10x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
+	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 	int mask = BIT(offset);
 	int val = TB10X_GPIO_DIR_IN << offset;
 
@@ -105,7 +100,7 @@ static int tb10x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 static int tb10x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
+	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 	int val;
 
 	val = tb10x_reg_read(tb10x_gpio, OFFSET_TO_REG_DATA);
@@ -118,7 +113,7 @@ static int tb10x_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void tb10x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
+	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 	int mask = BIT(offset);
 	int val = value << offset;
 
@@ -128,7 +123,7 @@ static void tb10x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int tb10x_gpio_direction_out(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
+	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 	int mask = BIT(offset);
 	int val = TB10X_GPIO_DIR_OUT << offset;
 
@@ -140,7 +135,7 @@ static int tb10x_gpio_direction_out(struct gpio_chip *chip,
 
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
+	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 
 	return irq_create_mapping(tb10x_gpio->domain, offset);
 }
@@ -210,7 +205,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	tb10x_gpio->gc.can_sleep	= false;
 
 
-	ret = gpiochip_add(&tb10x_gpio->gc);
+	ret = gpiochip_add_data(&tb10x_gpio->gc, tb10x_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not add gpiochip.\n");
 		goto fail_gpiochip_registration;
-- 
2.4.3

