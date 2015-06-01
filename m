From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH] pinctrl: samsung: Fix the pointer in PTR_ERR()
Date: Mon, 1 Jun 2015 09:57:04 -0300
Message-ID: <1433163424-6123-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bbn0105.outbound.protection.outlook.com ([157.56.111.105]:39280
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751942AbbFAM5b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 08:57:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

PTR_ERR should access the value just tested by IS_ERR

The semantic patch that makes this change is available
in scripts/coccinelle/tests/odd_ptr_err.cocci.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ed165ba..0fd20c5 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -806,7 +806,7 @@ static int samsung_pinctrl_parse_dt(struct platform_device *pdev,
 	functions = samsung_pinctrl_create_functions(dev, drvdata, &func_cnt);
 	if (IS_ERR(functions)) {
 		dev_err(dev, "failed to parse pin functions\n");
-		return PTR_ERR(groups);
+		return PTR_ERR(functions);
 	}
 
 	drvdata->pin_groups = groups;
-- 
1.9.1

