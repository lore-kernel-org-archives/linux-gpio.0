From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 017/182] gpio: bt8xx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:03 +0100
Message-ID: <1449666903-30548-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35615 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592AbbLINPI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:08 -0500
Received: by lfdl133 with SMTP id l133so33786307lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Buesch <m@bues.ch>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Michael Buesch <m@bues.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 7e4c43c18960..acefb25e8eca 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -80,7 +80,7 @@ MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the
 
 static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
-	struct bt8xxgpio *bg = container_of(gpio, struct bt8xxgpio, gpio);
+	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u32 outen, data;
 
@@ -101,7 +101,7 @@ static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 
 static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
-	struct bt8xxgpio *bg = container_of(gpio, struct bt8xxgpio, gpio);
+	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u32 val;
 
@@ -115,7 +115,7 @@ static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 					unsigned nr, int val)
 {
-	struct bt8xxgpio *bg = container_of(gpio, struct bt8xxgpio, gpio);
+	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u32 outen, data;
 
@@ -140,7 +140,7 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
 			    unsigned nr, int val)
 {
-	struct bt8xxgpio *bg = container_of(gpio, struct bt8xxgpio, gpio);
+	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u32 data;
 
@@ -217,7 +217,7 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 	bgwrite(0, BT848_GPIO_OUT_EN);
 
 	bt8xxgpio_gpio_setup(bg);
-	err = gpiochip_add(&bg->gpio);
+	err = gpiochip_add_data(&bg->gpio, bg);
 	if (err) {
 		printk(KERN_ERR "bt8xxgpio: Failed to register GPIOs\n");
 		goto err_disable;
-- 
2.4.3

