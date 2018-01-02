From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: omap: Fix error path on chip init
Date: Tue,  2 Jan 2018 11:23:14 +0100
Message-ID: <20180102102314.12906-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33972 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751546AbeABKZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 05:25:21 -0500
Received: by mail-lf0-f68.google.com with SMTP id h140so4408970lfg.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 02:25:20 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>

The error path was leaking a gpio_chip at one point.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e136d666f1e5..d83e8624964a 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1104,7 +1104,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 					-1, 0, bank->width, 0);
 	if (irq_base < 0) {
 		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_remove_chip;
 	}
 #endif
 
@@ -1122,8 +1123,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	if (ret) {
 		dev_err(bank->chip.parent,
 			"Couldn't add irqchip to gpiochip %d\n", ret);
-		gpiochip_remove(&bank->chip);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_remove_chip;
 	}
 
 	gpiochip_set_chained_irqchip(&bank->chip, irqc, bank->irq, NULL);
@@ -1132,8 +1133,12 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 			       omap_gpio_irq_handler,
 			       0, dev_name(bank->chip.parent), bank);
 	if (ret)
-		gpiochip_remove(&bank->chip);
+		goto err_remove_chip;
 
+	return 0;
+
+err_remove_chip:
+	gpiochip_remove(&bank->chip);
 	return ret;
 }
 
-- 
2.14.3

