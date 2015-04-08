From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: arrange Kconfig symbols alphabetically
Date: Wed,  8 Apr 2015 10:09:58 +0200
Message-ID: <1428480598-14332-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34547 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbbDHIKF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 04:10:05 -0400
Received: by lbcga7 with SMTP id ga7so11339901lbc.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 01:10:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This rearranges the GPIO drivers Kconfig symbols alphabetically
as the top comment in the file already states they should be.
No functional changes whatsoever.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 290 +++++++++++++++++++++++++--------------------------
 1 file changed, 145 insertions(+), 145 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 41d91b6a5505..0cd817dee07b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -126,6 +126,16 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_ALTERA
+	tristate "Altera GPIO"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to build support for the Altera PIO device.
+
+	  If driver is built as a module it will be called gpio-altera.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
@@ -140,12 +150,6 @@ config GPIO_DAVINCI
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-config GPIO_GENERIC_PLATFORM
-	tristate "Generic memory-mapped GPIO controller support (MMIO platform device)"
-	select GPIO_GENERIC
-	help
-	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
-
 config GPIO_DWAPB
 	tristate "Synopsys DesignWare APB GPIO driver"
 	depends on ((ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
@@ -155,22 +159,6 @@ config GPIO_DWAPB
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
 
-config GPIO_ALTERA
-	tristate "Altera GPIO"
-	depends on OF_GPIO
-	select GPIO_GENERIC
-	select GPIOLIB_IRQCHIP
-	help
-	  Say Y or M here to build support for the Altera PIO device.
-
-	  If driver is built as a module it will be called gpio-altera.
-
-config GPIO_IT8761E
-	tristate "IT8761E GPIO support"
-	depends on X86  # unconditional access to IO space.
-	help
-	  Say yes here to support GPIO functionality of IT8761E super I/O chip.
-
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
 	depends on ARM && OF_GPIO
@@ -182,20 +170,6 @@ config GPIO_EP93XX
 	depends on ARCH_EP93XX
 	select GPIO_GENERIC
 
-config GPIO_ZEVIO
-	bool "LSI ZEVIO SoC memory mapped GPIOs"
-	depends on ARM && OF_GPIO
-	help
-	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
-
-config GPIO_MM_LANTIQ
-	bool "Lantiq Memory mapped GPIOs"
-	depends on LANTIQ && SOC_XWAY
-	help
-	  This enables support for memory mapped GPIOs on the External Bus Unit
-	  (EBU) found on Lantiq SoCs. The gpios are output only as they are
-	  created by attaching a 16bit latch to the bus.
-
 config GPIO_F7188X
 	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
 	depends on X86
@@ -206,12 +180,89 @@ config GPIO_F7188X
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
 
+config GPIO_GE_FPGA
+	bool "GE FPGA based GPIO"
+	depends on GE_FPGA
+	select GPIO_GENERIC
+	help
+	  Support for common GPIO functionality provided on some GE Single Board
+	  Computers.
+
+	  This driver provides basic support (configure as input or output, read
+	  and write pin state) for GPIO implemented in a number of GE single
+	  board computers.
+
+config GPIO_GENERIC_PLATFORM
+	tristate "Generic memory-mapped GPIO controller support (MMIO platform device)"
+	select GPIO_GENERIC
+	help
+	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
+
+config GPIO_GRGPIO
+	tristate "Aeroflex Gaisler GRGPIO support"
+	depends on OF
+	select GPIO_GENERIC
+	select IRQ_DOMAIN
+	help
+	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
+	  VHDL IP core library.
+
+config GPIO_ICH
+	tristate "Intel ICH GPIO"
+	depends on PCI && X86
+	select MFD_CORE
+	select LPC_ICH
+	help
+	  Say yes here to support the GPIO functionality of a number of Intel
+	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8
+	  ICH9, ICH10, Series 5/3400 (eg Ibex Peak), Series 6/C200 (eg
+	  Cougar Point), NM10 (Tiger Point), and 3100 (Whitmore Lake).
+
+	  If unsure, say N.
+
+config GPIO_IOP
+	tristate "Intel IOP GPIO"
+	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X)
+	help
+	  Say yes here to support the GPIO functionality of a number of Intel
+	  IOP32X or IOP33X.
+
+	  If unsure, say N.
+
+config GPIO_IT8761E
+	tristate "IT8761E GPIO support"
+	depends on X86  # unconditional access to IO space.
+	help
+	  Say yes here to support GPIO functionality of IT8761E super I/O chip.
+
+config GPIO_LOONGSON
+	bool "Loongson-2/3 GPIO support"
+	depends on CPU_LOONGSON2 || CPU_LOONGSON3
+	help
+	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
+
+config GPIO_LYNXPOINT
+	tristate "Intel Lynxpoint GPIO support"
+	depends on ACPI && X86
+	select GPIOLIB_IRQCHIP
+	help
+	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
+	  Requires ACPI device enumeration code to set up a platform device.
+
 config GPIO_MB86S7X
 	bool "GPIO support for Fujitsu MB86S7x Platforms"
 	depends on ARCH_MB86S7X
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
+config GPIO_MM_LANTIQ
+	bool "Lantiq Memory mapped GPIOs"
+	depends on LANTIQ && SOC_XWAY
+	help
+	  This enables support for memory mapped GPIOs on the External Bus Unit
+	  (EBU) found on Lantiq SoCs. The gpios are output only as they are
+	  created by attaching a 16bit latch to the bus.
+
 config GPIO_MOXART
 	bool "MOXART GPIO support"
 	depends on ARCH_MOXART
@@ -312,6 +363,33 @@ config GPIO_SAMSUNG
 	  Legacy GPIO support. Use only for platforms without support for
 	  pinctrl.
 
+config GPIO_SCH
+	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
+	depends on PCI && X86
+	select MFD_CORE
+	select LPC_SCH
+	help
+	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
+	  Intel Tunnel Creek processor, Intel Centerton processor or
+	  Intel Quark X1000 SoC.
+
+	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
+	  powered by the core power rail and are turned off during sleep
+	  modes (S3 and higher). The remaining four GPIOs are powered by
+	  the Intel SCH suspend power supply. These GPIOs remain
+	  active during S3. The suspend powered GPIOs can be used to wake the
+	  system from the Suspend-to-RAM state.
+
+	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
+	  core power rail and 9 from suspend power supply.
+
+	  The Intel Centerton processor has a total of 30 GPIO pins.
+	  Twenty-one are powered by the core power rail and 9 from the
+	  suspend power supply.
+
+	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
+	  power well and 6 from the suspend power well.
+
 config GPIO_SCH311X
 	tristate "SMSC SCH311x SuperI/O GPIO"
 	help
@@ -342,6 +420,11 @@ config GPIO_SYSCON
 	help
 	  Say yes here to support GPIO functionality though SYSCON driver.
 
+config GPIO_TB10X
+	bool
+	select GENERIC_IRQ_CHIP
+	select OF_GPIO
+
 config GPIO_TS5500
 	tristate "TS-5500 DIO blocks and compatibles"
 	depends on TS5500 || COMPILE_TEST
@@ -373,6 +456,24 @@ config GPIO_VF610
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
 
+config GPIO_VR41XX
+	tristate "NEC VR4100 series General-purpose I/O Uint support"
+	depends on CPU_VR41XX
+	help
+	  Say yes here to support the NEC VR4100 series General-purpose I/O Uint
+
+config GPIO_VX855
+	tristate "VIA VX855/VX875 GPIO"
+	depends on PCI
+	select MFD_CORE
+	select MFD_VX855
+	help
+	  Support access to the VX855/VX875 GPIO lines through the gpio library.
+
+	  This driver provides common support for accessing the device,
+	  additional drivers must be enabled in order to use the
+	  functionality of the device.
+
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
 	depends on ARM64 && OF_GPIO
@@ -396,13 +497,6 @@ config GPIO_XILINX
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
-config GPIO_ZYNQ
-	tristate "Xilinx Zynq GPIO support"
-	depends on ARCH_ZYNQ
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support Xilinx Zynq GPIO controller.
-
 config GPIO_XTENSA
 	bool "Xtensa GPIO32 support"
 	depends on XTENSA
@@ -412,112 +506,18 @@ config GPIO_XTENSA
 	  Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
 	  and EXPSTATE (output) ports
 
-config GPIO_VR41XX
-	tristate "NEC VR4100 series General-purpose I/O Uint support"
-	depends on CPU_VR41XX
-	help
-	  Say yes here to support the NEC VR4100 series General-purpose I/O Uint
-
-config GPIO_SCH
-	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on PCI && X86
-	select MFD_CORE
-	select LPC_SCH
-	help
-	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
-	  Intel Tunnel Creek processor, Intel Centerton processor or
-	  Intel Quark X1000 SoC.
-
-	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
-	  powered by the core power rail and are turned off during sleep
-	  modes (S3 and higher). The remaining four GPIOs are powered by
-	  the Intel SCH suspend power supply. These GPIOs remain
-	  active during S3. The suspend powered GPIOs can be used to wake the
-	  system from the Suspend-to-RAM state.
-
-	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
-	  core power rail and 9 from suspend power supply.
-
-	  The Intel Centerton processor has a total of 30 GPIO pins.
-	  Twenty-one are powered by the core power rail and 9 from the
-	  suspend power supply.
-
-	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
-	  power well and 6 from the suspend power well.
-
-config GPIO_ICH
-	tristate "Intel ICH GPIO"
-	depends on PCI && X86
-	select MFD_CORE
-	select LPC_ICH
-	help
-	  Say yes here to support the GPIO functionality of a number of Intel
-	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8
-	  ICH9, ICH10, Series 5/3400 (eg Ibex Peak), Series 6/C200 (eg
-	  Cougar Point), NM10 (Tiger Point), and 3100 (Whitmore Lake).
-
-	  If unsure, say N.
-
-config GPIO_IOP
-	tristate "Intel IOP GPIO"
-	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X)
-	help
-	  Say yes here to support the GPIO functionality of a number of Intel
-	  IOP32X or IOP33X.
-
-	  If unsure, say N.
-
-config GPIO_VX855
-	tristate "VIA VX855/VX875 GPIO"
-	depends on PCI
-	select MFD_CORE
-	select MFD_VX855
-	help
-	  Support access to the VX855/VX875 GPIO lines through the gpio library.
-
-	  This driver provides common support for accessing the device,
-	  additional drivers must be enabled in order to use the
-	  functionality of the device.
-
-config GPIO_GE_FPGA
-	bool "GE FPGA based GPIO"
-	depends on GE_FPGA
-	select GPIO_GENERIC
+config GPIO_ZEVIO
+	bool "LSI ZEVIO SoC memory mapped GPIOs"
+	depends on ARM && OF_GPIO
 	help
