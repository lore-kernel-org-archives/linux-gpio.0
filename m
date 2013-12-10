From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 1/2] SFI: store GPIO table and export lookup function
Date: Tue, 10 Dec 2013 15:21:19 +0200
Message-ID: <1386681680-18324-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:10351 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752968Ab3LJNVw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Dec 2013 08:21:52 -0500
In-Reply-To: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

We have to provide a mechanism to retrive GPIO information from SFI. For this
we store SFI GPIO table and provide the lookup function
sfi_gpio_get_entry_by_name() that will be used later in GPIO framework.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/sfi/Makefile   |   2 +-
 drivers/sfi/sfi_core.c |   6 +++
 drivers/sfi/sfi_core.h |   3 ++
 drivers/sfi/sfi_gpio.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/sfi.h    |  10 +++++
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/sfi/sfi_gpio.c

diff --git a/drivers/sfi/Makefile b/drivers/sfi/Makefile
index 2343732..dc011db 100644
--- a/drivers/sfi/Makefile
+++ b/drivers/sfi/Makefile
@@ -1,3 +1,3 @@
 obj-y	+= sfi_acpi.o
 obj-y	+= sfi_core.o
-
+obj-y	+= sfi_gpio.o
diff --git a/drivers/sfi/sfi_core.c b/drivers/sfi/sfi_core.c
index 296db7a..e9ff6f0 100644
--- a/drivers/sfi/sfi_core.c
+++ b/drivers/sfi/sfi_core.c
@@ -512,6 +512,12 @@ void __init sfi_init_late(void)
 	syst_va = sfi_map_memory(syst_pa, length);
 
 	sfi_acpi_init();
+
+	/*
+	 * Parsing GPIO table first, since the DEVS table will need this table
+	 * to map the pin name to the actual pin.
+	 */
+	sfi_gpio_init();
 }
 
 /*
diff --git a/drivers/sfi/sfi_core.h b/drivers/sfi/sfi_core.h
index 1d5cfe8..18c663d 100644
--- a/drivers/sfi/sfi_core.h
+++ b/drivers/sfi/sfi_core.h
@@ -79,3 +79,6 @@ struct sfi_table_header *sfi_get_table(struct sfi_table_key *key);
 extern void sfi_put_table(struct sfi_table_header *table);
 extern struct sfi_table_attr __init *sfi_sysfs_install_table(u64 pa);
 extern void __init sfi_acpi_sysfs_init(void);
+
+/* sfi_gpio.c */
+int sfi_gpio_init(void);
diff --git a/drivers/sfi/sfi_gpio.c b/drivers/sfi/sfi_gpio.c
new file mode 100644
index 0000000..7b2f362
--- /dev/null
+++ b/drivers/sfi/sfi_gpio.c
@@ -0,0 +1,115 @@
+/* sfi_gpio.c Simple Firmware Interface - GPIO extensions */
+
+/*
+
+  This file is provided under a dual BSD/GPLv2 license.  When using or
+  redistributing this file, you may do so under either license.
+
+  GPL LICENSE SUMMARY
+
+  Copyright(c) 2013 Intel Corporation. All rights reserved.
+
+  This program is free software; you can redistribute it and/or modify
+  it under the terms of version 2 of the GNU General Public License as
+  published by the Free Software Foundation.
+
+  This program is distributed in the hope that it will be useful, but
+  WITHOUT ANY WARRANTY; without even the implied warranty of
+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  General Public License for more details.
+
+  BSD LICENSE
+
+  Copyright(c) 2013 Intel Corporation. All rights reserved.
+
+  Redistribution and use in source and binary forms, with or without
+  modification, are permitted provided that the following conditions
+  are met:
+
+    * Redistributions of source code must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+    * Redistributions in binary form must reproduce the above copyright
+      notice, this list of conditions and the following disclaimer in
+      the documentation and/or other materials provided with the
+      distribution.
+    * Neither the name of Intel Corporation nor the names of its
+      contributors may be used to endorse or promote products derived
+      from this software without specific prior written permission.
+
+  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+*/
+
+#define KMSG_COMPONENT "SFI"
+#define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/export.h>
+#include <linux/sfi.h>
+
+#include "sfi_core.h"
+
+static struct sfi_gpio_table_entry *sfi_gpio_table;
+static int sfi_gpio_num_entry;
+
+struct sfi_gpio_table_entry *sfi_gpio_get_entry_by_name(const char *name)
+{
+	struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
+	int i;
+
+	if (!pentry)
+		return ERR_PTR(-EAGAIN);
+
+	for (i = 0; i < sfi_gpio_num_entry; i++, pentry++) {
+		if (!strncmp(name, pentry->pin_name, SFI_NAME_LEN))
+			return pentry;
+	}
+
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_GPL(sfi_gpio_get_entry_by_name);
+
+static int __init sfi_gpio_parse(struct sfi_table_header *table)
+{
+	struct sfi_table_simple *sb;
+	struct sfi_gpio_table_entry *pentry;
+	int num, i;
+
+	sb = container_of(table, struct sfi_table_simple, header);
+
+	num = SFI_GET_NUM_ENTRIES(sb, struct sfi_gpio_table_entry);
+	pentry = (struct sfi_gpio_table_entry *)sb->pentry;
+
+	sfi_gpio_table = kmemdup(pentry, num * sizeof(*pentry), GFP_KERNEL);
+	if (!sfi_gpio_table)
+		return -ENOMEM;
+
+	sfi_gpio_num_entry = num;
+
+	pr_debug("GPIO pin info:\n");
+	for (i = 0; i < num; i++, pentry++)
+		pr_debug("GPIO [%2d] chip = %16.16s, name = %16.16s, pin=%d\n",
+			 i, pentry->controller_name, pentry->pin_name,
+			 pentry->pin_no);
+
+	return 0;
+}
+
+int __init sfi_gpio_init(void)
+{
+	return sfi_table_parse(SFI_SIG_GPIO, NULL, NULL, sfi_gpio_parse);
+}
diff --git a/include/linux/sfi.h b/include/linux/sfi.h
index d9b436f..4a9432f 100644
--- a/include/linux/sfi.h
+++ b/include/linux/sfi.h
@@ -61,6 +61,8 @@
 
 #include <linux/init.h>
 #include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/err.h>
 
 /* Table signatures reserved by the SFI specification */
 #define SFI_SIG_SYST		"SYST"
@@ -185,6 +187,8 @@ static inline void disable_sfi(void)
 	sfi_disabled = 1;
 }
 
+struct sfi_gpio_table_entry *sfi_gpio_get_entry_by_name(const char *name);
+
 #else /* !CONFIG_SFI */
 
 static inline void sfi_init(void)
@@ -204,6 +208,12 @@ static inline int sfi_table_parse(char *signature, char *oem_id,
 	return -1;
 }
 
+static inline
+struct sfi_gpio_table_entry *sfi_gpio_get_entry_by_name(const char *name)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 #endif /* !CONFIG_SFI */
 
 #endif /*_LINUX_SFI_H*/
-- 
1.8.4.4

