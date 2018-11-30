From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] pinctrl: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Fri, 30 Nov 2018 11:36:17 -0500
Message-ID: <20181130163617.3778-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pinctrl/pinconf.c | 29 ++++-------------------------
 drivers/pinctrl/pinmux.c  | 29 ++++-------------------------
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index d3fe14394b73..2c7229380f08 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -366,29 +366,8 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
 	return 0;
 }
 
-static int pinconf_pins_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinconf_pins_show, inode->i_private);
-}
-
-static int pinconf_groups_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinconf_groups_show, inode->i_private);
-}
-
-static const struct file_operations pinconf_pins_ops = {
-	.open		= pinconf_pins_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinconf_groups_ops = {
-	.open		= pinconf_groups_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pinconf_pins);
+DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
 
 #define MAX_NAME_LEN 15
 
@@ -613,9 +592,9 @@ void pinconf_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
 	debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
-			    devroot, pctldev, &pinconf_pins_ops);
+			    devroot, pctldev, &pinconf_pins_fops);
 	debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
-			    devroot, pctldev, &pinconf_groups_ops);
+			    devroot, pctldev, &pinconf_groups_fops);
 	debugfs_create_file("pinconf-config",  (S_IRUGO | S_IWUSR | S_IWGRP),
 			    devroot, pctldev, &pinconf_dbg_pinconfig_fops);
 }
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 5780442c068b..4d0cc1889dd9 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -644,37 +644,16 @@ void pinmux_show_setting(struct seq_file *s,
 		   setting->data.mux.func);
 }
 
-static int pinmux_functions_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinmux_functions_show, inode->i_private);
-}
-
-static int pinmux_pins_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pinmux_pins_show, inode->i_private);
-}
-
-static const struct file_operations pinmux_functions_ops = {
-	.open		= pinmux_functions_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static const struct file_operations pinmux_pins_ops = {
-	.open		= pinmux_pins_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
+DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
 	debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
-			    devroot, pctldev, &pinmux_functions_ops);
+			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
-			    devroot, pctldev, &pinmux_pins_ops);
+			    devroot, pctldev, &pinmux_pins_fops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.17.0
