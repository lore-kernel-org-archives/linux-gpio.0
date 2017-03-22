From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] gpio: pca953x: Sort headers alphabetically
Date: Wed, 22 Mar 2017 16:11:12 +0200
Message-ID: <20170322141113.34396-2-andriy.shevchenko@linux.intel.com>
References: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:7028 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934333AbdCVOLW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Mar 2017 10:11:22 -0400
In-Reply-To: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For sake of better maintenance sort the headers by alphabetical order.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index c149054ef976..cfee792182ab 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -11,18 +11,19 @@
  *  the Free Software Foundation; version 2 of the License.
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
+#include <linux/acpi.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_data/pca953x.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+
 #include <asm/unaligned.h>
-#include <linux/of_platform.h>
-#include <linux/acpi.h>
-#include <linux/regulator/consumer.h>
 
 #define PCA953X_INPUT		0
 #define PCA953X_OUTPUT		1
-- 
2.11.0

