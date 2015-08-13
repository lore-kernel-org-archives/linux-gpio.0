From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] pinctrl: imx6ul: Remove .owner field
Date: Thu, 13 Aug 2015 17:20:21 -0300
Message-ID: <1439497221-29913-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:35656 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752884AbbHMUUo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 16:20:44 -0400
Received: by ykdz80 with SMTP id z80so51589447ykd.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2015 13:20:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Frank.Li@freescale.com, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

platform_driver does not need to set an owner as it will be
populated by the driver core.

The semantic patch that makes this change is available
in scripts/coccinelle/api/platform_no_drv_owner.cocci.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/pinctrl/freescale/pinctrl-imx6ul.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
index b182be7..08e7576 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -299,7 +299,6 @@ static int imx6ul_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx6ul_pinctrl_driver = {
 	.driver = {
 		.name = "imx6ul-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(imx6ul_pinctrl_of_match),
 	},
 	.probe = imx6ul_pinctrl_probe,
-- 
1.9.1

