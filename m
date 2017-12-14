From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpiolib: use kstrdup_const() for gpio_device label
Date: Thu, 14 Dec 2017 15:29:20 +0100
Message-ID: <20171214142920.32683-3-brgl@bgdev.pl>
References: <20171214142920.32683-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214142920.32683-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joe Perches <joe@perches.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Users often pass a pointer to a static string to gpiochip_add_data()
family of functions. Avoid unnecessary memory allocations with the
provided helper routine.

While at it: use a ternary operator instead of an if else for brevity.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 56eec094184c..e9ec44ffaaaf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1062,7 +1062,7 @@ static void gpiodevice_release(struct device *dev)
 
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
-	kfree(gdev->label);
+	kfree_const(gdev->label);
 	kfree(gdev->descs);
 	kfree(gdev);
 }
@@ -1170,10 +1170,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		goto err_free_descs;
 	}
 
-	if (chip->label)
-		gdev->label = kstrdup(chip->label, GFP_KERNEL);
-	else
-		gdev->label = kstrdup("unknown", GFP_KERNEL);
+	gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);
 	if (!gdev->label) {
 		status = -ENOMEM;
 		goto err_free_descs;
@@ -1294,7 +1291,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	list_del(&gdev->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 err_free_label:
-	kfree(gdev->label);
+	kfree_const(gdev->label);
 err_free_descs:
 	kfree(gdev->descs);
 err_free_gdev:
-- 
2.15.1
