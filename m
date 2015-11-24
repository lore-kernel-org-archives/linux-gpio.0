From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: rework UniPhier pinctrl entries in Kconfig
Date: Tue, 24 Nov 2015 15:00:45 +0900
Message-ID: <1448344846-28726-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:29556 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753180AbbKXGAq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2015 01:00:46 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

There is a plan to support more pinctrl drivers for this SoC family.
Move the driver entries into a sub menu by using "menuconfig".
Also, add the missing dependency "depends on OF && MFD_SYSCON".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/Kconfig | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index ad90707..7abd614 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -1,32 +1,35 @@
-if ARCH_UNIPHIER
-
-config PINCTRL_UNIPHIER
-	bool
+menuconfig PINCTRL_UNIPHIER
+	bool "UniPhier SoC pinctrl drivers"
+	depends on ARCH_UNIPHIER
+	depends on OF && MFD_SYSCON
+	default y
 	select PINMUX
 	select GENERIC_PINCONF
 
+if PINCTRL_UNIPHIER
+
 config PINCTRL_UNIPHIER_PH1_LD4
 	tristate "UniPhier PH1-LD4 SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 config PINCTRL_UNIPHIER_PH1_PRO4
 	tristate "UniPhier PH1-Pro4 SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 config PINCTRL_UNIPHIER_PH1_SLD8
 	tristate "UniPhier PH1-sLD8 SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 config PINCTRL_UNIPHIER_PH1_PRO5
 	tristate "UniPhier PH1-Pro5 SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 config PINCTRL_UNIPHIER_PROXSTREAM2
 	tristate "UniPhier ProXstream2 SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 config PINCTRL_UNIPHIER_PH1_LD6B
 	tristate "UniPhier PH1-LD6b SoC pinctrl driver"
-	select PINCTRL_UNIPHIER
+	default y
 
 endif
-- 
1.9.1

