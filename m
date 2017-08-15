From: Yong Li <sdliyong@gmail.com>
Subject: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Wed, 16 Aug 2017 00:21:50 +0800
Message-ID: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:62265 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751573AbdHOQV4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Aug 2017 12:21:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, andrew@aj.id.au, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sdliyong@gmail.com

On AST2500, the hardware strap register(SCU70) only accepts write ‘1’,
to clear it to ‘0’, must set bits(write  ‘1’) to SCU7C

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 19 +++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  1 +
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a86a4d6..f2d5133 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -183,6 +183,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 {
 	int ret;
 	int i;
+	unsigned int rev_id;
 
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
@@ -213,8 +214,22 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
-		ret = regmap_update_bits(maps[desc->ip], desc->reg,
-					 desc->mask, val);
+		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
+			ret = regmap_read(maps[ASPEED_IP_SCU],
+				HW_REVISION_ID, &rev_id);
+			if (ret < 0)
+				return ret;
+
+			if (0x04 == ((rev_id >> 24) & 0xff))
+				ret = regmap_write(maps[desc->ip],
+					HW_REVISION_ID, (~val & desc->mask));
+			else
+				ret = regmap_update_bits(maps[desc->ip],
+					desc->reg, desc->mask, val);
+		} else
+			ret = regmap_update_bits(maps[desc->ip], desc->reg,
+				desc->mask, val);
 
 		if (ret)
 			return ret;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index fa125db..d4d7f03 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -251,6 +251,7 @@
 #define SCU3C           0x3C /* System Reset Control/Status Register */
 #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
 #define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split */
+#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
 #define SCU80           0x80 /* Multi-function Pin Control #1 */
 #define SCU84           0x84 /* Multi-function Pin Control #2 */
 #define SCU88           0x88 /* Multi-function Pin Control #3 */
-- 
2.7.4

