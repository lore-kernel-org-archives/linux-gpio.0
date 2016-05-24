From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: do not care about blank pin name
Date: Tue, 24 May 2016 14:26:26 +0900
Message-ID: <1464067586-20331-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:45368 "EHLO
	conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615AbcEXFZb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 01:25:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

If a pin name is not specified in struct pinctrl_pin_desc,
pinctrl_register_one_pin() dynamically assigns its name.
So, desc->name is always a valid pointer here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c    |  3 +--
 drivers/pinctrl/pinconf.c |  6 ++----
 drivers/pinctrl/pinmux.c  | 14 ++++----------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 98d2a1b..03c08c1 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1367,8 +1367,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
-		seq_printf(s, "pin %d (%s) ", pin,
-			   desc->name ? desc->name : "unnamed");
+		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 4dd7722..3f1b6f0 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -258,8 +258,7 @@ void pinconf_show_setting(struct seq_file *s,
 	case PIN_MAP_TYPE_CONFIGS_PIN:
 		desc = pin_desc_get(setting->pctldev,
 				    setting->data.configs.group_or_pin);
-		seq_printf(s, "pin %s (%d)",
-			   desc->name ? desc->name : "unnamed",
+		seq_printf(s, "pin %s (%d)", desc->name,
 			   setting->data.configs.group_or_pin);
 		break;
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
@@ -311,8 +310,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
-		seq_printf(s, "pin %d (%s):", pin,
-			   desc->name ? desc->name : "unnamed");
+		seq_printf(s, "pin %d (%s):", pin, desc->name);
 
 		pinconf_dump_pin(pctldev, s, pin);
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c223a9e..d94d76c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -606,23 +606,17 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		if (pmxops->strict) {
 			if (desc->mux_owner)
 				seq_printf(s, "pin %d (%s): device %s%s",
-					   pin,
-					   desc->name ? desc->name : "unnamed",
-					   desc->mux_owner,
+					   pin, desc->name, desc->mux_owner,
 					   is_hog ? " (HOG)" : "");
 			else if (desc->gpio_owner)
 				seq_printf(s, "pin %d (%s): GPIO %s",
-					   pin,
-					   desc->name ? desc->name : "unnamed",
-					   desc->gpio_owner);
+					   pin, desc->name, desc->gpio_owner);
 			else
 				seq_printf(s, "pin %d (%s): UNCLAIMED",
-					   pin,
-					   desc->name ? desc->name : "unnamed");
+					   pin, desc->name);
 		} else {
 			/* For non-strict controllers */
-			seq_printf(s, "pin %d (%s): %s %s%s", pin,
-				   desc->name ? desc->name : "unnamed",
+			seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
 				   desc->mux_owner ? desc->mux_owner
 				   : "(MUX UNCLAIMED)",
 				   desc->gpio_owner ? desc->gpio_owner
-- 
1.9.1

