From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Fix unused-const-variable warnings
Date: Fri,  7 Apr 2017 22:28:17 +0930
Message-ID: <20170407125817.15834-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43952 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932534AbdDGM66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 08:58:58 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org

Three video input signals suffered from a search/replace failure in
some copied code.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 7de596e2b9d4..731dc2352c71 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -856,8 +856,8 @@ SIG_EXPR_DECL(VPIG3, VPI18, VPI18_DESC, AB1_DESC);
 SIG_EXPR_DECL(VPIG3, VPI24, VPI24_DESC, AB1_DESC);
 SIG_EXPR_DECL(VPIG3, VPI30, VPI30_DESC, AB1_DESC);
 SIG_EXPR_LIST_DECL(VPIG3, SIG_EXPR_PTR(VPIG3, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG3, VPI24),
+		SIG_EXPR_PTR(VPIG3, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM3, PWM3, AB1_DESC);
 MS_PIN_DECL(AB1, GPION3, VPIG3, PWM3);
 FUNC_GROUP_DECL(PWM3, AB1);
@@ -868,8 +868,8 @@ SIG_EXPR_DECL(VPIG4, VPI18, VPI18_DESC, W5_DESC);
 SIG_EXPR_DECL(VPIG4, VPI24, VPI24_DESC, W5_DESC);
 SIG_EXPR_DECL(VPIG4, VPI30, VPI30_DESC, W5_DESC);
 SIG_EXPR_LIST_DECL(VPIG4, SIG_EXPR_PTR(VPIG4, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG4, VPI24),
+		SIG_EXPR_PTR(VPIG4, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM4, PWM4, W5_DESC);
 MS_PIN_DECL(W5, GPION4, VPIG4, PWM4);
 FUNC_GROUP_DECL(PWM4, W5);
@@ -880,8 +880,8 @@ SIG_EXPR_DECL(VPIG5, VPI18, VPI18_DESC, Y4_DESC);
 SIG_EXPR_DECL(VPIG5, VPI24, VPI24_DESC, Y4_DESC);
 SIG_EXPR_DECL(VPIG5, VPI30, VPI30_DESC, Y4_DESC);
 SIG_EXPR_LIST_DECL(VPIG5, SIG_EXPR_PTR(VPIG5, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG5, VPI24),
+		SIG_EXPR_PTR(VPIG5, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM5, PWM5, Y4_DESC);
 MS_PIN_DECL(Y4, GPION5, VPIG5, PWM5);
 FUNC_GROUP_DECL(PWM5, Y4);
-- 
2.9.3

