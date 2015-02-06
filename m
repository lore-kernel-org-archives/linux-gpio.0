From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Fri,  6 Feb 2015 17:30:56 +0100
Message-ID: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:54303 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbbBFQbB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Feb 2015 11:31:01 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: u.kleine-koenig@pengutronix.de, kernel@pengutronix.de, shawn.guo@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stefan@agner.ch

Commit 3dac1918a491 ("pinctrl: imx: detect uninitialized pins") needs
the values in struct imx_pin_reg to be -1. This has been done in a
rather unorthodox way by setting the memory to 0xff using memset...
Use a proper for loop to initialize the whole array with -1.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 52f2b94..95041b6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -645,7 +645,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 {
 	struct imx_pinctrl *ipctl;
 	struct resource *res;
-	int ret;
+	int ret, i;
 
 	if (!info || !info->pins || !info->npins) {
 		dev_err(&pdev->dev, "wrong pinctrl info\n");
@@ -662,7 +662,11 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 				      info->npins, GFP_KERNEL);
 	if (!info->pin_regs)
 		return -ENOMEM;
-	memset(info->pin_regs, 0xff, sizeof(*info->pin_regs) * info->npins);
+
+	for (i = 0; i < info->npins; i++) {
+		info->pin_regs[i].mux_reg = -1;
+		info->pin_regs[i].conf_reg = -1;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ipctl->base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.2.2

