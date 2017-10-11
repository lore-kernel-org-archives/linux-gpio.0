From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: Do not depend in GPIOLIB, select it
Date: Wed, 11 Oct 2017 12:07:42 +0200
Message-ID: <20171011100742.9912-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:44804 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751080AbdJKKHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 06:07:47 -0400
Received: by mail-lf0-f53.google.com with SMTP id 75so1481032lfx.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 03:07:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>

Instead of depends on GPIOLIB and having to run around in
Kconfig menus looking for why your device is not available,
simply select it from the pin control drivers that need it.

The Kconfig for GPIOLIB is improved, selectable and this
should "just work".

Cc: Phil Reid <preid@electromag.com.au>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/Kconfig       | 6 ++++--
 drivers/pinctrl/intel/Kconfig | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8da29e9e1bb2..034822c7144d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -97,7 +97,7 @@ config PINCTRL_AT91PIO4
 
 config PINCTRL_AMD
 	tristate "AMD GPIO pin control"
-	depends on GPIOLIB
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
@@ -156,6 +156,7 @@ config PINCTRL_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
 	depends on SPI_MASTER || I2C
 	depends on I2C || I2C=n
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select REGMAP_I2C if I2C
 	select REGMAP_SPI if SPI_MASTER
@@ -224,10 +225,11 @@ config PINCTRL_SIRF
 
 config PINCTRL_SX150X
 	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on GPIOLIB && I2C=y
+	depends on I2C=y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select REGMAP
 	help
diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index f30720a752f3..7fb1b9937c39 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -5,7 +5,8 @@ if (X86 || COMPILE_TEST)
 
 config PINCTRL_BAYTRAIL
 	bool "Intel Baytrail GPIO pin control"
-	depends on GPIOLIB && ACPI
+	depends on ACPI
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINMUX
 	select PINCONF
-- 
2.13.5

