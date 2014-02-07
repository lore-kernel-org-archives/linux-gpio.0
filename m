From: Aaron Sierra <asierra@xes-inc.com>
Subject: [PATCH 2/3] gpio: pca953x: Add NXP PCA9698
Date: Fri, 7 Feb 2014 16:36:03 -0600 (CST)
Message-ID: <1709957220.119585.1391812563657.JavaMail.zimbra@xes-inc.com>
References: <1523732022.119053.1391812099611.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:10170 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751615AbaBGWgH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 7 Feb 2014 17:36:07 -0500
In-Reply-To: <1523732022.119053.1391812099611.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Balaji Venkatachalam <balaji.v@thotakaa.com>

Add the NXP PCA9698 40-bit GPIO expander to the supported list.
Note: This only enables GPIO functionality.

Tested-by: Bob Schmitz <bschmitz@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/gpio/Kconfig        |    4 ++--
 drivers/gpio/gpio-pca953x.c |    2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fd7ad66..9b3107e0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -461,7 +461,7 @@ config GPIO_MC9S08DZ60
 	  Select this to enable the MC9S08DZ60 GPIO driver
 
 config GPIO_PCA953X
-	tristate "PCA953x, PCA955x, PCA957x, TCA64xx, and MAX7310 I/O ports"
+	tristate "PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports"
 	depends on I2C
 	help
 	  Say yes here to provide access to several register-oriented
@@ -478,7 +478,7 @@ config GPIO_PCA953X
 
 	  24 bits:	tca6424
 
-	  40 bits:	pca9505
+	  40 bits:	pca9505, pca9698
 
 config GPIO_PCA953X_IRQ
 	bool "Interrupt controller support for PCA953x"
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cede6f6..dbc95bc 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -59,6 +59,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9557", 8  | PCA953X_TYPE, },
 	{ "pca9574", 8  | PCA957X_TYPE | PCA_INT, },
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
+	{ "pca9698", 40 | PCA953X_TYPE, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
 	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
@@ -812,6 +813,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9557", },
 	{ .compatible = "nxp,pca9574", },
 	{ .compatible = "nxp,pca9575", },
+	{ .compatible = "nxp,pca9698", },
 
 	{ .compatible = "maxim,max7310", },
 	{ .compatible = "maxim,max7312", },
-- 
1.7.9.5