-	  Support for common GPIO functionality provided on some GE Single Board
-	  Computers.
-
-	  This driver provides basic support (configure as input or output, read
-	  and write pin state) for GPIO implemented in a number of GE single
-	  board computers.
+	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
-config GPIO_LYNXPOINT
-	tristate "Intel Lynxpoint GPIO support"
-	depends on ACPI && X86
+config GPIO_ZYNQ
+	tristate "Xilinx Zynq GPIO support"
+	depends on ARCH_ZYNQ
 	select GPIOLIB_IRQCHIP
 	help
-	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
-	  Requires ACPI device enumeration code to set up a platform device.
-
-config GPIO_GRGPIO
-	tristate "Aeroflex Gaisler GRGPIO support"
-	depends on OF
-	select GPIO_GENERIC
-	select IRQ_DOMAIN
-	help
-	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
-	  VHDL IP core library.
-
-config GPIO_LOONGSON
-	bool "Loongson-2/3 GPIO support"
-	depends on CPU_LOONGSON2 || CPU_LOONGSON3
-	help
-	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
-
-config GPIO_TB10X
-	bool
-	select GENERIC_IRQ_CHIP
-	select OF_GPIO
+	  Say yes here to support Xilinx Zynq GPIO controller.
 
 comment "I2C GPIO expanders:"
 
-- 
1.9.3

