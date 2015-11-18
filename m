From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH] gpiolib: make comment consistent with code
Date: Wed, 18 Nov 2015 17:07:07 +0800
Message-ID: <1447837627-5462-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:34065 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755119AbbKRJHQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2015 04:07:16 -0500
Received: by padhx2 with SMTP id hx2so38896199pad.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2015 01:07:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Commit f4d566a8a0e6 ("gpio: change member .dev to .parent") changes
member of gpiochip from .dev to .parent. Update the corresponding
comment.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 89e0153..e63bebc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -306,7 +306,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
  * different chip.  Otherwise it returns zero as a success code.
  *
  * When gpiochip_add() is called very early during boot, so that GPIOs
- * can be freely used, the chip->dev device must be registered before
+ * can be freely used, the chip->parent device must be registered before
  * the gpio framework's arch_initcall().  Otherwise sysfs initialization
  * for GPIOs will fail rudely.
  *
@@ -714,7 +714,8 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 #ifdef CONFIG_OF_GPIO
 	/*
 	 * If the gpiochip has an assigned OF node this takes precedence
-	 * FIXME: get rid of this and use gpiochip->dev->of_node everywhere
+	 * FIXME: get rid of this and use gpiochip->parent->of_node
+	 * everywhere
 	 */
 	if (gpiochip->of_node)
 		of_node = gpiochip->of_node;
-- 
2.1.4

