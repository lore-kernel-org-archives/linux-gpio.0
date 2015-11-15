From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: [PATCH] pinctrl: imx1-core: add missing of_node_put
Date: Sun, 15 Nov 2015 09:34:23 +0530
Message-ID: <20151115040422.GA15180@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35474 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934AbbKOEEa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 23:04:30 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration,
so of_node_put is required on break out of the loop.

This is done using Coccinelle. And semantic patch used for this is
as follows:

@@
expression root,e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 88a7fac..acaf84c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -538,8 +538,10 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
 		ret = imx1_pinctrl_parse_groups(child, grp, info, i++);
-		if (ret == -ENOMEM)
+		if (ret == -ENOMEM) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -582,8 +584,10 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 
 	for_each_child_of_node(np, child) {
 		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
-		if (ret == -ENOMEM)
+		if (ret == -ENOMEM) {
+			of_node_put(child);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
-- 
1.9.1

