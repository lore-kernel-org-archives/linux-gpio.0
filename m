From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] gpio: Export devm_gpiod_get_from_of_node() for consumers
Date: Tue,  9 Jan 2018 01:29:59 +0100
Message-ID: <20180109002959.22738-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39281 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbeAIAcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 19:32:06 -0500
Received: by mail-lf0-f67.google.com with SMTP id m8so7958304lfc.6
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2018 16:32:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

We have been holding back on adding an API for fetching GPIO handles
directly from device nodes, strongly preferring to get it from the
spawn devices instead.

The fwnode interface however already contains an API for doing this,
as it is used for opaque device tree nodes or ACPI nodes for getting
handles to LEDs and keys that use GPIO: those are specified as one
child per LED/key in the device tree and are not individual devices.

However regulators present a special problem as they already have
helper functions to traverse the device tree from a regulator node
and two levels down to fill in data, and as it already traverses
GPIO nodes in its own way, and already holds a pointer to each
regulators device tree node, it makes most sense to export an
API to fetch the GPIO descriptor directly from the node.

We only support the devm_* version for now, hopefully no non-devres
version will be needed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/devres.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c        |  9 +++++----
 drivers/gpio/gpiolib.h        |  6 ++++++
 include/linux/gpio/consumer.h | 17 +++++++++++++++++
 4 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index afbff155a0ba..e82cc763633c 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -124,6 +124,48 @@ struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
 }
 EXPORT_SYMBOL(devm_gpiod_get_index);
 
+/**
+ * devm_gpiod_get_from_of_node() - obtain a GPIO from an OF node
+ * @dev:	device for lifecycle management
+ * @node:	handle of the OF node
+ * @propname:	name of the DT property representing the GPIO
+ * @index:	index of the GPIO to obtain for the consumer
+ * @dflags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * Returns:
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @dflags.
+ *
+ * In case of error an ERR_PTR() is returned.
+ */
+struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
+					      struct device_node *node,
+					      const char *propname, int index,
+					      enum gpiod_flags dflags,
+					      const char *label)
+{
+	struct gpio_desc **dr;
+	struct gpio_desc *desc;
+
+	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
+			  GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	desc = gpiod_get_from_of_node(node, propname, index, dflags, label);
+	if (IS_ERR(desc)) {
+		devres_free(dr);
+		return desc;
+	}
+
+	*dr = desc;
+	devres_add(dev, dr);
+
+	return desc;
+}
+EXPORT_SYMBOL(devm_gpiod_get_from_of_node);
+
 /**
  * devm_fwnode_get_index_gpiod_from_child - get a GPIO descriptor from a
  *					    device's child node
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 294c255e6227..762a470030ce 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3644,10 +3644,10 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  *
  * In case of error an ERR_PTR() is returned.
  */
-static struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
-						const char *propname, int index,
-						enum gpiod_flags dflags,
-						const char *label)
+struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+					 const char *propname, int index,
+					 enum gpiod_flags dflags,
+					 const char *label)
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
 	unsigned long lflags = 0;
@@ -3693,6 +3693,7 @@ static struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 
 	return desc;
 }
+EXPORT_SYMBOL(gpiod_get_from_of_node);
 
 /**
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index af48322839c3..187056b8c6a6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -189,6 +189,12 @@ void gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				   struct gpio_desc **desc_array,
 				   int *value_array);
 
+/* This is just passed between gpiolib and devres */
+struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+					 const char *propname, int index,
+					 enum gpiod_flags dflags,
+					 const char *label);
+
 extern struct spinlock gpio_lock;
 extern struct list_head gpio_devices;
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 7447d85dbe2f..9f3cb651cb3c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -150,8 +150,14 @@ struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
 
 /* Child properties interface */
+struct device_node;
 struct fwnode_handle;
 
+struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
+					      struct device_node *node,
+					      const char *propname, int index,
+					      enum gpiod_flags dflags,
+					      const char *label);
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
@@ -464,8 +470,19 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 }
 
 /* Child properties interface */
+struct device_node;
 struct fwnode_handle;
 
+static inline
+struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
+					      struct device_node *node,
+					      const char *propname, int index,
+					      enum gpiod_flags dflags,
+					      const char *label)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 					 const char *propname, int index,
-- 
2.14.3

