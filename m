From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH] gpio: gpiolib: use devm_* API to simplify driver code
Date: Mon, 24 Aug 2015 20:05:30 +0800
Message-ID: <1440417930-15876-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:36311 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752987AbbHXMFG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2015 08:05:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, van.freenix@gmail.com

Use devm_* API to simplify driver code.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpiolib.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6bc612b..f9470b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -243,7 +243,8 @@ int gpiochip_add(struct gpio_chip *chip)
 	int		base = chip->base;
 	struct gpio_desc *descs;
 
-	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
+	descs = devm_kcalloc(chip->dev, chip->ngpio, sizeof(descs[0]),
+			     GFP_KERNEL);
 	if (!descs)
 		return -ENOMEM;
 
@@ -254,7 +255,7 @@ int gpiochip_add(struct gpio_chip *chip)
 		if (base < 0) {
 			status = base;
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			goto err_free_descs;
+			goto err_descs;
 		}
 		chip->base = base;
 	}
@@ -262,7 +263,7 @@ int gpiochip_add(struct gpio_chip *chip)
 	status = gpiochip_add_to_list(chip);
 	if (status) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		goto err_free_descs;
+		goto err_descs;
 	}
 
 	for (id = 0; id < chip->ngpio; id++) {
@@ -308,9 +309,7 @@ err_remove_chip:
 	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	chip->desc = NULL;
-err_free_descs:
-	kfree(descs);
-
+err_descs:
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
-- 
1.8.4.5

