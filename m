From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move MFD GPIO drivers under their own comment
Date: Wed,  8 Apr 2015 14:54:46 +0200
Message-ID: <1428497686-20374-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:36767 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173AbbDHMyx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 08:54:53 -0400
Received: by lbbqq2 with SMTP id qq2so57448020lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 05:54:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Get rid of AC97, MODULbus and other weird subheadings for
GPIO drivers. Move all MFD drivers out of I2C etc and in under
the MFD comment. This is too weird as it is and makes no
sense, if the dependent parent driver is MFD, group these as
MFD GPIO drivers. Alphabetize and move this comment group
inbetween "I2C" and "PCI" to also have the groups in
alphabetic order.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 260 +++++++++++++++++++++++++--------------------------
 1 file changed, 128 insertions(+), 132 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1356c482f00c..4d677510173f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -90,23 +90,6 @@ config GPIO_GENERIC
 
 # put drivers in the right section, in alphabetical order
 
-config GPIO_DA9052
-	tristate "Dialog DA9052 GPIO"
-	depends on PMIC_DA9052
-	help
-	  Say yes here to enable the GPIO driver for the DA9052 chip.
-
-config GPIO_DA9055
-	tristate "Dialog Semiconductor DA9055 GPIO"
-	depends on MFD_DA9055
-	help
-	  Say yes here to enable the GPIO driver for the DA9055 chip.
-
-	  The Dialog DA9055 PMIC chip has 3 GPIO pins that can be
-	  be controller by this driver.
-
-	  If driver is built as a module it will be called gpio-da9055.
-
 config GPIO_MAX730X
 	tristate
 
@@ -420,6 +403,16 @@ config GPIO_STA2X11
 	  Say yes here to support the STA2x11/ConneXt GPIO device.
 	  The GPIO module has 128 GPIO pins with alternate functions.
 
+config GPIO_STP_XWAY
+	bool "XWAY STP GPIOs"
+	depends on SOC_XWAY
+	help
+	  This enables support for the Serial To Parallel (STP) unit found on
+	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
+	  that can be up to 24 bit. This peripheral is aimed at driving leds.
+	  Some of the gpios/leds can be auto updated by the soc with dsl and
+	  phy status.
+
 config GPIO_SYSCON
 	tristate "GPIO based on SYSCON"
 	depends on MFD_SYSCON && OF
@@ -527,13 +520,6 @@ config GPIO_ZYNQ
 
 comment "I2C GPIO expanders:"
 
-config GPIO_ADP5520
-	tristate "GPIO Support for ADP5520 PMIC"
-	depends on PMIC_ADP5520
-	help
-	  This option enables support for on-chip GPIO found
-	  on Analog Devices ADP5520 PMICs.
-
 config GPIO_ADP5588
 	tristate "ADP5588 I2C GPIO expander"
 	depends on I2C
@@ -560,33 +546,6 @@ config GPIO_ADNP
 	  enough to represent all pins, but the driver will assume a
 	  register layout for 64 pins (8 registers).
 
-config GPIO_ARIZONA
-	tristate "Wolfson Microelectronics Arizona class devices"
-	depends on MFD_ARIZONA
-	help
-	  Support for GPIOs on Wolfson Arizona class devices.
-
-config GPIO_CRYSTAL_COVE
-	tristate "GPIO support for Crystal Cove PMIC"
-	depends on INTEL_SOC_PMIC
-	select GPIOLIB_IRQCHIP
-	help
-	  Support for GPIO pins on Crystal Cove PMIC.
-
-	  Say Yes if you have a Intel SoC based tablet with Crystal Cove PMIC
-	  inside.
-
-	  This driver can also be built as a module. If so, the module will be
-	  called gpio-crystalcove.
-
-config GPIO_LP3943
-	tristate "TI/National Semiconductor LP3943 GPIO expander"
-	depends on MFD_LP3943
-	help
-	  GPIO driver for LP3943 MFD.
-	  LP3943 can be used as a GPIO expander which provides up to 16 GPIOs.
-	  Open drain outputs are required for this usage.
-
 config GPIO_MAX7300
 	tristate "Maxim MAX7300 GPIO expander"
 	depends on I2C
