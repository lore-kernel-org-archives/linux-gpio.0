From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/27] mfd: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:27 +0200
Message-ID: <1430843563-18615-11-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54791 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761328AbbEEQcz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2015 12:32:55 -0400
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7eaa5488892524ba..3ee86248aa7cad8b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -52,7 +52,8 @@ config PMIC_ADP5520
 config MFD_AAT2870_CORE
 	bool "AnalogicTech AAT2870"
 	select MFD_CORE
-	depends on I2C=y && GPIOLIB
+	depends on I2C=y
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  If you say yes here you get support for the AAT2870.
 	  This driver provides common support for accessing the device,
@@ -1115,7 +1116,8 @@ config MFD_TPS6586X
 
 config MFD_TPS65910
 	bool "TI TPS65910 Power Management chip"
-	depends on I2C=y && GPIOLIB
+	depends on I2C=y
+	depends on GPIOLIB || COMPILE_TEST
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
-- 
1.9.1

