From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: make gpiod_to_irq() return negative for NO_IRQ
Date: Mon,  2 May 2016 13:15:02 +0200
Message-ID: <1462187702-7450-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35983 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753614AbcEBLPJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 07:15:09 -0400
Received: by mail-lf0-f43.google.com with SMTP id u64so183690696lff.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 04:15:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>

If a translation returns zero, that means NO_IRQ, so we
should return an error since the function is documented to
return a negative code on error.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 340b021a3782..a68c6d732818 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1999,13 +1999,22 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_chip	*chip;
-	int			offset;
+	struct gpio_chip *chip;
+	int offset;
 
 	VALIDATE_DESC(desc);
 	chip = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
-	return chip->to_irq ? chip->to_irq(chip, offset) : -ENXIO;
+	if (chip->to_irq) {
+		int retirq = chip->to_irq(chip, offset);
+
+		/* Zero means NO_IRQ */
+		if (!retirq)
+			return -ENXIO;
+
+		return retirq;
+	}
+	return -ENXIO;
 }
 EXPORT_SYMBOL_GPL(gpiod_to_irq);
 
-- 
2.4.11

