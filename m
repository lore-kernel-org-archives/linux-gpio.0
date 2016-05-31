From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: pca953x: remove redundant assignments
Date: Tue, 31 May 2016 17:05:57 +0300
Message-ID: <1464703557-60539-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:26416 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754407AbcEaOL4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 31 May 2016 10:11:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are few redundant assignments of ret variable which is updated anyway.
Remove them for good.

While here, correct indentation of the constant definition and remove one empty
line.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7630285..d8233be 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -44,7 +44,7 @@
 
 #define PCA_GPIO_MASK		0x00FF
 #define PCA_INT			0x0100
-#define PCA_PCAL			0x0200
+#define PCA_PCAL		0x0200
 #define PCA953X_TYPE		0x1000
 #define PCA957X_TYPE		0x2000
 #define PCA_TYPE_MASK		0xF000
@@ -135,7 +135,7 @@ static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 				int off)
 {
-	int ret = 0;
+	int ret;
 	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 	int offset = off / BANK_SZ;
 
@@ -235,7 +235,6 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 		goto exit;
 
 	chip->reg_direction[off / BANK_SZ] = reg_val;
-	ret = 0;
 exit:
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
@@ -286,7 +285,6 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		goto exit;
 
 	chip->reg_direction[off / BANK_SZ] = reg_val;
-	ret = 0;
 exit:
 	mutex_unlock(&chip->i2c_lock);
 	return ret;
@@ -351,7 +349,6 @@ exit:
 	mutex_unlock(&chip->i2c_lock);
 }
 
-
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		unsigned long *mask, unsigned long *bits)
 {
@@ -820,7 +817,7 @@ static int pca953x_remove(struct i2c_client *client)
 {
 	struct pca953x_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct pca953x_chip *chip = i2c_get_clientdata(client);
-	int ret = 0;
+	int ret;
 
 	if (pdata && pdata->teardown) {
 		ret = pdata->teardown(client, chip->gpio_chip.base,
-- 
2.8.1

