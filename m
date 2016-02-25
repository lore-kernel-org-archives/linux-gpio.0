From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 1/3] pinctrl: core: create nolock version of pinctrl_find_gpio_range_from_pin
Date: Thu, 25 Feb 2016 22:44:37 +0100
Message-ID: <1456436679-22077-2-git-send-email-manabian@gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36668 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbcBYVov (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 16:44:51 -0500
Received: by mail-lf0-f42.google.com with SMTP id 78so41841533lfy.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 13:44:50 -0800 (PST)
In-Reply-To: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

pinctrl_find_gpio_range_from_pin takes the pctldev->mutex but so
does pinconf_pins_show and this will cause a deadlock if
pinctrl_find_gpio_range_from_pin is used in .pin_config_get
callback.

Create a nolock version of pinctrl_find_gpio_range_from_pin to
allow pin to gpio lookup to be used from pinconf_pins_show.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pinctrl/core.c | 35 +++++++++++++++++++++++------------
 drivers/pinctrl/core.h |  4 ++++
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2686a4450dfc..f67a8b7a4e18 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -481,18 +481,12 @@ int pinctrl_get_group_pins(struct pinctrl_dev *pctldev, const char *pin_group,
 }
 EXPORT_SYMBOL_GPL(pinctrl_get_group_pins);
 
-/**
- * pinctrl_find_gpio_range_from_pin() - locate the GPIO range for a pin
- * @pctldev: the pin controller device to look in
- * @pin: a controller-local number to find the range for
- */
 struct pinctrl_gpio_range *
-pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
-				 unsigned int pin)
+pinctrl_find_gpio_range_from_pin_nolock(struct pinctrl_dev *pctldev,
+					unsigned int pin)
 {
 	struct pinctrl_gpio_range *range;
 
-	mutex_lock(&pctldev->mutex);
 	/* Loop over the ranges */
 	list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 		/* Check if we're in the valid range */
@@ -500,15 +494,32 @@ pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
 			int a;
 			for (a = 0; a < range->npins; a++) {
 				if (range->pins[a] == pin)
-					goto out;
+					return range;
 			}
 		} else if (pin >= range->pin_base &&
 			   pin < range->pin_base + range->npins)
-			goto out;
+			return range;
 	}
-	range = NULL;
-out:
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin_nolock);
+
+/**
+ * pinctrl_find_gpio_range_from_pin() - locate the GPIO range for a pin
+ * @pctldev: the pin controller device to look in
+ * @pin: a controller-local number to find the range for
+ */
+struct pinctrl_gpio_range *
+pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
+				 unsigned int pin)
+{
+	struct pinctrl_gpio_range *range;
+
+	mutex_lock(&pctldev->mutex);
+	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
 	mutex_unlock(&pctldev->mutex);
+
 	return range;
 }
 EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index b24ea846c867..ca08723b9ee1 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -182,6 +182,10 @@ static inline struct pin_desc *pin_desc_get(struct pinctrl_dev *pctldev,
 	return radix_tree_lookup(&pctldev->pin_desc_tree, pin);
 }
 
+extern struct pinctrl_gpio_range *
+pinctrl_find_gpio_range_from_pin_nolock(struct pinctrl_dev *pctldev,
+					unsigned int pin);
+
 int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 			 bool dup);
 void pinctrl_unregister_map(struct pinctrl_map const *map);
-- 
1.8.0

