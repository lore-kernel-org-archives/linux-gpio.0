From: bamvor.zhangjian@linaro.org
Subject: [PATCH v3 2/5] tools/gpio: re-work gpio hammer with gpio operations
Date: Wed, 31 Aug 2016 11:45:45 +0200
Message-ID: <20160831094548.12574-3-bamvor.zhangjian@linaro.org>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:36020 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932779AbcHaJqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 05:46:11 -0400
Received: by mail-pf0-f182.google.com with SMTP id h186so17865472pfg.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 02:46:11 -0700 (PDT)
In-Reply-To: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 tools/gpio/gpio-hammer.c | 52 ++++++++++--------------------------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 37b3f14..14dd20c 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -23,49 +23,20 @@
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
-	int fd;
 	int ret;
 	int i, j;
 	unsigned int iteration = 0;
 
-	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
-	if (ret < 0)
-		return -ENOMEM;
-
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
-		goto exit_close_error;
-	}
-
-	/* Read initial states */
-	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-	if (ret == -1) {
-		ret = -errno;
+	/* Do not set input or output to avoid change direction or value */
+	ret = gpio_gets(device_name, lines, nlines, 0, &data);
+	if (ret < 0) {
 		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
 			"VALUES IOCTL (%d)\n",
 			ret);
@@ -92,18 +63,18 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 		for (i = 0; i < nlines; i++)
 			data.values[i] = !data.values[i];
 
-		ret = ioctl(req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
-		if (ret == -1) {
-			ret = -errno;
+		ret = gpio_sets(device_name, lines, nlines,
+				GPIOHANDLE_REQUEST_OUTPUT, &data);
+		if (ret < 0) {
 			fprintf(stderr, "Failed to issue GPIOHANDLE SET LINE "
 				"VALUES IOCTL (%d)\n",
 				ret);
 			goto exit_close_error;
 		}
 		/* Re-read values to get status */
-		ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-		if (ret == -1) {
-			ret = -errno;
+		ret = gpio_gets(device_name, lines, nlines,
+				GPIOHANDLE_REQUEST_OUTPUT, &data);
+		if (ret < 0) {
 			fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
 				"VALUES IOCTL (%d)\n",
 				ret);
@@ -132,9 +103,6 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	ret = 0;
 
 exit_close_error:
-	if (close(fd) == -1)
-		perror("Failed to close GPIO character device file");
-	free(chrdev_name);
 	return ret;
 }
 
-- 
1.8.4.5

