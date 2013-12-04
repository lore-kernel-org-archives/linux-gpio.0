From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] gpiolib: convert gpiod_lookup description to kernel-doc
Date: Wed,  4 Dec 2013 15:42:58 +0200
Message-ID: <1386164580-32288-4-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:28590 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932467Ab3LDNnf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Dec 2013 08:43:35 -0500
In-Reply-To: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The patch moves description of the fields to the top of struct definition and
converts them to the kernel-doc format.

There is no functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
 include/linux/gpio/driver.h | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 7193f43..64f2c38 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -136,29 +136,21 @@ enum gpio_lookup_flags {
 };
 
 /**
- * Lookup table for associating GPIOs to specific devices and functions using
- * platform data.
+ * struct gpiod_lookup - lookup table
+ * @chip_label: name of the chip the GPIO belongs to
+ * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
+ * @con_id: name of the GPIO from the device's point of view
+ * @idx: index of the GPIO in case several GPIOs share the same name
+ * @flags: mask of GPIO_* values
+ *
+ * gpiod_lookup is a lookup table for associating GPIOs to specific devices and
+ * functions using platform data.
  */
 struct gpiod_lookup {
-	/*
-	 * name of the chip the GPIO belongs to
-	 */
 	const char *chip_label;
-	/*
-	 * hardware number (i.e. relative to the chip) of the GPIO
-	 */
 	u16 chip_hwnum;
-	/*
-	 * name of the GPIO from the device's point of view
-	 */
 	const char *con_id;
-	/*
-	 * index of the GPIO in case several GPIOs share the same name
-	 */
 	unsigned int idx;
-	/*
-	 * mask of GPIO_* values
-	 */
 	enum gpio_lookup_flags flags;
 };
 
-- 
1.8.4.4

