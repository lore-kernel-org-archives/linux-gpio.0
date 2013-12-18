From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Wed, 18 Dec 2013 09:10:29 +0200
Message-ID: <bfc8635f56992aa8865dc58810a4f9872b3a0c86.1387350629.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:43548 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750855Ab3LRHLm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Dec 2013 02:11:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org, Baruch Siach <baruch@tkos.co.il>

Prevent build failure when the selected variant does not support GPIO32.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Move the HAVE_XTENSA_GPIO32 definition to arch/xtensa/Kconfig (Max)
   Add Max's ack
---
 arch/xtensa/Kconfig  | 6 ++++++
 drivers/gpio/Kconfig | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 65ffc09..8462f32 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -65,6 +65,9 @@ config MMU
 config VARIANT_IRQ_SWITCH
 	def_bool n
 
+config HAVE_XTENSA_GPIO32
+	def_bool n
+
 menu "Processor type and features"
 
 choice
@@ -74,16 +77,19 @@ choice
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
index 43c45ea..ae94e96 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -293,6 +293,7 @@ config GPIO_XILINX
 config GPIO_XTENSA
 	bool "Xtensa GPIO32 support"
 	depends on XTENSA
+	depends on HAVE_XTENSA_GPIO32
 	depends on !SMP
 	help
 	  Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
-- 
1.8.5.1

