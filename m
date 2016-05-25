From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: pinconf: separate config parameters with commas for debugfs
Date: Wed, 25 May 2016 15:37:27 +0900
Message-ID: <1464158248-19048-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36315 "EHLO
	conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786AbcEYGgw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2016 02:36:52 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

To improve debugfs readability, use commas instead of whitespaces
for separating configuration parameters.

For example, the "pinconf-pins" dump on my board will change as follows:

Without this commit:

 # head -5 pinconf-pins
 Pin config settings per pin
 Format: pin (name): configs
 pin 0 (ED0): input bias pull down output drive strength (8 mA) input enabled
 pin 1 (ED1): input bias pull down output drive strength (8 mA) input enabled
 pin 2 (ED2): input bias pull down output drive strength (8 mA) input enabled

With this commit:

 # head -5 pinconf-pins
 Pin config settings per pin
 Format: pin (name): configs
 pin 0 (ED0): input bias pull down, output drive strength (8 mA), input enabled
 pin 1 (ED1): input bias pull down, output drive strength (8 mA), input enabled
 pin 2 (ED2): input bias pull down, output drive strength (8 mA), input enabled

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf-generic.c | 14 +++++++++-----
 drivers/pinctrl/pinconf.c         |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d5bf9fa..34b601b 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -53,7 +53,7 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 				     struct seq_file *s, const char *gname,
 				     unsigned pin,
 				     const struct pin_config_item *items,
-				     int nitems)
+				     int nitems, int *print_sep)
 {
 	int i;
 
@@ -75,8 +75,10 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 			seq_printf(s, "ERROR READING CONFIG SETTING %d ", i);
 			continue;
 		}
-		/* Space between multiple configs */
-		seq_puts(s, " ");
+		/* comma between multiple configs */
+		if (*print_sep)
+			seq_puts(s, ", ");
+		*print_sep = 1;
 		seq_puts(s, items[i].display);
 		/* Print unit if available */
 		if (items[i].has_arg) {
@@ -105,19 +107,21 @@ void pinconf_generic_dump_pins(struct pinctrl_dev *pctldev, struct seq_file *s,
 			       const char *gname, unsigned pin)
 {
 	const struct pinconf_ops *ops = pctldev->desc->confops;
+	int print_sep = 0;
 
 	if (!ops->is_generic)
 		return;
 
 	/* generic parameters */
 	pinconf_generic_dump_one(pctldev, s, gname, pin, conf_items,
-				 ARRAY_SIZE(conf_items));
+				 ARRAY_SIZE(conf_items), &print_sep);
 	/* driver-specific parameters */
 	if (pctldev->desc->num_custom_params &&
 	    pctldev->desc->custom_conf_items)
 		pinconf_generic_dump_one(pctldev, s, gname, pin,
 					 pctldev->desc->custom_conf_items,
-					 pctldev->desc->num_custom_params);
+					 pctldev->desc->num_custom_params,
+					 &print_sep);
 }
 
 void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 3f1b6f0..799048f 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -310,7 +310,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
-		seq_printf(s, "pin %d (%s):", pin, desc->name);
+		seq_printf(s, "pin %d (%s): ", pin, desc->name);
 
 		pinconf_dump_pin(pctldev, s, pin);
 
@@ -347,7 +347,7 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
 	while (selector < ngroups) {
 		const char *gname = pctlops->get_group_name(pctldev, selector);
 
-		seq_printf(s, "%u (%s):", selector, gname);
+		seq_printf(s, "%u (%s): ", selector, gname);
 		pinconf_dump_group(pctldev, s, selector, gname);
 		seq_printf(s, "\n");
 
-- 
1.9.1

