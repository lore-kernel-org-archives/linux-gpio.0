From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Subject: [PATCH] tools/gpio: add gpio util to get or set gpio lines
Date: Mon, 24 Jul 2017 16:32:18 +0200
Message-ID: <20170724143218.8510-1-mnhu@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail02.prevas.se ([62.95.78.10]:24892 "EHLO mail02.prevas.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753413AbdGXOm2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jul 2017 10:42:28 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>, linux-gpio@vger.kernel.org

Add a new tool to set or get the value of one or more gpio lines, which
can as either chip offsets or line names. This makes it easier to
control gpio lines from user space without using the cumbersome sysfs
interface. It also demostrates how gpio-line-names can be used to
decouple software from hardware layout.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 tools/gpio/.gitignore |   2 +-
 tools/gpio/Build      |   1 +
 tools/gpio/Makefile   |  11 ++-
 tools/gpio/gpio.c     | 261 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+), 2 deletions(-)
 create mode 100644 tools/gpio/gpio.c

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index 9e9dd4b681b2..1039ed454be6 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,4 @@
 gpio-event-mon
 gpio-hammer
 lsgpio
-
+gpio
diff --git a/tools/gpio/Build b/tools/gpio/Build
index 620c1937d957..6692741538c8 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -1,3 +1,4 @@
+gpio-y += gpio.o gpio-utils.o
 lsgpio-y += lsgpio.o gpio-utils.o
 gpio-hammer-y += gpio-hammer.o gpio-utils.o
 gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index b4401536cfa9..77d35c2bf5ac 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -15,7 +15,7 @@ CC = $(CROSS_COMPILE)gcc
 LD = $(CROSS_COMPILE)ld
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
-ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
+ALL_TARGETS := gpio lsgpio gpio-hammer gpio-event-mon
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
 all: $(ALL_PROGRAMS)
