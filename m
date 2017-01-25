From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/7] gpio: mockup: implement injecting events over debugfs
Date: Wed, 25 Jan 2017 16:34:19 +0100
Message-ID: <1485358461-24070-6-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

When probing gpio-mockup, create a debugfs directory structure that
allows the user to inject line events by writing either 0
(falling-edge) or 1 (rising-edge) to debugfs files.

The gpio-mockup-event directory has one sub-directory per chip and
a single event file per line.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index cf8b1b2..c5eb530 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -15,6 +15,10 @@
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
+#include <linux/debugfs.h>
+#include <linux/uaccess.h>
+
+#include "gpiolib.h"
 
 #define GPIO_NAME	"gpio-mockup"
 #define	MAX_GC		10
@@ -37,6 +41,7 @@ struct gpio_pin_status {
 struct mockup_gpio_controller {
 	struct gpio_chip gc;
 	struct gpio_pin_status *stats;
+	struct dentry *dbg_dir;
 };
 
 static int gpio_mockup_ranges[MAX_GC << 1];
@@ -44,6 +49,7 @@ static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
 static const char pins_name_start = 'A';
+static struct dentry *dbg_dir;
 
 static int mockup_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
@@ -85,6 +91,80 @@ static int mockup_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return cntr->stats[offset].dir;
 }
 
+static ssize_t mockup_gpio_event_write(struct file *file,
+				       const char __user *usr_buf,
+				       size_t size, loff_t *ppos)
+{
+	struct gpio_desc *desc;
+	struct seq_file *sfile;
+	int status, val;
+	char buf;
+
+	sfile = file->private_data;
+	desc = sfile->private;
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
+	gpiod_inject_event(desc);
+
+	return size;
+}
+
+static int mockup_gpio_event_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations mockup_gpio_event_ops = {
+	.owner = THIS_MODULE,
+	.open = mockup_gpio_event_open,
+	.write = mockup_gpio_event_write,
+	.llseek = no_llseek,
+};
+
+static void mockup_gpio_debugfs_setup(struct mockup_gpio_controller *cntr)
+{
+	struct dentry *evfile;
+	struct gpio_chip *gc;
+	struct device *dev;
+	char *name;
+	int i;
+
+	gc = &cntr->gc;
+	dev = &gc->gpiodev->dev;
+
+	cntr->dbg_dir = debugfs_create_dir(gc->label, dbg_dir);
+	if (!cntr->dbg_dir)
+		goto err;
+
+	for (i = 0; i < gc->ngpio; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
+		if (!name)
+			goto err;
+
+		evfile = debugfs_create_file(name, 0200, cntr->dbg_dir,
+					     &gc->gpiodev->descs[i],
+					     &mockup_gpio_event_ops);
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
 static int mockup_gpio_add(struct device *dev,
 			   struct mockup_gpio_controller *cntr,
 			   const char *name, int base, int ngpio)
@@ -112,6 +192,9 @@ static int mockup_gpio_add(struct device *dev,
 	if (ret)
 		goto err;
 
+	if (dbg_dir)
+		mockup_gpio_debugfs_setup(cntr);
+
 	dev_info(dev, "gpio<%d..%d> add successful!", base, base + ngpio);
 	return 0;
 err:
@@ -182,6 +265,10 @@ static int __init mock_device_init(void)
 {
 	int err;
 
+	dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
+	if (!dbg_dir)
+		pr_err("%s: error creating debugfs directory\n", GPIO_NAME);
+
 	pdev = platform_device_alloc(GPIO_NAME, -1);
 	if (!pdev)
 		return -ENOMEM;
@@ -203,6 +290,7 @@ static int __init mock_device_init(void)
 
 static void __exit mock_device_exit(void)
 {
+	debugfs_remove_recursive(dbg_dir);
 	platform_driver_unregister(&mockup_gpio_driver);
 	platform_device_unregister(pdev);
 }
-- 
2.9.3