@@ -681,6 +640,103 @@ config GPIO_PCF857X
 	  This driver provides an in-kernel interface to those GPIOs using
 	  platform-neutral GPIO calls.
 
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
+comment "MFD GPIO expanders:"
+
+config GPIO_ADP5520
+	tristate "GPIO Support for ADP5520 PMIC"
+	depends on PMIC_ADP5520
+	help
+	  This option enables support for on-chip GPIO found
+	  on Analog Devices ADP5520 PMICs.
+
+config GPIO_ARIZONA
+	tristate "Wolfson Microelectronics Arizona class devices"
+	depends on MFD_ARIZONA
+	help
+	  Support for GPIOs on Wolfson Arizona class devices.
+
+config GPIO_CRYSTAL_COVE
+	tristate "GPIO support for Crystal Cove PMIC"
+	depends on INTEL_SOC_PMIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Support for GPIO pins on Crystal Cove PMIC.
+
+	  Say Yes if you have a Intel SoC based tablet with Crystal Cove PMIC
+	  inside.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-crystalcove.
+
+config GPIO_DA9052
+	tristate "Dialog DA9052 GPIO"
+	depends on PMIC_DA9052
+	help
+	  Say yes here to enable the GPIO driver for the DA9052 chip.
+
+config GPIO_DA9055
+	tristate "Dialog Semiconductor DA9055 GPIO"
+	depends on MFD_DA9055
+	help
+	  Say yes here to enable the GPIO driver for the DA9055 chip.
+
+	  The Dialog DA9055 PMIC chip has 3 GPIO pins that can be
+	  be controller by this driver.
+
+	  If driver is built as a module it will be called gpio-da9055.
+
+config GPIO_JANZ_TTL
+	tristate "Janz VMOD-TTL Digital IO Module"
+	depends on MFD_JANZ_CMODIO
+	help
+	  This enables support for the Janz VMOD-TTL Digital IO module.
+	  This driver provides support for driving the pins in output
+	  mode only. Input mode is not supported.
+
+config GPIO_KEMPLD
+	tristate "Kontron ETX / COMexpress GPIO"
+	depends on MFD_KEMPLD
+	help
+	  This enables support for the PLD GPIO interface on some Kontron ETX
+	  and COMexpress (ETXexpress) modules.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-kempld.
+
+config GPIO_LP3943
+	tristate "TI/National Semiconductor LP3943 GPIO expander"
+	depends on MFD_LP3943
+	help
+	  GPIO driver for LP3943 MFD.
+	  LP3943 can be used as a GPIO expander which provides up to 16 GPIOs.
+	  Open drain outputs are required for this usage.
+
+config GPIO_MSIC
+	bool "Intel MSIC mixed signal gpio support"
+	depends on MFD_INTEL_MSIC
+	help
+	  Enable support for GPIO on intel MSIC controllers found in
+	  intel MID devices
+
+config GPIO_PALMAS
+	bool "TI PALMAS series PMICs GPIO"
+	depends on MFD_PALMAS
+	help
+	  Select this option to enable GPIO driver for the TI PALMAS
+	  series chip family.
+
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
 	depends on MFD_RC5T583
@@ -699,28 +755,6 @@ config GPIO_STMPE
 	  This enables support for the GPIOs found on the STMPE I/O
 	  Expanders.
 
-config GPIO_STP_XWAY
-	bool "XWAY STP GPIOs"
-	depends on SOC_XWAY
-	help
-	  This enables support for the Serial To Parallel (STP) unit found on
-	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
-	  that can be up to 24 bit. This peripheral is aimed at driving leds.
-	  Some of the gpios/leds can be auto updated by the soc with dsl and
-	  phy status.
-
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
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
 	depends on MFD_TC3589X
@@ -729,6 +763,20 @@ config GPIO_TC3589X
 	  This enables support for the GPIOs found on the TC3589X
 	  I/O Expander.
 
+config GPIO_TPS6586X
+	bool "TPS6586X GPIO"
+	depends on MFD_TPS6586X
+	help
+	  Select this option to enable GPIO driver for the TPS6586X
+	  chip family.
+
+config GPIO_TPS65910
+	bool "TPS65910 GPIO"
+	depends on MFD_TPS65910
+	help
+	  Select this option to enable GPIO driver for the TPS65910
+	  chip family.
+
 config GPIO_TPS65912
 	tristate "TI TPS65912 GPIO"
 	depends on (MFD_TPS65912_I2C || MFD_TPS65912_SPI)
@@ -749,6 +797,13 @@ config GPIO_TWL6040
 	  Say yes here to access the GPO signals of twl6040
 	  audio chip from Texas Instruments.
 
+config GPIO_UCB1400
+	tristate "Philips UCB1400 GPIO"
+	depends on UCB1400_CORE
+	help
+	  This enables support for the Philips UCB1400 GPIO pins.
+	  The UCB1400 is an AC97 audio codec.
+
 config GPIO_WM831X
 	tristate "WM831x GPIOs"
 	depends on MFD_WM831X
@@ -899,65 +954,6 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
-comment "AC97 GPIO expanders:"
-
-config GPIO_UCB1400
-	tristate "Philips UCB1400 GPIO"
-	depends on UCB1400_CORE
-	help
-	  This enables support for the Philips UCB1400 GPIO pins.
-	  The UCB1400 is an AC97 audio codec.
-
-comment "LPC GPIO expanders:"
-
-config GPIO_KEMPLD
-	tristate "Kontron ETX / COMexpress GPIO"
-	depends on MFD_KEMPLD
-	help
-	  This enables support for the PLD GPIO interface on some Kontron ETX
-	  and COMexpress (ETXexpress) modules.
-
-	  This driver can also be built as a module. If so, the module will be
-	  called gpio-kempld.
-
-comment "MODULbus GPIO expanders:"
-
-config GPIO_JANZ_TTL
-	tristate "Janz VMOD-TTL Digital IO Module"
-	depends on MFD_JANZ_CMODIO
-	help
-	  This enables support for the Janz VMOD-TTL Digital IO module.
-	  This driver provides support for driving the pins in output
-	  mode only. Input mode is not supported.
-
-config GPIO_PALMAS
-	bool "TI PALMAS series PMICs GPIO"
-	depends on MFD_PALMAS
-	help
-	  Select this option to enable GPIO driver for the TI PALMAS
-	  series chip family.
-
-config GPIO_TPS6586X
-	bool "TPS6586X GPIO"
-	depends on MFD_TPS6586X
-	help
-	  Select this option to enable GPIO driver for the TPS6586X
-	  chip family.
-
-config GPIO_TPS65910
-	bool "TPS65910 GPIO"
-	depends on MFD_TPS65910
-	help
-	  Select this option to enable GPIO driver for the TPS65910
-	  chip family.
-
-config GPIO_MSIC
-	bool "Intel MSIC mixed signal gpio support"
-	depends on MFD_INTEL_MSIC
-	help
-	  Enable support for GPIO on intel MSIC controllers found in
-	  intel MID devices
-
 comment "USB GPIO expanders:"
 
 config GPIO_VIPERBOARD
-- 
1.9.3

