From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] gpio: pca953x: Sort headers alphabetically
Date: Mon, 20 Mar 2017 17:45:16 +0200
Message-ID: <20170320154517.41003-2-andriy.shevchenko@linux.intel.com>
References: <20170320154517.41003-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:31854 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754942AbdCTPqM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Mar 2017 11:46:12 -0400
In-Reply-To: <20170320154517.41003-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For sake of better maintenance sort the headers by alphabetical order.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 968e8bf5b286..cd6c9c5f3e77 100644
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

