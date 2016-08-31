From: bamvor.zhangjian@linaro.org
Subject: [PATCH v3 1/5] tools/gpio: add gpio basic opereations
Date: Wed, 31 Aug 2016 11:45:44 +0200
Message-ID: <20160831094548.12574-2-bamvor.zhangjian@linaro.org>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34881 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759075AbcHaJqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 05:46:10 -0400
Received: by mail-pf0-f172.google.com with SMTP id x72so17900191pfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 02:46:09 -0700 (PDT)
In-Reply-To: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Add basic gpio operations. User could get/set gpio value and/or flag for
specific gpio chardev.

Reference the "tools/testing/selftest/gpio/gpio-mockup-chardev.c" for
how to use it.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 tools/gpio/gpio-utils.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++
 tools/gpio/gpio-utils.h | 121 +++++++++++++++++++++++++++++++++++
 2 files changed, 284 insertions(+)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 8208718..3c0a35c 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -2,10 +2,173 @@
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
+int gpio_request(const char *device_name, unsigned int *lines,
+		 unsigned int nlines, unsigned int flag,
+		 struct gpiohandle_data *data, const char *consumer_label)
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
+		goto exit_close_error;
+	}
+
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+	free(chrdev_name);
+	return ret < 0 ? ret : req.fd;
+}
+
+int gpio_set_values(const int fd, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue %s (%d)\n",
+			"GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
+		goto exit_close_error;
+	}
+
+exit_close_error:
+	return ret;
+}
+
+int gpio_get_values(const int fd, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue %s (%d)\n",
+			"GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
+		goto exit_close_error;
+	}
+
+exit_close_error:
+	return ret;
+}
+
+int gpio_release(const int fd)
+{
+	int ret;
+
+	ret = close(fd);
+	if (ret < -1)
+		perror("Failed to close GPIO LINEHANDLE device file");
+
+	return ret;
+}
+
+int gpio_gets(const char *device_name, unsigned int *lines, unsigned int nlines,
+	      unsigned int flag, struct gpiohandle_data *data)
+{
+	int fd;
+	int ret;
+
+	ret = gpio_request(device_name, lines, nlines, flag, data, COMSUMER);
+	if (ret < 0)
+		return ret;
+
+	fd = ret;
+	ret = gpio_get_values(fd, data);
+	ret = gpio_release(fd);
+	return ret;
+}
+
+int gpio_sets(const char *device_name, unsigned int *lines, unsigned int nlines,
+	      unsigned int flag, struct gpiohandle_data *data)
+{
+	int ret;
+
+	ret = gpio_request(device_name, lines, nlines, flag, data, COMSUMER);
+	if (ret < 0)
+		return ret;
+
+	ret = gpio_release(ret);
+	return ret;
+}
+
+int gpio_get(const char *device_name, unsigned int line, unsigned int flag)
+{
+	struct gpiohandle_data data;
+	unsigned int lines[] = {line};
+
+	gpio_gets(device_name, lines, 1, flag, &data);
+	return data.values[0];
+}
+
+int gpio_set(const char *device_name, unsigned int line, unsigned int flag,
+	     unsigned int value)
+{
+	struct gpiohandle_data data;
+	unsigned int lines[] = {line};
+
+	data.values[0] = value;
+	return gpio_sets(device_name, lines, 1, flag, &data);
+}
+
+int gpio_set_flag(const char *device_name, unsigned int line, unsigned int flag)
+{
+	struct gpiohandle_data data;
+	unsigned int lines[] = {line};
+	int ret;
+
+	ret = gpio_request(device_name, lines, 1, flag, &data, COMSUMER);
+	if (ret < 0)
+		return ret;
+
+	ret = gpio_release(ret);
+	return ret;
+}
+
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index 5f57133..fcf87b6 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -24,4 +24,125 @@ static inline int check_prefix(const char *str, const char *prefix)
 		strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+/* Basic operation of gpio */
