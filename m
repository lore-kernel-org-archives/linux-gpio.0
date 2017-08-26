From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: core: Delete an error message for a failed memory
 allocation in pinctrl_register_map()
Date: Sat, 26 Aug 2017 20:20:16 +0200
Message-ID: <31e88aa1-83b1-586b-447b-94ffc122567f@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 20:15:21 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c5e2c5705058..350f8962831e 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1380,7 +1380,6 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 		maps_node->maps = kmemdup(maps, sizeof(*maps) * num_maps,
 					  GFP_KERNEL);
 		if (!maps_node->maps) {
-			pr_err("failed to duplicate mapping table\n");
 			kfree(maps_node);
 			return -ENOMEM;
 		}
-- 
2.14.0
