From: Yong Li <sdliyong@gmail.com>
Subject: [PATCH v4] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Fri, 18 Aug 2017 06:53:22 +0800
Message-ID: <1503010402-90405-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4048 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753271AbdHQWx2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Aug 2017 18:53:28 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, andrew@aj.id.au, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sdliyong@gmail.com

On AST2500, the hardware strap register(SCU70) only accepts write ‘1’,
to clear it to ‘0’, must set bits(write  ‘1’) to SCU7C

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 21 +++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a86a4d6..7f13ce8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -213,6 +213,27 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
+		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
+			unsigned int rev_id;
+
+			ret = regmap_read(maps[ASPEED_IP_SCU],
+				HW_REVISION_ID, &rev_id);
+			if (ret < 0)
+				return ret;
+
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
 		ret = regmap_update_bits(maps[desc->ip], desc->reg,
 					 desc->mask, val);
 
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

