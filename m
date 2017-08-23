From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Rework strap register write logic for the AST2500
Date: Wed, 23 Aug 2017 23:11:25 +0930
Message-ID: <20170823134125.2339-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, joel@jms.id.au, linux-kernel@vger.kernel.org, Yong Li <sdliyong@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Yong Li found that writes to the AST2500 strapping register were not
properly supported by the Aspeed pinctrl core and provided a patch to
rectify the problem. Several revisions of the patch were posted and
ultimately v4 should have been applied, however some unfortunate
liberal application of tags on my part lead to confusion between v3[1]
and v4[2].

Generate the diff between v3 and v4 to apply as a fixup patch.

[1] http://patchwork.ozlabs.org/patch/801662/
[2] http://patchwork.ozlabs.org/patch/802946/

Cc: Yong Li <sdliyong@gmail.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index f2d5133f6993..7f13ce8450a3 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -183,7 +183,6 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 {
 	int ret;
 	int i;
-	unsigned int rev_id;
 
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
@@ -216,20 +215,27 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 
 		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
+			unsigned int rev_id;
+
 			ret = regmap_read(maps[ASPEED_IP_SCU],
 				HW_REVISION_ID, &rev_id);
 			if (ret < 0)
 				return ret;
 
-			if (0x04 == ((rev_id >> 24) & 0xff))
-				ret = regmap_write(maps[desc->ip],
-					HW_REVISION_ID, (~val & desc->mask));
-			else
-				ret = regmap_update_bits(maps[desc->ip],
-					desc->reg, desc->mask, val);
-		} else
-			ret = regmap_update_bits(maps[desc->ip], desc->reg,
-				desc->mask, val);
+			if (0x04 == (rev_id >> 24)) {
+				u32 value = ~val & desc->mask;
+
+				if (value) {
+					ret = regmap_write(maps[desc->ip],
+						HW_REVISION_ID, value);
+					if (ret < 0)
+						return ret;
+				}
+			}
+		}
+
+		ret = regmap_update_bits(maps[desc->ip], desc->reg,
+					 desc->mask, val);
 
 		if (ret)
 			return ret;
-- 
2.11.0
