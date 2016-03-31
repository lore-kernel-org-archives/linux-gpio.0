From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] gpiolib: Defer gpio device setup until after gpiolib initialization
Date: Thu, 31 Mar 2016 08:11:30 -0700
Message-ID: <1459437090-10029-2-git-send-email-linux@roeck-us.net>
References: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Greg Ungerer <gerg@uclinux.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
attempts to add a gpio chip prior to gpiolib initialization cause
the system to crash. This happens because gpio_bus_type has not been
registered yet. Defer creating gpio devices until after gpiolib has
been initialized to fix the problem.

Cc: Greg Ungerer <gerg@uclinux.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpio/gpiolib.c | 98 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f1531070814d..8bb24dc8dc3d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -68,6 +68,7 @@ LIST_HEAD(gpio_devices);
 static void gpiochip_free_hogs(struct gpio_chip *chip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 
+static bool gpiolib_initialized;
 
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
@@ -445,6 +446,58 @@ static void gpiodevice_release(struct device *dev)
 	kfree(gdev);
 }
 
+static int gpiochip_setup_dev(struct gpio_device *gdev)
+{
+	int status;
+
+	cdev_init(&gdev->chrdev, &gpio_fileops);
+	gdev->chrdev.owner = THIS_MODULE;
+	gdev->chrdev.kobj.parent = &gdev->dev.kobj;
+	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
+	status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
+	if (status < 0)
+		chip_warn(gdev->chip, "failed to add char device %d:%d\n",
+			  MAJOR(gpio_devt), gdev->id);
+	else
+		chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
+			 MAJOR(gpio_devt), gdev->id);
+	status = device_add(&gdev->dev);
+	if (status)
+		goto err_remove_chardev;
+
+	status = gpiochip_sysfs_register(gdev);
+	if (status)
+		goto err_remove_device;
+
+	/* From this point, the .release() function cleans up gpio_device */
+	gdev->dev.release = gpiodevice_release;
+	get_device(&gdev->dev);
+	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
+		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
+		 dev_name(&gdev->dev), gdev->chip->label ? : "generic");
+
+	return 0;
+
+err_remove_device:
+	device_del(&gdev->dev);
+err_remove_chardev:
+	cdev_del(&gdev->chrdev);
+	return status;
+}
+
+static void gpiochip_setup_devs(void)
+{
+	struct gpio_device *gdev;
+	int err;
+
+	list_for_each_entry(gdev, &gpio_devices, list) {
+		err = gpiochip_setup_dev(gdev);
+		if (err)
+			pr_err("%s: Failed to initialize gpio device (%d)\n",
+			       dev_name(&gdev->dev), err);
+	}
+}
+
 /**
  * gpiochip_add_data() - register a gpio_chip
  * @chip: the chip to register, with chip->base initialized
@@ -459,6 +512,9 @@ static void gpiodevice_release(struct device *dev)
  * the gpio framework's arch_initcall().  Otherwise sysfs initialization
  * for GPIOs will fail rudely.
  *
+ * gpiochip_add_data() must only be called after gpiolib initialization,
+ * ie after core_initcall().
+ *
  * If chip->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
  */
@@ -515,7 +571,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
 		status = -EINVAL;
-		goto err_free_gdev;
+		goto err_free_descs;
 	}
 
 	if (chip->label)
@@ -597,39 +653,16 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	 * we get a device node entry in sysfs under
 	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
 	 * coldplug of device nodes and other udev business.
+	 * We can do this only if gpiolib has been initialized.
+	 * Otherwise, defer until later.
 	 */
-	cdev_init(&gdev->chrdev, &gpio_fileops);
-	gdev->chrdev.owner = THIS_MODULE;
-	gdev->chrdev.kobj.parent = &gdev->dev.kobj;
-	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
-	status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
-	if (status < 0)
-		chip_warn(chip, "failed to add char device %d:%d\n",
-			  MAJOR(gpio_devt), gdev->id);
-	else
-		chip_dbg(chip, "added GPIO chardev (%d:%d)\n",
-			 MAJOR(gpio_devt), gdev->id);
-	status = device_add(&gdev->dev);
-	if (status)
-		goto err_remove_chardev;
-
-	status = gpiochip_sysfs_register(gdev);
-	if (status)
-		goto err_remove_device;
-
-	/* From this point, the .release() function cleans up gpio_device */
-	gdev->dev.release = gpiodevice_release;
-	get_device(&gdev->dev);
-	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
-		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
-		 dev_name(&gdev->dev), chip->label ? : "generic");
-
+	if (gpiolib_initialized) {
+		status = gpiochip_setup_dev(gdev);
+		if (status)
+			goto err_remove_chip;
+	}
 	return 0;
 
-err_remove_device:
-	device_del(&gdev->dev);
-err_remove_chardev:
-	cdev_del(&gdev->chrdev);
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
@@ -2834,6 +2867,9 @@ static int __init gpiolib_dev_init(void)
 	if (ret < 0) {
 		pr_err("gpiolib: failed to allocate char dev region\n");
 		bus_unregister(&gpio_bus_type);
+	} else {
+		gpiolib_initialized = true;
+		gpiochip_setup_devs();
 	}
 	return ret;
 }
-- 
2.5.0
