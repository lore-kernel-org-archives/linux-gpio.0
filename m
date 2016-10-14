From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Subject: [PATCH v4 2/3] tools/gpio: re-work gpio hammer with gpio operations
Date: Fri, 14 Oct 2016 10:48:26 +0800
Message-ID: <1476413307-1397-3-git-send-email-bamvor.zhangjian@huawei.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:18620 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753767AbcJNCpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2016 22:45:34 -0400
In-Reply-To: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, broonie@kernel.org, mwelling@ieee.org, shuahkh@osg.samsung.com

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 tools/gpio/gpio-hammer.c | 67 ++++++++++++------------------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 37b3f14..f1eab58 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -23,54 +23,31 @@
 #include <getopt.h>
 #include <sys/ioctl.h>
 #include <linux/gpio.h>
+#include "gpio-utils.h"
 
 int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 		  unsigned int loops)
 {
-	struct gpiohandle_request req;
 	struct gpiohandle_data data;
-	char *chrdev_name;
 	char swirr[] = "-\\|/";
 	int fd;
 	int ret;
 	int i, j;
 	unsigned int iteration = 0;
 
-	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
+	memset(&data.values, 0, sizeof(data.values));
+	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+					   GPIOHANDLE_REQUEST_OUTPUT, &data,
+					   "gpio-hammler");
 	if (ret < 0)
-		return -ENOMEM;
+		goto exit_error;
+	else
+		fd = ret;
 
-	fd = open(chrdev_name, 0);
-	if (fd == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto exit_close_error;
-	}
-
-	/* Request lines as output */
-	for (i = 0; i < nlines; i++)
-		req.lineoffsets[i] = lines[i];
-	req.flags = GPIOHANDLE_REQUEST_OUTPUT; /* Request as output */
-	strcpy(req.consumer_label, "gpio-hammer");
-	req.lines = nlines;
-	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GET LINEHANDLE "
-			"IOCTL (%d)\n",
-			ret);
+	ret = gpiotools_get_values(fd, &data);
+	if (ret < 0)
 		goto exit_close_error;
-	}
 
-	/* Read initial states */
-	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
-			"VALUES IOCTL (%d)\n",
-			ret);
-		goto exit_close_error;
-	}
 	fprintf(stdout, "Hammer lines [");
 	for (i = 0; i < nlines; i++) {
 		fprintf(stdout, "%d", lines[i]);
@@ -92,23 +69,14 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 		for (i = 0; i < nlines; i++)
 			data.values[i] = !data.values[i];
 
-		ret = ioctl(req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
-		if (ret == -1) {
-			ret = -errno;
-			fprintf(stderr, "Failed to issue GPIOHANDLE SET LINE "
-				"VALUES IOCTL (%d)\n",
-				ret);
+		ret = gpiotools_set_values(fd, &data);
+		if (ret < 0)
 			goto exit_close_error;
-		}
+
 		/* Re-read values to get status */
-		ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-		if (ret == -1) {
-			ret = -errno;
-			fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
-				"VALUES IOCTL (%d)\n",
-				ret);
+		ret = gpiotools_get_values(fd, &data);
+		if (ret < 0)
 			goto exit_close_error;
-		}
 
 		fprintf(stdout, "[%c] ", swirr[j]);
 		j++;
@@ -132,9 +100,8 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	ret = 0;
 
 exit_close_error:
-	if (close(fd) == -1)
-		perror("Failed to close GPIO character device file");
-	free(chrdev_name);
+	gpiotools_release_linehandle(fd);
+exit_error:
 	return ret;
 }
 
-- 
1.8.4.5

