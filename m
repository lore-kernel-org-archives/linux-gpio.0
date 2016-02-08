From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/6 v3] gpio: add a userspace chardev ABI for GPIOs
Date: Mon,  8 Feb 2016 15:32:52 +0100
Message-ID: <1454941972-25507-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35904 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753152AbcBHOdA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2016 09:33:00 -0500
Received: by mail-lf0-f51.google.com with SMTP id 78so96394474lfy.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Feb 2016 06:32:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

A new chardev that is to be used for userspace GPIO access is
added in this patch. It is intended to gradually replace the
horribly broken sysfs ABI.

Using a chardev has many upsides:

- All operations are per-gpiochip, which is the actual
  device underlying the GPIOs, making us tie in to the
  kernel device model properly.

- Hotpluggable GPIO controllers can come and go, as this
  kind of problem has been know to userspace for character
  devices since ages, and if a gpiochip handle is held in
  userspace we know we will break something, whereas the
  sysfs is stateless.

- The one-value-per-file rule of sysfs is really hard to
  maintain when you want to twist more than one knob at a time,
  for example have in-kernel APIs to switch several GPIO
  lines at the same time, and this will be possible to do
  with a single ioctl() from userspace, saving a lot of
  context switching.

We also need to add a new bus type for GPIO. This is
necessary for example for userspace coldplug, where sysfs is
traversed to find the boot-time device nodes and create the
character devices in /dev.

This new chardev ABI is *non* *optional* and can be counted
on to be present in the future, emphasizing the preference
of this ABI.

The ABI only implements one single ioctl() to get the name
and number of GPIO lines of a chip. Even this is debatable:
see it as a minimal example for review. This ABI shall be
ruthlessly reviewed and etched in stone.

The old /sys/class/gpio is still optional to compile in,
but will be deprecated.

Unique device IDs are created using IDR, which is overkill
and insanely scalable, but also well tested.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Drop assigning the gpiochip label as userspace name if
  present, just use "gpiochip0", "gpiochip1" ... "gpiochipN"
---
 MAINTAINERS               |   1 +
 drivers/gpio/gpiolib.c    | 125 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h    |   2 +
 include/uapi/linux/Kbuild |   1 +
 include/uapi/linux/gpio.h |  28 +++++++++++
 5 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 30aca4aa5467..76986c3ab4ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4819,6 +4819,7 @@ F:	drivers/gpio/
 F:	include/linux/gpio/
 F:	include/linux/gpio.h
 F:	include/asm-generic/gpio.h
+F:	include/uapi/linux/gpio.h
 
 GRE DEMULTIPLEXER DRIVER
 M:	Dmitry Kozlov <xeb@mail.ru>
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4b94e31a50af..70e0fff0a8a7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -17,6 +17,10 @@
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/idr.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
 
@@ -45,6 +49,11 @@
 
 /* Device and char device-related information */
 static DEFINE_IDA(gpio_ida);
