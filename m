From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Mon, 16 Dec 2013 09:05:23 +0200
Message-ID: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:32933 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932Ab3LPHGl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 16 Dec 2013 02:06:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org, Baruch Siach <baruch@tkos.co.il>

Prevent build failure when the selected variant does not support GPIO32.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Chris, Max,

I assume that the gpio tree is the natural path for this patch as it carries 
the driver already. Please ack the arch/xtensa part.
---
 arch/xtensa/Kconfig  | 3 +++
 drivers/gpio/Kconfig | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 65ffc09..6bd4ee3 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -74,16 +74,19 @@ choice
 config XTENSA_VARIANT_FSF
 	bool "fsf - default (not generic) configuration"
 	select MMU
+	select HAVE_XTENSA_GPIO32
 
 config XTENSA_VARIANT_DC232B
 	bool "dc232b - Diamond 232L Standard Core Rev.B (LE)"
 	select MMU
+	select HAVE_XTENSA_GPIO32
 	help
 	  This variant refers to Tensilica's Diamond 232L Standard core Rev.B (LE).
 
 config XTENSA_VARIANT_DC233C
 	bool "dc233c - Diamond 233L Standard Core Rev.C (LE)"
 	select MMU
+	select HAVE_XTENSA_GPIO32
 	help
 	  This variant refers to Tensilica's Diamond 233L Standard core Rev.C (LE).
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 43c45ea..766accb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -290,9 +290,13 @@ config GPIO_XILINX
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
+config HAVE_XTENSA_GPIO32
+	bool
+
 config GPIO_XTENSA
 	bool "Xtensa GPIO32 support"
 	depends on XTENSA
+	depends on HAVE_XTENSA_GPIO32
 	depends on !SMP
 	help
 	  Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
-- 
1.8.5.1

