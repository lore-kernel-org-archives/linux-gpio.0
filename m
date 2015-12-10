From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nsp-gpio: use gpiochip data pointer
Date: Thu, 10 Dec 2015 19:03:24 +0100
Message-ID: <1449770604-15734-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36048 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267AbbLJSDa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:03:30 -0500
Received: by lfed137 with SMTP id d137so11731841lfe.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:03:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index bb7891e786e3..59192ad10d98 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -18,7 +18,7 @@
  * through the interaction with the NSP IOMUX controller.
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -81,11 +81,6 @@ enum base_type {
 	IO_CTRL
 };
 
-static inline struct nsp_gpio *to_nsp_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct nsp_gpio, gc);
-}
-
 /*
  * Mapping from PINCONF pins to GPIO pins is 1-to-1
  */
@@ -297,7 +292,7 @@ static void nsp_gpio_free(struct gpio_chip *gc, unsigned offset)
 
 static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
-	struct nsp_gpio *chip = to_nsp_gpio(gc);
+	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -311,7 +306,7 @@ static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 static int nsp_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
 				     int val)
 {
-	struct nsp_gpio *chip = to_nsp_gpio(gc);
+	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -325,7 +320,7 @@ static int nsp_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
 
 static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	struct nsp_gpio *chip = to_nsp_gpio(gc);
+	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -337,14 +332,14 @@ static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 
 static int nsp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
-	struct nsp_gpio *chip = to_nsp_gpio(gc);
+	struct nsp_gpio *chip = gpiochip_get_data(gc);
 
 	return !!(readl(chip->base + NSP_GPIO_DATA_IN) & BIT(gpio));
 }
 
 static int nsp_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct nsp_gpio *chip = to_nsp_gpio(gc);
+	struct nsp_gpio *chip = gpiochip_get_data(gc);
 
 	return irq_linear_revmap(chip->irq_domain, offset);
 }
@@ -714,7 +709,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 		writel(val, (chip->base + NSP_CHIP_A_INT_MASK));
 	}
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, chip);
 	if (ret < 0) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;
-- 
2.4.3