+static dev_t gpio_devt;
+#define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
+static struct bus_type gpio_bus_type = {
+	.name = "gpio",
+};
 
 /* gpio_lock prevents conflicts during gpio_desc[] table updates.
  * While any GPIO is requested, its gpio_chip is not removable;
@@ -316,10 +325,84 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	return 0;
 }
 
+/**
+ * gpio_ioctl() - ioctl handler for the GPIO chardev
+ */
+static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct gpio_device *gdev = filp->private_data;
+	struct gpio_chip *chip = gdev->chip;
+	int __user *ip = (int __user *)arg;
+	struct gpiochip_info chipinfo;
+
+	/* We fail any subsequent ioctl():s when the chip is gone */
+	if (!chip)
+		return -ENODEV;
+
+	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {
+		/* Fill in the struct and pass to userspace */
+		strncpy(chipinfo.name, dev_name(&gdev->dev),
+			sizeof(chipinfo.name));
+		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
+		chipinfo.lines = chip->ngpio;
+		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
+			return -EFAULT;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+/**
+ * gpio_chrdev_open() - open the chardev for ioctl operations
+ * @inode: inode for this chardev
+ * @filp: file struct for storing private data
+ * Returns 0 on success
+ */
+static int gpio_chrdev_open(struct inode *inode, struct file *filp)
+{
+	struct gpio_device *gdev = container_of(inode->i_cdev,
+					      struct gpio_device, chrdev);
+
+	/* Fail on open if the backing gpiochip is gone */
+	if (!gdev || !gdev->chip)
+		return -ENODEV;
+	get_device(&gdev->dev);
+	filp->private_data = gdev;
+	return 0;
+}
+
+/**
+ * gpio_chrdev_release() - close chardev after ioctl operations
+ * @inode: inode for this chardev
+ * @filp: file struct for storing private data
+ * Returns 0 on success
+ */
+static int gpio_chrdev_release(struct inode *inode, struct file *filp)
+{
+	struct gpio_device *gdev = container_of(inode->i_cdev,
+					      struct gpio_device, chrdev);
+
+	if (!gdev)
+		return -ENODEV;
+	put_device(&gdev->dev);
+	return 0;
+}
+
+
+static const struct file_operations gpio_fileops = {
+	.release = gpio_chrdev_release,
+	.open = gpio_chrdev_open,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = gpio_ioctl,
+	.compat_ioctl = gpio_ioctl,
+};
+
 static void gpiodevice_release(struct device *dev)
 {
 	struct gpio_device *gdev = dev_get_drvdata(dev);
 
+	cdev_del(&gdev->chrdev);
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
 }
@@ -357,6 +440,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	gdev = kmalloc(sizeof(*gdev), GFP_KERNEL);
 	if (!gdev)
 		return -ENOMEM;
+	gdev->dev.bus = &gpio_bus_type;
 	gdev->chip = chip;
 	chip->gpiodev = gdev;
 	if (chip->parent) {
@@ -452,9 +536,26 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 
 	acpi_gpiochip_add(chip);
 
+	/*
+	 * By first adding the chardev, and then adding the device,
+	 * we get a device node entry in sysfs under
+	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
+	 * coldplug of device nodes and other udev business.
+	 */
+	cdev_init(&gdev->chrdev, &gpio_fileops);
+	gdev->chrdev.owner = THIS_MODULE;
+	gdev->chrdev.kobj.parent = &gdev->dev.kobj;
+	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
+	status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
+	if (status < 0)
+		chip_warn(chip, "failed to add char device %d:%d\n",
+			  MAJOR(gpio_devt), gdev->id);
+	else
+		chip_dbg(chip, "added GPIO chardev (%d:%d)\n",
+			 MAJOR(gpio_devt), gdev->id);
 	status = device_add(&gdev->dev);
 	if (status)
-		goto err_remove_chip;
+		goto err_remove_chardev;
 
 	status = gpiochip_sysfs_register(chip);
 	if (status)
@@ -471,6 +572,8 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 
 err_remove_device:
 	device_del(&gdev->dev);
+err_remove_chardev:
+	cdev_del(&gdev->chrdev);
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
@@ -2543,6 +2646,26 @@ void gpiod_put_array(struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(gpiod_put_array);
 
+static int __init gpiolib_dev_init(void)
+{
+	int ret;
+
+	/* Register GPIO sysfs bus */
+	ret  = bus_register(&gpio_bus_type);
+	if (ret < 0) {
+		pr_err("gpiolib: could not register GPIO bus type\n");
+		return ret;
+	}
+
+	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, "gpiochip");
+	if (ret < 0) {
+		pr_err("gpiolib: failed to allocate char dev region\n");
+		bus_unregister(&gpio_bus_type);
+	}
+	return ret;
+}
+core_initcall(gpiolib_dev_init);
+
 #ifdef CONFIG_DEBUG_FS
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3f329c922f5b..1524ba0ca99d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -26,6 +26,7 @@ struct acpi_device;
  * struct gpio_device - internal state container for GPIO devices
  * @id: numerical ID number for the GPIO chip
  * @dev: the GPIO device struct
+ * @chrdev: character device for the GPIO device
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
@@ -39,6 +40,7 @@ struct acpi_device;
 struct gpio_device {
 	int			id;
 	struct device		dev;
+	struct cdev		chrdev;
 	struct module		*owner;
 	struct gpio_chip	*chip;
 	struct list_head        list;
diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
index ebd10e624598..5c9ae6a9b7f5 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/linux/Kbuild
@@ -138,6 +138,7 @@ header-y += genetlink.h
 header-y += gen_stats.h
 header-y += gfs2_ondisk.h
 header-y += gigaset_dev.h
+header-y += gpio.h
 header-y += gsmmux.h
 header-y += hdlcdrv.h
 header-y += hdlc.h
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
new file mode 100644
index 000000000000..3188a87bdaa0
--- /dev/null
+++ b/include/uapi/linux/gpio.h
@@ -0,0 +1,28 @@
+/*
+ * <linux/gpio.h> - userspace ABI for the GPIO character devices
+ *
+ * Copyright (C) 2015 Linus Walleij
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ */
+#ifndef _UAPI_GPIO_H_
+#define _UAPI_GPIO_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * struct gpiochip_info - Information about a certain GPIO chip
+ * @name: the name of this GPIO chip
+ * @lines: number of GPIO lines on this chip
+ */
+struct gpiochip_info {
+	char name[32];
+	__u32 lines;
+};
+
+#define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info)
+
+#endif /* _UAPI_GPIO_H_ */
-- 
2.4.3

