From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: pxa: guard sub-directory with CONFIG_PINCTRL_PXA
Date: Sun, 24 Jan 2016 00:31:08 +0900
Message-ID: <1453563068-30238-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

CONFIG_PINCTRL_PXA is more suitable than CONFIG_ARCH_PXA
to guard the drivers/pinctrl/pxa/ directory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index b7b456a..04b633f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -40,7 +40,7 @@ obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-$(CONFIG_PINCTRL_MVEBU)	+= mvebu/
 obj-y				+= nomadik/
-obj-$(CONFIG_ARCH_PXA)		+= pxa/
+obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SH_PFC)	+= sh-pfc/
-- 
1.9.1
