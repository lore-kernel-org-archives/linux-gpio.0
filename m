From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 2/2] gpiolib: append SFI helpers for GPIO API
Date: Mon,  9 Dec 2013 16:47:01 +0200
Message-ID: <1386600421-16463-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:18806 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755805Ab3LIOrf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 09:47:35 -0500
In-Reply-To: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

To support some (legacy) firmwares and platforms let's make life easier for
their customers.

This patch provides a function which converts sfi_gpio_table_entry to
gpio_desc. The use of it is integrated into GPIO library to enable generic
access to the SFI GPIO resources.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig       |  4 ++++
 drivers/gpio/Makefile      |  1 +
 drivers/gpio/gpiolib-sfi.c | 27 +++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c     |  3 +++
 drivers/gpio/gpiolib.h     | 13 +++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 drivers/gpio/gpiolib-sfi.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae3682d..a12752a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -51,6 +51,10 @@ config OF_GPIO
 	def_bool y
 	depends on OF
 
+config GPIO_SFI
+	def_bool y
+	depends on SFI
+
 config GPIO_ACPI
 	def_bool y
 	depends on ACPI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ee95154..5373e3a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -5,6 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 obj-$(CONFIG_GPIO_DEVRES)	+= devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
+obj-$(CONFIG_GPIO_SFI)		+= gpiolib-sfi.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
 # Device drivers. Generally keep list sorted alphabetically
diff --git a/drivers/gpio/gpiolib-sfi.c b/drivers/gpio/gpiolib-sfi.c
new file mode 100644
index 0000000..7531624
--- /dev/null
+++ b/drivers/gpio/gpiolib-sfi.c
@@ -0,0 +1,27 @@
+/*
+ * Simple Firmware Interface (SFI) helpers for GPIO API
+ *
+ * Copyright (C) 2013, Intel Corporation
+ * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/sfi.h>
+#include <linux/err.h>
+
+#include "gpiolib.h"
+
+struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
+{
+	struct sfi_gpio_table_entry *pentry;
+
+	pentry = sfi_gpio_get_entry_by_name(name);
+	if (IS_ERR(pentry))
+		return ERR_CAST(pentry);
+
+	return gpio_to_desc(pentry->pin_no);
+}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d2ffdfe..7575c51 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2452,6 +2452,9 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	} else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev)) {
 		dev_dbg(dev, "using ACPI for GPIO lookup\n");
 		desc = acpi_find_gpio(dev, con_id, idx, &flags);
+	} else if (IS_ENABLED(CONFIG_SFI)) {
+		dev_dbg(dev, "using SFI for GPIO lookup\n");
+		desc = sfi_get_gpiod_by_name(con_id);
 	}
 
 	/*
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 82be586..ca0615a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -43,4 +43,17 @@ acpi_get_gpiod_by_index(struct device *dev, int index,
 }
 #endif
 
+#ifdef CONFIG_GPIO_SFI
+
+struct gpio_desc *sfi_get_gpiod_by_name(const char *name);
+
+#else /* !CONFIG_GPIO_SFI */
+
+static inline struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+#endif /* !CONFIG_GPIO_SFI */
+
 #endif /* GPIOLIB_H */
-- 
1.8.4.4

