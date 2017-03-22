From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/3] gpio: pca953x: Introduce a long awaited ->get_direction()
Date: Wed, 22 Mar 2017 16:11:11 +0200
Message-ID: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:58432 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751125AbdCVOMA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Mar 2017 10:12:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Introduce ->get_direction() callback for the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 v2: fix direction (0 for out, 1 for in)
 drivers/gpio/gpio-pca953x.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d44232aadb6c..c149054ef976 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -363,6 +363,21 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 	mutex_unlock(&chip->i2c_lock);
 }
 
+static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
+{
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	u32 reg_val;
+	int ret;
+
+	mutex_lock(&chip->i2c_lock);
+	ret = pca953x_read_single(chip, chip->regs->direction, &reg_val, off);
+	mutex_unlock(&chip->i2c_lock);
+	if (ret < 0)
+		return ret;
+
+	return (reg_val & (1u << (off % BANK_SZ))) ? GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
@@ -408,6 +423,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->direction_output = pca953x_gpio_direction_output;
 	gc->get = pca953x_gpio_get_value;
 	gc->set = pca953x_gpio_set_value;
+	gc->get_direction = pca953x_gpio_get_direction;
 	gc->set_multiple = pca953x_gpio_set_multiple;
 	gc->can_sleep = true;
 
-- 
2.11.0

