From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: drop surplus I2C dependencies
Date: Sun,  1 Nov 2015 10:44:33 +0100
Message-ID: <1446371073-31151-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:33160 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbKAJoh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Nov 2015 04:44:37 -0500
Received: by lbbec13 with SMTP id ec13so72170171lbb.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2015 01:44:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The I2C expander menu already depends on I2C, drop subdependecies
on individual drivers. Keep the instances of depends on I2C=y
though, so these are still restricted to the compiled-in case.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 777f401aa8ec..a8dcc99830c3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -565,7 +565,6 @@ menu "I2C GPIO expanders"
 
 config GPIO_ADP5588
 	tristate "ADP5588 I2C GPIO expander"
-	depends on I2C
 	help
 	  This option enables support for 18 GPIOs found
 	  on Analog Devices ADP5588 GPIO Expanders.
@@ -579,7 +578,7 @@ config GPIO_ADP5588_IRQ
 
 config GPIO_ADNP
 	tristate "Avionic Design N-bit GPIO expander"
-	depends on I2C && OF_GPIO
+	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for N GPIOs found on Avionic Design
@@ -591,14 +590,12 @@ config GPIO_ADNP
 
 config GPIO_MAX7300
 	tristate "Maxim MAX7300 GPIO expander"
-	depends on I2C
 	select GPIO_MAX730X
 	help
 	  GPIO driver for Maxim MAX7300 I2C-based GPIO expander.
 
 config GPIO_MAX732X
 	tristate "MAX7319, MAX7320-7327 I2C Port Expanders"
-	depends on I2C
 	help
 	  Say yes here to support the MAX7319, MAX7320-7327 series of I2C
 	  Port Expanders. Each IO port on these chips has a fixed role of
@@ -631,7 +628,6 @@ config GPIO_MC9S08DZ60
 
 config GPIO_PCA953X
 	tristate "PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports"
-	depends on I2C
 	help
 	  Say yes here to provide access to several register-oriented
 	  SMBus I/O expanders, made mostly by NXP or TI.  Compatible
@@ -659,7 +655,6 @@ config GPIO_PCA953X_IRQ
 
 config GPIO_PCF857X
 	tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders"
-	depends on I2C
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	help
-- 
2.4.3

