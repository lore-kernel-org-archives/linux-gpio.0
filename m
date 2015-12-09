From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 035/182] gpio: mb86s7x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:38 +0100
Message-ID: <1449667058-31408-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35699 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598AbbLINRn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:43 -0500
Received: by lbpu9 with SMTP id u9so29581702lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mb86s7x.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 93d61a5be0d4..7fffc1d6c055 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -44,14 +44,9 @@ struct mb86s70_gpio_chip {
 	spinlock_t lock;
 };
 
-static inline struct mb86s70_gpio_chip *chip_to_mb86s70(struct gpio_chip *gc)
-{
-	return container_of(gc, struct mb86s70_gpio_chip, gc);
-}
-
 static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 val;
 
@@ -73,7 +68,7 @@ static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
 
 static void mb86s70_gpio_free(struct gpio_chip *gc, unsigned gpio)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 val;
 
@@ -88,7 +83,7 @@ static void mb86s70_gpio_free(struct gpio_chip *gc, unsigned gpio)
 
 static int mb86s70_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned char val;
 
@@ -106,7 +101,7 @@ static int mb86s70_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 static int mb86s70_gpio_direction_output(struct gpio_chip *gc,
 					 unsigned gpio, int value)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned char val;
 
@@ -130,14 +125,14 @@ static int mb86s70_gpio_direction_output(struct gpio_chip *gc,
 
 static int mb86s70_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 
 	return !!(readl(gchip->base + PDR(gpio)) & OFFSET(gpio));
 }
 
 static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
 {
-	struct mb86s70_gpio_chip *gchip = chip_to_mb86s70(gc);
+	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned char val;
 
@@ -192,7 +187,7 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gchip);
 
-	ret = gpiochip_add(&gchip->gc);
+	ret = gpiochip_add_data(&gchip->gc, gchip);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't register gpio driver\n");
 		clk_disable_unprepare(gchip->clk);
-- 
2.4.3

