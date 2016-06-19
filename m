From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/2] tools/gpio: move to tools buildsystem
Date: Sun, 19 Jun 2016 23:41:11 +0300
Message-ID: <1466368872-99495-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:47611 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751604AbcFSUlQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 16:41:16 -0400
In-Reply-To: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is a nice buildsystem dedicated for userspace tools in Linux kernel tree.
Switch gpio target to be built by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/gpio/Build    |  3 +++
 tools/gpio/Makefile | 69 ++++++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 64 insertions(+), 8 deletions(-)
 create mode 100644 tools/gpio/Build

diff --git a/tools/gpio/Build b/tools/gpio/Build
new file mode 100644
index 0000000..620c1937
--- /dev/null
+++ b/tools/gpio/Build
@@ -0,0 +1,3 @@
+lsgpio-y += lsgpio.o gpio-utils.o
+gpio-hammer-y += gpio-hammer.o gpio-utils.o
+gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 619314f..5a82f15 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,14 +1,67 @@
+include ../scripts/Makefile.include
+
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Do not use make's built-in rules
+# (this improves performance and avoids hard-to-debug behaviour);
+MAKEFLAGS += -r
+
 CC = $(CROSS_COMPILE)gcc
-CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
+LD = $(CROSS_COMPILE)ld
+CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+
+ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
+ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
+
+all: $(ALL_PROGRAMS)
 
-all: lsgpio gpio-hammer gpio-event-mon
+export srctree OUTPUT CC LD CFLAGS
+include $(srctree)/tools/build/Makefile.include
 
-lsgpio: lsgpio.o gpio-utils.o
-gpio-hammer: gpio-hammer.o gpio-utils.o
-gpio-event-mon: gpio-event-mon.o gpio-utils.o
+#
+# We need the following to be outside of kernel tree
+#
+$(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux/gpio.h
+	mkdir -p $(OUTPUT)include/linux 2>&1 || true
+	ln -sf $(CURDIR)/../../include/uapi/linux/gpio.h $@
 
-%.o: %.c gpio-utils.h
+prepare: $(OUTPUT)include/linux/gpio.h
+
+#
+# lsgpio
+#
+LSGPIO_IN := $(OUTPUT)lsgpio-in.o
+$(LSGPIO_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=lsgpio
+$(OUTPUT)lsgpio: $(LSGPIO_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+#
+# gpio-hammer
+#
+GPIO_HAMMER_IN := $(OUTPUT)gpio-hammer-in.o
+$(GPIO_HAMMER_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=gpio-hammer
+$(OUTPUT)gpio-hammer: $(GPIO_HAMMER_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+#
+# gpio-event-mon
+#
+GPIO_EVENT_MON_IN := $(OUTPUT)gpio-event-mon-in.o
+$(GPIO_EVENT_MON_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=gpio-event-mon
+$(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
 
-.PHONY: clean
 clean:
-	rm -f *.o lsgpio gpio-hammer gpio-event-mon
+	rm -f $(ALL_PROGRAMS)
+	rm -f $(OUTPUT)include/linux/gpio.h
+	find $(if $(OUTPUT),$(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+
+FORCE:
+
+.PHONY: all clean FORCE prepare
-- 
2.8.1

