From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] pinctrl: fix confusing debug message in pinctrl_register_map()
Date: Fri, 29 May 2015 18:09:17 +0900
Message-ID: <1432890557-19523-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:30008 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754234AbbE2JJe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2015 05:09:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

There are two types for pinctrl maps: pinmux and pinconfig.
This debug message shows the number of maps with both types.

The string "pinmux map" is not precise.  Let's say "pinctrl map"
instead.

While we are here, fix the %d/%u mismatch too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Fix %d/%u mismatch

 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 18ee208..f3cf3a8 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1115,7 +1115,7 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 	int i, ret;
 	struct pinctrl_maps *maps_node;
 
-	pr_debug("add %d pinmux maps\n", num_maps);
+	pr_debug("add %u pinctrl maps\n", num_maps);
 
 	/* First sanity check the new mapping */
 	for (i = 0; i < num_maps; i++) {
-- 
1.9.1

