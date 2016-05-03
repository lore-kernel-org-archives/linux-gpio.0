From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] pinctrl: ns2: rename pinctrl_utils_dt_free_map
Date: Tue,  3 May 2016 17:26:54 +0200
Message-ID: <1462289221-861102-2-git-send-email-arnd@arndb.de>
References: <1462289221-861102-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:53218 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933764AbcECP13 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2016 11:27:29 -0400
In-Reply-To: <1462289221-861102-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

A conflict of two patches caused a build error when a function got renamed
but a new user appeared in the other patch:

drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)
  .dt_free_map = pinctrl_utils_dt_free_map,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~

This renames the new user of pinctrl_utils_dt_free_map accordingly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: d32f7fd3bbc3 ("pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map")
Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 1fd57db52d7b..3fefd14acc3e 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -537,7 +537,7 @@ static struct pinctrl_ops ns2_pinctrl_ops = {
 	.get_group_pins = ns2_get_group_pins,
 	.pin_dbg_show = ns2_pin_dbg_show,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
-	.dt_free_map = pinctrl_utils_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int ns2_get_functions_count(struct pinctrl_dev *pctrl_dev)
-- 
2.7.0

