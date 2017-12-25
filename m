From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: tz1090: Delete an error message for a failed memory
 allocation in two functions
Date: Mon, 25 Dec 2017 18:13:56 +0100
Message-ID: <91c76055-bba2-8a6e-4294-1dae0daf1363@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:60275 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751456AbdLYROD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Dec 2017 12:14:03 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 17:55:48 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-tz1090.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinctrl-tz1090.c
index 74d1ffcc2199..2379ce2be365 100644
--- a/drivers/pinctrl/pinctrl-tz1090.c
+++ b/drivers/pinctrl/pinctrl-tz1090.c
@@ -1082,10 +1082,8 @@ static int add_map_configs(struct device *dev,
 
 	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
 			      GFP_KERNEL);
-	if (!dup_configs) {
-		dev_err(dev, "kmemdup(configs) failed\n");
+	if (!dup_configs)
 		return -ENOMEM;
-	}
 
 	(*map)[*num_maps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
 	(*map)[*num_maps].data.configs.group_or_pin = group;
@@ -1946,10 +1944,9 @@ static int tz1090_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
-	if (!pmx) {
-		dev_err(&pdev->dev, "Can't alloc tz1090_pmx\n");
+	if (!pmx)
 		return -ENOMEM;
-	}
+
 	pmx->dev = &pdev->dev;
 	spin_lock_init(&pmx->lock);
 
-- 
2.15.1

