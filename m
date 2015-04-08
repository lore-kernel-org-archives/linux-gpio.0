From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: split GPIO drivers in submenus
Date: Wed,  8 Apr 2015 15:21:47 +0200
Message-ID: <1428499307-8041-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:36464 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751577AbbDHNVx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 09:21:53 -0400
Received: by lbbqq2 with SMTP id qq2so58066316lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 06:21:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Create Kconfig submenus for memory mapped, I2C, MFD,
PCI, SPI and USB GPIO drivers to help navigate the forest
of drivers in this subsystem. The I2C, SPI and USB menus
get dependencies so we don't have to see them unless we
have the required subsystem enabled in the first place.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c8d804074f61..97c31840f87a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -90,10 +90,11 @@ config GPIO_GENERIC
 
 # put drivers in the right section, in alphabetical order
 
+# This symbol is selected by both I2C and SPI expanders
 config GPIO_MAX730X
 	tristate
 
-comment "Memory mapped GPIO drivers:"
+menu "Memory mapped GPIO drivers"
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
@@ -518,7 +519,10 @@ config GPIO_ZYNQ
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
 
-comment "I2C GPIO expanders:"
+endmenu
+
+menu "I2C GPIO expanders"
+	depends on I2C
 
 config GPIO_ADP5588
 	tristate "ADP5588 I2C GPIO expander"
@@ -652,7 +656,9 @@ config GPIO_SX150X
 	  8 bits:  sx1508q
 	  16 bits: sx1509q
 
-comment "MFD GPIO expanders:"
+endmenu
+
+menu "MFD GPIO expanders"
 
 config GPIO_ADP5520
 	tristate "GPIO Support for ADP5520 PMIC"
@@ -853,7 +859,10 @@ config GPIO_WM8994
 	  Say yes here to access the GPIO signals of WM8994 audio hub
 	  CODECs from Wolfson Microelectronics.
 
-comment "PCI GPIO expanders:"
+endmenu
+
+menu "PCI GPIO expanders"
+	depends on PCI
 
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
@@ -933,8 +942,10 @@ config GPIO_SODAVILLE
 	help
 	  Say Y here to support Intel Sodaville GPIO.
 
+endmenu
 
-comment "SPI GPIO expanders:"
+menu "SPI GPIO expanders"
+	depends on SPI_MASTER
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
@@ -967,7 +978,10 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
-comment "USB GPIO expanders:"
+endmenu
+
+menu "USB GPIO expanders"
+	depends on USB
 
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
@@ -980,4 +994,6 @@ config GPIO_VIPERBOARD
           River Tech's viperboard.h for detailed meaning
           of the module parameters.
 
+endmenu
+
 endif
-- 
1.9.3

