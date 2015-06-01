From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 7/7] pinctrl: atlas7: Remove .owner field
Date: Mon, 1 Jun 2015 09:54:05 -0300
Message-ID: <1433163245-5780-7-git-send-email-fabio.estevam@freescale.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bn0107.outbound.protection.outlook.com ([157.56.110.107]:38400
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751263AbbFANKa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 09:10:30 -0400
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
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 046251a..c2ced3f 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -4066,7 +4066,6 @@ static int atlas7_pinmux_probe(struct platform_device *pdev)
 	pmx->pctl_desc.pctlops = &atlas7_pinctrl_ops;
 	pmx->pctl_desc.pmxops = &atlas7_pinmux_ops;
 	pmx->pctl_desc.confops = &atlas7_pinconf_ops;
-	pmx->pctl_desc.owner = THIS_MODULE;
 
 	for (idx = 0; idx < banks; idx++) {
 		pmx->regs[idx] = of_iomap(np, idx);
@@ -4109,7 +4108,6 @@ static const struct of_device_id atlas7_pinmux_ids[] = {
 static struct platform_driver atlas7_pinmux_driver = {
 	.driver = {
 		.name = "atlas7-ioc",
-		.owner = THIS_MODULE,
 		.of_match_table = atlas7_pinmux_ids,
 	},
 	.probe = atlas7_pinmux_probe,
-- 
1.9.1

