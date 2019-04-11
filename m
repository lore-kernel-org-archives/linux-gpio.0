From: Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH] pinctrl: Add kernel config PINCTRL_MTK_V2
Date: Thu, 11 Apr 2019 17:32:18 +0800
Message-ID: <1554975138-801-1-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sean.wang@kernel.org, wsd_upstream@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

Since no single Mediatek chip use code for PINCTRL_MTK and code for
PINCTRL_MTK_MOORE/PINCTRL_MTK_PARIS simultaneously, it is better to use
different config to determine if related code will be built or not on
building non-generic kernel.

Add kernel config PINCTRL_MTK_V2 selected by either PINCTRL_MTK_MOORE
or PINCTRL_MTK_PARIS.
Use PINCTRL_MTK and PINCTRL_MTK_V2 to control building of
drivers/pinctrl/medaitek/.
Remove selection of EINT_MTK from PINCTRL_MTK since code for EINT_MTK is
only related to PINCTRL_MTK_MOORE/PINCTRL_MTK_PARIS, i.e. PINCTL_MTK_V2.

---
 drivers/pinctrl/Makefile         |  3 ++-
 drivers/pinctrl/mediatek/Kconfig | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 712184b..fcee0e0 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
-obj-y				+= mediatek/
+obj-$(CONFIG_PINCTRL_MTK)	+= mediatek/
+obj-$(CONFIG_PINCTRL_MTK_V2)	+= mediatek/
 obj-$(CONFIG_PINCTRL_ZX)	+= zte/
 obj-y				+= cirrus/
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index a005cbc..5e26462 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -2,10 +2,15 @@ menu "MediaTek pinctrl drivers"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 
 config EINT_MTK
-	bool "MediaTek External Interrupt Support"
-	depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
+	bool "MediaTek External Interrupt driver that is based on PINCTRL_MTK_V2"
+	depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
 	select GPIOLIB
 	select IRQ_DOMAIN
+	help
+	  Say yes here to enable support for MediaTek External Interrupt
+	  (EINT) driver based on PINCTRL_MTK version 2.
+	  This driver is combined with MediaTek Pinctrl driver version 2
+	  so PINCTRL_MTK_V2 shall be set first.
 
 config PINCTRL_MTK
 	bool
@@ -13,9 +18,11 @@ config PINCTRL_MTK
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select EINT_MTK
 	select OF_GPIO
 
+config PINCTRL_MTK_V2
+	bool "MediaTek Pinctrl Support V2"
+
 config PINCTRL_MTK_MOORE
 	bool
 	depends on OF
@@ -24,6 +31,7 @@ config PINCTRL_MTK_MOORE
 	select GENERIC_PINMUX_FUNCTIONS
 	select GPIOLIB
 	select OF_GPIO
+	select PINCTRL_MTK_V2
 
 config PINCTRL_MTK_PARIS
 	bool
@@ -33,6 +41,7 @@ config PINCTRL_MTK_PARIS
 	select GPIOLIB
 	select EINT_MTK
 	select OF_GPIO
+	select PINCTRL_MTK_V2
 
 # For ARMv7 SoCs
 config PINCTRL_MT2701
-- 
1.8.1.1.dirty
