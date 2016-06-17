From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] tools/gpio: add install section
Date: Fri, 17 Jun 2016 21:24:22 +0300
Message-ID: <1466187862-71801-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1466187862-71801-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:41525 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932106AbcFQSYd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jun 2016 14:24:33 -0400
In-Reply-To: <1466187862-71801-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Allow user to call install target.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/Makefile      | 7 ++++---
 tools/gpio/Makefile | 8 +++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

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
index 5ea607c..74d739c 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -72,6 +72,12 @@ clean:
 	$(Q)rm -f $(OUTPUT)include/linux/gpio.h
 	$(Q)find $(if $(OUTPUT),$(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
 
+install: $(ALL_PROGRAMS)
+	$(Q)install -d -m 755 $(DESTDIR)$(bindir);		\
+	$(Q)for program in $(ALL_PROGRAMS); do			\
+		$(Q)install $$program $(DESTDIR)$(bindir);	\
+	done
+
 FORCE:
 
-.PHONY: all clean FORCE prepare
+.PHONY: all install clean FORCE prepare
-- 
2.8.1

