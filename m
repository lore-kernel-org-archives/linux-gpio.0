From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] tools/gpio: add the gpio-hammer tool
Date: Thu,  2 Jun 2016 13:51:27 +0200
Message-ID: <1464868289-1766-2-git-send-email-linus.walleij@linaro.org>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34616 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776AbcFBLvv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 07:51:51 -0400
Received: by mail-lf0-f45.google.com with SMTP id k98so32242499lfi.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 04:51:50 -0700 (PDT)
In-Reply-To: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

The gpio-hammer is used from userspace as an example of how
to retrieve a GPIO handle for one or several GPIO lines and
hammer the outputs from low to high and back again. It will
pulse the selected lines once per second for a specified
number of times or indefinitely if no loop count is
supplied.

Example output:
$ gpio-hammer -n gpiochip0 -o5 -o6 -o7
Hammer lines [5, 6, 7] on gpiochip0, initial states: [1, 1, 1]
[-] [5: 0, 6: 0, 7: 0]

Tested-by: Michael Welling <mwelling@ieee.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 tools/gpio/Makefile      |   5 +-
 tools/gpio/gpio-hammer.c | 189 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+), 2 deletions(-)
 create mode 100644 tools/gpio/gpio-hammer.c

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index c155d6bc47a7..aea23949054e 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,12 +1,13 @@
 CC = $(CROSS_COMPILE)gcc
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
 
-all: lsgpio
+all: lsgpio gpio-hammer
 
 lsgpio: lsgpio.o gpio-utils.o
+gpio-hammer: gpio-hammer.o gpio-utils.o
 
 %.o: %.c gpio-utils.h
 
 .PHONY: clean
 clean:
-	rm -f *.o lsgpio
+	rm -f *.o lsgpio gpio-hammer
diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
new file mode 100644
index 000000000000..37b3f141053d
--- /dev/null
+++ b/tools/gpio/gpio-hammer.c
@@ -0,0 +1,189 @@
+/*
+ * gpio-hammer - example swiss army knife to shake GPIO lines on a system
+ *
+ * Copyright (C) 2016 Linus Walleij
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * Usage:
+ *	gpio-hammer -n <device-name> -o <offset1> -o <offset2>
+ */
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <dirent.h>
+#include <errno.h>
+#include <string.h>
+#include <poll.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include <linux/gpio.h>
+
+int hammer_device(const char *device_name, unsigned int *lines, int nlines,
+		  unsigned int loops)
+{
+	struct gpiohandle_request req;
+	struct gpiohandle_data data;
+	char *chrdev_name;
+	char swirr[] = "-\\|/";
+	int fd;
+	int ret;
+	int i, j;
+	unsigned int iteration = 0;
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
+	/* Request lines as output */
+	for (i = 0; i < nlines; i++)
+		req.lineoffsets[i] = lines[i];
+	req.flags = GPIOHANDLE_REQUEST_OUTPUT; /* Request as output */
+	strcpy(req.consumer_label, "gpio-hammer");
+	req.lines = nlines;
+	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GET LINEHANDLE "
+			"IOCTL (%d)\n",
+			ret);
+		goto exit_close_error;
+	}
+
+	/* Read initial states */
+	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
+			"VALUES IOCTL (%d)\n",
+			ret);
+		goto exit_close_error;
+	}
+	fprintf(stdout, "Hammer lines [");
+	for (i = 0; i < nlines; i++) {
+		fprintf(stdout, "%d", lines[i]);
+		if (i != (nlines - 1))
+			fprintf(stdout, ", ");
+	}
+	fprintf(stdout, "] on %s, initial states: [", device_name);
+	for (i = 0; i < nlines; i++) {
+		fprintf(stdout, "%d", data.values[i]);
+		if (i != (nlines - 1))
+			fprintf(stdout, ", ");
+	}
+	fprintf(stdout, "]\n");
+
+	/* Hammertime! */
+	j = 0;
+	while (1) {
+		/* Invert all lines so we blink */
+		for (i = 0; i < nlines; i++)
+			data.values[i] = !data.values[i];
+
+		ret = ioctl(req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
+		if (ret == -1) {
+			ret = -errno;
+			fprintf(stderr, "Failed to issue GPIOHANDLE SET LINE "
+				"VALUES IOCTL (%d)\n",
+				ret);
+			goto exit_close_error;
+		}
+		/* Re-read values to get status */
+		ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
+		if (ret == -1) {
+			ret = -errno;
+			fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
+				"VALUES IOCTL (%d)\n",
+				ret);
+			goto exit_close_error;
+		}
+
+		fprintf(stdout, "[%c] ", swirr[j]);
+		j++;
+		if (j == sizeof(swirr)-1)
+			j = 0;
+
+		fprintf(stdout, "[");
+		for (i = 0; i < nlines; i++) {
+			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
+			if (i != (nlines - 1))
+				fprintf(stdout, ", ");
+		}
+		fprintf(stdout, "]\r");
+		fflush(stdout);
+		sleep(1);
+		iteration++;
+		if (loops && iteration == loops)
+			break;
+	}
+	fprintf(stdout, "\n");
+	ret = 0;
+
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+	free(chrdev_name);
+	return ret;
+}
+
+void print_usage(void)
+{
+	fprintf(stderr, "Usage: gpio-hammer [options]...\n"
+		"Hammer GPIO lines, 0->1->0->1...\n"
+		"  -n <name>  Hammer GPIOs on a named device (must be stated)\n"
+		"  -o <n>     Offset[s] to hammer, at least one, several can be stated\n"
+		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
+		"  -?         This helptext\n"
+		"\n"
+		"Example:\n"
+		"gpio-hammer -n gpiochip0 -o 4\n"
+	);
+}
+
+int main(int argc, char **argv)
+{
+	const char *device_name = NULL;
+	unsigned int lines[GPIOHANDLES_MAX];
+	unsigned int loops = 0;
+	int nlines;
+	int c;
+	int i;
+
+	i = 0;
+	while ((c = getopt(argc, argv, "c:n:o:?")) != -1) {
+		switch (c) {
+		case 'c':
+			loops = strtoul(optarg, NULL, 10);
+			break;
+		case 'n':
+			device_name = optarg;
+			break;
+		case 'o':
+			lines[i] = strtoul(optarg, NULL, 10);
+			i++;
+			break;
+		case '?':
+			print_usage();
+			return -1;
+		}
+	}
+	nlines = i;
+
+	if (!device_name || !nlines) {
+		print_usage();
+		return -1;
+	}
+	return hammer_device(device_name, lines, nlines, loops);
+}
-- 
2.4.11

