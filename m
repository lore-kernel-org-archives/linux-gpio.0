From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] pinctrl: st: st_pinconf_dbg_show wrong format string
Date: Sat,  5 Nov 2016 15:25:15 +0100
Message-ID: <20161105142515.4377-1-xypron.glpk@gmx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:53186 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754306AbcKEO0T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Nov 2016 10:26:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>

function is defined as unsigned int.
So we need %u to print it.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 drivers/pinctrl/pinctrl-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index b7bb371..8308f15 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1006,7 +1006,7 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 
 	function = st_pctl_get_pin_function(pc, offset);
 	if (function)
-		snprintf(f, 10, "Alt Fn %d", function);
+		snprintf(f, 10, "Alt Fn %u", function);
 	else
 		snprintf(f, 5, "GPIO");
 
-- 
2.10.1

