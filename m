From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: present the consumer of a line to userspace
Date: Thu, 25 Feb 2016 21:08:10 +0100
Message-ID: <1456430890-7828-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36674 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933286AbcBYUIP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 15:08:15 -0500
Received: by mail-lf0-f49.google.com with SMTP id 78so40402724lfy.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 12:08:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

I named the field representing the current user of GPIO line as
"label" but this is too vague and ambiguous. Before anyone gets
confused, rename it to "consumer" and indicate clearly in the
documentation that this is a string set by the user of the line.

Also clean up leftovers in the documentation.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c    |  8 ++++----
 include/uapi/linux/gpio.h | 22 ++++++++++++----------
 tools/gpio/lsgpio.c       |  6 +++---
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 872774a404f1..bc788b958c7e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -368,11 +368,11 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			lineinfo.name[0] = '\0';
 		}
 		if (desc->label) {
-			strncpy(lineinfo.label, desc->label,
-				sizeof(lineinfo.label));
-			lineinfo.label[sizeof(lineinfo.label)-1] = '\0';
+			strncpy(lineinfo.consumer, desc->label,
+				sizeof(lineinfo.consumer));
+			lineinfo.consumer[sizeof(lineinfo.consumer)-1] = '\0';
 		} else {
-			lineinfo.label[0] = '\0';
+			lineinfo.consumer[0] = '\0';
 		}
 
 		/*
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 416ce47f2291..dfe8ade2742d 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -15,8 +15,9 @@
 
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
- * @name: the name of this GPIO chip
- * @label: a functional name for this GPIO chip
+ * @name: the Linux kernel name of this GPIO chip
+ * @label: a functional name for this GPIO chip, such as a product
+ * number, may be NULL
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
@@ -34,20 +35,21 @@ struct gpiochip_info {
 
 /**
  * struct gpioline_info - Information about a certain GPIO line
- * @line_offset: the local offset on this GPIO device, fill in when
- * requesting information from the kernel
+ * @line_offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
  * @flags: various flags for this line
- * @name: the name of this GPIO line
- * @label: a functional name for this GPIO line
- * @kernel: this GPIO is in use by the kernel
- * @out: this GPIO is an output line (false means it is an input)
- * @active_low: this GPIO is active low
+ * @name: the name of this GPIO line, such as the output pin of the line on the
+ * chip, a rail or a pin header name on a board, as specified by the gpio
+ * chip, may be NULL
+ * @consumer: a functional name for the consumer of this GPIO line as set by
+ * whatever is using it, will be NULL if there is no current user but may
+ * also be NULL if the consumer doesn't set this up
  */
 struct gpioline_info {
 	__u32 line_offset;
 	__u32 flags;
 	char name[32];
-	char label[32];
+	char consumer[32];
 };
 
 #define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info)
diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 6af118cc7efb..1124da375942 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -116,10 +116,10 @@ int list_device(const char *device_name)
 			fprintf(stdout, " \"%s\"", linfo.name);
 		else
 			fprintf(stdout, " unnamed");
-		if (linfo.label[0])
-			fprintf(stdout, " \"%s\"", linfo.label);
+		if (linfo.consumer[0])
+			fprintf(stdout, " \"%s\"", linfo.consumer);
 		else
-			fprintf(stdout, " unlabeled");
+			fprintf(stdout, " unused");
 		if (linfo.flags) {
 			fprintf(stdout, " [");
 			print_flags(linfo.flags);
-- 
2.4.3

