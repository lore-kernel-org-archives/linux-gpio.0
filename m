From: Aaron Sierra <asierra@xes-inc.com>
Subject: [PATCH 3/3] gpio: pca953x: Add Exar XRA1202
Date: Fri, 7 Feb 2014 16:36:21 -0600 (CST)
Message-ID: <1776003837.119594.1391812581852.JavaMail.zimbra@xes-inc.com>
References: <1453094753.119123.1391812144563.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:53159 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751912AbaBGWgY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 7 Feb 2014 17:36:24 -0500
In-Reply-To: <1453094753.119123.1391812144563.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Add Exar XRA1202 8-bit GPIO expander to supported list.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/gpio/Kconfig        |    2 +-
 drivers/gpio/gpio-pca953x.c |    3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9b3107e0..1ad9f39 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -471,7 +471,7 @@ config GPIO_PCA953X
 	  4 bits:	pca9536, pca9537
 
 	  8 bits:	max7310, max7315, pca6107, pca9534, pca9538, pca9554,
-			pca9556, pca9557, pca9574, tca6408
+			pca9556, pca9557, pca9574, tca6408, xra1202
 
 	  16 bits:	max7312, max7313, pca9535, pca9539, pca9555, pca9575,
 			tca6416
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index dbc95bc..948a074 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -69,6 +69,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
+	{ "xra1202", 8  | PCA953X_TYPE },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
@@ -824,6 +825,8 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6408", },
 	{ .compatible = "ti,tca6416", },
 	{ .compatible = "ti,tca6424", },
+
+	{ .compatible = "exar,xra1202", },
 	{ }
 };
 
-- 
1.7.9.5
