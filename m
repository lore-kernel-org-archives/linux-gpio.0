From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 041/182] gpio: mpc5200: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:28 +0100
Message-ID: <1449667108-31693-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33283 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbbLINSd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:33 -0500
Received: by lfaz4 with SMTP id z4so34025489lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpc5200.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 4c542153e923..ff6551c67502 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -71,8 +71,7 @@ static inline void
 __mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
 
 	if (val)
@@ -100,8 +99,7 @@ mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 
@@ -125,8 +123,7 @@ mpc52xx_wkup_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -169,7 +166,7 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 	gc->get              = mpc52xx_wkup_gpio_get;
 	gc->set              = mpc52xx_wkup_gpio_set;
 
-	ret = of_mm_gpiochip_add(ofdev->dev.of_node, &chip->mmchip);
+	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)
 		return ret;
 
@@ -236,8 +233,7 @@ static inline void
 __mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
 
 	if (val)
@@ -264,8 +260,7 @@ mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 
@@ -288,8 +283,7 @@ static int
 mpc52xx_simple_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpiochip *chip = container_of(mm_gc,
-			struct mpc52xx_gpiochip, mmchip);
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
 	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
 	unsigned long flags;
 
@@ -334,7 +328,7 @@ static int mpc52xx_simple_gpiochip_probe(struct platform_device *ofdev)
 	gc->get              = mpc52xx_simple_gpio_get;
 	gc->set              = mpc52xx_simple_gpio_set;
 
-	ret = of_mm_gpiochip_add(ofdev->dev.of_node, &chip->mmchip);
+	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)
 		return ret;
 
-- 
2.4.3

