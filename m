From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: tegra: don't auto-enable for COMPILE_TEST
Date: Wed,  6 Jul 2016 14:54:03 +0200
Message-ID: <20160706125424.1687264-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:51229 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753282AbcGFMvQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 08:51:16 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, Arnd Bergmann <arnd@arndb.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

I stumbled over a build error with COMPILE_TEST and CONFIG_OF
disabled:

drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_probe':
drivers/gpio/gpio-tegra.c:603:9: error: 'struct gpio_chip' has no member named 'of_node'

The problem is that the newly added GPIO_TEGRA Kconfig symbol
does not have a dependency on CONFIG_OF. However, there is another
problem here as the driver gets enabled unconditionally whenever
COMPILE_TEST is set.

This fixes both problems, by making the symbol user-visible
when COMPILE_TEST is set and default-enabled for ARCH_TEGRA=y.

As a side-effect, it is now possible to compile-test a Tegra
kernel with GPIO support disabled, which is harmless.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 4dd4dd1d2120 ("gpio: tegra: Allow compile test")
---
 drivers/gpio/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 681c2dcd697b..513a3d174706 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -402,9 +402,12 @@ config GPIO_TB10X
 	select OF_GPIO
 
 config GPIO_TEGRA
-	bool
-	default y
+	bool "NVIDIA Tegra GPIO support"
+	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on OF
+	help
+	  Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
 
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
-- 
2.9.0

