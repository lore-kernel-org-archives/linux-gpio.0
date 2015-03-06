From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 1/2] arm64: mediatek: Select PINCTRL for Mediatek platform
Date: Fri, 6 Mar 2015 14:24:50 +0800
Message-ID: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

These 2 patches are fixup for MT8173 pinctrl driver:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320066.html

Arm64 maintainers doesn't want to add MACH_* in Kconfig, this patch
is used to replace the first one in that series.

Matthias,
Can you take this one?

----------------------------------
MediaTek SoC expect to work with a pinctrl driver.
Select PINCTRL if ARCH_MEDIATEK is selected.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e627ead..a2ddd3f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -151,6 +151,7 @@ menu "Platform selection"
 config ARCH_MEDIATEK
 	bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
 	select ARM_GIC
+	select PINCTRL
 	help
 	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
 
-- 
1.8.1.1.dirty
