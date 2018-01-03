From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: merrifield: Add support of ACPI enabled platforms
Date: Wed,  3 Jan 2018 19:32:40 +0200
Message-ID: <20180103173240.45755-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:45726 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750819AbeACRcn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 12:32:43 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

The driver needs the pin control device name for ACPI.

We are looking through ACPI namespace and return first found device
based on ACPI HID for Intel Merrifield FLIS.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 43 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index dd67a31ac337..61e75d10669d 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -9,6 +9,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -380,9 +381,48 @@ static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id mrfld_pinctrl_acpi_ids[] = {
+	{"INTC1002"},
+	{}
+};
+
+static acpi_status
+mrfld_acpi_find_pinctrl(acpi_handle handle, u32 lvl, void *context, void **rv)
+{
+	const char **name = context;
+	struct acpi_device *adev;
+
+	if (acpi_bus_get_device(handle, &adev))
+		return AE_OK;
+
+	if (acpi_match_device_ids(adev, mrfld_pinctrl_acpi_ids))
+		return AE_OK;
+
+	*name = dev_name(&adev->dev);
+	return AE_CTRL_TERMINATE;
+}
+
+static const char *mrfld_acpi_get_pinctrl_dev_name(const char *fallback)
+{
+	const char *pinctrl_dev_name = fallback;
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
+			    ACPI_UINT32_MAX, mrfld_acpi_find_pinctrl, NULL,
+			    &pinctrl_dev_name, NULL);
+	return pinctrl_dev_name;
+}
+#else
+static inline const char *mrfld_acpi_get_pinctrl_dev_name(const char *fallback)
+{
+	return fallback;
+}
+#endif
+
 static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mrfld_gpio_pinrange *range;
+	const char *pinctrl_dev_name;
 	struct mrfld_gpio *priv;
 	u32 gpio_base, irq_base;
 	void __iomem *base;
@@ -439,10 +479,11 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 		return retval;
 	}
 
+	pinctrl_dev_name = mrfld_acpi_get_pinctrl_dev_name("pinctrl-merrifield");
 	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
 		range = &mrfld_gpio_ranges[i];
 		retval = gpiochip_add_pin_range(&priv->chip,
-						"pinctrl-merrifield",
+						pinctrl_dev_name,
 						range->gpio_base,
 						range->pin_base,
 						range->npins);
-- 
2.15.1

