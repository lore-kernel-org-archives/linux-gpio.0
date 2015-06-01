From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 4/7] pinctrl: mt8135: Remove .owner field
Date: Mon, 1 Jun 2015 09:54:02 -0300
Message-ID: <1433163245-5780-4-git-send-email-fabio.estevam@freescale.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bbn0107.outbound.protection.outlook.com ([157.56.111.107]:13419
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753111AbbFANIv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 09:08:51 -0400
In-Reply-To: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
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
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 203bd2a..404f117 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -357,7 +357,6 @@ static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt8135_pinctrl_probe,
 	.driver = {
 		.name = "mediatek-mt8135-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = mt8135_pctrl_match,
 	},
 };
-- 
1.9.1

