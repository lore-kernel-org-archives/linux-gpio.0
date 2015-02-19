From: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Subject: [PATCH] gpio: tps65912: fix wrong container_of arguments
Date: Thu, 19 Feb 2015 01:52:25 +0000
Message-ID: <1424310745-28101-1-git-send-email-nicolassaenzj@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:57150 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbbBSBwj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Feb 2015 20:52:39 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

The gpio_chip operations receive a pointer the gpio_chip struct which is
contained in the driver's private struct, yet the container_of call in those
functions point to the mfd struct defined in include/linux/mfd/tps65912.h.

Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
---
 drivers/gpio/gpio-tps65912.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 472fb5b..9cdbc0c 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -26,9 +26,12 @@ struct tps65912_gpio_data {
 	struct gpio_chip gpio_chip;
 };
 
+#define to_tgd(gc) container_of(gc, struct tps65912_gpio_data, gpio_chip)
+
 static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65912 *tps65912 = container_of(gc, struct tps65912, gpio);
+	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 	int val;
 
 	val = tps65912_reg_read(tps65912, TPS65912_GPIO1 + offset);
@@ -42,7 +45,8 @@ static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
 			      int value)
 {
-	struct tps65912 *tps65912 = container_of(gc, struct tps65912, gpio);
+	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	if (value)
 		tps65912_set_bits(tps65912, TPS65912_GPIO1 + offset,
@@ -55,7 +59,8 @@ static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
 static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
-	struct tps65912 *tps65912 = container_of(gc, struct tps65912, gpio);
+	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	/* Set the initial value */
 	tps65912_gpio_set(gc, offset, value);
@@ -66,7 +71,8 @@ static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
 
 static int tps65912_gpio_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct tps65912 *tps65912 = container_of(gc, struct tps65912, gpio);
+	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
+	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
 
 	return tps65912_clear_bits(tps65912, TPS65912_GPIO1 + offset,
 								GPIO_CFG_MASK);
-- 
2.1.0

