From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] tools: gpio: Print error string on IOCTL failures
Date: Thu, 28 Sep 2017 15:01:44 +0200
Message-ID: <1506603704-7527-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60732 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752933AbdI1NCd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2017 09:02:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-gpio@vger.kernel.org

Add to error messages the error description by concatenating
output of strerror() function to error messages print out by
gpio-utils.c on IOCTL failures.
Rationalize error messages, while at there, making all of them
look the same.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 tools/gpio/gpio-utils.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index b86a32d..cf7e2f3 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -76,7 +76,8 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 	fd = open(chrdev_name, 0);
 	if (fd == -1) {
 		ret = -errno;
-		fprintf(stderr, "Failed to open %s\n", chrdev_name);
+		fprintf(stderr, "Failed to open %s, %s\n",
+			chrdev_name, strerror(errno));
 		goto exit_close_error;
 	}

@@ -92,8 +93,8 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
 	if (ret == -1) {
 		ret = -errno;
-		fprintf(stderr, "Failed to issue GET LINEHANDLE IOCTL (%d)\n",
-			ret);
+		fprintf(stderr, "Failed to issue %s (%d), %s\n",
+			"GPIO_GET_LINEHANDLE_IOCTL", ret, strerror(errno));
 	}

 exit_close_error:
@@ -118,8 +119,9 @@ int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
 	ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
 	if (ret == -1) {
 		ret = -errno;
-		fprintf(stderr, "Failed to issue %s (%d)\n",
-			"GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
+		fprintf(stderr, "Failed to issue %s (%d), %s\n",
+			"GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret,
+			strerror(errno));
 	}

 	return ret;
@@ -141,8 +143,9 @@ int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
 	ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
 	if (ret == -1) {
 		ret = -errno;
-		fprintf(stderr, "Failed to issue %s (%d)\n",
-			"GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
+		fprintf(stderr, "Failed to issue %s (%d), %s\n",
+			"GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret,
+			strerror(errno));
 	}

 	return ret;
--
2.7.4

