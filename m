From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/4] gpiolib: unify pr_* messages format
Date: Tue,  3 Dec 2013 21:03:23 +0200
Message-ID: <1386097406-24585-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:36488 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754125Ab3LCTD5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 14:03:57 -0500
In-Reply-To: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch includes following amendments:
 1) use "?" as a label when last is not defined in gpiod_*;
 2) whenever it's possilbe gpiod_* are used;
 3) print a function name, if it's already used in other messages.

Additionally it fixes an indentation in few places.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 72 ++++++++++++++++++++++++--------------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f7af309..9ed6f19 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -86,36 +86,36 @@ static int gpiod_request(struct gpio_desc *desc, const char *label);
 static void gpiod_free(struct gpio_desc *desc);
 
 #ifdef CONFIG_DEBUG_FS
-#define gpiod_emerg(desc, fmt, ...)			                \
-	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+#define gpiod_emerg(desc, fmt, ...)					       \
+	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
                  ##__VA_ARGS__)
-#define gpiod_crit(desc, fmt, ...)			                \
-	pr_crit("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+#define gpiod_crit(desc, fmt, ...)					       \
+	pr_crit("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
                  ##__VA_ARGS__)
-#define gpiod_err(desc, fmt, ...)				        \
-	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,   \
+#define gpiod_err(desc, fmt, ...)					       \
+	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",  \
                  ##__VA_ARGS__)
-#define gpiod_warn(desc, fmt, ...)				        \
-	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+#define gpiod_warn(desc, fmt, ...)					       \
+	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
                  ##__VA_ARGS__)
-#define gpiod_info(desc, fmt, ...)				        \
-	pr_info("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+#define gpiod_info(desc, fmt, ...)					       \
+	pr_info("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
                 ##__VA_ARGS__)
-#define gpiod_dbg(desc, fmt, ...)				   \
-	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+#define gpiod_dbg(desc, fmt, ...)					       \
+	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
                  ##__VA_ARGS__)
 #else
-#define gpiod_emerg(desc, fmt, ...)			           \
+#define gpiod_emerg(desc, fmt, ...)					\
 	pr_emerg("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
-#define gpiod_crit(desc, fmt, ...)			           \
+#define gpiod_crit(desc, fmt, ...)					\
 	pr_crit("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
-#define gpiod_err(desc, fmt, ...)				   \
+#define gpiod_err(desc, fmt, ...)					\
 	pr_err("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
-#define gpiod_warn(desc, fmt, ...)				   \
+#define gpiod_warn(desc, fmt, ...)					\
 	pr_warn("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
-#define gpiod_info(desc, fmt, ...)				   \
+#define gpiod_info(desc, fmt, ...)					\
 	pr_info("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
-#define gpiod_dbg(desc, fmt, ...)				   \
+#define gpiod_dbg(desc, fmt, ...)					\
 	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
 #endif
 
@@ -188,7 +188,8 @@ static int gpio_ensure_requested(struct gpio_desc *desc)
 	if (WARN(test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0,
 			"autorequest GPIO-%d\n", gpio)) {
 		if (!try_module_get(chip->owner)) {
-			pr_err("GPIO-%d: module can't be gotten \n", gpio);
+			gpiod_err(desc, "%s: module can't be gotten\n",
+					__func__);
 			clear_bit(FLAG_REQUESTED, &desc->flags);
 			/* lose */
 			return -EIO;
@@ -809,8 +810,8 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
 	     test_bit(FLAG_EXPORT, &desc->flags)) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		pr_debug("%s: gpio %d unavailable (requested=%d, exported=%d)\n",
-				__func__, desc_to_gpio(desc),
+		gpiod_dbg(desc, "%s: unavailable (requested=%d, exported=%d)\n",
+				__func__,
 				test_bit(FLAG_REQUESTED, &desc->flags),
 				test_bit(FLAG_EXPORT, &desc->flags));
 		status = -EPERM;
@@ -858,8 +859,7 @@ fail_unregister_device:
 	device_unregister(dev);
 fail_unlock:
 	mutex_unlock(&sysfs_lock);
-	pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-		 status);
+	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
 }
 EXPORT_SYMBOL_GPL(gpiod_export);
@@ -907,8 +907,7 @@ int gpiod_export_link(struct device *dev, const char *name,
 	mutex_unlock(&sysfs_lock);
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 
 	return status;
 }
@@ -952,8 +951,7 @@ unlock:
 	mutex_unlock(&sysfs_lock);
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 
 	return status;
 }
@@ -995,8 +993,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	if (status)
-		pr_debug("%s: gpio%d status %d\n", __func__, desc_to_gpio(desc),
-			 status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
@@ -1223,7 +1220,7 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (status)
 		goto fail;
 
-	pr_debug("gpiochip_add: registered GPIOs %d to %d on device: %s\n",
+	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
 		chip->label ? : "generic");
 
@@ -1233,7 +1230,7 @@ unlock:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 fail:
 	/* failures here can mean systems won't boot... */
-	pr_err("gpiochip_add: gpios %d..%d (%s) failed to register\n",
+	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
 		chip->label ? : "generic");
 	return status;
@@ -1502,8 +1499,7 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
 	}
 done:
 	if (status)
-		pr_debug("_gpio_request: gpio-%d (%s) status %d\n",
-			 desc_to_gpio(desc), label ? : "?", status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	return status;
 }
@@ -1704,7 +1700,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (!chip->get || !chip->direction_input) {
 		gpiod_warn(desc,
 			"%s: missing get() or direction_input() operations\n",
-			 __func__);
+			__func__);
 		return -EIO;
 	}
 
@@ -1724,7 +1720,8 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (status) {
 		status = chip->request(chip, offset);
 		if (status < 0) {
-			gpiod_dbg(desc, "chip request fail, %d\n", status);
+			gpiod_dbg(desc, "%s: chip request fail, %d\n",
+					__func__, status);
 			/* and it's not available to anyone else ...
 			 * gpio_request() is the fully clean solution.
 			 */
@@ -1742,7 +1739,7 @@ lose:
 fail:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	if (status)
-		gpiod_dbg(desc, "%s status %d\n", __func__, status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
@@ -1809,7 +1806,8 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	if (status) {
 		status = chip->request(chip, offset);
 		if (status < 0) {
-			gpiod_dbg(desc, "chip request fail, %d\n", status);
+			gpiod_dbg(desc, "%s: chip request fail, %d\n",
+					__func__, status);
 			/* and it's not available to anyone else ...
 			 * gpio_request() is the fully clean solution.
 			 */
-- 
1.8.4.4

