From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH] pinctrl: imx: Kconfig: PINCTRL_IMX select REGMAP
Date: Sun, 10 Apr 2016 20:41:38 +0200
Message-ID: <1460313698-23917-1-git-send-email-akurz@blala.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vs81.iboxed.net ([185.82.85.146]:59475 "EHLO vs81.iboxed.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758523AbcDJSwz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 10 Apr 2016 14:52:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Alexander Kurz <akurz@blala.de>

Regmap functionality has been integrated into pinctrl-imx.c with commit
8626ada8 which might trigger build failures when regmap is not selected
otherwise. Hence, make Kconfig aware about this new dependency.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/pinctrl/freescale/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index debe121..fc8cbf6 100644
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
2.1.4

