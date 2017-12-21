From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpiolib: remove a redundant check in gpiod_to_chip()
Date: Thu, 21 Dec 2017 18:37:30 +0200
Message-ID: <20171221163730.6093-1-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:44563 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751828AbdLUQhd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 11:37:33 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

This non-functional change slightly simplifies the implementation
of gpiod_to_chip() function.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 72577cd..6e19385 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -161,7 +161,7 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
-	if (!desc || !desc->gdev || !desc->gdev->chip)
+	if (!desc || !desc->gdev)
 		return NULL;
 	return desc->gdev->chip;
 }
-- 
2.10.2