@@ -33,6 +33,15 @@ $(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux/gpio.h
 prepare: $(OUTPUT)include/linux/gpio.h
 
 #
+# gpio
+#
+GPIO_IN := $(OUTPUT)gpio-in.o
+$(GPIO_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=gpio
+$(OUTPUT)gpio: $(GPIO_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+#
 # lsgpio
 #
 LSGPIO_IN := $(OUTPUT)lsgpio-in.o
diff --git a/tools/gpio/gpio.c b/tools/gpio/gpio.c
new file mode 100644
index 000000000000..7ab360a0a131
--- /dev/null
+++ b/tools/gpio/gpio.c
@@ -0,0 +1,261 @@
+/*
+ * lsgpio - example on how to list the GPIO lines on a system
+ *
+ * Copyright (C) 2015 Linus Walleij
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * Usage:
+ *	lsgpio <-n device-name>
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
+#include "gpio-utils.h"
+
+int print_offsets(const char *device_name, unsigned int *lines, int nlines)
+{
+	struct gpiohandle_data data;
+	int i, line, value, ret;
+
+	ret = gpiotools_gets(device_name, lines, nlines, &data);
+	if (ret)
+		return ret;
+
+	/* print value for each configured line */
+	printf("GPIO chip: %s\n", device_name);
+	for (i = 0; i < nlines; i++) {
+		line = lines[i];
+		value = data.values[line];
+		printf("\tline %i: %i\n", lines[i], value);
+	}
+
+	return ret;
+}
+
+int print_labels(const char *device_name, unsigned int *lines,
+		  const char *labels[], int nlabels)
+{
+	struct gpiohandle_data data;
+	int i, value, ret;
+	const char *label;
+
+	ret = gpiotools_gets(device_name, lines, nlabels, &data);
+	if (ret)
+		return ret;
+
+	/* print value for each configured label */
+	printf("GPIO chip: %s\n", device_name);
+	for (i = 0; i < nlabels; i++) {
+		label = labels[i];
+		value = data.values[i];
+		printf("\t%s: %i\n", label, value);
+	}
+
+	return ret;
+}
+
+int control_offsets(const char *device_name, unsigned int *lines, int nlines,
+		    int flags, int value)
+{
+	struct gpiohandle_data data = {{ value }};
+
+	if (flags & GPIOHANDLE_REQUEST_INPUT)
+		return print_offsets(device_name, lines, nlines);
+	else
+		return gpiotools_sets(device_name, lines, nlines, &data);
+}
+
+int control_labels(const char *device_name, const char *labels[], int nlabels,
+		   int flags, int value)
+{
+	struct gpiochip_info cinfo = {0};
+	char *chrdev_name = NULL;
+	unsigned int lines[GPIOHANDLES_MAX];
+	int nlines = 0;
+	int ret, fd, i, j;
+
+	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
+	if (ret < 0)
+		return -ENOMEM;
+
+	fd = open(chrdev_name, 0);
+	if (fd == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to open %s\n", chrdev_name);
+		goto exit_error;
+	}
+
+	/* Inspect this GPIO chip */
+	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
+	if (ret == -1) {
+		ret = -errno;
+		perror("Failed to issue CHIPINFO IOCTL\n");
+		goto exit_close_error;
+	}
+
+	/* Loop over the lines and match info */
+	for (i = 0; i < cinfo.lines; i++) {
+		struct gpioline_info linfo;
+
+		memset(&linfo, 0, sizeof(linfo));
+		linfo.line_offset = i;
+
+		ret = ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
+		if (ret == -1) {
+			ret = -errno;
+			perror("Failed to issue LINEINFO IOCTL\n");
+			goto exit_close_error;
+		}
+
+		/* Check if line name is included requested names */
+		for (j = 0; j < nlabels; j++) {
+			if (strcmp(linfo.name, labels[j]) == 0) {
+				lines[nlines++] = i;
+				break;
+			}
+		}
+	}
+
+	if (nlines == 0)
+		goto exit_close_error;
+
+	if (flags & GPIOHANDLE_REQUEST_INPUT) {
+		print_labels(device_name, lines, labels, nlabels);
+	} else {
+		struct gpiohandle_data data = {{ value }};
+		ret = gpiotools_sets(device_name, lines, nlines, &data);
+	}
+
+exit_close_error:
+	if (fd >= 0 && close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+
+exit_error:
+	free(chrdev_name);
+
+	return ret;
+}
+
+void print_usage(void)
+{
+	fprintf(stderr, "Usage: gpio [options]... (input | output <value>)\n"
+		"List GPIO chips, lines and states\n"
+		"  -n <name>  Control GPIO(s) on a named device\n"
+		"  -o <n>     Offset[s] to control, at least one, several can be stated\n"
+		"  -l <label> Labeled line[s] to control, at least one, several can be stated\n"
+		"  -?         This helptext\n"
+		"  <value>    Should be either 0 or 1\n"
+	);
+}
+
+int main(int argc, char **argv)
+{
+	const char *device_name = NULL;
+	unsigned int lines[GPIOHANDLES_MAX];
+	const char *labels[GPIOHANDLES_MAX];
+	int nlines = 0;
+	int nlabels = 0;
+	int value = 0;
+	int ret = 0;
+	int flags;
+	int c;
+
+	while ((c = getopt(argc, argv, "n:o:l:")) != -1) {
+		switch (c) {
+		case 'n':
+			device_name = optarg;
+			break;
+		case 'o':
+			lines[nlines++] = strtoul(optarg, NULL, 10);
+			break;
+		case 'l':
+			labels[nlabels++] = optarg;
+			break;
+		case '?':
+			print_usage();
+			return -1;
+		}
+	}
+
+	/* User must give at least one positional argument */
+	if (optind >= argc) {
+		print_usage();
+		return -1;
+	}
+
+	/* Match on "input" or "output <value>" */
+	if (strcmp(argv[optind], "input") == 0) {
+		flags = GPIOHANDLE_REQUEST_INPUT;
+	} else if (strcmp(argv[optind], "output") == 0) {
+		flags = GPIOHANDLE_REQUEST_OUTPUT;
+		value = atoi(argv[++optind]);
+		/* Only boolean value is alowed */
+		if (value < 0 || value > 1) {
+			print_usage();
+			return -1;
+		}
+	} else {
+		print_usage();
+		return -1;
+	}
+
+	/* Numeric offsets must come together with a gpio chip name */
+	if (nlines != 0 && device_name == NULL) {
+		fprintf(stderr, "Option '-o' requires '-n'\n");
+		return -1;
+	}
+
+	/* At least one line or label must be given */
+	if (nlines == 0 && nlabels == 0) {
+		fprintf(stderr, "No lines or labels given\n");
+		return -1;
+	}
+
+	if (device_name) {
+		if (nlines)
+			ret += control_offsets(device_name, lines, nlines, flags, value);
+		if (nlabels)
+			ret += control_labels(device_name, labels, nlabels, flags, value);
+	} else {
+		const struct dirent *ent;
+		DIR *dp;
+
+		/* Control all GPIO devices one at a time */
+		dp = opendir("/dev");
+		if (!dp) {
+			ret = -errno;
+			goto error_out;
+		}
+
+		ret = -ENOENT;
+		while (ent = readdir(dp), ent) {
+			if (check_prefix(ent->d_name, "gpiochip")) {
+				ret += control_labels(ent->d_name, labels, nlabels, flags, value);
+				if (ret)
+					break;
+			}
+		}
+
+		ret = 0;
+		if (closedir(dp) == -1) {
+			perror("scanning devices: Failed to close directory");
+			ret = -errno;
+		}
+	}
+error_out:
+	return ret;
+}
-- 
2.13.3

