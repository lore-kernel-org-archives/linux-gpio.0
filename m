From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 20/23] gpio: sysfs: fix race between gpiod export and unexport
Date: Mon,  4 May 2015 17:10:45 +0200
Message-ID: <1430752248-15401-21-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Make sure to deregister the class device (and release the irq) while
holding the sysfs lock in gpio_unexport to prevent racing with
gpio_export.

Note that this requires the recently introduced per-gpio locking to
avoid a deadlock with the kernfs active protection when waiting for the
attribute operations to drain during deregistration.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 51 ++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1bb05aa33a84..1540f7d60f06 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -674,9 +674,8 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data	*data;
-	int			status = 0;
-	struct device		*dev = NULL;
+	struct gpiod_data *data;
+	struct device *dev;
 
 	if (!desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
@@ -685,33 +684,35 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 	mutex_lock(&sysfs_lock);
 
-	if (test_bit(FLAG_EXPORT, &desc->flags)) {
+	if (!test_bit(FLAG_EXPORT, &desc->flags))
+		goto err_unlock;
 
-		dev = class_find_device(&gpio_class, NULL, desc, match_export);
-		if (dev) {
-			clear_bit(FLAG_SYSFS_DIR, &desc->flags);
-			clear_bit(FLAG_EXPORT, &desc->flags);
-		} else
-			status = -ENODEV;
-	}
+	dev = class_find_device(&gpio_class, NULL, desc, match_export);
+	if (!dev)
+		goto err_unlock;
+
+	data = dev_get_drvdata(dev);
+
+	clear_bit(FLAG_SYSFS_DIR, &desc->flags);
+	clear_bit(FLAG_EXPORT, &desc->flags);
+
+	device_unregister(dev);
+
+	/*
+	 * Release irq after deregistration to prevent race with edge_store.
+	 */
+	if (desc->flags & GPIO_TRIGGER_MASK)
+		gpio_sysfs_free_irq(dev);
 
 	mutex_unlock(&sysfs_lock);
 
-	if (dev) {
-		data = dev_get_drvdata(dev);
-		device_unregister(dev);
-		/*
-		 * Release irq after deregistration to prevent race with
-		 * edge_store.
-		 */
-		if (desc->flags & GPIO_TRIGGER_MASK)
-			gpio_sysfs_free_irq(dev);
-		put_device(dev);
-		kfree(data);
-	}
+	put_device(dev);
+	kfree(data);
 
-	if (status)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
+	return;
+
+err_unlock:
+	mutex_unlock(&sysfs_lock);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-- 
2.0.5
