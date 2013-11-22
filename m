From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] pinctrl-baytrail: show pin label with the reset of the gpio debug data
Date: Fri, 22 Nov 2013 14:01:23 +0200
Message-ID: <1385121683-29223-1-git-send-email-mathias.nyman@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:45166 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752750Ab3KVLzK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Nov 2013 06:55:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com, Mathias Nyman <mathias.nyman@linux.intel.com>

The default gpiolib debug output shows pin labels.
We want baytrail custom debug output to have the same functionality.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/pinctrl/pinctrl-baytrail.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-baytrail.c b/drivers/pinctrl/pinctrl-baytrail.c
index 2832576..1174ea8 100644
--- a/drivers/pinctrl/pinctrl-baytrail.c
+++ b/drivers/pinctrl/pinctrl-baytrail.c
@@ -286,13 +286,19 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	spin_lock_irqsave(&vg->lock, flags);
 
 	for (i = 0; i < vg->chip.ngpio; i++) {
+		const char *label;
 		offs = vg->range->pins[i] * 16;
 		conf0 = readl(vg->reg_base + offs + BYT_CONF0_REG);
 		val = readl(vg->reg_base + offs + BYT_VAL_REG);
 
+		label = gpiochip_is_requested(chip, i);
+		if (!label)
+			label = "Unrequested";
+
 		seq_printf(s,
-			   " gpio-%-3d %s %s %s pad-%-3d offset:0x%03x mux:%d %s%s%s\n",
+			   " gpio-%-3d (%-20.20s) %s %s %s pad-%-3d offset:0x%03x mux:%d %s%s%s\n",
 			   i,
+			   label,
 			   val & BYT_INPUT_EN ? "  " : "in",
 			   val & BYT_OUTPUT_EN ? "   " : "out",
 			   val & BYT_LEVEL ? "hi" : "lo",
-- 
1.8.1.2

