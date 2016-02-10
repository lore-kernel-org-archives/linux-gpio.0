From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] pinctrl: mediatek: guard sub-directory with CONFIG_PINCTRL_MTK
Date: Wed, 10 Feb 2016 18:54:32 +0900
Message-ID: <1455098072-13112-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:32731 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751702AbcBJJyi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 04:54:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

CONFIG_PINCTRL_MTK is more suitable than CONFIG_ARCH_MEDIATEK
to guard the drivers/pinctrl/mediatek/ directory.
(I renamed CONFIG_PINCTRL_MTK_COMMON to CONFIG_PINCTRL_MTK.)

This allows COMPILE_TEST to descend into drivers/pinctrl/mediatek
without CONFIG_ARCH_MEDIATEK define.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Series-changes: 2
  - Rebase onto linux-pinctrl/devel

 drivers/pinctrl/Makefile          |  2 +-
 drivers/pinctrl/mediatek/Kconfig  | 12 ++++++------
 drivers/pinctrl/mediatek/Makefile | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 7ea62ef..e4bc115 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -50,4 +50,4 @@ obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
-obj-$(CONFIG_ARCH_MEDIATEK)	+= mediatek/
+obj-$(CONFIG_PINCTRL_MTK)	+= mediatek/
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 13e9939..e4fbc58 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 if ARCH_MEDIATEK || COMPILE_TEST
 
-config PINCTRL_MTK_COMMON
+config PINCTRL_MTK
 	bool
 	depends on OF
 	select PINMUX
@@ -13,19 +13,19 @@ config PINCTRL_MT2701
 	bool "Mediatek MT2701 pin control" if COMPILE_TEST && !MACH_MT2701
 	depends on OF
 	default MACH_MT2701
-	select PINCTRL_MTK_COMMON
+	select PINCTRL_MTK
 
 config PINCTRL_MT8135
 	bool "Mediatek MT8135 pin control" if COMPILE_TEST && !MACH_MT8135
 	depends on OF
 	default MACH_MT8135
-	select PINCTRL_MTK_COMMON
+	select PINCTRL_MTK
 
 config PINCTRL_MT8127
 	bool "Mediatek MT8127 pin control" if COMPILE_TEST && !MACH_MT8127
 	depends on OF
 	default MACH_MT8127
-	select PINCTRL_MTK_COMMON
+	select PINCTRL_MTK
 
 # For ARMv8 SoCs
 config PINCTRL_MT8173
@@ -33,13 +33,13 @@ config PINCTRL_MT8173
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
-	select PINCTRL_MTK_COMMON
+	select PINCTRL_MTK
 
 # For PMIC
 config PINCTRL_MT6397
 	bool "Mediatek MT6397 pin control" if COMPILE_TEST && !MFD_MT6397
 	depends on OF
 	default MFD_MT6397
-	select PINCTRL_MTK_COMMON
+	select PINCTRL_MTK
 
 endif
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index da30314..e59c613 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -1,9 +1,9 @@
 # Core
-obj-$(CONFIG_PINCTRL_MTK_COMMON)	+= pinctrl-mtk-common.o
+obj-y				+= pinctrl-mtk-common.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_MT2701)		+= pinctrl-mt2701.o
-obj-$(CONFIG_PINCTRL_MT8135)		+= pinctrl-mt8135.o
-obj-$(CONFIG_PINCTRL_MT8127)		+= pinctrl-mt8127.o
-obj-$(CONFIG_PINCTRL_MT8173)		+= pinctrl-mt8173.o
-obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
+obj-$(CONFIG_PINCTRL_MT2701)	+= pinctrl-mt2701.o
+obj-$(CONFIG_PINCTRL_MT8135)	+= pinctrl-mt8135.o
+obj-$(CONFIG_PINCTRL_MT8127)	+= pinctrl-mt8127.o
+obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
+obj-$(CONFIG_PINCTRL_MT6397)	+= pinctrl-mt6397.o
-- 
1.9.1

