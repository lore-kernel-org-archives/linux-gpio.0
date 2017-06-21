From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V4 3/7] pinctrl: imx: switch to use the generic pinmux property
Date: Wed, 21 Jun 2017 19:59:51 +0800
Message-ID: <1498046395-30001-4-git-send-email-aisheng.dong@nxp.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam01on0049.outbound.protection.outlook.com ([104.47.32.49]:10608
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751118AbdFUMBo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jun 2017 08:01:44 -0400
In-Reply-To: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>

The generic pinmux property seems to be more suitable for IMX.
So we change to use 'pinmux' instead of 'pins'.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Bai Ping <ping.bai@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

---
ChangeLog:
 * new patch
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 72aca75..fc1ba3c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -563,14 +563,14 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	 * do sanity check and calculate pins number
 	 *
 	 * First try legacy 'fsl,pins' property, then fall back to the
-	 * generic 'pins'.
+	 * generic 'pinmux'.
 	 *
-	 * Note: for generic 'pins' case, there's no CONFIG part in
+	 * Note: for generic 'pinmux' case, there's no CONFIG part in
 	 * the binding format.
 	 */
 	list = of_get_property(np, "fsl,pins", &size);
 	if (!list) {
-		list = of_get_property(np, "pins", &size);
+		list = of_get_property(np, "pinmux", &size);
 		if (!list) {
 			dev_err(info->dev,
 				"no fsl,pins and pins property in node %s\n",
-- 
2.7.4

