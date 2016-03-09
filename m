From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] pinctrl: freescale: imx: fix bogus check of of_iomap() return value
Date: Wed,  9 Mar 2016 02:45:36 +0200
Message-ID: <1457484336-8928-1-git-send-email-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:48820 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753517AbcCIApn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 8 Mar 2016 19:45:43 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Adrian Alonso <aalonso@freescale.com>, linux-gpio@vger.kernel.org

On error path of_iomap() returns NULL, hence IS_ERR() check is invalid
and may cause a NULL pointer dereference, the change fixes this
problem.

While we are here invert a device node check to simplify the code.

Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 4c435cf..b2d0ac7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -752,19 +752,18 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 
 	if (of_property_read_bool(dev_np, "fsl,input-sel")) {
 		np = of_parse_phandle(dev_np, "fsl,input-sel", 0);
-		if (np) {
-			ipctl->input_sel_base = of_iomap(np, 0);
-			if (IS_ERR(ipctl->input_sel_base)) {
-				of_node_put(np);
-				dev_err(&pdev->dev,
-					"iomuxc input select base address not found\n");
-				return PTR_ERR(ipctl->input_sel_base);
-			}
-		} else {
+		if (!np) {
 			dev_err(&pdev->dev, "iomuxc fsl,input-sel property not found\n");
 			return -EINVAL;
 		}
+
+		ipctl->input_sel_base = of_iomap(np, 0);
 		of_node_put(np);
+		if (!ipctl->input_sel_base) {
+			dev_err(&pdev->dev,
+				"iomuxc input select base address not found\n");
+			return -ENOMEM;
+		}
 	}
 
 	imx_pinctrl_desc.name = dev_name(&pdev->dev);
-- 
2.1.4

