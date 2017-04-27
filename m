From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 1/6] gpio: mcp23s08: move to pinctrl
Date: Thu, 27 Apr 2017 16:19:32 +0200
Message-ID: <20170427141937.762-2-sebastian.reichel@collabora.co.uk>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49972 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937618AbdD0OTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:19:53 -0400
In-Reply-To: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

This moves the mcp23s08 driver from gpio to pinctrl. Actual
pinctrl support for configuration of the pull-up resistors
follows in its own patch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/gpio/Kconfig                                    | 17 -----------------
 drivers/gpio/Makefile                                   |  1 -
 drivers/pinctrl/Kconfig                                 | 13 +++++++++++++
 drivers/pinctrl/Makefile                                |  1 +
 .../gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c}      |  0
 5 files changed, 14 insertions(+), 18 deletions(-)
 rename drivers/{gpio/gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} (100%)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 05043071fc98..4d64b109826c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1217,23 +1217,6 @@ config GPIO_PISOSR
 
 endmenu
 
-menu "SPI or I2C GPIO expanders"
-	depends on (SPI_MASTER && !I2C) || I2C
-
-config GPIO_MCP23S08
-	tristate "Microchip MCP23xxx I/O expander"
-	depends on OF_GPIO
-	select GPIOLIB_IRQCHIP
-	select REGMAP_I2C if I2C
-	select REGMAP if SPI_MASTER
-	help
-	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
-	  I/O expanders.
-	  This provides a GPIO interface supporting inputs and outputs.
-	  The I2C versions of the chips can be used as interrupt-controller.
-
-endmenu
-
 menu "USB GPIO expanders"
 	depends on USB
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index becb96c724fe..c210ce4d91ac 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -76,7 +76,6 @@ obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
 obj-$(CONFIG_GPIO_MERRIFIELD)	+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
-obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8f8c2af45781..cccff799a88a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -135,6 +135,19 @@ config PINCTRL_FALCON
 	depends on SOC_FALCON
 	depends on PINCTRL_LANTIQ
 
+config PINCTRL_MCP23S08
+	tristate "Microchip MCP23xxx I/O expander"
+	depends on OF_GPIO
+	depends on SPI_MASTER || I2C
+	select GPIOLIB_IRQCHIP
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
+	help
+	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
+	  I/O expanders.
+	  This provides a GPIO interface supporting inputs and outputs.
+	  The I2C versions of the chips can be used as interrupt-controller.
+
 config PINCTRL_MESON
 	bool
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index a251f439626f..7a0c6a9c166e 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
 obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
+obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
similarity index 100%
rename from drivers/gpio/gpio-mcp23s08.c
rename to drivers/pinctrl/pinctrl-mcp23s08.c
-- 
2.11.0

