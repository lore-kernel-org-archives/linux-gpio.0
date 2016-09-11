From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: ret needs to be an int for -ve return value from regmap_update_bits
Date: Sun, 11 Sep 2016 09:36:25 +0100
Message-ID: <20160911083625.7451-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:47569 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbcIKIhz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2016 04:37:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Macro regmap_update_bits can return a -ve on an error value so ret
needs to be an integer rather than a bool type.

Fixes warning found by static analysis with cppcheck:
[drivers/pinctrl/aspeed/pinctrl-aspeed.c:192]: (warning) Comparison of
  a boolean expression with an integer other than 0 or 1.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7d461fc..75935ab 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -166,7 +166,7 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 				bool enable, struct regmap *map)
 {
 	int i;
-	bool ret;
+	int ret;
 
 	ret = aspeed_sig_expr_eval(expr, enable, map);
 	if (ret)
-- 
2.9.3

