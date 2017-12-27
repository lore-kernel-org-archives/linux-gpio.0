From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: spear: Delete an error message for a failed memory
 allocation in spear_pinctrl_probe()
Date: Wed, 27 Dec 2017 22:48:58 +0100
Message-ID: <3d936763-6a8a-edd3-3bcf-0075c9343e37@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:57282 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751881AbdL0VtU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Dec 2017 16:49:20 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Viresh Kumar <vireshk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Dec 2017 22:44:04 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/spear/pinctrl-spear.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 4db52ba38d8d..efe79d3f7659 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -361,10 +361,8 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 		return -ENODEV;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
-	if (!pmx) {
-		dev_err(&pdev->dev, "Can't alloc spear_pmx\n");
+	if (!pmx)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pmx->vbase = devm_ioremap_resource(&pdev->dev, res);
-- 
2.15.1

