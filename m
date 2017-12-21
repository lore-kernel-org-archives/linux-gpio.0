From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpiolib: don't dereference a desc before validation
Date: Thu, 21 Dec 2017 18:37:24 +0200
Message-ID: <20171221163724.6043-1-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:44557 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751655AbdLUQh2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 11:37:28 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

The fix restores a proper validation of an input gpio desc, which
might be needed to deal with optional GPIOs correctly.

Fixes: 02e479808b5d ("gpio: Alter semantics of *raw* operations to actually be raw")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e9ec44f..72577cd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2457,7 +2457,7 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
-	struct gpio_chip *gc = desc->gdev->chip;
+	struct gpio_chip *gc;
 	int ret;
 
 	VALIDATE_DESC(desc);
@@ -2474,6 +2474,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
+	gc = desc->gdev->chip;
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
 		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-- 
2.10.2

