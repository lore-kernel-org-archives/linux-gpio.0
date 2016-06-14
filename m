From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: pca953x: enable driver on Intel Edison
Date: Wed, 15 Jun 2016 01:57:56 +0300
Message-ID: <1465945076-25517-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:54372 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752862AbcFNW6B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Jun 2016 18:58:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Intel Edison board has 4 GPIO expanders PCA9555a connected to I2C bus. Add an
ID to support them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 21b21cd..8b630a4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -67,6 +67,8 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
 	{ "pca9698", 40 | PCA953X_TYPE, },
 
+	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
+
 	{ "max7310", 8  | PCA953X_TYPE, },
 	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "max7313", 16 | PCA953X_TYPE | PCA_INT, },
-- 
2.8.1

