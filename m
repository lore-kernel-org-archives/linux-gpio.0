From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] gpiolib: Provide helper macros for logging of GPIO events
Date: Mon,  9 Sep 2013 10:33:49 +0100
Message-ID: <1378719230-10931-1-git-send-email-broonie@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37617 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751128Ab3IIJe0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 05:34:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Currently many but not all GPIO log messages log the GPIO number and the
formats vary. Ensure that this is done consistently by defining logging
helpers which take the GPIO descriptor.

The will help people pattern matching on logs and providing the number
makes the log messages that omitted it more useful.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib.c | 52 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 941ec40..e4937b7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -103,6 +103,18 @@ static int gpiod_export_link(struct device *dev, const char *name,
 static int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
 static void gpiod_unexport(struct gpio_desc *desc);
 
+#define gpiod_emerg(desc, fmt, ...)			           \
+	pr_emerg("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#define gpiod_crit(desc, fmt, ...)			           \
+	pr_crit("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#define gpiod_err(desc, fmt, ...)				   \
+	pr_err("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#define gpiod_warn(desc, fmt, ...)				   \
+	pr_warn("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#define gpiod_info(desc, fmt, ...)				   \
+	pr_info("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#define gpiod_dbg(desc, fmt, ...)				   \
+	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
 
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
@@ -1636,8 +1648,9 @@ static int gpiod_direction_input(struct gpio_desc *desc)
 
 	chip = desc->chip;
 	if (!chip->get || !chip->direction_input) {
-		pr_warn("%s: missing get() or direction_input() operations\n",
-			__func__);
+		gpiod_warn(desc,
+			"%s: missing get() or direction_input() operations\n",
+			 __func__);
 		return -EIO;
 	}
 
@@ -1657,8 +1670,7 @@ static int gpiod_direction_input(struct gpio_desc *desc)
 	if (status) {
 		status = chip->request(chip, offset);
 		if (status < 0) {
-			pr_debug("GPIO-%d: chip request fail, %d\n",
-				desc_to_gpio(desc), status);
+			gpiod_dbg(desc, "chip request fail, %d\n", status);
 			/* and it's not available to anyone else ...
 			 * gpio_request() is the fully clean solution.
 			 */
@@ -1676,8 +1688,7 @@ lose:
 fail:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+		gpiod_dbg(desc, "%s status %d\n", __func__, status);
 	return status;
 }
 
@@ -1709,8 +1720,9 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->direction_output) {
-		pr_warn("%s: missing set() or direction_output() operations\n",
-			__func__);
+		gpiod_warn(desc,
+		       "%s: missing set() or direction_output() operations\n",
+		       __func__);
 		return -EIO;
 	}
 
@@ -1730,8 +1742,7 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 	if (status) {
 		status = chip->request(chip, offset);
 		if (status < 0) {
-			pr_debug("GPIO-%d: chip request fail, %d\n",
-				desc_to_gpio(desc), status);
+			gpiod_dbg(desc, "chip request fail, %d\n", status);
 			/* and it's not available to anyone else ...
 			 * gpio_request() is the fully clean solution.
 			 */
@@ -1749,8 +1760,7 @@ lose:
 fail:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+		gpiod_dbg(desc, "%s: gpio status %d\n", __func__, status);
 	return status;
 }
 
@@ -1782,8 +1792,9 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->set_debounce) {
-		pr_debug("%s: missing set() or set_debounce() operations\n",
-			__func__);
+		gpiod_dbg(desc,
+			  "%s: missing set() or set_debounce() operations\n",
+			  __func__);
 		return -ENOTSUPP;
 	}
 
@@ -1805,8 +1816,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 fail:
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 
 	return status;
 }
@@ -1894,8 +1904,9 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, int value)
 	}
 	trace_gpio_direction(desc_to_gpio(desc), value, err);
 	if (err < 0)
-		pr_err("%s: Error in set_value for open drain gpio%d err %d\n",
-					__func__, desc_to_gpio(desc), err);
+		gpiod_err(desc,
+			  "%s: Error in set_value for open drain err %d\n",
+			  __func__, err);
 }
 
 /*
@@ -1921,8 +1932,9 @@ static void _gpio_set_open_source_value(struct gpio_desc *desc, int value)
 	}
 	trace_gpio_direction(desc_to_gpio(desc), !value, err);
 	if (err < 0)
-		pr_err("%s: Error in set_value for open source gpio%d err %d\n",
-					__func__, desc_to_gpio(desc), err);
+		gpiod_err(desc,
+			  "%s: Error in set_value for open source err %d\n",
+			  __func__, err);
 }
 
 /**
-- 
1.8.4.rc3

