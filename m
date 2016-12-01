From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: merrifield: Implement gpio_get_direction callback
Date: Thu,  1 Dec 2016 18:09:33 +0200
Message-ID: <20161201160933.39406-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:27404 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755513AbcLAQJh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Dec 2016 11:09:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Implement gpio_get_direction() callback for Intel Merrifield GPIO.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index d7cbbc0..69e0f4a 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -161,6 +162,13 @@ static int mrfld_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
+static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
+
+	return (readl(gpdr) & BIT(offset % 32)) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
+}
+
 static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 				   unsigned int debounce)
 {
@@ -405,6 +413,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	priv->chip.direction_output = mrfld_gpio_direction_output;
 	priv->chip.get = mrfld_gpio_get;
 	priv->chip.set = mrfld_gpio_set;
+	priv->chip.get_direction = mrfld_gpio_get_direction;
 	priv->chip.set_debounce = mrfld_gpio_set_debounce;
 	priv->chip.base = gpio_base;
 	priv->chip.ngpio = MRFLD_NGPIO;
-- 
2.10.2

