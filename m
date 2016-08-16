From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: make any OF dependent driver depend on OF_GPIO
Date: Tue, 16 Aug 2016 12:25:57 +0200
Message-ID: <1471343157-30076-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38319 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136AbcHPK0Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2016 06:26:16 -0400
Received: by mail-wm0-f41.google.com with SMTP id o80so157377185wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2016 03:26:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rabin Vincent <rabin@rab.in>, Pramod Gurav <pramod.gurav@smartplayin.com>, Andreas Larsson <andreas@gaisler.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thierry Reding <treding@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>

The drivers that depend on OF but not OF_GPIO are wreaking havoc
with the autobuilders for archs that have all requirements for
OF but not for OF_GPIO, particularly the UM (Usermode) arch does
not have iomem (NO_IOMEM) which result in configuring GPIOLIB but
without OF_GPIO which is wrong if the driver is using the .of_node
of the gpiochip, which only appears with OF_GPIO.

After a brief look at the drivers just depending on OF it seems
most if not all of them actually require stuff from gpiolib-of so
the dependency is wrong in the first place.

This simply patches the Kconfig so that all GPIO drivers using OF
depend on OF_GPIO rather than just OF.

Cc: Rabin Vincent <rabin@rab.in>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Phil Reid <preid@electromag.com.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Driver maintainers: if you for some reason think that this is not
good for your driver, tell me why.
---
 drivers/gpio/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a6026f2fe7f5..7f3aabc7ee10 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -189,7 +189,7 @@ config GPIO_EP93XX
 config GPIO_ETRAXFS
 	bool "Axis ETRAX FS General I/O"
 	depends on CRIS || COMPILE_TEST
-	depends on OF
+	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -215,7 +215,7 @@ config GPIO_GENERIC_PLATFORM
 
 config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
-	depends on OF
+	depends on OF_GPIO
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -313,7 +313,7 @@ config GPIO_MPC8XXX
 config GPIO_MVEBU
 	def_bool y
 	depends on PLAT_ORION
-	depends on OF
+	depends on OF_GPIO
 	select GENERIC_IRQ_CHIP
 
 config GPIO_MXC
@@ -406,7 +406,7 @@ config GPIO_TEGRA
 	bool "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on OF
+	depends on OF_GPIO
 	help
 	  Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
 
@@ -1100,7 +1100,7 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on OF
+	depends on OF_GPIO
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
-- 
2.7.4

