From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: merrifield: Don't use GPIOF_DIR_IN / GPIOF_DIR_OUT
Date: Thu, 23 Mar 2017 14:56:32 +0200
Message-ID: <20170323125632.89661-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:15052 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932136AbdCWM5J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 08:57:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The mentioned flags are dedicated solely for consumer API.
Replace them by explicit values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index f40088d268c1..96dc5123a58a 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -166,7 +166,7 @@ static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
 
-	return (readl(gpdr) & BIT(offset % 32)) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
+	return (readl(gpdr) & BIT(offset % 32)) ? 0 : 1;
 }
 
 static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
-- 
2.11.0

