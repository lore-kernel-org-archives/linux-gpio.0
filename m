From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ep93xx: get rid of bogus __raw* accessors
Date: Mon, 14 Oct 2013 10:09:53 +0200
Message-ID: <1381738193-11448-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:56393 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074Ab3JNIJ7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 04:09:59 -0400
Received: by mail-wi0-f175.google.com with SMTP id hm4so829415wib.14
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 01:09:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Ryan Mallon <rmallon@gmail.com>, H Hartley Sweeten <hartleys@visionengravers.com>

I have no idea why this driver is using __raw* accessors for
reading and writing registers, I suspect it is just force of
habit or copy/paste. Change all to readb()/writeb() except
one chain where I used writeb_relaxed() up until the last
writeb().

Cc: Ryan Mallon <rmallon@gmail.com>
Cc: H Hartley Sweeten <hartleys@visionengravers.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 56b98ee..80829f3 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -51,15 +51,15 @@ static void ep93xx_gpio_update_int_params(unsigned port)
 {
 	BUG_ON(port > 2);
 
-	__raw_writeb(0, EP93XX_GPIO_REG(int_en_register_offset[port]));
+	writeb_relaxed(0, EP93XX_GPIO_REG(int_en_register_offset[port]));
 
-	__raw_writeb(gpio_int_type2[port],
+	writeb_relaxed(gpio_int_type2[port],
 		EP93XX_GPIO_REG(int_type2_register_offset[port]));
 
-	__raw_writeb(gpio_int_type1[port],
+	writeb_relaxed(gpio_int_type1[port],
 		EP93XX_GPIO_REG(int_type1_register_offset[port]));
 
-	__raw_writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
+	writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
 		EP93XX_GPIO_REG(int_en_register_offset[port]));
 }
 
@@ -74,7 +74,7 @@ static void ep93xx_gpio_int_debounce(unsigned int irq, bool enable)
 	else
 		gpio_int_debounce[port] &= ~port_mask;
 
-	__raw_writeb(gpio_int_debounce[port],
+	writeb(gpio_int_debounce[port],
 		EP93XX_GPIO_REG(int_debounce_register_offset[port]));
 }
 
@@ -83,7 +83,7 @@ static void ep93xx_gpio_ab_irq_handler(unsigned int irq, struct irq_desc *desc)
 	unsigned char status;
 	int i;
 
-	status = __raw_readb(EP93XX_GPIO_A_INT_STATUS);
+	status = readb(EP93XX_GPIO_A_INT_STATUS);
 	for (i = 0; i < 8; i++) {
 		if (status & (1 << i)) {
 			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_A(0)) + i;
@@ -91,7 +91,7 @@ static void ep93xx_gpio_ab_irq_handler(unsigned int irq, struct irq_desc *desc)
 		}
 	}
 
-	status = __raw_readb(EP93XX_GPIO_B_INT_STATUS);
+	status = readb(EP93XX_GPIO_B_INT_STATUS);
 	for (i = 0; i < 8; i++) {
 		if (status & (1 << i)) {
 			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_B(0)) + i;
@@ -124,7 +124,7 @@ static void ep93xx_gpio_irq_ack(struct irq_data *d)
 		ep93xx_gpio_update_int_params(port);
 	}
 
-	__raw_writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
+	writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
 }
 
 static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
@@ -139,7 +139,7 @@ static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 	gpio_int_unmasked[port] &= ~port_mask;
 	ep93xx_gpio_update_int_params(port);
 
-	__raw_writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
+	writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
 }
 
 static void ep93xx_gpio_irq_mask(struct irq_data *d)
-- 
1.8.3.1

