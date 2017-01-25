From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/7] gpio: mockup: implement naming the GPIO lines
Date: Wed, 25 Jan 2017 16:34:20 +0100
Message-ID: <1485358461-24070-7-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:34192 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdAYPeq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 10:34:46 -0500
Received: by mail-wm0-f54.google.com with SMTP id f73so52862232wmf.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2017 07:34:40 -0800 (PST)
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Implement a new boolean module argument that indicates that the mockup
lines should be named. The names are created by appending the line
offset to the chip label.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c5eb530..dabf3ec 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
+#include <linux/slab.h>
 
 #include "gpiolib.h"
 
@@ -48,6 +49,10 @@ static int gpio_mockup_ranges[MAX_GC << 1];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
+static bool gpio_mockup_named_lines;
+module_param_named(gpio_mockup_named_lines,
+		   gpio_mockup_named_lines, bool, 0400);
+
 static const char pins_name_start = 'A';
 static struct dentry *dbg_dir;
 
@@ -169,7 +174,8 @@ static int mockup_gpio_add(struct device *dev,
 			   struct mockup_gpio_controller *cntr,
 			   const char *name, int base, int ngpio)
 {
-	int ret;
+	char **names;
+	int ret, i;
 
 	cntr->gc.base = base;
 	cntr->gc.ngpio = ngpio;
@@ -188,6 +194,28 @@ static int mockup_gpio_add(struct device *dev,
 		ret = -ENOMEM;
 		goto err;
 	}
+
+	if (gpio_mockup_named_lines) {
+		names = devm_kzalloc(dev,
+				     sizeof(char *) * cntr->gc.ngpio,
+				     GFP_KERNEL);
+		if (!names) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		for (i = 0; i < cntr->gc.ngpio; i++) {
+			names[i] = devm_kasprintf(dev, GFP_KERNEL,
+						  "%s-%d", cntr->gc.label, i);
+			if (!names[i]) {
+				ret = -ENOMEM;
+				goto err;
+			}
+		}
+
+		cntr->gc.names = (const char *const*)names;
+	}
+
 	ret = devm_gpiochip_add_data(dev, &cntr->gc, cntr);
 	if (ret)
 		goto err;
-- 
2.9.3

