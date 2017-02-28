From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Fix spelling of 'successful'
Date: Tue, 28 Feb 2017 17:03:12 +0200
Message-ID: <20170228150312.47488-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:56693 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752442AbdB1PJm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Feb 2017 10:09:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Remove extra 'l' in "successfull".

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/devres.c  | 2 +-
 drivers/gpio/gpiolib.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index 7031eea165c9..a75511d1ea5d 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -136,7 +136,7 @@ EXPORT_SYMBOL(devm_gpiod_get_index);
  * GPIO descriptors returned from this function are automatically disposed on
  * driver detach.
  *
- * On successfull request the GPIO pin is configured in accordance with
+ * On successful request the GPIO pin is configured in accordance with
  * provided @flags.
  */
 struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index db5508c2c168..26e8fae83370 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3326,7 +3326,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * underlying firmware interface and then makes sure that the GPIO
  * descriptor is requested before it is returned to the caller.
  *
- * On successfull request the GPIO pin is configured in accordance with
+ * On successful request the GPIO pin is configured in accordance with
  * provided @dflags.
  *
  * In case of error an ERR_PTR() is returned.
-- 
2.11.0

