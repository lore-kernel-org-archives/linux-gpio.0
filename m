From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: add userspace ABI for GPIO line information
Date: Fri, 12 Feb 2016 22:39:22 +0100
Message-ID: <1455313162-22956-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33418 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbcBLVj2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2016 16:39:28 -0500
Received: by mail-lf0-f47.google.com with SMTP id m1so59948501lfg.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2016 13:39:27 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

This adds a GPIO line ABI for getting name, label and a few select
flags from the kernel.

This hides the kernel internals and only tells userspace what it
may need to know: the different in-kernel consumers are masked
behind the flag "kernel" and that is all userspace needs to know.

However electric characteristics like active low, open drain etc
are reflected to userspace, as this is important information.

We provide information on all lines on all chips, later on we will
likely add a flag for the chardev consumer so we can filter and
display only the lines userspace actually uses in e.g. lsgpio,
but then we first need an ABI for userspace to grab and use
(get/set/select direction) a GPIO line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c    | 50 +++++++++++++++++++++++++--
 include/uapi/linux/gpio.h | 26 ++++++++++++++
 tools/gpio/gpio-utils.h   |  2 ++
 tools/gpio/lsgpio.c       | 88 ++++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 152 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a022e9249f69..6138df74f148 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -331,14 +331,15 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	struct gpio_device *gdev = filp->private_data;
 	struct gpio_chip *chip = gdev->chip;
 	int __user *ip = (int __user *)arg;
-	struct gpiochip_info chipinfo;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!chip)
 		return -ENODEV;
 
+	/* Fill in the struct and pass to userspace */
 	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {
-		/* Fill in the struct and pass to userspace */
+		struct gpiochip_info chipinfo;
+
 		strncpy(chipinfo.name, dev_name(&gdev->dev),
 			sizeof(chipinfo.name));
 		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
@@ -349,6 +350,51 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
+	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
+		struct gpioline_info lineinfo;
+		struct gpio_desc *desc;
+
+		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+			return -EFAULT;
+		if (lineinfo.line_offset > gdev->ngpio)
+			return -EINVAL;
+
+		desc = &gdev->descs[lineinfo.line_offset];
+		if (desc->name) {
+			strncpy(lineinfo.name, desc->name,
+				sizeof(lineinfo.name));
+			lineinfo.name[sizeof(lineinfo.name)-1] = '\0';
+		} else {
+			lineinfo.name[0] = '\0';
+		}
+		if (desc->label) {
+			strncpy(lineinfo.label, desc->label,
+				sizeof(lineinfo.label));
+			lineinfo.label[sizeof(lineinfo.label)-1] = '\0';
+		} else {
+			lineinfo.label[0] = '\0';
+		}
+
+		/*
+		 * Userspace only need to know that the kernel is using
+		 * this GPIO so it can't use it.
+		 */
+		if (desc->flags & (FLAG_REQUESTED | FLAG_IS_HOGGED |
+				   FLAG_USED_AS_IRQ | FLAG_EXPORT |
+				   FLAG_SYSFS))
+			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
+		if (desc->flags & FLAG_IS_OUT)
+			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
+		if (desc->flags & FLAG_ACTIVE_LOW)
+			lineinfo.flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+		if (desc->flags & FLAG_OPEN_DRAIN)
+			lineinfo.flags |= GPIOLINE_FLAG_OPEN_DRAIN;
+		if (desc->flags & FLAG_OPEN_SOURCE)
+			lineinfo.flags |= GPIOLINE_FLAG_OPEN_SOURCE;
+
+		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+			return -EFAULT;
+		return 0;
 	}
 	return -EINVAL;
 }
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 3f93e1bcd3dd..416ce47f2291 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -25,6 +25,32 @@ struct gpiochip_info {
 	__u32 lines;
 };
 
