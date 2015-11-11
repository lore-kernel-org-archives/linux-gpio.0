From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Wed, 11 Nov 2015 11:45:30 -0800
Message-ID: <20151111194530.GA26559@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33152 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752761AbbKKTpd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 14:45:33 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

We should not fall back to the legacy unnamed gpio lookup style if the
driver requests gpios with different names, because we'll give out the same
gpio twice. Let's keep track of the names that were used for the device and
only do the fallback for the first name used.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v1: incorporated changes suggested by Mika Westerberg in response to the
draft patch I posted in Goodix thread.

v2: moved acpi_can_fallback_to_crs body to drivers/gpio/gpiolib-acpi.c
and provided stub for !CONFIG_ACPI case to fix build error if ACPI is
disabled.

 drivers/gpio/gpiolib-acpi.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |  3 +++
 drivers/gpio/gpiolib.h      |  8 ++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 143a9bd..d5f3008 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -838,3 +838,46 @@ int acpi_gpio_count(struct device *dev, const char *con_id)
 	}
 	return count;
 }
+
+struct acpi_crs_lookup {
+	struct list_head node;
+	struct acpi_device *adev;
+	const char *con_id;
+};
+
+static DEFINE_MUTEX(acpi_crs_lookup_lock);
+static LIST_HEAD(acpi_crs_lookup_list);
+
+bool acpi_can_fallback_to_crs(struct acpi_device *adev, const char *con_id)
+{
+	struct acpi_crs_lookup *l, *lookup = NULL;
+
+	/* Never allow fallback if the device has properties */
+	if (adev->data.properties || adev->driver_gpios)
+		return false;
+
+	mutex_lock(&acpi_crs_lookup_lock);
+
+	list_for_each_entry(l, &acpi_crs_lookup_list, node) {
+		if (l->adev == adev) {
+			lookup = l;
+			break;
+		}
+	}
+
+	if (!lookup) {
+		lookup = kmalloc(sizeof(*lookup), GFP_KERNEL);
+		if (lookup) {
+			lookup->adev = adev;
+			lookup->con_id = con_id;
+			list_add_tail(&lookup->node, &acpi_crs_lookup_list);
+		}
+	}
+
+	mutex_unlock(&acpi_crs_lookup_lock);
+
+	return lookup &&
+		((!lookup->con_id && !con_id) ||
+		 (lookup->con_id && con_id &&
+		  strcmp(lookup->con_id, con_id) == 0));
+}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5db3445..0faf4b7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1765,6 +1765,9 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 
 	/* Then from plain _CRS GPIOs */
 	if (IS_ERR(desc)) {
+		if (!acpi_can_fallback_to_crs(adev, con_id))
+			return ERR_PTR(-ENOENT);
+
 		desc = acpi_get_gpiod_by_index(adev, NULL, idx, &info);
 		if (IS_ERR(desc))
 			return desc;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index bf34300..986eb5c 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -44,6 +44,8 @@ struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 					  struct acpi_gpio_info *info);
 
 int acpi_gpio_count(struct device *dev, const char *con_id);
+
+bool acpi_can_fallback_to_crs(struct acpi_device *adev, const char *con_id);
 #else
 static inline void acpi_gpiochip_add(struct gpio_chip *chip) { }
 static inline void acpi_gpiochip_remove(struct gpio_chip *chip) { }
@@ -65,6 +67,12 @@ static inline int acpi_gpio_count(struct device *dev, const char *con_id)
 {
 	return -ENODEV;
 }
+
+static inline bool acpi_can_fallback_to_crs(struct acpi_device *adev,
+					    const char *con_id)
+{
+	return false;
+}
 #endif
 
 struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-- 
2.6.0.rc2.230.g3dd15c0


-- 
Dmitry
