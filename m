From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] gpio: x86: update config dependencies for x86 specific hardware
Date: Sun, 20 Nov 2016 17:37:25 +0000
Message-ID: <20161120173725.32658-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34875 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbcKTRhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Nov 2016 12:37:31 -0500
Received: by mail-wm0-f66.google.com with SMTP id a20so20633252wme.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Nov 2016 09:37:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

The devices here are specific to x86 so lets depend on x86.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

v1->v2:
	- As suggested by Linus add COMPILE_TEST

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d011cb8..2b16264 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -455,7 +455,7 @@ config GPIO_VR41XX
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"
-	depends on PCI
+	depends on (X86 || COMPILE_TEST) && PCI
 	select MFD_CORE
 	select MFD_VX855
 	help
@@ -607,7 +607,7 @@ config GPIO_IT87
 
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on PCI
+	depends on (X86 || COMPILE_TEST) && PCI
 	select MFD_CORE
 	select LPC_SCH
 	help
@@ -826,7 +826,7 @@ config GPIO_ARIZONA
 
 config GPIO_CRYSTAL_COVE
 	tristate "GPIO support for Crystal Cove PMIC"
-	depends on INTEL_SOC_PMIC
+	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
 	select GPIOLIB_IRQCHIP
 	help
 	  Support for GPIO pins on Crystal Cove PMIC.
@@ -839,6 +839,7 @@ config GPIO_CRYSTAL_COVE
 
 config GPIO_CS5535
 	tristate "AMD CS5535/CS5536 GPIO support"
+	depends on X86 || MIPS || COMPILE_TEST
 	depends on MFD_CS5535
 	help
 	  The AMD CS5535 and CS5536 southbridges support 28 GPIO pins that
@@ -931,7 +932,7 @@ config GPIO_MAX77620
 
 config GPIO_MSIC
 	bool "Intel MSIC mixed signal gpio support"
-	depends on MFD_INTEL_MSIC
+	depends on (X86 || COMPILE_TEST) && MFD_INTEL_MSIC
 	help
 	  Enable support for GPIO on intel MSIC controllers found in
 	  intel MID devices
@@ -1032,7 +1033,7 @@ config GPIO_UCB1400
 
 config GPIO_WHISKEY_COVE
 	tristate "GPIO support for Whiskey Cove PMIC"
-	depends on INTEL_SOC_PMIC
+	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
 	select GPIOLIB_IRQCHIP
 	help
 	  Support for GPIO pins on Whiskey Cove PMIC.
@@ -1071,6 +1072,7 @@ menu "PCI GPIO expanders"
 
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
+	depends on X86 || COMPILE_TEST
 	help
 	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
 
@@ -1112,6 +1114,7 @@ config GPIO_MERRIFIELD
 
 config GPIO_ML_IOH
 	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
+	depends on X86 || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	help
 	  ML7213 is companion chip for Intel Atom E6xx series.
-- 
2.9.3

