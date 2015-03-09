From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Adjust mt8173 pinctrl kconfig
Date: Mon, 9 Mar 2015 16:13:44 +0800
Message-ID: <1425888824-13935-1-git-send-email-yingjoe.chen@mediatek.com>
References: <1425623091-30478-2-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:58898 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751484AbbCIIPt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 04:15:49 -0400
In-Reply-To: <1425623091-30478-2-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Paul Bolle <pebolle@tiscali.nl>
Cc: Arnd Bergmann <arnd@arndb.de>, srv_heupstream@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

Change based on Paul's suggestion.
Old patch can be found at:
http://lists.infradead.org/pipermail/linux-mediatek/2015-March/000057.html

------
ARM64 maintainer doesn't want to add MACH_* for each SoC.
Adjust mt8173 pinctrl kconfig entry so user can manually select it.

Also make PINCTRL_MT8135 build when COMPILE_TEST is enabled.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 49b8649..0e3a002 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,4 +1,4 @@
-if ARCH_MEDIATEK
+if ARCH_MEDIATEK || COMPILE_TEST
 
 config PINCTRL_MTK_COMMON
 	bool
@@ -8,11 +8,13 @@ config PINCTRL_MTK_COMMON
 	select OF_GPIO
 
 config PINCTRL_MT8135
-	def_bool MACH_MT8135
+	def_bool MACH_MT8135 || COMPILE_TEST
 	select PINCTRL_MTK_COMMON
 
 config PINCTRL_MT8173
-	def_bool MACH_MT8173
+	bool "Mediatek MT8173 pin control"
+	default y
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MTK_COMMON
 
 endif
-- 
1.8.1.1.dirty

