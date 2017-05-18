From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] pinctrl: mxs: atomically switch mux and drive strength config
Date: Thu, 18 May 2017 11:23:55 +0200
Message-ID: <20170518092355.6735-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:56183 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752796AbdERJYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 May 2017 05:24:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, linux-gpio@vger.kernel.org

To set the mux mode of a pin two bits must be set. Up to now this is
implemented using the following idiom:

	writel(mask, reg + CLR);
	writel(value, reg + SET);

. This however results in the mux mode being 0 between the two writes.

On my machine there is an IC's reset pin connected to LCD_D20. The
bootloader configures this pin as GPIO output-high (i.e. not holding the
IC in reset). When Linux reconfigures the pin to GPIO the short time
LCD_D20 is muxed as LCD_D20 instead of GPIO_1_20 is enough to confuse
the connected IC.

The same problem is present for the pin's drive strength setting which is
reset to low drive strength before using the right value.

So instead of relying on the hardware to modify the register setting
using two writes implement the bit toggling using read-modify-write.

Fixes: 17723111e64f ("pinctrl: add pinctrl-mxs support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 41b5b07d5a2b..6852010a6d70 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -194,6 +194,16 @@ static int mxs_pinctrl_get_func_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void mxs_pinctrl_rmwl(u32 value, u32 mask, u8 shift, void __iomem *reg)
+{
+	u32 tmp;
+
+	tmp = readl(reg);
+	tmp &= ~(mask << shift);
+	tmp |= value << shift;
+	writel(tmp, reg);
+}
+
 static int mxs_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 			       unsigned group)
 {
@@ -211,8 +221,7 @@ static int mxs_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		reg += bank * 0x20 + pin / 16 * 0x10;
 		shift = pin % 16 * 2;
 
-		writel(0x3 << shift, reg + CLR);
-		writel(g->muxsel[i] << shift, reg + SET);
+		mxs_pinctrl_rmwl(g->muxsel[i], 0x3, shift, reg);
 	}
 
 	return 0;
@@ -279,8 +288,7 @@ static int mxs_pinconf_group_set(struct pinctrl_dev *pctldev,
 			/* mA */
 			if (config & MA_PRESENT) {
 				shift = pin % 8 * 4;
-				writel(0x3 << shift, reg + CLR);
-				writel(ma << shift, reg + SET);
+				mxs_pinctrl_rmwl(ma, 0x3, shift, reg);
 			}
 
 			/* vol */
-- 
2.11.0

