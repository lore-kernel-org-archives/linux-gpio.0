From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] gpio: ks8695: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Fri, 30 Nov 2018 11:22:46 -0500
Message-ID: <20181130162246.3555-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/gpio/gpio-ks8695.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index 55d562e1278e..d6d6140ffc40 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -282,22 +282,13 @@ static int ks8695_gpio_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int ks8695_gpio_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, ks8695_gpio_show, NULL);
-}
-
-static const struct file_operations ks8695_gpio_operations = {
-	.open		= ks8695_gpio_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(ks8695_gpio);
 
 static int __init ks8695_gpio_debugfs_init(void)
 {
 	/* /sys/kernel/debug/ks8695_gpio */
-	(void) debugfs_create_file("ks8695_gpio", S_IFREG | S_IRUGO, NULL, NULL, &ks8695_gpio_operations);
+	debugfs_create_file("ks8695_gpio", S_IFREG | S_IRUGO, NULL, NULL,
+				&ks8695_gpio_fops);
 	return 0;
 }
 postcore_initcall(ks8695_gpio_debugfs_init);
-- 
2.17.0