+/*
+ * Request the lines for gpio with device_name. Could set the default value
+ * in request.
+ * device_name:    the name of gpiochip in "/dev", such as gpiochip0.
+ * lines:	   the array of which line should be requested.
+ * nline:          the total number of line
+ * flag:           input, output and so on. Reference "linux/gpio.h" for the
+ *                 meaning for flag.
+ * data:	   default value when flag is GPIOHANDLE_REQUEST_OUTPUT.
+ * consumer_label: the name of consumer, such as "sysfs", "powerkey".
+ *
+ * Return value:   On success return the fd of specific gpiochip. It could be
+ *                 release by gpio_release.
+ *		   On failure return the errno.
+ */
+int gpio_request(const char *device_name, unsigned int *lines,
+		 unsigned int nlines, unsigned int flag,
+		 struct gpiohandle_data *data, const char *consumer_label);
+/*
+ * Set the value of gpio for fd
+ * fd:             the fd returned by gpio_request
+ * data:	   the value want to set
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_set_values(const int fd, struct gpiohandle_data *data);
+
+/*
+ * Get the value of gpio for fd
+ * fd:             the fd returned by gpio_request
+ * data:	   the valud get from gpiochip.
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_get_values(const int fd, struct gpiohandle_data *data);
+
+/*
+ * release the fd for gpiochip
+ */
+int gpio_release(const int fd);
+
+/* Easy operation for one time get/set */
+/*
+ * Get one pin value from line of device_name. Could change the flag if
+ * necessary.
+ * device_name: the name of gpiochip in "/dev", such as gpiochip0.
+ * line:        number of line, such as 2.
+ * flag:        input, output and so on. Reference "linux/gpio.h" for the
+ *              meaning for flag. Set to 0 if do not want to update the
+ *              flag. It is the recommandation value.
+ *
+ * Return value:   On success return the value get from gpiochip.
+ *		   On failure return the errno.
+ */
+int gpio_get(const char *device_name, unsigned int line, unsigned int flag);
+
+/*
+ * Get pins value from line of device_name. Could change the flag if
+ * necessary.
+ * device_name: the name of gpiochip in "/dev", such as gpiochip0.
+ * lines:	   the array of which line should be requested.
+ * nline:          the total number of line
+ * flag:           input, output and so on. Reference "linux/gpio.h" for the
+ *                 meaning for flag.
+ * data:	   the valud get from gpiochip.
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_gets(const char *device_name, unsigned int *lines, unsigned int nlines,
+	      unsigned int flag, struct gpiohandle_data *data);
+
+/*
+ * Set one pin value from line of device_name. Could change the flag if
+ * necessary.
+ * device_name: the name of gpiochip in "/dev", such as gpiochip0.
+ * line:        number of line, such as 2.
+ * flag:        input, output and so on. Reference "linux/gpio.h" for the
+ *              meaning for flag. Set to 0 if do not want to update the
+ *              flag. It is the recommandation value.
+ * value:	the value want to set the gpio line.
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_set(const char *device_name, unsigned int line, unsigned int flag,
+	     unsigned int value);
+
+/*
+ * Set pins value from line of device_name. Could change the flag if
+ * necessary.
+ * device_name: the name of gpiochip in "/dev", such as gpiochip0.
+ * lines:	   the array of which line should be requested.
+ * nline:          the total number of line
+ * flag:           input, output and so on. Reference "linux/gpio.h" for the
+ *                 meaning for flag.
+ * data:	   the value want to set
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_sets(const char *device_name, unsigned int *lines, unsigned int nlines,
+	      unsigned int flag, struct gpiohandle_data *data);
+
+/*
+ * set the flag for device_name. Mainly for changing the direction of gpio
+ *
+ * device_name: the name of gpiochip in "/dev", such as gpiochip0.
+ * line:        number of line, such as 2.
+ * flag:        input, output and so on. Reference "linux/gpio.h" for the
+ *              meaning for flag.
+ *
+ * Return value:   On success return 0
+ *		   On failure return the errno.
+ */
+int gpio_set_flag(const char *device_name, unsigned int line,
+		  unsigned int flag);
+
 #endif /* _GPIO_UTILS_H_ */
-- 
1.8.4.5

