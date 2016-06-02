From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] tools/gpio: add the gpio-event-mon tool
Date: Thu,  2 Jun 2016 13:51:29 +0200
Message-ID: <1464868289-1766-4-git-send-email-linus.walleij@linaro.org>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34654 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbcFBLv5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 07:51:57 -0400
Received: by mail-lf0-f50.google.com with SMTP id k98so32244128lfi.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 04:51:56 -0700 (PDT)
In-Reply-To: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

The gpio-event-mon is used from userspace as an example of how
to monitor GPIO line events. It will latch on to a certain
GPIO line on a certain gpiochip and print timestamped events
as they arrive.

Example output:
$ gpio-event-mon -n gpiochip2 -o 0 -r -f
Monitoring line 0 on gpiochip2
Initial line value: 1
GPIO EVENT 946685798487609863: falling edge
GPIO EVENT 946685798732482910: rising edge
GPIO EVENT 946685799115997314: falling edge
GPIO EVENT 946685799381469726: rising edge

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 tools/gpio/Makefile         |   5 +-
 tools/gpio/gpio-event-mon.c | 192 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 tools/gpio/gpio-event-mon.c

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index aea23949054e..619314ff9bd6 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,13 +1,14 @@
 CC = $(CROSS_COMPILE)gcc
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
 
-all: lsgpio gpio-hammer
+all: lsgpio gpio-hammer gpio-event-mon
 
 lsgpio: lsgpio.o gpio-utils.o
 gpio-hammer: gpio-hammer.o gpio-utils.o
+gpio-event-mon: gpio-event-mon.o gpio-utils.o
 
 %.o: %.c gpio-utils.h
 
 .PHONY: clean
 clean:
-	rm -f *.o lsgpio gpio-hammer
+	rm -f *.o lsgpio gpio-hammer gpio-event-mon
diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
new file mode 100644
index 000000000000..448ed96b3b4f
--- /dev/null
+++ b/tools/gpio/gpio-event-mon.c
@@ -0,0 +1,192 @@
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
+ *	gpio-event-mon -n <device-name> -o <offset>
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
+#include <inttypes.h>
+#include <sys/ioctl.h>
+#include <linux/gpio.h>
+
+int monitor_device(const char *device_name,
+		   unsigned int line,
+		   u_int32_t handleflags,
+		   u_int32_t eventflags,
+		   unsigned int loops)
+{
+	struct gpioevent_request req;
+	struct gpiohandle_data data;
+	char *chrdev_name;
+	int fd;
+	int ret;
+	int i = 0;
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
+	req.lineoffset = line;
+	req.handleflags = handleflags;
+	req.eventflags = eventflags;
+	strcpy(req.consumer_label, "gpio-event-mon");
+
+	ret = ioctl(fd, GPIO_GET_LINEEVENT_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GET EVENT "
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
+
+	fprintf(stdout, "Monitoring line %d on %s\n", line, device_name);
+	fprintf(stdout, "Initial line value: %d\n", data.values[0]);
+
+	while (1) {
+		struct gpioevent_data event;
+
+		ret = read(req.fd, &event, sizeof(event));
+		if (ret == -1) {
+			if (errno == -EAGAIN) {
+				fprintf(stderr, "nothing available\n");
+				continue;
+			} else {
+				ret = -errno;
+				fprintf(stderr, "Failed to read event (%d)\n",
+					ret);
+				break;
+			}
+		}
+
+		if (ret != sizeof(event)) {
+			fprintf(stderr, "Reading event failed\n");
+			ret = -EIO;
+			break;
+		}
+		fprintf(stdout, "GPIO EVENT %" PRIu64 ": ", event.timestamp);
+		switch (event.id) {
+		case GPIOEVENT_EVENT_RISING_EDGE:
+			fprintf(stdout, "rising edge");
+			break;
+		case GPIOEVENT_EVENT_FALLING_EDGE:
+			fprintf(stdout, "falling edge");
+			break;
+		default:
+			fprintf(stdout, "unknown event");
+		}
+		fprintf(stdout, "\n");
+
+		i++;
+		if (i == loops)
+			break;
+	}
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
+	fprintf(stderr, "Usage: gpio-event-mon [options]...\n"
+		"Listen to events on GPIO lines, 0->1 1->0\n"
+		"  -n <name>  Listen on GPIOs on a named device (must be stated)\n"
+		"  -o <n>     Offset to monitor\n"
+		"  -d         Set line as open drain\n"
+		"  -s         Set line as open source\n"
+		"  -r         Listen for rising edges\n"
+		"  -f         Listen for falling edges\n"
+		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
+		"  -?         This helptext\n"
+		"\n"
+		"Example:\n"
+		"gpio-event-mon -n gpiochip0 -o 4 -r -f\n"
+	);
+}
+
+int main(int argc, char **argv)
+{
+	const char *device_name = NULL;
+	unsigned int line = -1;
+	unsigned int loops = 0;
+	u_int32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
+	u_int32_t eventflags = 0;
+	int c;
+
+	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+		switch (c) {
+		case 'c':
+			loops = strtoul(optarg, NULL, 10);
+			break;
+		case 'n':
+			device_name = optarg;
+			break;
+		case 'o':
+			line = strtoul(optarg, NULL, 10);
+			break;
+		case 'd':
+			handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+			break;
+		case 's':
+			handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+			break;
+		case 'r':
+			eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
+			break;
+		case 'f':
+			eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
+			break;
+		case '?':
+			print_usage();
+			return -1;
+		}
+	}
+
+	if (!device_name || line == -1) {
+		print_usage();
+		return -1;
+	}
+	if (!eventflags) {
+		printf("No flags specified, listening on both rising and "
+		       "falling edges\n");
+		eventflags = GPIOEVENT_REQUEST_BOTH_EDGES;
+	}
+	return monitor_device(device_name, line, handleflags,
+			      eventflags, loops);
+}
-- 
2.4.11

