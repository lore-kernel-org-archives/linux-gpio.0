From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/2] tools/gpio: add install section
Date: Sun, 19 Jun 2016 23:41:12 +0300
Message-ID: <1466368872-99495-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:20869 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751579AbcFSUlQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 16:41:16 -0400
In-Reply-To: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Allow user to call install target.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/Makefile      |  7 ++++---
 tools/gpio/Makefile | 10 +++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index f10b64d8..daa8fb3 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -85,7 +85,7 @@ tmon: FORCE
 freefall: FORCE
 	$(call descend,laptop/$@)
 
-all: acpi cgroup cpupower hv firewire lguest \
+all: acpi cgroup cpupower gpio hv firewire lguest \
 		perf selftests turbostat usb \
 		virtio vm net x86_energy_perf_policy \
 		tmon freefall objtool
@@ -96,7 +96,7 @@ acpi_install:
 cpupower_install:
 	$(call descend,power/$(@:_install=),install)
 
-cgroup_install firewire_install hv_install lguest_install perf_install usb_install virtio_install vm_install net_install objtool_install:
+cgroup_install firewire_install gpio_install hv_install lguest_install perf_install usb_install virtio_install vm_install net_install objtool_install:
 	$(call descend,$(@:_install=),install)
 
 selftests_install:
@@ -114,7 +114,8 @@ freefall_install:
 kvm_stat_install:
 	$(call descend,kvm/$(@:_install=),install)
 
-install: acpi_install cgroup_install cpupower_install hv_install firewire_install lguest_install \
+install: acpi_install cgroup_install cpupower_install gpio_install \
+		hv_install firewire_install lguest_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install vm_install net_install x86_energy_perf_policy_install \
 		tmon_install freefall_install objtool_install kvm_stat_install
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 5a82f15..250a891 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,5 +1,7 @@
 include ../scripts/Makefile.include
 
+bindir ?= /usr/bin
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(shell pwd)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
@@ -62,6 +64,12 @@ clean:
 	rm -f $(OUTPUT)include/linux/gpio.h
 	find $(if $(OUTPUT),$(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
 
+install: $(ALL_PROGRAMS)
+	install -d -m 755 $(DESTDIR)$(bindir);		\
+	for program in $(ALL_PROGRAMS); do		\
+		install $$program $(DESTDIR)$(bindir);	\
+	done
+
 FORCE:
 
-.PHONY: all clean FORCE prepare
+.PHONY: all install clean FORCE prepare
-- 
2.8.1

