From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: fix up SPI submenu
Date: Sun,  1 Nov 2015 10:52:52 +0100
Message-ID: <1446371572-31924-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:36514 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbbKAJxG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Nov 2015 04:53:06 -0500
Received: by lbjm5 with SMTP id m5so71454385lbj.3
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2015 01:53:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

- Relax dependencies on SPI_MASTER for drivers in the SPI menu
  that already has this dependency.
- Move out the expander that would be hidden for I2C access if
  SPI_MASTER was not selected. Tentatively create a separate
  menu for this.
- Move the ZX SoC driver to memory-mapped drivers, this must be
  a mistake and only worked because the system has an SPI master
  enabled at the same time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a8dcc99830c3..b18bea08ff25 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -483,6 +483,12 @@ config GPIO_ZYNQ
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
 
+config GPIO_ZX
+	bool "ZTE ZX GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO device on ZTE ZX SoCs.
+
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
@@ -984,7 +990,7 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on SPI_MASTER && OF
+	depends on OF
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
@@ -992,32 +998,28 @@ config GPIO_74X164
 
 config GPIO_MAX7301
 	tristate "Maxim MAX7301 GPIO expander"
-	depends on SPI_MASTER
 	select GPIO_MAX730X
 	help
 	  GPIO driver for Maxim MAX7301 SPI-based GPIO expander.
 
-config GPIO_MCP23S08
-	tristate "Microchip MCP23xxx I/O expander"
-	depends on (SPI_MASTER && !I2C) || I2C
-	help
-	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
-	  I/O expanders.
-	  This provides a GPIO interface supporting inputs and outputs.
-	  The I2C versions of the chips can be used as interrupt-controller.
-
 config GPIO_MC33880
 	tristate "Freescale MC33880 high-side/low-side switch"
-	depends on SPI_MASTER
 	help
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
-config GPIO_ZX
-	bool "ZTE ZX GPIO support"
-	select GPIOLIB_IRQCHIP
+endmenu
+
+menu "SPI or I2C GPIO expanders"
+	depends on (SPI_MASTER && !I2C) || I2C
+
+config GPIO_MCP23S08
+	tristate "Microchip MCP23xxx I/O expander"
 	help
-	  Say yes here to support the GPIO device on ZTE ZX SoCs.
+	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
+	  I/O expanders.
+	  This provides a GPIO interface supporting inputs and outputs.
+	  The I2C versions of the chips can be used as interrupt-controller.
 
 endmenu
 
-- 
2.4.3

