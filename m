From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: create an API to detect open drain/source on lines
Date: Tue, 16 Feb 2016 15:46:19 +0100
Message-ID: <1455633979-30970-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36416 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754189AbcBPOqY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 09:46:24 -0500
Received: by mail-lb0-f175.google.com with SMTP id x1so18169656lbj.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 06:46:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

My left hand merges code to privatize the descriptor handling
while my right hand merges drivers that poke around and
disrespect with the same gpiolib internals.

So let's expose the proper APIs for drivers to ask the gpiolib
core if a line is marked as open drain or open source and
get some order around things so this driver compiles again.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65218.c |  9 ++++-----
 drivers/gpio/gpiolib.c       | 18 ++++++++++++++++++
 include/linux/gpio/driver.h  |  4 ++++
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 7b02f7be9bc9..9eb1a5ab2d95 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -71,17 +71,16 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
-	unsigned long flags = gc->desc[offset].flags;
 	int ret;
 
-	if (flags & FLAG_OPEN_SOURCE) {
+	if (gpiochip_line_is_open_source(gc, offset)) {
 		dev_err(gc->parent, "can't work as open source\n");
 		return -EINVAL;
 	}
 
 	switch (offset) {
 	case 0:
-		if (!(flags & FLAG_OPEN_DRAIN)) {
+		if (!gpiochip_line_is_open_drain(gc, offset)) {
 			dev_err(gc->parent, "GPO1 works only as open drain\n");
 			return -EINVAL;
 		}
@@ -103,7 +102,7 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 		break;
 	case 1:
 		/* GP02 is push-pull by default, can be set as open drain. */
-		if (flags & FLAG_OPEN_DRAIN) {
+		if (gpiochip_line_is_open_drain(gc, offset)) {
 			ret = tps65218_clear_bits(tps65218,
 						  TPS65218_REG_CONFIG1,
 						  TPS65218_CONFIG1_GPO2_BUF,
@@ -122,7 +121,7 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 		break;
 
 	case 2:
-		if (!(flags & FLAG_OPEN_DRAIN)) {
+		if (!gpiochip_line_is_open_drain(gc, offset)) {
 			dev_err(gc->parent, "GPO3 works only as open drain\n");
 			return -EINVAL;
 		}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aa4a60e19339..d8511cd68e7b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1901,6 +1901,24 @@ bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
 
+bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return test_bit(FLAG_OPEN_DRAIN, &chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_open_drain);
+
+bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return test_bit(FLAG_OPEN_SOURCE, &chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
+
 /**
  * gpiod_get_raw_value_cansleep() - return a gpio's raw value
  * @desc: gpio whose value will be returned
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b92ab9efdb69..ff96d0f9fceb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -199,6 +199,10 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset);
 
+/* Line status inquiry for drivers */
+bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset);
+
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *chip);
 
-- 
2.4.3

