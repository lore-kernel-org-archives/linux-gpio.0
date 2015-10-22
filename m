From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/6] tools/gpio: create GPIO tools
Date: Thu, 22 Oct 2015 10:32:28 +0200
Message-ID: <1445502750-22672-5-git-send-email-linus.walleij@linaro.org>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33526 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756737AbbJVIdC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:33:02 -0400
Received: by lffv3 with SMTP id v3so39293211lff.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:33:00 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

This creates GPIO tools under tools/gpio/* and adds a single
example program to list the GPIOs on a system. When proper
devices are created it provides this minimal output:

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS             |   1 +
 tools/Makefile          |   7 +--
 tools/gpio/Makefile     |  12 +++++
 tools/gpio/gpio-utils.c |  11 +++++
 tools/gpio/gpio-utils.h |  25 ++++++++++
 tools/gpio/lsgpio.c     | 128 ++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 181 insertions(+), 3 deletions(-)
 create mode 100644 tools/gpio/Makefile
 create mode 100644 tools/gpio/gpio-utils.c
 create mode 100644 tools/gpio/gpio-utils.h
 create mode 100644 tools/gpio/lsgpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a12cd019511..3bb1f52d54e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4647,6 +4647,7 @@ F:	include/linux/gpio/
 F:	include/linux/gpio.h
 F:	include/asm-generic/gpio.h
 F:	include/uapi/linux/gpio.h
+F:	tools/gpio/
 
 GRE DEMULTIPLEXER DRIVER
 M:	Dmitry Kozlov <xeb@mail.ru>
diff --git a/tools/Makefile b/tools/Makefile
index d6f307dfb1a3..8912759247b5 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -12,6 +12,7 @@ help:
 	@echo '  cgroup     - cgroup tools'
 	@echo '  cpupower   - a tool for all things x86 CPU power'
 	@echo '  firewire   - the userspace part of nosy, an IEEE-1394 traffic sniffer'
+	@echo '  gpio       - GPIO tools'
 	@echo '  hv         - tools used when in Hyper-V clients'
 	@echo '  iio        - IIO tools'
 	@echo '  lguest     - a minimal 32-bit x86 hypervisor'
@@ -48,7 +49,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-cgroup firewire hv guest usb virtio vm net iio: FORCE
+cgroup firewire hv guest usb virtio vm net iio gpio: FORCE
 	$(call descend,$@)
 
 liblockdep: FORCE
@@ -109,7 +110,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-cgroup_clean hv_clean firewire_clean lguest_clean usb_clean virtio_clean vm_clean net_clean iio_clean:
+cgroup_clean hv_clean firewire_clean lguest_clean usb_clean virtio_clean vm_clean net_clean iio_clean gpio_clean:
 	$(call descend,$(@:_clean=),clean)
 
 liblockdep_clean:
@@ -136,6 +137,6 @@ freefall_clean:
 clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean lguest_clean \
 		perf_clean selftests_clean turbostat_clean usb_clean virtio_clean \
 		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
-		freefall_clean
+		freefall_clean gpio_clean
 
 .PHONY: FORCE
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
new file mode 100644
index 000000000000..4d198d5c4203
--- /dev/null
+++ b/tools/gpio/Makefile
@@ -0,0 +1,12 @@
+CC = $(CROSS_COMPILE)gcc
+CFLAGS += -Wall -g -D_GNU_SOURCE
+
+all: lsgpio
+
+lsgpio: lsgpio.o gpio-utils.o
+
+%.o: %.c gpio-utils.h
+
+.PHONY: clean
+clean:
+	rm -f *.o lsgpio
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
new file mode 100644
index 000000000000..8208718f2c99
--- /dev/null
+++ b/tools/gpio/gpio-utils.c
@@ -0,0 +1,11 @@
+/*
+ * GPIO tools - helpers library for the GPIO tools
+ *
+ * Copyright (C) 2015 Linus Walleij
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ */
+
+#include "gpio-utils.h"
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
new file mode 100644
index 000000000000..b18209a45ad3
--- /dev/null
+++ b/tools/gpio/gpio-utils.h
@@ -0,0 +1,25 @@
+/*
+ * GPIO tools - utility helpers library for the GPIO tools
+ *
+ * Copyright (C) 2015 Linus Walleij
+ *
+ * Portions copied from iio_utils and lssio:
+ * Copyright (c) 2010 Manuel Stahl <manuel.stahl@iis.fraunhofer.de>
+ * Copyright (c) 2008 Jonathan Cameron
+ * *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ */
+#ifndef _GPIO_UTILS_H_
+#define _GPIO_UTILS_H_
+
+#include <string.h>
+
+static inline int check_prefix(const char *str, const char *prefix)
+{
+	return strlen(str) > strlen(prefix) &&
+		strncmp(str, prefix, strlen(prefix)) == 0;
+}
+
+#endif /* _GPIO_UTILS_H_ */
diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
new file mode 100644
index 000000000000..4cfe29da279b
--- /dev/null
+++ b/tools/gpio/lsgpio.c
@@ -0,0 +1,128 @@
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
+int list_device(const char *device_name)
+{
+	struct gpiochip_info cinfo;
+	char *chrdev_name;
+	int fd;
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
+		goto free_chrdev_name;
+	}
+
+	/* Inspect this GPIO chip */
+	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to retrieve GPIO fd\n");
+		if (close(fd) == -1)
+			perror("Failed to close GPIO character device file");
+
+		goto free_chrdev_name;
+	}
+	fprintf(stdout, "GPIO chip: %s, %u GPIO lines\n",
+		cinfo.name, cinfo.lines);
+
+	if (close(fd) == -1)  {
+		ret = -errno;
+		goto free_chrdev_name;
+	}
+
+free_chrdev_name:
+	free(chrdev_name);
+
+	return ret;
+
+}
+
+void print_usage(void)
+{
+	fprintf(stderr, "Usage: lsgpio [options]...\n"
+		"List GPIO chips, lines and states\n"
+		"  -n <name>  List GPIOs on a named device\n"
+		"  -?         This helptext\n"
+	);
+}
+
+int main(int argc, char **argv)
+{
+	const char *device_name;
+	int ret;
+	int c;
+
+	while ((c = getopt(argc, argv, "n:")) != -1) {
+		switch (c) {
+		case 'n':
+			device_name = optarg;
+			break;
+		case '?':
+			print_usage();
+			return -1;
+		}
+	}
+
+	if (device_name)
+		ret = list_device(device_name);
+	else {
+		const struct dirent *ent;
+		DIR *dp;
+
+		/* List all GPIO devices one at a time */
+		dp = opendir("/dev");
+		if (!dp) {
+			ret = -errno;
+			goto error_out;
+		}
+
+		ret = -ENOENT;
+		while (ent = readdir(dp), ent) {
+			if (check_prefix(ent->d_name, "gpiochip")) {
+				ret = list_device(ent->d_name);
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
2.4.3

