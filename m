From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: xgene: implement .get_direction()
Date: Sun,  1 May 2016 10:32:10 +0200
Message-ID: <1462091530-27288-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33276 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbcEAIcT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2016 04:32:19 -0400
Received: by mail-lf0-f41.google.com with SMTP id y84so159353306lfc.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2016 01:32:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Duc Dang <dhdang@apm.com>, Feng Kan <fkan@apm.com>

This implements the .get_direction() callback for the xgene GPIO
controller.

Cc: Duc Dang <dhdang@apm.com>
Cc: Feng Kan <fkan@apm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xgene.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 46faecd1f580..dc85dcd47d19 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -85,6 +85,17 @@ static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
+static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
+	unsigned long bank_offset, bit_offset;
+
+	bank_offset = GPIO_SET_DR_OFFSET + GPIO_BANK_OFFSET(offset);
+	bit_offset = GPIO_BIT_OFFSET(offset);
+
+	return !!(ioread32(chip->base + bank_offset) & BIT(bit_offset));
+}
+
 static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct xgene_gpio *chip = gpiochip_get_data(gc);
@@ -184,6 +195,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&gpio->lock);
 	gpio->chip.parent = &pdev->dev;
+	gpio->chip.get_direction = xgene_gpio_get_direction;
 	gpio->chip.direction_input = xgene_gpio_dir_in;
 	gpio->chip.direction_output = xgene_gpio_dir_out;
 	gpio->chip.get = xgene_gpio_get;
-- 
2.4.11

