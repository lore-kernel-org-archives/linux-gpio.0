From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: imx: select regmap subsystem
Date: Sat, 16 Apr 2016 22:26:06 +0200
Message-ID: <1460838382-1245338-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:51797 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcDPU0o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Apr 2016 16:26:44 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.Li@freescale.com>, Anson Huang <b20788@freescale.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Building the imx pinctrl driver without regmap fails with multiple
build errors like:

drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_probe':
drivers/pinctrl/freescale/pinctrl-imx.c:723:9: error: variable 'config' has initializer but incomplete type
  struct regmap_config config = { .name = "gpr" };

This adds a 'select REGMAP' statement, to ensure we can define a 'struct
regmap_config'. This matches what all other regmap users do. The driver
actually uses syscon on top of regmap, but syscon is already enabled
on i.MX for other reasons, and selecting REGMAP but not SYSCON is
sufficient for build testing on other platforms.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 8626ada871f1 ("pinctrl: imx: attach iomuxc device to gpr syscon")
---
 drivers/pinctrl/freescale/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index debe1219d76d..fc8cbf611723 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -2,6 +2,7 @@ config PINCTRL_IMX
 	bool
 	select PINMUX
 	select PINCONF
+	select REGMAP
 
 config PINCTRL_IMX1_CORE
 	bool
-- 
2.7.0

