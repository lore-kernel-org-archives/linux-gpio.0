From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the status of unselected irqs
Date: Fri, 10 Mar 2017 21:58:46 +0100
Message-ID: <20170310205846.16530-3-hdegoede@redhat.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40734 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755049AbdCJU6x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Mar 2017 15:58:53 -0500
In-Reply-To: <20170310205846.16530-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

When acpi_dev_gpio_irq_get gets called with an index of say 2, it
should not care if the gpioint matching index 0 or 1 has a valid
descriptor.

Before this commit acpi_dev_gpio_irq_get would exit on the first gpioint
with an invalid descriptor it would encounter, this commit modifies it to
only care if the gpioint with the requested index has a valid descriptor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 86fabdd..11bd1a6 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -746,21 +746,27 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
 int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
 	unsigned int irq_flags;
-	int idx, i;
+	int idx, i, irq, ret;
 
 	for (i = 0, idx = 0; idx <= index; i++) {
 		struct acpi_gpio_info info;
-		struct gpio_desc *desc;
+		struct acpi_gpio_lookup lookup;
 
-		desc = acpi_get_gpiod_by_index(adev, NULL, i, &info);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
+		memset(&lookup, 0, sizeof(lookup));
+		lookup.index = index;
+		lookup.adev = adev;
+		ret = acpi_gpio_resource_lookup(&lookup, &info);
+		if (!lookup.found)
+			return ret;
 
 		if (info.gpioint && idx++ == index) {
-			int irq = gpiod_to_irq(desc);
+			struct gpio_desc *desc = lookup.desc;
 			char label[32];
-			int ret;
 
+			if (!desc)
+				return ret;
+
+			irq = gpiod_to_irq(desc);
 			if (irq < 0)
 				return irq;
 
-- 
2.9.3

