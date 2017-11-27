From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 01/18] gpio: mockup: add missing prefixes
Date: Mon, 27 Nov 2017 11:48:37 +0100
Message-ID: <20171127104854.333-2-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Add the gpio_mockup_ prefix to the remaining symbols that still don't
have it, so that the entire driver code is consistent.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 9532d86a82f7..d21c6d651287 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -327,8 +327,9 @@ static struct platform_driver gpio_mockup_driver = {
 	.probe = gpio_mockup_probe,
 };
 
-static struct platform_device *pdev;
-static int __init mock_device_init(void)
+static struct platform_device *gpio_mockup_pdev;
+
+static int __init gpio_mockup_init(void)
 {
 	int err;
 
@@ -337,34 +338,34 @@ static int __init mock_device_init(void)
 		pr_err("%s: error creating debugfs directory\n",
 		       GPIO_MOCKUP_NAME);
 
-	pdev = platform_device_alloc(GPIO_MOCKUP_NAME, -1);
-	if (!pdev)
+	gpio_mockup_pdev = platform_device_alloc(GPIO_MOCKUP_NAME, -1);
+	if (!gpio_mockup_pdev)
 		return -ENOMEM;
 
-	err = platform_device_add(pdev);
+	err = platform_device_add(gpio_mockup_pdev);
 	if (err) {
-		platform_device_put(pdev);
+		platform_device_put(gpio_mockup_pdev);
 		return err;
 	}
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		platform_device_unregister(pdev);
+		platform_device_unregister(gpio_mockup_pdev);
 		return err;
 	}
 
 	return 0;
 }
 
-static void __exit mock_device_exit(void)
+static void __exit gpio_mockup_exit(void)
 {
 	debugfs_remove_recursive(gpio_mockup_dbg_dir);
 	platform_driver_unregister(&gpio_mockup_driver);
-	platform_device_unregister(pdev);
+	platform_device_unregister(gpio_mockup_pdev);
 }
 
-module_init(mock_device_init);
-module_exit(mock_device_exit);
+module_init(gpio_mockup_init);
+module_exit(gpio_mockup_exit);
 
 MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@broadcom.com>");
 MODULE_AUTHOR("Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>");
-- 
2.15.0
