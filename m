From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: pinmux: Fix kerneldoc for pinmux_generic_add_function()
Date: Mon,  3 Apr 2017 10:32:42 +0200
Message-ID: <1491208362-17443-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:43130 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbdDCIcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2017 04:32:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Correct the incorrect function name and description.

Fixes: a76edc89b100e4fe ("pinctrl: core: Add generic pinctrl functions for managing groups")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 29ad3151abecc42e..9fd6d9087dc508ca 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -763,7 +763,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
 /**
- * pinmux_generic_get_function_groups() - gets the function groups
+ * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
  * @name: name of the function
  * @groups: array of pin groups
-- 
2.7.4

