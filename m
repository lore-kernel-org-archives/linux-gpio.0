From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: aspeed: fix regmap error handling
Date: Fri,  9 Sep 2016 11:26:50 +0200
Message-ID: <20160909092715.403663-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The newly added aspeed driver tries to check for a negative return
value from a pinctrl function, but stores the intermediate value in
a 'bool' variable, which cannot work:

drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'aspeed_sig_expr_set':
drivers/pinctrl/aspeed/pinctrl-aspeed.c:192:11: error: comparison of constant '0' with boolean expression is always false [-Werror=bool-compare]

This slightly reworks the logic to use an explicit comparison with zero
before assigning to the temporary variable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7d461fc30d3c..0391f9f13f3e 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -187,10 +187,10 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 			continue;
 
 		ret = regmap_update_bits(map, desc->reg, desc->mask,
-				pattern << __ffs(desc->mask));
+				pattern << __ffs(desc->mask)) == 0;
 
-		if (ret < 0)
-			return false;
+		if (!ret)
+			return ret;
 	}
 
 	return aspeed_sig_expr_eval(expr, enable, map);
-- 
2.9.0
