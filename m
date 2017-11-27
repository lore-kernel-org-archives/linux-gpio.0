From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 12/18] gpio: mockup: fix debugfs handling
Date: Mon, 27 Nov 2017 11:48:48 +0100
Message-ID: <20171127104854.333-13-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

The debugfs routines returning pointers can return NULL or error codes
embedded with ERR_PTR(). Check the return values with IS_ERR_OR_NULL().

While we're at it: make the error message more specific so it's not
confused with the one emitted when the top-level gpio-mockup debugfs
directory creation fails.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index dba5e79e3278..68a0c1e06a16 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -183,11 +183,11 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	devname = dev_name(&gc->gpiodev->dev);
 
 	chip->dbg_dir = debugfs_create_dir(devname, gpio_mockup_dbg_dir);
-	if (!chip->dbg_dir)
+	if (IS_ERR_OR_NULL(chip->dbg_dir))
 		goto err;
 
 	link = debugfs_create_symlink(gc->label, gpio_mockup_dbg_dir, devname);
-	if (!link)
+	if (IS_ERR_OR_NULL(link))
 		goto err;
 
 	for (i = 0; i < gc->ngpio; i++) {
@@ -205,14 +205,14 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 
 		evfile = debugfs_create_file(name, 0200, chip->dbg_dir, priv,
 					     &gpio_mockup_event_ops);
-		if (!evfile)
+		if (IS_ERR_OR_NULL(evfile))
 			goto err;
 	}
 
 	return;
 
 err:
-	dev_err(dev, "error creating debugfs directory\n");
+	dev_err(dev, "error creating debugfs event files\n");
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
@@ -336,7 +336,7 @@ static int __init gpio_mockup_init(void)
 	num_chips = gpio_mockup_params_nr / 2;
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
-	if (!gpio_mockup_dbg_dir)
+	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
 		gpio_mockup_err("error creating debugfs directory\n");
 
 	err = platform_driver_register(&gpio_mockup_driver);
-- 
2.15.0
