From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: arrange PCI GPIO controllers alphabetically
Date: Wed,  8 Apr 2015 14:31:57 +0200
Message-ID: <1428496317-19852-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33224 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751265AbbDHMcD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 08:32:03 -0400
Received: by layy10 with SMTP id y10so64702935lay.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 05:32:01 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Rearrange PCI GPIO controllers in alphabetic order
as already indicated by the comment in the file.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 64 ++++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38fd1311b9d6..c9e4c5dfd7c3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -766,15 +766,17 @@ config GPIO_WM8994
 
 comment "PCI GPIO expanders:"
 
-config GPIO_CS5535
-	tristate "AMD CS5535/CS5536 GPIO support"
-	depends on MFD_CS5535
+config GPIO_AMD8111
+	tristate "AMD 8111 GPIO driver"
+	depends on PCI
 	help
-	  The AMD CS5535 and CS5536 southbridges support 28 GPIO pins that
-	  can be used for quite a number of things.  The CS5535/6 is found on
-	  AMD Geode and Lemote Yeeloong devices.
+	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
 
-	  If unsure, say N.
+	  Note, that usually system firmware/ACPI handles GPIO pins on their
+	  own and users might easily break their systems with uncarefull usage
+	  of this driver!
+
+	  If unsure, say N
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
@@ -792,17 +794,15 @@ config GPIO_BT8XX
 
 	  If unsure, say N.
 
-config GPIO_AMD8111
-	tristate "AMD 8111 GPIO driver"
-	depends on PCI
+config GPIO_CS5535
+	tristate "AMD CS5535/CS5536 GPIO support"
+	depends on MFD_CS5535
 	help
-	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
-
-	  Note, that usually system firmware/ACPI handles GPIO pins on their
-	  own and users might easily break their systems with uncarefull usage
-	  of this driver!
+	  The AMD CS5535 and CS5536 southbridges support 28 GPIO pins that
+	  can be used for quite a number of things.  The CS5535/6 is found on
+	  AMD Geode and Lemote Yeeloong devices.
 
-	  If unsure, say N
+	  If unsure, say N.
 
 config GPIO_INTEL_MID
 	bool "Intel Mid GPIO support"
@@ -811,6 +811,16 @@ config GPIO_INTEL_MID
 	help
 	  Say Y here to support Intel Mid GPIO.
 
+config GPIO_ML_IOH
+	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
+	depends on PCI
+	select GENERIC_IRQ_CHIP
+	help
+	  ML7213 is companion chip for Intel Atom E6xx series.
+	  This driver can be used for OKI SEMICONDUCTOR ML7213 IOH(Input/Output
+	  Hub) which is for IVI(In-Vehicle Infotainment) use.
+	  This driver can access the IOH's GPIO device.
+
 config GPIO_PCH
 	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
 	depends on PCI && (X86_32 || COMPILE_TEST)
@@ -827,15 +837,14 @@ config GPIO_PCH
 	  ML7223/ML7831 is companion chip for Intel Atom E6xx series.
 	  ML7223/ML7831 is completely compatible for Intel EG20T PCH.
 
-config GPIO_ML_IOH
-	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
+config GPIO_RDC321X
+	tristate "RDC R-321x GPIO support"
 	depends on PCI
-	select GENERIC_IRQ_CHIP
+	select MFD_CORE
+	select MFD_RDC321X
 	help
-	  ML7213 is companion chip for Intel Atom E6xx series.
-	  This driver can be used for OKI SEMICONDUCTOR ML7213 IOH(Input/Output
-	  Hub) which is for IVI(In-Vehicle Infotainment) use.
-	  This driver can access the IOH's GPIO device.
+	  Support for the RDC R321x SoC GPIOs over southbridge
+	  PCI configuration space.
 
 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
@@ -851,15 +860,6 @@ config GPIO_TIMBERDALE
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 
-config GPIO_RDC321X
-	tristate "RDC R-321x GPIO support"
-	depends on PCI
-	select MFD_CORE
-	select MFD_RDC321X
-	help
-	  Support for the RDC R321x SoC GPIOs over southbridge
-	  PCI configuration space.
-
 comment "SPI GPIO expanders:"
 
 config GPIO_MAX7301
-- 
1.9.3

