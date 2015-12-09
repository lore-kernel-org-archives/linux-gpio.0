From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 090/182] pinctrl: cygnus-gpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:29:53 +0100
Message-ID: <1449667793-1826-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34663 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbLINaE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:30:04 -0500
Received: by lffu14 with SMTP id u14so34267853lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:30:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Jon Mason <jonmason@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 33 +++++++++++++------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index bd212b269094..d15e52c40c83 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -24,7 +24,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/ioport.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -96,11 +96,6 @@ struct cygnus_gpio {
 	struct pinctrl_desc pctldesc;
 };
 
-static inline struct cygnus_gpio *to_cygnus_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct cygnus_gpio, gc);
-}
-
 /*
  * Mapping from PINCONF pins to GPIO pins is 1-to-1
  */
@@ -145,7 +140,7 @@ static inline bool cygnus_get_bit(struct cygnus_gpio *chip, unsigned int reg,
 static void cygnus_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	int i, bit;
 
@@ -178,7 +173,7 @@ static void cygnus_gpio_irq_handler(struct irq_desc *desc)
 static void cygnus_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned gpio = d->hwirq;
 	unsigned int offset = CYGNUS_GPIO_REG(gpio,
 			CYGNUS_GPIO_INT_CLR_OFFSET);
@@ -197,7 +192,7 @@ static void cygnus_gpio_irq_ack(struct irq_data *d)
 static void cygnus_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned gpio = d->hwirq;
 
 	cygnus_set_bit(chip, CYGNUS_GPIO_INT_MSK_OFFSET, gpio, unmask);
@@ -206,7 +201,7 @@ static void cygnus_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 static void cygnus_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -217,7 +212,7 @@ static void cygnus_gpio_irq_mask(struct irq_data *d)
 static void cygnus_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -228,7 +223,7 @@ static void cygnus_gpio_irq_unmask(struct irq_data *d)
 static int cygnus_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned gpio = d->hwirq;
 	bool level_triggered = false;
 	bool dual_edge = false;
@@ -290,7 +285,7 @@ static struct irq_chip cygnus_gpio_irq_chip = {
  */
 static int cygnus_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned gpio = gc->base + offset;
 
 	/* not all Cygnus GPIO pins can be muxed individually */
@@ -302,7 +297,7 @@ static int cygnus_gpio_request(struct gpio_chip *gc, unsigned offset)
 
 static void cygnus_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned gpio = gc->base + offset;
 
 	if (!chip->pinmux_is_supported)
@@ -313,7 +308,7 @@ static void cygnus_gpio_free(struct gpio_chip *gc, unsigned offset)
 
 static int cygnus_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -328,7 +323,7 @@ static int cygnus_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 static int cygnus_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
 					int val)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -343,7 +338,7 @@ static int cygnus_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
 
 static void cygnus_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -355,7 +350,7 @@ static void cygnus_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 
 static int cygnus_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
-	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
+	struct cygnus_gpio *chip = gpiochip_get_data(gc);
 	unsigned int offset = CYGNUS_GPIO_REG(gpio,
 					      CYGNUS_GPIO_DATA_IN_OFFSET);
 	unsigned int shift = CYGNUS_GPIO_SHIFT(gpio);
@@ -732,7 +727,7 @@ static int cygnus_gpio_probe(struct platform_device *pdev)
 	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
 							"gpio-ranges");
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, chip);
 	if (ret < 0) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;
-- 
2.4.3

