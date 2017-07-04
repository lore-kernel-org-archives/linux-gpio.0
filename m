From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: add COMPILE_TEST to several drivers
Date: Tue,  4 Jul 2017 12:51:53 +0900
Message-ID: <1499140313-31592-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

These drivers are actually platform-agnostic.  Add COMPILE_TEST for
the compilation test coverage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f235eae04c16..da82cee24980 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -153,7 +153,7 @@ config GPIO_CLPS711X
 config GPIO_DAVINCI
 	bool "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
-	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE)
+	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST)
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
@@ -279,7 +279,7 @@ config GPIO_LPC18XX
 
 config GPIO_LYNXPOINT
 	tristate "Intel Lynxpoint GPIO support"
-	depends on ACPI && X86
+	depends on ACPI && (X86 || COMPILE_TEST)
 	select GPIOLIB_IRQCHIP
 	help
 	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
@@ -337,20 +337,20 @@ config GPIO_MPC8XXX
 
 config GPIO_MVEBU
 	def_bool y
-	depends on PLAT_ORION || ARCH_MVEBU
+	depends on PLAT_ORION || ARCH_MVEBU || COMPILE_TEST
 	depends on OF_GPIO
 	select GENERIC_IRQ_CHIP
 	select REGMAP_MMIO
 
 config GPIO_MXC
 	def_bool y
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
 config GPIO_MXS
 	def_bool y
-	depends on ARCH_MXS
+	depends on ARCH_MXS || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
@@ -381,7 +381,7 @@ config GPIO_PL061
 
 config GPIO_PXA
 	bool "PXA GPIO support"
-	depends on ARCH_PXA || ARCH_MMP
+	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
 	help
 	  Say yes here to support the PXA GPIO device
 
@@ -467,7 +467,7 @@ config GPIO_TZ1090_PDC
 
 config GPIO_VF610
 	def_bool y
-	depends on ARCH_MXC && SOC_VF610
+	depends on (ARCH_MXC && SOC_VF610) || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
@@ -492,7 +492,7 @@ config GPIO_VX855
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64 && OF_GPIO
+	depends on (ARM64 || COMPILE_TEST) && OF_GPIO
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
@@ -543,7 +543,7 @@ config GPIO_ZEVIO
 
 config GPIO_ZYNQ
 	tristate "Xilinx Zynq GPIO support"
-	depends on ARCH_ZYNQ || ARCH_ZYNQMP
+	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
@@ -1154,14 +1154,14 @@ config GPIO_BT8XX
 
 config GPIO_INTEL_MID
 	bool "Intel MID GPIO support"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Intel MID GPIO.
 
 config GPIO_MERRIFIELD
 	tristate "Intel Merrifield GPIO support"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Intel Merrifield GPIO.
-- 
2.7.4
