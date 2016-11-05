From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] pinctrl: st: st_pctl_dt_parse_groups simplify expression
Date: Sat,  5 Nov 2016 15:35:15 +0100
Message-ID: <20161105143515.4668-1-xypron.glpk@gmx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:51491 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754373AbcKEOf7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Nov 2016 10:35:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>

for_each_property_of_node(pins, pp) checks that pp is not NULL.
So there is no need to check it inside the loop.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 drivers/pinctrl/pinctrl-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 8308f15..676efcc 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1181,7 +1181,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 		if (!strcmp(pp->name, "name"))
 			continue;
 
-		if (pp  && (pp->length/sizeof(__be32)) >= OF_GPIO_ARGS_MIN) {
+		if (pp->length / sizeof(__be32) >= OF_GPIO_ARGS_MIN) {
 			npins++;
 		} else {
 			pr_warn("Invalid st,pins in %s node\n", np->name);
-- 
2.10.1

