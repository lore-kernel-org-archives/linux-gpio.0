From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] pinctrl: baytrail: Fix debugfs offset output
Date: Thu, 26 Jan 2017 14:17:54 +0100
Message-ID: <20170126131754.29630-1-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:54495 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750877AbdAZNST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 08:18:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

Apparently each GPIO pad's register are 16 bytes, so multiply the pad_map
by that. The same is done in byt_gpio_reg the only other place where
pad_map is used.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 3730063..6cce314 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1449,7 +1449,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			   val & BYT_INPUT_EN ? "  " : "in",
 			   val & BYT_OUTPUT_EN ? "   " : "out",
 			   val & BYT_LEVEL ? "hi" : "lo",
-			   comm->pad_map[i], comm->pad_map[i] * 32,
+			   comm->pad_map[i], comm->pad_map[i] * 16,
 			   conf0 & 0x7,
 			   conf0 & BYT_TRIG_NEG ? " fall" : "     ",
 			   conf0 & BYT_TRIG_POS ? " rise" : "     ",
-- 
2.10.2

