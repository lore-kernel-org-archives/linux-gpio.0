From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: improve debugfs for strict controllers
Date: Thu, 28 May 2015 10:14:02 +0200
Message-ID: <1432800842-19318-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:33438 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbbE1IOK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2015 04:14:10 -0400
Received: by lbcue7 with SMTP id ue7so23088678lbc.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2015 01:14:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sonic Zhang <sonic.zhang@analog.com>

If we know we are using a strict pin controller (one that cannot
mix device functions+group use and GPIO) we can be a bit more
specific in debugfs, just print either device-function-group
or GPIO consumer for the pin. Let's do that to be helpful.

Cc: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinmux.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c58c168b06c2..77f82b23f7be 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -585,7 +585,12 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		return 0;
 
 	seq_puts(s, "Pinmux settings per pin\n");
-	seq_puts(s, "Format: pin (name): mux_owner gpio_owner hog?\n");
+	if (pmxops->strict)
+		seq_puts(s,
+		 "Format: pin (name): mux_owner|gpio_owner (strict) hog?\n");
+	else
+		seq_puts(s,
+		"Format: pin (name): mux_owner gpio_owner hog?\n");
 
 	mutex_lock(&pctldev->mutex);
 
@@ -604,14 +609,34 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
 			is_hog = true;
 
-		seq_printf(s, "pin %d (%s): %s %s%s", pin,
-			   desc->name ? desc->name : "unnamed",
-			   desc->mux_owner ? desc->mux_owner
-				: "(MUX UNCLAIMED)",
-			   desc->gpio_owner ? desc->gpio_owner
-				: "(GPIO UNCLAIMED)",
-			   is_hog ? " (HOG)" : "");
+		if (pmxops->strict) {
+			if (desc->mux_owner)
+				seq_printf(s, "pin %d (%s): device %s%s",
+					   pin,
+					   desc->name ? desc->name : "unnamed",
+					   desc->mux_owner,
+					   is_hog ? " (HOG)" : "");
+			else if (desc->gpio_owner)
+				seq_printf(s, "pin %d (%s): GPIO %s",
+					   pin,
+					   desc->name ? desc->name : "unnamed",
+					   desc->gpio_owner);
+			else
+				seq_printf(s, "pin %d (%s): UNCLAIMED",
+					   pin,
+					   desc->name ? desc->name : "unnamed");
+		} else {
+			/* For non-strict controllers */
+			seq_printf(s, "pin %d (%s): %s %s%s", pin,
+				   desc->name ? desc->name : "unnamed",
+				   desc->mux_owner ? desc->mux_owner
+				   : "(MUX UNCLAIMED)",
+				   desc->gpio_owner ? desc->gpio_owner
+				   : "(GPIO UNCLAIMED)",
+				   is_hog ? " (HOG)" : "");
+		}
 
+		/* If mux: print function+group claiming the pin */
 		if (desc->mux_setting)
 			seq_printf(s, " function %s group %s\n",
 				   pmxops->get_function_name(pctldev,
-- 
1.9.3

