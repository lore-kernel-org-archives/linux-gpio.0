From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 013/182] gpio: amdpt: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:30 +0100
Message-ID: <1449666870-30357-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36253 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317AbbLINOf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:35 -0500
Received: by lfs39 with SMTP id 39so34102128lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, YD Tseng <ltyu101@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: YD Tseng <ltyu101@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-amdpt.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index f842ccc45e64..c2484046e8e9 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -31,11 +31,9 @@ struct pt_gpio_chip {
 	spinlock_t               lock;
 };
 
-#define to_pt_gpio(c)	container_of(c, struct pt_gpio_chip, gc)
-
 static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 using_pins;
 
@@ -60,7 +58,7 @@ static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 
 static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 using_pins;
 
@@ -77,7 +75,7 @@ static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 
 static void pt_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 data;
 
@@ -97,7 +95,7 @@ static void pt_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 
 static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 data;
 
@@ -124,7 +122,7 @@ static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 
 static int pt_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 data;
 
@@ -144,7 +142,7 @@ static int pt_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 static int pt_gpio_direction_output(struct gpio_chip *gc,
 					unsigned offset, int value)
 {
-	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 data;
 
@@ -214,7 +212,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 #if defined(CONFIG_OF_GPIO)
 	pt_gpio->gc.of_node          = pdev->dev.of_node;
 #endif
-	ret = gpiochip_add(&pt_gpio->gc);
+	ret = gpiochip_add_data(&pt_gpio->gc, pt_gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register GPIO lib\n");
 		return ret;
-- 
2.4.3

