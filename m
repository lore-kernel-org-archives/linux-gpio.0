From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH] gpio: drop surplus PCI and USB dependencies
Date: Sun, 6 Dec 2015 14:52:45 -0600
Message-ID: <1449435165-14020-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:48804 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754384AbbLFUwu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 6 Dec 2015 15:52:50 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-gpio@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>

The PCI/USB expander menus already depend on PCI/USB, drop subdependecies
on individual drivers.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/Kconfig | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 30d8bd3..c204fd4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -920,7 +920,6 @@ menu "PCI GPIO expanders"
 
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
-	depends on PCI
 	help
 	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
 
@@ -932,7 +931,7 @@ config GPIO_AMD8111
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
-	depends on PCI && VIDEO_BT848=n
+	depends on VIDEO_BT848=n
 	help
 	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.
@@ -948,14 +947,13 @@ config GPIO_BT8XX
 
 config GPIO_INTEL_MID
 	bool "Intel Mid GPIO support"
-	depends on PCI && X86
+	depends on X86
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Intel Mid GPIO.
 
 config GPIO_ML_IOH
 	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
-	depends on PCI
 	select GENERIC_IRQ_CHIP
 	help
 	  ML7213 is companion chip for Intel Atom E6xx series.
@@ -965,7 +963,7 @@ config GPIO_ML_IOH
 
 config GPIO_PCH
 	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
-	depends on PCI && (X86_32 || COMPILE_TEST)
+	depends on X86_32 || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	help
 	  This driver is for PCH(Platform controller Hub) GPIO of Intel Topcliff
@@ -981,7 +979,6 @@ config GPIO_PCH
 
 config GPIO_RDC321X
 	tristate "RDC R-321x GPIO support"
-	depends on PCI
 	select MFD_CORE
 	select MFD_RDC321X
 	help
@@ -990,7 +987,7 @@ config GPIO_RDC321X
 
 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
-	depends on X86 && PCI && OF
+	depends on X86 && OF
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
@@ -1041,7 +1038,7 @@ menu "USB GPIO expanders"
 
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
-	depends on MFD_VIPERBOARD && USB
+	depends on MFD_VIPERBOARD
 	help
 	  Say yes here to access the GPIO signals of Nano River
 	  Technologies Viperboard. There are two GPIO chips on the
-- 
1.9.1

