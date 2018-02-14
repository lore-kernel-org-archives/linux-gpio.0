From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Wed, 14 Feb 2018 17:44:12 +0200
Message-ID: <20180214154412.53016-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:43146 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031624AbeBNPoP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Feb 2018 10:44:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...instead of open coding file operations followed by custom ->open()
callbacks per each attribute.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 78 ++++----------------------------------------------
 1 file changed, 6 insertions(+), 72 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d2b0329bc98a..3ae7bbf36b53 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1586,6 +1586,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(pinctrl_pins);
 
 static int pinctrl_groups_show(struct seq_file *s, void *what)
 {
@@ -1631,6 +1632,7 @@ static int pinctrl_groups_show(struct seq_file *s, void *what)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(pinctrl_groups);
 
 static int pinctrl_gpioranges_show(struct seq_file *s, void *what)
 {
@@ -1664,6 +1666,7 @@ static int pinctrl_gpioranges_show(struct seq_file *s, void *what)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(pinctrl_gpioranges);
 
 static int pinctrl_devices_show(struct seq_file *s, void *what)
 {
@@ -1690,6 +1693,7 @@ static int pinctrl_devices_show(struct seq_file *s, void *what)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(pinctrl_devices);
 
 static inline const char *map_type(enum pinctrl_map_type type)
 {
@@ -1743,6 +1747,7 @@ static int pinctrl_maps_show(struct seq_file *s, void *what)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(pinctrl_maps);
 
 static int pinctrl_show(struct seq_file *s, void *what)
 {
@@ -1788,78 +1793,7 @@ static int pinctrl_show(struct seq_file *s, void *what)
 
 	return 0;
 }
-
-static int pinctrl_pins_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_pins_show, inode->i_private);
-}
-
-static int pinctrl_groups_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_groups_show, inode->i_private);
-}
-
-static int pinctrl_gpioranges_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_gpioranges_show, inode->i_private);
-}
-
-static int pinctrl_devices_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_devices_show, NULL);
-}
-
-static int pinctrl_maps_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_maps_show, NULL);
-}
-
-static int pinctrl_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinctrl_show, NULL);
-}
-
-static const struct file_operations pinctrl_pins_ops = {
-	.open		= pinctrl_pins_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinctrl_groups_ops = {
-	.open		= pinctrl_groups_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinctrl_gpioranges_ops = {
-	.open		= pinctrl_gpioranges_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinctrl_devices_ops = {
-	.open		= pinctrl_devices_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinctrl_maps_ops = {
-	.open		= pinctrl_maps_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinctrl_ops = {
-	.open		= pinctrl_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pinctrl);
 
 static struct dentry *debugfs_root;
 
-- 
2.15.1

