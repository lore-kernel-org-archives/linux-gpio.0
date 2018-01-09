From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] gpio: Break out code to get a descriptor from a DT node
Date: Tue,  9 Jan 2018 01:27:27 +0100
Message-ID: <20180109002727.22676-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41320 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753381AbeAIA3w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 19:29:52 -0500
Received: by mail-lf0-f68.google.com with SMTP id h137so14021571lfe.8
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2018 16:29:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Sometimes a GPIO needs to be taken from a node without
a device associated with it. The fwnode accessor does this,
let's however break out the DT code for now.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 117 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4..294c255e6227 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3629,18 +3629,83 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpiod_get_index);
 
+/**
+ * gpiod_get_from_of_node() - obtain a GPIO from an OF node
+ * @node:	handle of the OF node
+ * @propname:	name of the DT property representing the GPIO
+ * @index:	index of the GPIO to obtain for the consumer
+ * @dflags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * Returns:
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @dflags. If the node does not have the requested GPIO
+ * property, NULL is returned.
+ *
+ * In case of error an ERR_PTR() is returned.
+ */
+static struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+						const char *propname, int index,
+						enum gpiod_flags dflags,
+						const char *label)
+{
+	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	unsigned long lflags = 0;
+	enum of_gpio_flags flags;
+	bool active_low = false;
+	bool single_ended = false;
+	bool open_drain = false;
+	int ret;
+
+	desc = of_get_named_gpiod_flags(node, propname,
+					index, &flags);
+
+	if (!desc || IS_ERR(desc)) {
+		/* If it is not there, just return NULL */
+		if (PTR_ERR(desc) == -ENOENT)
+			return NULL;
+		return desc;
+	}
+
+	active_low = flags & OF_GPIO_ACTIVE_LOW;
+	single_ended = flags & OF_GPIO_SINGLE_ENDED;
+	open_drain = flags & OF_GPIO_OPEN_DRAIN;
+
+	ret = gpiod_request(desc, label);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (active_low)
+		lflags |= GPIO_ACTIVE_LOW;
+
+	if (single_ended) {
+		if (open_drain)
+			lflags |= GPIO_OPEN_DRAIN;
+		else
+			lflags |= GPIO_OPEN_SOURCE;
+	}
+
+	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
+	if (ret < 0) {
+		gpiod_put(desc);
+		return ERR_PTR(ret);
+	}
+
+	return desc;
+}
+
 /**
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
  * @propname:	name of the firmware property representing the GPIO
- * @index:	index of the GPIO to obtain in the consumer
+ * @index:	index of the GPIO to obtain for the consumer
  * @dflags:	GPIO initialization flags
  * @label:	label to attach to the requested GPIO
  *
  * This function can be used for drivers that get their configuration
- * from firmware.
+ * from opaque firmware.
  *
- * Function properly finds the corresponding GPIO using whatever is the
+ * The function properly finds the corresponding GPIO using whatever is the
  * underlying firmware interface and then makes sure that the GPIO
  * descriptor is requested before it is returned to the caller.
  *
@@ -3657,53 +3722,37 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
 	unsigned long lflags = 0;
-	bool active_low = false;
-	bool single_ended = false;
-	bool open_drain = false;
 	int ret;
 
 	if (!fwnode)
 		return ERR_PTR(-EINVAL);
 
 	if (is_of_node(fwnode)) {
-		enum of_gpio_flags flags;
-
-		desc = of_get_named_gpiod_flags(to_of_node(fwnode), propname,
-						index, &flags);
-		if (!IS_ERR(desc)) {
-			active_low = flags & OF_GPIO_ACTIVE_LOW;
-			single_ended = flags & OF_GPIO_SINGLE_ENDED;
-			open_drain = flags & OF_GPIO_OPEN_DRAIN;
-		}
+		desc = gpiod_get_from_of_node(to_of_node(fwnode),
+					      propname, index,
+					      dflags,
+					      label);
+		return desc;
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
 
 		desc = acpi_node_get_gpiod(fwnode, propname, index, &info);
-		if (!IS_ERR(desc)) {
-			active_low = info.polarity == GPIO_ACTIVE_LOW;
-			ret = acpi_gpio_update_gpiod_flags(&dflags, info.flags);
-			if (ret)
-				pr_debug("Override GPIO initialization flags\n");
-		}
-	}
+		if (IS_ERR(desc))
+			return desc;
 
-	if (IS_ERR(desc))
-		return desc;
+		ret = acpi_gpio_update_gpiod_flags(&dflags, info.flags);
+		if (ret)
+			pr_debug("Override GPIO initialization flags\n");
 
+		if (info.polarity == GPIO_ACTIVE_LOW)
+			lflags |= GPIO_ACTIVE_LOW;
+	}
+
+	/* Currently only ACPI takes this path */
 	ret = gpiod_request(desc, label);
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (active_low)
-		lflags |= GPIO_ACTIVE_LOW;
-
-	if (single_ended) {
-		if (open_drain)
-			lflags |= GPIO_OPEN_DRAIN;
-		else
-			lflags |= GPIO_OPEN_SOURCE;
-	}
-
 	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
 	if (ret < 0) {
 		gpiod_put(desc);
-- 
2.14.3

