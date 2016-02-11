From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/6 v2] gpio: move the pin ranges into gpio_device
Date: Thu, 11 Feb 2016 11:37:14 +0100
Message-ID: <1455187034-29022-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34068 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbcBKKhV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:37:21 -0500
Received: by mail-lf0-f42.google.com with SMTP id j78so28768834lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:37:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Instead of keeping this reference to the pin ranges in the
client driver-supplied gpio_chip, move it to the internal
gpio_device as the drivers have no need to inspect this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Actually commit the entire patch, grrr.
---
 drivers/gpio/gpiolib.c      | 10 +++++-----
 drivers/gpio/gpiolib.h      | 10 ++++++++++
 include/linux/gpio/driver.h |  9 ---------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 157ab40d19b1..08e93857a7d5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -532,8 +532,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 #ifdef CONFIG_PINCTRL
-	/* FIXME: move pin ranges to gpio_device */
-	INIT_LIST_HEAD(&chip->pin_ranges);
+	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
 
 	status = gpiochip_set_desc_names(chip);
@@ -1036,7 +1035,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 		 gpio_offset, gpio_offset + pin_range->range.npins - 1,
 		 pinctrl_dev_get_devname(pctldev), pin_group);
 
-	list_add_tail(&pin_range->node, &chip->pin_ranges);
+	list_add_tail(&pin_range->node, &gdev->pin_ranges);
 
 	return 0;
 }
@@ -1085,7 +1084,7 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 		 pinctl_name,
 		 pin_offset, pin_offset + npins - 1);
 
-	list_add_tail(&pin_range->node, &chip->pin_ranges);
+	list_add_tail(&pin_range->node, &gdev->pin_ranges);
 
 	return 0;
 }
@@ -1098,8 +1097,9 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pin_range);
 void gpiochip_remove_pin_ranges(struct gpio_chip *chip)
 {
 	struct gpio_pin_range *pin_range, *tmp;
+	struct gpio_device *gdev = chip->gpiodev;
 
-	list_for_each_entry_safe(pin_range, tmp, &chip->pin_ranges, node) {
+	list_for_each_entry_safe(pin_range, tmp, &gdev->pin_ranges, node) {
 		list_del(&pin_range->node);
 		pinctrl_remove_gpio_range(pin_range->pctldev,
 				&pin_range->range);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d154984c71d9..5a36908fd39d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -55,6 +55,16 @@ struct gpio_device {
 	int			base;
 	u16			ngpio;
 	struct list_head        list;
+
+#ifdef CONFIG_PINCTRL
+	/*
+	 * If CONFIG_PINCTRL is enabled, then gpio controllers can optionally
+	 * describe the actual pin range which they serve in an SoC. This
+	 * information would be used by pinctrl subsystem to configure
+	 * corresponding pins for gpio usage.
+	 */
+	struct list_head pin_ranges;
+#endif
 };
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bfc842c2fc57..1babd000bbbe 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -181,15 +181,6 @@ struct gpio_chip {
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
 #endif
-#ifdef CONFIG_PINCTRL
-	/*
-	 * If CONFIG_PINCTRL is enabled, then gpio controllers can optionally
-	 * describe the actual pin range which they serve in an SoC. This
-	 * information would be used by pinctrl subsystem to configure
-	 * corresponding pins for gpio usage.
-	 */
-	struct list_head pin_ranges;
-#endif
 };
 
 extern const char *gpiochip_is_requested(struct gpio_chip *chip,
-- 
2.4.3

