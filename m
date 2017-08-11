From: Yong Li <sdliyong@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Fix hardware strap register write logic
Date: Fri, 11 Aug 2017 15:27:52 +0800
Message-ID: <1502436472-136063-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:60764 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751370AbdHKH16 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Aug 2017 03:27:58 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, andrew@aj.id.au, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sdliyong@gmail.com

The hardware strap register(SCU70) only accepts write ‘1’,
to clear it to ‘0’, must set bits(write  ‘1’) to SCU7C

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 9 +++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a86a4d6..4305052 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -213,8 +213,13 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
-		ret = regmap_update_bits(maps[desc->ip], desc->reg,
-					 desc->mask, val);
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
+			val == 0)
+			ret = regmap_update_bits(maps[desc->ip], HW_REVISION_ID,
+				desc->mask, desc->mask);
+		else
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

