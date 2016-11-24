From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH] pinctrl: imx: fix imx_pinctrl_desc initialization
Date: Thu, 24 Nov 2016 19:11:51 +0100
Message-ID: <20161124181151.29419-1-gary.bisson@boundarydevices.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34761 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935294AbcKXSMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 13:12:01 -0500
Received: by mail-wm0-f52.google.com with SMTP id u144so22908308wmu.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2016 10:12:01 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: hawnguo@kernel.org
Cc: linus.walleij@linaro.org, vladimir_zapolskiy@mentor.com, van.freenix@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Bisson <gary.bisson@boundarydevices.com>

Was introduced by:
6e408ed pinctrl: imx: fix initialization of imx_pinctrl_desc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 79c4e14..5ef7e87 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -778,10 +778,10 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	imx_pinctrl_desc->name = dev_name(&pdev->dev);
 	imx_pinctrl_desc->pins = info->pins;
 	imx_pinctrl_desc->npins = info->npins;
-	imx_pinctrl_desc->pctlops = &imx_pctrl_ops,
-	imx_pinctrl_desc->pmxops = &imx_pmx_ops,
-	imx_pinctrl_desc->confops = &imx_pinconf_ops,
-	imx_pinctrl_desc->owner = THIS_MODULE,
+	imx_pinctrl_desc->pctlops = &imx_pctrl_ops;
+	imx_pinctrl_desc->pmxops = &imx_pmx_ops;
+	imx_pinctrl_desc->confops = &imx_pinconf_ops;
+	imx_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = imx_pinctrl_probe_dt(pdev, info);
 	if (ret) {
-- 
2.9.3

