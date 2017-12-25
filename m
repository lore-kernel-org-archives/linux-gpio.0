From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: utils: Delete an error message for a failed memory
 allocation in pinctrl_utils_add_map_configs()
Date: Mon, 25 Dec 2017 20:15:41 +0100
Message-ID: <4a1181a6-e37c-3f2b-782c-6dd4279ce39f@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 20:04:05 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-utils.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index 9189fbafb102..f2bcbf62c03d 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -83,10 +83,8 @@ int pinctrl_utils_add_map_configs(struct pinctrl_dev *pctldev,
 
 	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
 			      GFP_KERNEL);
-	if (!dup_configs) {
-		dev_err(pctldev->dev, "kmemdup(configs) failed\n");
+	if (!dup_configs)
 		return -ENOMEM;
-	}
 
 	(*map)[*num_maps].type = type;
 	(*map)[*num_maps].data.configs.group_or_pin = group;
-- 
2.15.1

