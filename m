From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] pinctrl: berlin: guard sub-directory with CONFIG_PINCTRL_BERLIN
Date: Tue, 24 Nov 2015 20:45:22 +0900
Message-ID: <1448365524-12605-2-git-send-email-yamada.masahiro@socionext.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jisheng Zhang <jszhang@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

CONFIG_PINCTRL_BERLIN is more suitable than CONFIG_ARCH_BERLIN
to guard the drivers/pinctrl/berlin/ directory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/Makefile        | 2 +-
 drivers/pinctrl/berlin/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 738cb49..17c0206 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-$(CONFIG_ARCH_BCM)		+= bcm/
-obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
+obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-$(CONFIG_PLAT_ORION)        += mvebu/
diff --git a/drivers/pinctrl/berlin/Makefile b/drivers/pinctrl/berlin/Makefile
index 06f9402..6f641ce 100644
--- a/drivers/pinctrl/berlin/Makefile
+++ b/drivers/pinctrl/berlin/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_PINCTRL_BERLIN)		+= berlin.o
+obj-y					+= berlin.o
 obj-$(CONFIG_PINCTRL_BERLIN_BG2)	+= berlin-bg2.o
 obj-$(CONFIG_PINCTRL_BERLIN_BG2CD)	+= berlin-bg2cd.o
 obj-$(CONFIG_PINCTRL_BERLIN_BG2Q)	+= berlin-bg2q.o
-- 
1.9.1
