From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 1/7] pinctrl: imx7d: Remove .owner field
Date: Mon, 1 Jun 2015 09:53:59 -0300
Message-ID: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bbn0105.outbound.protection.outlook.com ([157.56.111.105]:24857
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751357AbbFAMyZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 08:54:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

platform_driver does not need to set the owner field, as it will be 
populated by the driver core, so just remove it.

The semantic patch that makes this change is available
in scripts/coccinelle/api/platform_no_drv_owner.cocci.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/pinctrl/freescale/pinctrl-imx7d.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index d8ab17e..1fa7530 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -361,7 +361,6 @@ static int imx7d_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx7d_pinctrl_driver = {
 	.driver = {
 		.name = "imx7d-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(imx7d_pinctrl_of_match),
 	},
 	.probe = imx7d_pinctrl_probe,
-- 
1.9.1

