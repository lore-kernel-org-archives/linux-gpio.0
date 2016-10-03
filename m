From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] gpio: acpi: separation of concerns
Date: Mon,  3 Oct 2016 11:02:39 +0200
Message-ID: <1475485360-15127-2-git-send-email-linus.walleij@linaro.org>
References: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34569 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751567AbcJCJCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 05:02:50 -0400
Received: by mail-lf0-f46.google.com with SMTP id b81so29603638lfe.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 02:02:49 -0700 (PDT)
In-Reply-To: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>

The generic GPIO library directly implement code for acpi_find_gpio()
which is only used with CONFIG_ACPI. This was probably done because
OF did the same thing, but I removed that so remove this too.

Rename the internal acpi_find_gpio() in gpiolib-acpi.c to
acpi_populate_gpio_lookup() which seems to be more appropriate anyway
so as to avoid a namespace clash with the same function.

Make the stub return -ENOENT rather than -ENOSYS (as that is for
syscalls!).

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 56 ++++++++++++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.c      | 49 ---------------------------------------
 drivers/gpio/gpiolib.h      | 15 +++++++-----
 3 files changed, 62 insertions(+), 58 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index af514618d7fb..5aca4053e06a 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -395,7 +395,7 @@ struct acpi_gpio_lookup {
 	int n;
 };
 
-static int acpi_find_gpio(struct acpi_resource *ares, void *data)
+static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 {
 	struct acpi_gpio_lookup *lookup = data;
 
@@ -440,7 +440,8 @@ static int acpi_gpio_resource_lookup(struct acpi_gpio_lookup *lookup,
 
 	INIT_LIST_HEAD(&res_list);
 
-	ret = acpi_dev_get_resources(lookup->adev, &res_list, acpi_find_gpio,
+	ret = acpi_dev_get_resources(lookup->adev, &res_list,
+				     acpi_populate_gpio_lookup,
 				     lookup);
 	if (ret < 0)
 		return ret;
@@ -513,7 +514,7 @@ static int acpi_gpio_property_lookup(struct fwnode_handle *fwnode,
  * Note: if the GPIO resource has multiple entries in the pin list, this
  * function only returns the first.
  */
-struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
+static struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 					  const char *propname, int index,
 					  struct acpi_gpio_info *info)
 {
@@ -546,6 +547,55 @@ struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 	return ret ? ERR_PTR(ret) : lookup.desc;
 }
 
+struct gpio_desc *acpi_find_gpio(struct device *dev,
+				 const char *con_id,
+				 unsigned int idx,
+				 enum gpiod_flags flags,
+				 enum gpio_lookup_flags *lookupflags)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct acpi_gpio_info info;
+	struct gpio_desc *desc;
+	char propname[32];
+	int i;
+
+	/* Try first from _DSD */
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
+		if (con_id && strcmp(con_id, "gpios")) {
+			snprintf(propname, sizeof(propname), "%s-%s",
+				 con_id, gpio_suffixes[i]);
+		} else {
+			snprintf(propname, sizeof(propname), "%s",
+				 gpio_suffixes[i]);
+		}
+
+		desc = acpi_get_gpiod_by_index(adev, propname, idx, &info);
+		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
+			break;
+	}
+
+	/* Then from plain _CRS GPIOs */
+	if (IS_ERR(desc)) {
+		if (!acpi_can_fallback_to_crs(adev, con_id))
+			return ERR_PTR(-ENOENT);
+
+		desc = acpi_get_gpiod_by_index(adev, NULL, idx, &info);
+		if (IS_ERR(desc))
+			return desc;
+
+		if ((flags == GPIOD_OUT_LOW || flags == GPIOD_OUT_HIGH) &&
+		    info.gpioint) {
+			dev_dbg(dev, "refusing GpioInt() entry when doing GPIOD_OUT_* lookup\n");
+			return ERR_PTR(-ENOENT);
+		}
+	}
+
+	if (info.polarity == GPIO_ACTIVE_LOW)
+		*lookupflags |= GPIO_ACTIVE_LOW;
+
+	return desc;
+}
+
 /**
  * acpi_node_get_gpiod() - get a GPIO descriptor from ACPI resources
  * @fwnode: pointer to an ACPI firmware node to get the GPIO information from
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5404cdcfed19..f0fc3a0d37c8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2883,55 +2883,6 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 	mutex_unlock(&gpio_lookup_lock);
 }
 
-static struct gpio_desc *acpi_find_gpio(struct device *dev,
-					const char *con_id,
-					unsigned int idx,
-					enum gpiod_flags flags,
-					enum gpio_lookup_flags *lookupflags)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-	struct acpi_gpio_info info;
-	struct gpio_desc *desc;
-	char propname[32];
-	int i;
-
-	/* Try first from _DSD */
-	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
-		if (con_id && strcmp(con_id, "gpios")) {
-			snprintf(propname, sizeof(propname), "%s-%s",
-				 con_id, gpio_suffixes[i]);
-		} else {
-			snprintf(propname, sizeof(propname), "%s",
-				 gpio_suffixes[i]);
-		}
-
-		desc = acpi_get_gpiod_by_index(adev, propname, idx, &info);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
-			break;
-	}
-
-	/* Then from plain _CRS GPIOs */
-	if (IS_ERR(desc)) {
-		if (!acpi_can_fallback_to_crs(adev, con_id))
-			return ERR_PTR(-ENOENT);
-
-		desc = acpi_get_gpiod_by_index(adev, NULL, idx, &info);
-		if (IS_ERR(desc))
-			return desc;
-
-		if ((flags == GPIOD_OUT_LOW || flags == GPIOD_OUT_HIGH) &&
-		    info.gpioint) {
-			dev_dbg(dev, "refusing GpioInt() entry when doing GPIOD_OUT_* lookup\n");
-			return ERR_PTR(-ENOENT);
-		}
-	}
-
-	if (info.polarity == GPIO_ACTIVE_LOW)
-		*lookupflags |= GPIO_ACTIVE_LOW;
-
-	return desc;
-}
-
 static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index cc7fd56d7c9b..9ef9cfee788d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -109,9 +109,11 @@ void acpi_gpiochip_remove(struct gpio_chip *chip);
 void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
 
-struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
-					  const char *propname, int index,
-					  struct acpi_gpio_info *info);
+struct gpio_desc *acpi_find_gpio(struct device *dev,
+				 const char *con_id,
+				 unsigned int idx,
+				 enum gpiod_flags flags,
+				 enum gpio_lookup_flags *lookupflags);
 struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
 				      const char *propname, int index,
 				      struct acpi_gpio_info *info);
@@ -130,10 +132,11 @@ static inline void
 acpi_gpiochip_free_interrupts(struct gpio_chip *chip) { }
 
 static inline struct gpio_desc *
-acpi_get_gpiod_by_index(struct acpi_device *adev, const char *propname,
-			int index, struct acpi_gpio_info *info)
+acpi_find_gpio(struct device *dev, const char *con_id,
+	       unsigned int idx, enum gpiod_flags flags,
+	       enum gpio_lookup_flags *lookupflags)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-ENOENT);
 }
 static inline struct gpio_desc *
 acpi_node_get_gpiod(struct fwnode_handle *fwnode, const char *propname,
-- 
2.7.4

