From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: intel-mid: Sort header block alphabetically
Date: Wed,  6 Jul 2016 12:50:13 +0300
Message-ID: <1467798613-70389-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:29938 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752644AbcGFJuS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Jul 2016 05:50:18 -0400
In-Reply-To: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sort the header inclusion lines by alphabetical order.

While here, update Intel Copyright.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-intel-mid.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index c0f7cce..164de64 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -1,7 +1,7 @@
 /*
  * Intel MID GPIO driver
  *
- * Copyright (c) 2008-2014 Intel Corporation.
+ * Copyright (c) 2008-2014,2016 Intel Corporation.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -19,18 +19,18 @@
  * Clovertrail platform Cloverview chip.
  */
 
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/stddef.h>
-#include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
-#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
 
 #define INTEL_MID_IRQ_TYPE_EDGE		(1 << 0)
 #define INTEL_MID_IRQ_TYPE_LEVEL	(1 << 1)
-- 
2.8.1

