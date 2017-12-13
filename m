From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpiolib: use kstrdup_const() for gpio_device label
Date: Wed, 13 Dec 2017 12:25:20 +0100
Message-ID: <20171213112520.7479-2-brgl@bgdev.pl>
References: <20171213112520.7479-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213112520.7479-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Users often pass a pointer to a static string to gpiochip_add_data()
family of functions. Avoid unnecessary memory allocations with the
provided helper routine.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 56eec094184c..c078f7f35100 100644
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
@@ -1171,9 +1171,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	}
 
 	if (chip->label)
-		gdev->label = kstrdup(chip->label, GFP_KERNEL);
+		gdev->label = kstrdup_const(chip->label, GFP_KERNEL);
 	else
-		gdev->label = kstrdup("unknown", GFP_KERNEL);
+		gdev->label = kstrdup_const("unknown", GFP_KERNEL);
 	if (!gdev->label) {
 		status = -ENOMEM;
 		goto err_free_descs;
@@ -1294,7 +1294,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
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
