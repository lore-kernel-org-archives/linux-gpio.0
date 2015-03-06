From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 2/2] pinctrl: mediatek: Adjust mt8173 pinctrl kconfig
Date: Fri, 6 Mar 2015 14:24:51 +0800
Message-ID: <1425623091-30478-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

Linus,
This one make PINCTRL_MT8173 option user selectable and is based on
mtk-staging in your tree. If you think this is OK, please applied or
squash this into previous change. Thanks.

--------------------------------------------------
ARM64 maintainer doesn't want to add MACH_* for each SoC.
Adjust mt8173 pinctrl kconfig entry so user can manually select it.

Also make PINCTRL_MT8135 build when COMPILE_TEST is enabled.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 49b8649..1472f0e 100644
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
+	def_bool y
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MTK_COMMON
 
 endif
-- 
1.8.1.1.dirty
