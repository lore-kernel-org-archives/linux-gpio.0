From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sprd: Restrict PINCTRL_SPRD to ARCH_SPRD or COMPILE_TEST
Date: Wed,  6 Sep 2017 18:08:05 +0200
Message-ID: <1504714085-17731-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

The Spreadtrum pinctrl drivers are only useful when building for a
Spreadtrum platform.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
On top of Arnd's:
  - pinctrl: sprd: add missing Kconfig dependency
  - pinctrl: sprd: add CONFIG_OF dependency

 drivers/pinctrl/sprd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
index e75cde2e1b460d66..bc7f3fab22f1c431 100644
--- a/drivers/pinctrl/sprd/Kconfig
+++ b/drivers/pinctrl/sprd/Kconfig
@@ -5,6 +5,7 @@
 config PINCTRL_SPRD
 	bool "Spreadtrum pinctrl driver"
 	depends on OF
+	depends on ARCH_SPRD || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.7.4
