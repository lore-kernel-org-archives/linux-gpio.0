From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 09/18] gpio: mockup: extend the debugfs layout
Date: Mon, 27 Nov 2017 11:48:45 +0100
Message-ID: <20171127104854.333-10-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Currently each chip has a dedicated directory in debugfs for event
triggers. We use the chip's label for the directory name, but the user
can't really associate these directories with chip names without
parsing the relevant sysfs entries.

Use chip names for directory names. For backward compatibility: create
links pointing to the actual directories named using the chip labels.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 9da90ad87030..9a880e15ea0b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -196,17 +196,23 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 				      struct gpio_mockup_chip *chip)
 {
 	struct gpio_mockup_dbgfs_private *priv;
-	struct dentry *evfile;
+	struct dentry *evfile, *link;
 	struct gpio_chip *gc;
+	const char *devname;
 	char *name;
 	int i;
 
 	gc = &chip->gc;
+	devname = dev_name(&gc->gpiodev->dev);
 
-	chip->dbg_dir = debugfs_create_dir(gc->label, gpio_mockup_dbg_dir);
+	chip->dbg_dir = debugfs_create_dir(devname, gpio_mockup_dbg_dir);
 	if (!chip->dbg_dir)
 		goto err;
 
+	link = debugfs_create_symlink(gc->label, gpio_mockup_dbg_dir, devname);
+	if (!link)
+		goto err;
+
 	for (i = 0; i < gc->ngpio; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
 		if (!name)
-- 
2.15.0
