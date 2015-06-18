From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: simplify of_pinctrl_get()
Date: Thu, 18 Jun 2015 14:42:45 +0900
Message-ID: <1434606165-2629-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:17388 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751763AbbFRFm5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2015 01:42:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

This commit does not change the logic at all.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/devicetree.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 0bbf7d7..fe04e74 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -97,13 +97,7 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 
 struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 {
-	struct pinctrl_dev *pctldev;
-
-	pctldev = get_pinctrl_dev_from_of_node(np);
-	if (!pctldev)
-		return NULL;
-
-	return pctldev;
+	return get_pinctrl_dev_from_of_node(np);
 }
 
 static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
-- 
1.9.1

