From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/4] gpiolib: introduce chip_* to print with chip->label prefix
Date: Tue,  3 Dec 2013 21:03:24 +0200
Message-ID: <1386097406-24585-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:36488 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753409Ab3LCTD5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 14:03:57 -0500
In-Reply-To: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

In several places we are printing messages with prefix based on chip->label.
Introduced macros help us to do this easier and in uniform way.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9ed6f19..222f544 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -85,6 +85,8 @@ static DEFINE_IDR(dirent_idr);
 static int gpiod_request(struct gpio_desc *desc, const char *label);
 static void gpiod_free(struct gpio_desc *desc);
 
+/* With descriptor prefix */
+
 #ifdef CONFIG_DEBUG_FS
 #define gpiod_emerg(desc, fmt, ...)					       \
 	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
@@ -119,6 +121,21 @@ static void gpiod_free(struct gpio_desc *desc);
 	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
 #endif
 
+/* With chip prefix */
+
+#define chip_emerg(chip, fmt, ...)					\
+	pr_emerg("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+#define chip_crit(chip, fmt, ...)					\
+	pr_crit("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+#define chip_err(chip, fmt, ...)					\
+	pr_err("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+#define chip_warn(chip, fmt, ...)					\
+	pr_warn("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+#define chip_info(chip, fmt, ...)					\
+	pr_info("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+#define chip_dbg(chip, fmt, ...)					\
+	pr_debug("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
+
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 #ifdef CONFIG_DEBUG_FS
@@ -1032,8 +1049,7 @@ static int gpiochip_export(struct gpio_chip *chip)
 			chip->desc[gpio++].chip = NULL;
 		spin_unlock_irqrestore(&gpio_lock, flags);
 
-		pr_debug("%s: chip %s status %d\n", __func__,
-				chip->label, status);
+		chip_dbg(chip, "%s: status %d\n", __func__, status);
 	}
 
 	return status;
@@ -1056,8 +1072,7 @@ static void gpiochip_unexport(struct gpio_chip *chip)
 	mutex_unlock(&sysfs_lock);
 
 	if (status)
-		pr_debug("%s: chip %s status %d\n", __func__,
-				chip->label, status);
+		chip_dbg(chip, "%s: status %d\n", __func__, status);
 }
 
 static int __init gpiolib_sysfs_init(void)
@@ -1339,8 +1354,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
-		pr_err("%s: GPIO chip: failed to allocate pin ranges\n",
-				chip->label);
+		chip_err(chip, "failed to allocate pin ranges\n");
 		return -ENOMEM;
 	}
 
@@ -1361,9 +1375,8 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 
 	pinctrl_add_gpio_range(pctldev, &pin_range->range);
 
-	pr_debug("GPIO chip %s: created GPIO range %d->%d ==> %s PINGRP %s\n",
-		 chip->label, gpio_offset,
-		 gpio_offset + pin_range->range.npins - 1,
+	chip_dbg(chip, "created GPIO range %d->%d ==> %s PINGRP %s\n",
+		 gpio_offset, gpio_offset + pin_range->range.npins - 1,
 		 pinctrl_dev_get_devname(pctldev), pin_group);
 
 	list_add_tail(&pin_range->node, &chip->pin_ranges);
@@ -1390,8 +1403,7 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
-		pr_err("%s: GPIO chip: failed to allocate pin ranges\n",
-				chip->label);
+		chip_err(chip, "failed to allocate pin ranges\n");
 		return -ENOMEM;
 	}
 
@@ -1406,13 +1418,12 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			&pin_range->range);
 	if (IS_ERR(pin_range->pctldev)) {
 		ret = PTR_ERR(pin_range->pctldev);
-		pr_err("%s: GPIO chip: could not create pin range\n",
-		       chip->label);
+		chip_err(chip, "could not create pin range\n");
 		kfree(pin_range);
 		return ret;
 	}
-	pr_debug("GPIO chip %s: created GPIO range %d->%d ==> %s PIN %d->%d\n",
-		 chip->label, gpio_offset, gpio_offset + npins - 1,
+	chip_dbg(chip, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
+		 gpio_offset, gpio_offset + npins - 1,
 		 pinctl_name,
 		 pin_offset, pin_offset + npins - 1);
 
-- 
1.8.4.4

