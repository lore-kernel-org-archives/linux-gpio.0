From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/2] pinctrl: sprd: check for allocation failure
Date: Thu, 7 Sep 2017 10:29:26 +0300
Message-ID: <20170907072926.56oqezwk4r72yjgt@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:42524 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752315AbdIGHav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2017 03:30:51 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_pinctrl_get() could fail with ERR_PTR(-ENOMEM) so I have added a
check for that.  I also reversed the other IS_ERR() test because it was
a little confusing to test one way and then the opposite a couple lines
later.

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 7e7b9ac7e836..673b77bbbc8c 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -1100,12 +1100,16 @@ int sprd_pinctrl_remove(struct platform_device *pdev)
 
 void sprd_pinctrl_shutdown(struct platform_device *pdev)
 {
-	struct pinctrl *pinctl = devm_pinctrl_get(&pdev->dev);
+	struct pinctrl *pinctl;
 	struct pinctrl_state *state;
 
+	pinctl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(pinctl))
+		return;
 	state = pinctrl_lookup_state(pinctl, "shutdown");
-	if (!IS_ERR(state))
-		pinctrl_select_state(pinctl, state);
+	if (IS_ERR(state))
+		return;
+	pinctrl_select_state(pinctl, state);
 }
 
 MODULE_DESCRIPTION("SPREADTRUM Pin Controller Driver");
