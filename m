From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: arrange I2C Kconfig symbols alphabetically
Date: Wed,  8 Apr 2015 14:15:35 +0200
Message-ID: <1428495335-19157-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:35720 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753458AbbDHMPm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 08:15:42 -0400
Received: by labbd9 with SMTP id bd9so52928597lab.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 05:15:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Rearrange the I2C GPIO expanders in alphabetic order
as already indicated by the comment in the file.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 90 ++++++++++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0cd817dee07b..38fd1311b9d6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -521,6 +521,39 @@ config GPIO_ZYNQ
 
 comment "I2C GPIO expanders:"
 
+config GPIO_ADP5520
+	tristate "GPIO Support for ADP5520 PMIC"
+	depends on PMIC_ADP5520
+	help
+	  This option enables support for on-chip GPIO found
+	  on Analog Devices ADP5520 PMICs.
+
+config GPIO_ADP5588
+	tristate "ADP5588 I2C GPIO expander"
+	depends on I2C
+	help
+	  This option enables support for 18 GPIOs found
+	  on Analog Devices ADP5588 GPIO Expanders.
+
+config GPIO_ADP5588_IRQ
+	bool "Interrupt controller support for ADP5588"
+	depends on GPIO_ADP5588=y
+	help
+	  Say yes here to enable the adp5588 to be used as an interrupt
+	  controller. It requires the driver to be built in the kernel.
+
+config GPIO_ADNP
+	tristate "Avionic Design N-bit GPIO expander"
+	depends on I2C && OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  This option enables support for N GPIOs found on Avionic Design
+	  I2C GPIO expanders. The register space will be extended by powers
+	  of two, so the controller will need to accommodate for that. For
+	  example: if a controller provides 48 pins, 6 registers will be
+	  enough to represent all pins, but the driver will assume a
+	  register layout for 64 pins (8 registers).
+
 config GPIO_ARIZONA
 	tristate "Wolfson Microelectronics Arizona class devices"
 	depends on MFD_ARIZONA
@@ -651,18 +684,6 @@ config GPIO_RC5T583
 	  This driver provides the support for driving/reading the gpio pins
 	  of RC5T583 device through standard gpio library.
 
-config GPIO_SX150X
-	bool "Semtech SX150x I2C GPIO expander"
-	depends on I2C=y
-	select GPIOLIB_IRQCHIP
-	default n
-	help
-	  Say yes here to provide support for Semtech SX150-series I2C
-	  GPIO expanders. Compatible models include:
-
-	  8 bits:  sx1508q
-	  16 bits: sx1509q
-
 config GPIO_STMPE
 	bool "STMPE GPIOs"
 	depends on MFD_STMPE
@@ -682,6 +703,18 @@ config GPIO_STP_XWAY
 	  Some of the gpios/leds can be auto updated by the soc with dsl and
 	  phy status.
 
+config GPIO_SX150X
+	bool "Semtech SX150x I2C GPIO expander"
+	depends on I2C=y
+	select GPIOLIB_IRQCHIP
+	default n
+	help
+	  Say yes here to provide support for Semtech SX150-series I2C
+	  GPIO expanders. Compatible models include:
+
+	  8 bits:  sx1508q
+	  16 bits: sx1509q
+
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
 	depends on MFD_TC3589X
@@ -731,39 +764,6 @@ config GPIO_WM8994
 	  Say yes here to access the GPIO signals of WM8994 audio hub
 	  CODECs from Wolfson Microelectronics.
 
-config GPIO_ADP5520
-	tristate "GPIO Support for ADP5520 PMIC"
-	depends on PMIC_ADP5520
-	help
-	  This option enables support for on-chip GPIO found
-	  on Analog Devices ADP5520 PMICs.
-
-config GPIO_ADP5588
-	tristate "ADP5588 I2C GPIO expander"
-	depends on I2C
-	help
-	  This option enables support for 18 GPIOs found
-	  on Analog Devices ADP5588 GPIO Expanders.
-
-config GPIO_ADP5588_IRQ
-	bool "Interrupt controller support for ADP5588"
-	depends on GPIO_ADP5588=y
-	help
-	  Say yes here to enable the adp5588 to be used as an interrupt
-	  controller. It requires the driver to be built in the kernel.
-
-config GPIO_ADNP
-	tristate "Avionic Design N-bit GPIO expander"
-	depends on I2C && OF_GPIO
-	select GPIOLIB_IRQCHIP
-	help
-	  This option enables support for N GPIOs found on Avionic Design
-	  I2C GPIO expanders. The register space will be extended by powers
-	  of two, so the controller will need to accommodate for that. For
-	  example: if a controller provides 48 pins, 6 registers will be
-	  enough to represent all pins, but the driver will assume a
-	  register layout for 64 pins (8 registers).
-
 comment "PCI GPIO expanders:"
 
 config GPIO_CS5535
-- 
1.9.3

