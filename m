From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Subject: [PATCH v4 1/3] tools/gpio: add gpio basic opereations
Date: Fri, 14 Oct 2016 10:48:25 +0800
Message-ID: <1476413307-1397-2-git-send-email-bamvor.zhangjian@huawei.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:18618 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753507AbcJNCpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2016 22:45:34 -0400
In-Reply-To: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, broonie@kernel.org, mwelling@ieee.org, shuahkh@osg.samsung.com

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Add basic gpio operations. User could get/set gpio value for specific
line of gpiochip.

Reference "tools/gpio/gpio-hammer.c" or
"tools/testing/selftest/gpio/gpio-mockup-chardev.c" for how to use it.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Reviewed-by: Michael Welling <mwelling@ieee.org>
---
 tools/gpio/gpio-utils.c | 257 ++++++++++++++++++++++++++++++++++++++++++++++++
 tools/gpio/gpio-utils.h |  16 +++
 2 files changed, 273 insertions(+)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 8208718..f6209cd 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -2,10 +2,267 @@
  * GPIO tools - helpers library for the GPIO tools
  *
  * Copyright (C) 2015 Linus Walleij
+ * Copyright (C) 2016 Bamvor Jian Zhang
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License version 2 as published by
  * the Free Software Foundation.
  */
 
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <errno.h>
+#include <string.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include <linux/gpio.h>
 #include "gpio-utils.h"
