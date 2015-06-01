From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 5/7] pinctrl: mt8127: Remove .owner field
Date: Mon, 1 Jun 2015 09:54:03 -0300
Message-ID: <1433163245-5780-5-git-send-email-fabio.estevam@freescale.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0118.outbound.protection.outlook.com ([65.55.169.118]:13920
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753484AbbFANJ4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 09:09:56 -0400
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
 drivers/pinctrl/mediatek/pinctrl-mt8127.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index 6a26cfa..b317b0b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -342,7 +342,6 @@ static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt8127_pinctrl_probe,
 	.driver = {
 		.name = "mediatek-mt8127-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = mt8127_pctrl_match,
 	},
 };
-- 
1.9.1

