From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 05/18] gpio: mockup: implement gpio_mockup_err()
Date: Mon, 27 Nov 2017 11:48:41 +0100
Message-ID: <20171127104854.333-6-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:41107 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdK0KtP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 05:49:15 -0500
Received: by mail-wm0-f65.google.com with SMTP id b189so33107890wmd.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 02:49:14 -0800 (PST)
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Visually shrink the pr_err() calls by encapsulating adding the module
name prefix to the message in a macro.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 5ba8f2089de8..0aa68242f33b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -34,6 +34,8 @@
  */
 #define GPIO_MOCKUP_MAX_RANGES	(GPIO_MOCKUP_MAX_GC * 2)
 
+#define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
+
 enum {
 	GPIO_MOCKUP_DIR_OUT = 0,
 	GPIO_MOCKUP_DIR_IN = 1,
@@ -344,13 +346,11 @@ static int __init gpio_mockup_init(void)
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
 	if (!gpio_mockup_dbg_dir)
-		pr_err("%s: error creating debugfs directory\n",
-		       GPIO_MOCKUP_NAME);
+		gpio_mockup_err("error creating debugfs directory\n");
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		pr_err("%s: error registering platform driver\n",
-		       GPIO_MOCKUP_NAME);
+		gpio_mockup_err("error registering platform driver\n");
 		return err;
 	}
 
@@ -366,8 +366,7 @@ static int __init gpio_mockup_init(void)
 							 i, NULL, 0, &pdata,
 							 sizeof(pdata));
 		if (!pdev) {
-			pr_err("%s: error registering device",
-			       GPIO_MOCKUP_NAME);
+			gpio_mockup_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			return -ENOMEM;
-- 
2.15.0

