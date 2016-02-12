From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: store reflect the label to userspace
Date: Fri, 12 Feb 2016 14:50:38 +0100
Message-ID: <1455285038-2071-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36548 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbcBLNup (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2016 08:50:45 -0500
Received: by mail-lb0-f171.google.com with SMTP id tk3so33192529lbb.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2016 05:50:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

The gpio_chip label is useful for userspace to understand what
kind of GPIO chip it is dealing with. Let's store a copy of this
label in the gpio_device, add it to the struct passed to userspace
for GPIO_GET_CHIPINFO_IOCTL and modify lsgpio to show it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 drivers/gpio/gpiolib.h      |  3 +++
 include/linux/gpio/driver.h |  3 ++-
 include/uapi/linux/gpio.h   |  2 ++
 tools/gpio/lsgpio.c         |  4 ++--
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aa4a60e19339..9fff3b0847bf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -342,6 +342,9 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		strncpy(chipinfo.name, dev_name(&gdev->dev),
 			sizeof(chipinfo.name));
 		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
+		strncpy(chipinfo.label, gdev->label,
+			sizeof(chipinfo.label));
+		chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
 		chipinfo.lines = gdev->ngpio;
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
@@ -479,6 +482,16 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		status = -EINVAL;
 		goto err_free_gdev;
 	}
+
+	if (chip->label)
+		gdev->label = devm_kstrdup(&gdev->dev, chip->label, GFP_KERNEL);
+	else
+		gdev->label = devm_kstrdup(&gdev->dev, chip->label, "unknown");
+	if (!gdev->label) {
+		status = -ENOMEM;
+		goto err_free_gdev;
+	}
+
 	gdev->ngpio = chip->ngpio;
 	gdev->data = data;
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ddbe409ad48f..e30e5fdb1214 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -37,6 +37,8 @@ struct acpi_device;
  * of the @descs array.
  * @base: GPIO base in the DEPRECATED global Linux GPIO numberspace, assigned
  * at device creation time.
+ * @label: a descriptive name for the GPIO device, such as the part number
+ * or name of the IP component in a System on Chip.
  * @data: per-instance data assigned by the driver
  * @list: links gpio_device:s together for traversal
  *
@@ -55,6 +57,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	int			base;
 	u16			ngpio;
+	char			*label;
 	void			*data;
 	struct list_head        list;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b92ab9efdb69..341c3d6b2650 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -21,7 +21,8 @@ struct gpio_device;
 
 /**
  * struct gpio_chip - abstract a GPIO controller
- * @label: for diagnostics
+ * @label: a functional name for the GPIO device, such as a part
+ *	number or the name of the SoC IP-block implementing it.
  * @gpiodev: the internal state holder, opaque struct
  * @parent: optional parent device providing the GPIOs
  * @owner: helps prevent removal of modules exporting active GPIOs
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 3188a87bdaa0..3f93e1bcd3dd 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -16,10 +16,12 @@
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the name of this GPIO chip
+ * @label: a functional name for this GPIO chip
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
 	char name[32];
+	char label[32];
 	__u32 lines;
 };
 
diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 4cfe29da279b..692233f561fb 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -54,8 +54,8 @@ int list_device(const char *device_name)
 
 		goto free_chrdev_name;
 	}
-	fprintf(stdout, "GPIO chip: %s, %u GPIO lines\n",
-		cinfo.name, cinfo.lines);
+	fprintf(stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n",
+		cinfo.name, cinfo.label, cinfo.lines);
 
 	if (close(fd) == -1)  {
 		ret = -errno;
-- 
2.4.3

