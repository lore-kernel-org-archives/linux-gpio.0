From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 22 Oct 2015 10:32:25 +0200
Message-ID: <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33335 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbbJVIcu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:32:50 -0400
Received: by lffv3 with SMTP id v3so39288048lff.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:32:48 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

GPIO chips have been around for years, but were never real devices,
instead they were piggy-backing on a parent device (such as a
platform_device or amba_device) but this was always optional.
GPIO chips could also exist without any device at all, with its
struct device *dev pointer being set to null.

When sysfs was in use, a mock device would be created, with the
optional parent assigned, or just floating orphaned with NULL
as parent.

For a proper userspace ABI we need gpiochips to *always have a
populated struct device, so add this in the gpio_chip struct.
The name "dev" is unfortunately already take so we use "device"
to name it.

If sysfs is active, it will use this device as parent, and the
former parent device "dev" will be set as parent of the new
"device" struct member.

>From this point on, gpiochips are devices.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 44 +++++++++++++++++++++++++++++++++++++++-----
 include/linux/gpio/driver.h  |  9 +++++++--
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b57ed8e55ab5..7e5bc5736e47 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -605,7 +605,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (chip->names && chip->names[offset])
 		ioname = chip->names[offset];
 
-	dev = device_create_with_groups(&gpio_class, chip->dev,
+	dev = device_create_with_groups(&gpio_class, &chip->device,
 					MKDEV(0, 0), data, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6798355c61c6..0ab4f75b7f8e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/idr.h>
 
 #include "gpiolib.h"
 
@@ -42,6 +43,9 @@
 #define	extra_checks	0
 #endif
 
+/* Device and char device-related information */
+static DEFINE_IDA(gpio_ida);
+
 /* gpio_lock prevents conflicts during gpio_desc[] table updates.
  * While any GPIO is requested, its gpio_chip is not removable;
  * each GPIO's "requested" flag serves as a lock and refcount.
@@ -52,7 +56,6 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_chips);
 
-
 static void gpiochip_free_hogs(struct gpio_chip *chip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 
@@ -300,7 +303,7 @@ int gpiochip_add(struct gpio_chip *chip)
 {
 	unsigned long	flags;
 	int		status = 0;
-	unsigned	id;
+	unsigned	i;
 	int		base = chip->base;
 	struct gpio_desc *descs;
 
@@ -308,6 +311,28 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (!descs)
 		return -ENOMEM;
 
+	/*
+	 * The "dev" member of gpiochip is the parent, and the actual
+	 * device is named "device" for historical reasons.
+	 *
+	 * We memset the struct to zero to avoid reentrance issues.
+	 */
+	memset(&chip->device, 0, sizeof(chip->device));
+	if (chip->dev) {
+		chip->device.parent = chip->dev;
+		chip->device.of_node = chip->dev->of_node;
+	} else {
+#ifdef CONFIG_OF_GPIO
+	/* If the gpiochip has an assigned OF node this takes precedence */
+	if (chip->of_node)
+		chip->device.of_node = chip->of_node;
+#endif
+	}
+	chip->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
+	dev_set_name(&chip->device, "gpiochip%d", chip->id);
+	device_initialize(&chip->device);
+	dev_set_drvdata(&chip->device, chip);
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	if (base < 0) {
@@ -326,8 +351,8 @@ int gpiochip_add(struct gpio_chip *chip)
 		goto err_free_descs;
 	}
 
-	for (id = 0; id < chip->ngpio; id++) {
-		struct gpio_desc *desc = &descs[id];
+	for (i = 0; i < chip->ngpio; i++) {
+		struct gpio_desc *desc = &descs[i];
 
 		desc->chip = chip;
 
@@ -361,16 +386,22 @@ int gpiochip_add(struct gpio_chip *chip)
 
 	acpi_gpiochip_add(chip);
 
-	status = gpiochip_sysfs_register(chip);
+	status = device_add(&chip->device);
 	if (status)
 		goto err_remove_chip;
 
+	status = gpiochip_sysfs_register(chip);
+	if (status)
+		goto err_remove_device;
+
 	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
 		chip->label ? : "generic");
 
 	return 0;
 
+err_remove_device:
+	device_del(&chip->device);
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
@@ -381,6 +412,7 @@ err_remove_from_list:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	chip->desc = NULL;
 err_free_descs:
+	ida_simple_remove(&gpio_ida, chip->id);
 	kfree(descs);
 
 	/* failures here can mean systems won't boot... */
@@ -426,6 +458,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	if (requested)
 		dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
+	device_del(&chip->device);
+	ida_simple_remove(&gpio_ida, chip->id);
 	kfree(chip->desc);
 	chip->desc = NULL;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index d1baebf350d8..cf3028eccc4b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -1,6 +1,7 @@
 #ifndef __LINUX_GPIO_DRIVER_H
 #define __LINUX_GPIO_DRIVER_H
 
+#include <linux/device.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/irq.h>
@@ -8,8 +9,8 @@
 #include <linux/irqdomain.h>
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/cdev.h>
 
-struct device;
 struct gpio_desc;
 struct of_phandle_args;
 struct device_node;
@@ -20,7 +21,9 @@ struct seq_file;
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: for diagnostics
- * @dev: optional device providing the GPIOs
+ * @id: numerical ID number for the GPIO chip
+ * @device: the GPIO device struct.
+ * @dev: optional parent device (hardware) providing the GPIOs
  * @cdev: class device used by sysfs interface (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @list: links gpio_chips together for traversal
@@ -89,6 +92,8 @@ struct seq_file;
  */
 struct gpio_chip {
 	const char		*label;
+	int			id;
+	struct device		device;
 	struct device		*dev;
 	struct device		*cdev;
 	struct module		*owner;
-- 
2.4.3

