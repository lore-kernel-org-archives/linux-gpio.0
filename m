From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: devres: Use global array of gpio suffixes
Date: Tue,  3 Jan 2017 19:00:20 +0200
Message-ID: <20170103170020.35844-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:56703 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753016AbdACRAc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Jan 2017 12:00:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

We have already a global array of possible GPIO suffixes. Use it here instead
of another copy of them.

Unfortunately this will not reduce the memory footprint, though allows to easy
maintain list in only one place.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/devres.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index b760cbbb41d8..54da61112752 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -21,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/gfp.h>
 
+#include "gpiolib.h"
+
 static void devm_gpiod_release(struct device *dev, void *res)
 {
 	struct gpio_desc **desc = res;
@@ -135,7 +137,6 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
 					    struct fwnode_handle *child)
 {
-	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
 	struct gpio_desc *desc;
@@ -146,13 +147,13 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 	if (!dr)
 		return ERR_PTR(-ENOMEM);
 
-	for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
 		if (con_id)
 			snprintf(prop_name, sizeof(prop_name), "%s-%s",
-					    con_id, suffixes[i]);
+					    con_id, gpio_suffixes[i]);
 		else
 			snprintf(prop_name, sizeof(prop_name), "%s",
-							       suffixes[i]);
+					    gpio_suffixes[i]);
 
 		desc = fwnode_get_named_gpiod(child, prop_name);
 		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
-- 
2.11.0