+/* Line is in use by the kernel */
+#define GPIOLINE_FLAG_KERNEL		(1UL << 0)
+#define GPIOLINE_FLAG_IS_OUT		(1UL << 1)
+#define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
+#define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
+#define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
+
+/**
+ * struct gpioline_info - Information about a certain GPIO line
+ * @line_offset: the local offset on this GPIO device, fill in when
+ * requesting information from the kernel
+ * @flags: various flags for this line
+ * @name: the name of this GPIO line
+ * @label: a functional name for this GPIO line
+ * @kernel: this GPIO is in use by the kernel
+ * @out: this GPIO is an output line (false means it is an input)
+ * @active_low: this GPIO is active low
+ */
+struct gpioline_info {
+	__u32 line_offset;
+	__u32 flags;
+	char name[32];
+	char label[32];
+};
+
 #define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_IOCTL _IOWR('o', 0x02, struct gpioline_info)
 
 #endif /* _UAPI_GPIO_H_ */
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index b18209a45ad3..5f57133b8c04 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -16,6 +16,8 @@
 
 #include <string.h>
 
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
 static inline int check_prefix(const char *str, const char *prefix)
 {
 	return strlen(str) > strlen(prefix) &&
diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 692233f561fb..908535cbc403 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -26,12 +26,56 @@
 
 #include "gpio-utils.h"
 
+struct gpio_flag {
+	char *name;
+	unsigned long mask;
+};
+
+struct gpio_flag flagnames[] = {
+	{
+		.name = "kernel",
+		.mask = GPIOLINE_FLAG_KERNEL,
+	},
+	{
+		.name = "output",
+		.mask = GPIOLINE_FLAG_IS_OUT,
+	},
+	{
+		.name = "active-low",
+		.mask = GPIOLINE_FLAG_ACTIVE_LOW,
+	},
+	{
+		.name = "open-drain",
+		.mask = GPIOLINE_FLAG_OPEN_DRAIN,
+	},
+	{
+		.name = "open-source",
+		.mask = GPIOLINE_FLAG_OPEN_SOURCE,
+	},
+};
+
+void print_flags(unsigned long flags)
+{
+	int i;
+	int printed = 0;
+
+	for (i = 0; i < ARRAY_SIZE(flagnames); i++) {
+		if (flags & flagnames[i].mask) {
+			if (printed)
+				fprintf(stdout, " ");
+			fprintf(stdout, "%s", flagnames[i].name);
+			printed++;
+		}
+	}
+}
+
 int list_device(const char *device_name)
 {
 	struct gpiochip_info cinfo;
 	char *chrdev_name;
 	int fd;
 	int ret;
+	int i;
 
 	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
 	if (ret < 0)
@@ -41,32 +85,52 @@ int list_device(const char *device_name)
 	if (fd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto free_chrdev_name;
+		goto exit_close_error;
 	}
 
 	/* Inspect this GPIO chip */
 	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
 	if (ret == -1) {
 		ret = -errno;
-		fprintf(stderr, "Failed to retrieve GPIO fd\n");
-		if (close(fd) == -1)
-			perror("Failed to close GPIO character device file");
-
-		goto free_chrdev_name;
+		perror("Failed to issue CHIPINFO IOCTL\n");
+		goto exit_close_error;
 	}
 	fprintf(stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n",
 		cinfo.name, cinfo.label, cinfo.lines);
 
-	if (close(fd) == -1)  {
-		ret = -errno;
-		goto free_chrdev_name;
+	/* Loop over the lines and print info */
+	for (i = 0; i < cinfo.lines; i++) {
+		struct gpioline_info linfo;
+
+		ret = ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
+		if (ret == -1) {
+			ret = -errno;
+			perror("Failed to issue LINEINFO IOCTL\n");
+			goto exit_close_error;
+		}
+		fprintf(stdout, "\tline %d:", i);
+		if (linfo.name[0])
+			fprintf(stdout, " %s", linfo.name);
+		else
+			fprintf(stdout, " unnamed");
+		if (linfo.label[0])
+			fprintf(stdout, "\"%s\"", linfo.label);
+		else
+			fprintf(stdout, " unlabeled");
+		if (linfo.flags) {
+			fprintf(stdout, "[");
+			print_flags(linfo.flags);
+			fprintf(stdout, "]");
+		}
+		fprintf(stdout, "\n");
+
 	}
 
-free_chrdev_name:
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
 	free(chrdev_name);
-
 	return ret;
-
 }
 
 void print_usage(void)
-- 
2.4.3

