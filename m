From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] pinctrl: mvebu: guard sub-directory with CONFIG_PINCTRL_MVEBU
Date: Tue, 24 Nov 2015 20:45:23 +0900
Message-ID: <1448365524-12605-3-git-send-email-yamada.masahiro@socionext.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

CONFIG_PINCTRL_MVEBU is more suitable than CONFIG_PLAT_ORION
to guard the drivers/pinctrl/mvebu/ directory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/Makefile       | 2 +-
 drivers/pinctrl/mvebu/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 17c0206..cdc4a61 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -44,7 +44,7 @@ obj-$(CONFIG_ARCH_BCM)		+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
-obj-$(CONFIG_PLAT_ORION)        += mvebu/
+obj-$(CONFIG_PINCTRL_MVEBU)	+= mvebu/
 obj-y				+= nomadik/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
diff --git a/drivers/pinctrl/mvebu/Makefile b/drivers/pinctrl/mvebu/Makefile
index 554d8af..18270cd 100644
--- a/drivers/pinctrl/mvebu/Makefile
+++ b/drivers/pinctrl/mvebu/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_PINCTRL_MVEBU)	+= pinctrl-mvebu.o
+obj-y				+= pinctrl-mvebu.o
 obj-$(CONFIG_PINCTRL_DOVE)	+= pinctrl-dove.o
 obj-$(CONFIG_PINCTRL_KIRKWOOD)	+= pinctrl-kirkwood.o
 obj-$(CONFIG_PINCTRL_ARMADA_370) += pinctrl-armada-370.o
-- 
1.9.1
