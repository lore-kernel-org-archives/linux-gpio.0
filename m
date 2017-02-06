From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 7/7] gpio: mockup: implement event injecting over debugfs
Date: Mon,  6 Feb 2017 13:10:41 +0100
Message-ID: <1486383041-16758-8-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Create a debugfs directory for every mockup chip and a single file
for every line. Writing (0 or 1) to these files allows the user to
inject line events (falling or rising edge respectively).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 115 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 7d82d35..449918b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -19,6 +19,10 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_work.h>
+#include <linux/debugfs.h>
+#include <linux/uaccess.h>
+
+#include "gpiolib.h"
 
 #define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define	GPIO_MOCKUP_MAX_GC	10
@@ -47,6 +51,13 @@ struct gpio_mockup_chip {
 	struct gpio_chip gc;
 	struct gpio_mockup_line_status *lines;
 	struct gpio_mockup_irq_context irq_ctx;
+	struct dentry *dbg_dir;
+};
+
+struct gpio_mockup_dbgfs_private {
+	struct gpio_mockup_chip *chip;
+	struct gpio_desc *desc;
+	int offset;
 };
 
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_GC << 1];
@@ -58,6 +69,7 @@ module_param_named(gpio_mockup_named_lines,
 		   gpio_mockup_named_lines, bool, 0400);
 
 static const char gpio_mockup_name_start = 'A';
+static struct dentry *gpio_mockup_dbg_dir;
 
 static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 {
@@ -175,6 +187,94 @@ static int gpio_mockup_irqchip_setup(struct device *dev,
 	return 0;
 }
 
+static ssize_t gpio_mockup_event_write(struct file *file,
+				       const char __user *usr_buf,
+				       size_t size, loff_t *ppos)
+{
+	struct gpio_mockup_dbgfs_private *priv;
+	struct gpio_mockup_chip *chip;
+	struct seq_file *sfile;
+	struct gpio_desc *desc;
+	struct gpio_chip *gc;
+	int status, val;
+	char buf;
+
+	sfile = file->private_data;
+	priv = sfile->private;
+	desc = priv->desc;
+	chip = priv->chip;
+	gc = &chip->gc;
+
+	status = copy_from_user(&buf, usr_buf, 1);
+	if (status)
+		return status;
+
+	if (buf == '0')
+		val = 0;
+	else if (buf == '1')
+		val = 1;
+	else
+		return -EINVAL;
+
+	gpiod_set_value_cansleep(desc, val);
+	priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
+	irq_work_queue(&priv->chip->irq_ctx.work);
+
+	return size;
+}
+
+static int gpio_mockup_event_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations gpio_mockup_event_ops = {
+	.owner = THIS_MODULE,
+	.open = gpio_mockup_event_open,
+	.write = gpio_mockup_event_write,
+	.llseek = no_llseek,
+};
+
+static void gpio_mockup_debugfs_setup(struct device *dev,
+				      struct gpio_mockup_chip *chip)
+{
+	struct gpio_mockup_dbgfs_private *priv;
+	struct dentry *evfile;
+	struct gpio_chip *gc;
+	char *name;
+	int i;
+
+	gc = &chip->gc;
+
+	chip->dbg_dir = debugfs_create_dir(gc->label, gpio_mockup_dbg_dir);
+	if (!chip->dbg_dir)
+		goto err;
+
+	for (i = 0; i < gc->ngpio; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
+		if (!name)
+			goto err;
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			goto err;
+
+		priv->chip = chip;
+		priv->offset = i;
+		priv->desc = &gc->gpiodev->descs[i];
+
+		evfile = debugfs_create_file(name, 0200, chip->dbg_dir, priv,
+					     &gpio_mockup_event_ops);
+		if (!evfile)
+			goto err;
+	}
+
+	return;
+
+err:
+	dev_err(dev, "error creating debugfs directory\n");
+}
+
 static int gpio_mockup_add(struct device *dev,
 			   struct gpio_mockup_chip *chip,
 			   const char *name, int base, int ngpio)
@@ -209,7 +309,14 @@ static int gpio_mockup_add(struct device *dev,
 	if (ret)
 		return ret;
 
-	return devm_gpiochip_add_data(dev, &chip->gc, chip);
+	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
+	if (ret)
+		return ret;
+
+	if (gpio_mockup_dbg_dir)
+		gpio_mockup_debugfs_setup(dev, chip);
+
+	return 0;
 }
 
 static int gpio_mockup_probe(struct platform_device *pdev)
@@ -277,6 +384,11 @@ static int __init mock_device_init(void)
 {
 	int err;
 
+	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
+	if (!gpio_mockup_dbg_dir)
+		pr_err("%s: error creating debugfs directory\n",
+		       GPIO_MOCKUP_NAME);
+
 	pdev = platform_device_alloc(GPIO_MOCKUP_NAME, -1);
 	if (!pdev)
 		return -ENOMEM;
@@ -298,6 +410,7 @@ static int __init mock_device_init(void)
 
 static void __exit mock_device_exit(void)
 {
+	debugfs_remove_recursive(gpio_mockup_dbg_dir);
 	platform_driver_unregister(&gpio_mockup_driver);
 	platform_device_unregister(pdev);
 }
-- 
2.9.3
