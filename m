From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: tz1090-pdc: Delete an error message for a failed
 memory allocation in two functions
Date: Mon, 25 Dec 2017 18:34:40 +0100
Message-ID: <f52b8393-9e1f-bd65-1374-4e9db1a0e4c0@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:64416 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751456AbdLYReq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Dec 2017 12:34:46 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Landley <rob@landley.net>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 18:28:02 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-tz1090-pdc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/pinctrl-tz1090-pdc.c
index 5cfa93cecf73..b16d1c96b7eb 100644
--- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
+++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
@@ -357,10 +357,8 @@ static int add_map_configs(struct device *dev,
 
 	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
 			      GFP_KERNEL);
-	if (!dup_configs) {
-		dev_err(dev, "kmemdup(configs) failed\n");
+	if (!dup_configs)
 		return -ENOMEM;
-	}
 
 	/*
 	 * We support both pins and pin groups, but we need to figure out which
@@ -931,10 +929,9 @@ static int tz1090_pdc_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
-	if (!pmx) {
-		dev_err(&pdev->dev, "Can't alloc tz1090_pdc_pmx\n");
+	if (!pmx)
 		return -ENOMEM;
-	}
+
 	pmx->dev = &pdev->dev;
 	spin_lock_init(&pmx->lock);
 
-- 
2.15.1

