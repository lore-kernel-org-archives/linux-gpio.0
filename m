From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/6] gpio: move the pin ranges into gpio_device
Date: Thu, 11 Feb 2016 11:26:23 +0100
Message-ID: <1455186383-28004-7-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38532 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158AbcBKK0s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:48 -0500
Received: by mail-wm0-f51.google.com with SMTP id p63so61849795wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:48 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Instead of keeping this reference to the pin ranges in the
client driver-supplied gpio_chip, move it to the internal
gpio_device as the drivers have no need to inspect this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.4.3