+
+#define COMSUMER "gpio-utils"
+
+/**
+ * doc: Operation of gpio
+ *
+ * Provide the api of gpiochip for chardev interface. There are two
+ * types of api.  The first one provide as same function as each
+ * ioctl, including request and release for lines of gpio, read/write
+ * the value of gpio. If the user want to do lots of read and write of
+ * lines of gpio, user should use this type of api.
+ *
+ * The second one provide the easy to use api for user. Each of the
+ * following api will request gpio lines, do the operation and then
+ * release these lines.
+ */
+/**
+ * gpiotools_request_linehandle() - request gpio lines in a gpiochip
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0"
+ * @lines:		An array desired lines, specified by offset
+ *			index for the associated GPIO device.
+ * @nline:		The number of lines to request.
+ * @flag:		The new flag for requsted gpio. Reference
+ *			"linux/gpio.h" for the meaning of flag.
+ * @data:		Default value will be set to gpio when flag is
+ *			GPIOHANDLE_REQUEST_OUTPUT.
+ * @consumer_label:	The name of consumer, such as "sysfs",
+ *			"powerkey". This is useful for other users to
+ *			know who is using.
+ *
+ * Request gpio lines through the ioctl provided by chardev. User
+ * could call gpiotools_set_values() and gpiotools_get_values() to
+ * read and write respectively through the returned fd. Call
+ * gpiotools_release_linehandle() to release these lines after that.
+ *
+ * Return:		On success return the fd;
+ *			On failure return the errno.
+ */
+int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
+				 unsigned int nlines, unsigned int flag,
+				 struct gpiohandle_data *data,
+				 const char *consumer_label)
+{
+	struct gpiohandle_request req;
+	char *chrdev_name;
+	int fd;
+	int i;
+	int ret;
+
+	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
+	if (ret < 0)
+		return -ENOMEM;
+
+	fd = open(chrdev_name, 0);
+	if (fd == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to open %s\n", chrdev_name);
+		goto exit_close_error;
+	}
+
+	for (i = 0; i < nlines; i++)
+		req.lineoffsets[i] = lines[i];
+
+	req.flags = flag;
+	strcpy(req.consumer_label, consumer_label);
+	req.lines = nlines;
+	if (flag & GPIOHANDLE_REQUEST_OUTPUT)
+		memcpy(req.default_values, data, sizeof(req.default_values));
+
+	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GET LINEHANDLE IOCTL (%d)\n",
+			ret);
+	}
+
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+	free(chrdev_name);
+	return ret < 0 ? ret : req.fd;
+}
+/**
+ * gpiotools_set_values(): Set the value of gpio(s)
+ * @fd:			The fd returned by
+ *			gpiotools_request_linehandle().
+ * @data:		The array of values want to set.
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue %s (%d)\n",
+			"GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
+	}
+
+	return ret;
+}
+
+/**
+ * gpiotools_get_values(): Get the value of gpio(s)
+ * @fd:			The fd returned by
+ *			gpiotools_request_linehandle().
+ * @data:		The array of values get from hardware.
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue %s (%d)\n",
+			"GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
+	}
+
+	return ret;
+}
+
+/**
+ * gpiotools_release_linehandle(): Release the line(s) of gpiochip
+ * @fd:			The fd returned by
+ *			gpiotools_request_linehandle().
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_release_linehandle(const int fd)
+{
+	int ret;
+
+	ret = close(fd);
+	if (ret == -1) {
+		perror("Failed to close GPIO LINEHANDLE device file");
+		ret = -errno;
+	}
+
+	return ret;
+}
+
+/**
+ * gpiotools_get(): Get value from specific line
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0"
+ * @line:		number of line, such as 2.
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_get(const char *device_name, unsigned int line)
+{
+	struct gpiohandle_data data;
+	unsigned int lines[] = {line};
+
+	gpiotools_gets(device_name, lines, 1, &data);
+	return data.values[0];
+}
+
+
+/**
+ * gpiotools_gets(): Get values from specific lines.
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0".
+ * @lines:		An array desired lines, specified by offset
+ *			index for the associated GPIO device.
+ * @nline:		The number of lines to request.
+ * @data:		The array of values get from gpiochip.
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_gets(const char *device_name, unsigned int *lines,
+		   unsigned int nlines, struct gpiohandle_data *data)
+{
+	int fd;
+	int ret;
+	int ret_close;
+
+	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+					   GPIOHANDLE_REQUEST_INPUT, data,
+					   COMSUMER);
+	if (ret < 0)
+		return ret;
+
+	fd = ret;
+	ret = gpiotools_get_values(fd, data);
+	ret_close = gpiotools_release_linehandle(fd);
+	return ret < 0 ? ret : ret_close;
+}
+
+/**
+ * gpiotools_set(): Set value to specific line
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0"
+ * @line:		number of line, such as 2.
+ * @value:		The value of gpio, must be 0(low) or 1(high).
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_set(const char *device_name, unsigned int line,
+		  unsigned int value)
+{
+	struct gpiohandle_data data;
+	unsigned int lines[] = {line};
+
+	data.values[0] = value;
+	return gpiotools_sets(device_name, lines, 1, &data);
+}
+
+/**
+ * gpiotools_sets(): Set values to specific lines.
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0".
+ * @lines:		An array desired lines, specified by offset
+ *			index for the associated GPIO device.
+ * @nline:		The number of lines to request.
+ * @data:		The array of values set to gpiochip, must be
+ *			0(low) or 1(high).
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_sets(const char *device_name, unsigned int *lines,
+		   unsigned int nlines, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+					   GPIOHANDLE_REQUEST_OUTPUT, data,
+					   COMSUMER);
+	if (ret < 0)
+		return ret;
+
+	return gpiotools_release_linehandle(ret);
+}
+
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index 5f57133..344ea04 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -24,4 +24,20 @@ static inline int check_prefix(const char *str, const char *prefix)
 		strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
+				 unsigned int nlines, unsigned int flag,
+				 struct gpiohandle_data *data,
+				 const char *consumer_label);
+int gpiotools_set_values(const int fd, struct gpiohandle_data *data);
+int gpiotools_get_values(const int fd, struct gpiohandle_data *data);
+int gpiotools_release_linehandle(const int fd);
+
+int gpiotools_get(const char *device_name, unsigned int line);
+int gpiotools_gets(const char *device_name, unsigned int *lines,
+		   unsigned int nlines, struct gpiohandle_data *data);
+int gpiotools_set(const char *device_name, unsigned int line,
+		  unsigned int value);
+int gpiotools_sets(const char *device_name, unsigned int *lines,
+		   unsigned int nlines, struct gpiohandle_data *data);
+
 #endif /* _GPIO_UTILS_H_ */
-- 
1.8.4.5

