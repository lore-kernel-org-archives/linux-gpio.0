From: Marek Vasut <marex@denx.de>
Subject: [PATCH] gpio: pca953x: Add MAX7318 compatible
Date: Mon, 17 Oct 2016 18:36:49 +0200
Message-ID: <20161017163649.12113-1-marex@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:43559 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755100AbcJQQhB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2016 12:37:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>

Add compatible string for the MAX7318 part. This is a two bank,
16 lines, I2C GPIO expander with interrupt line.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e422568..601c455 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -74,6 +74,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "max7313", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "max7315", 8  | PCA953X_TYPE | PCA_INT, },
+	{ "max7318", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca6107", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
@@ -907,6 +908,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "maxim,max7313", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "maxim,max7315", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "maxim,max7318", .data = OF_953X(16, PCA_INT), },
 
 	{ .compatible = "ti,pca6107", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,pca9536", .data = OF_953X( 4, 0), },
-- 
2.9.3

