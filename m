From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] gpio: acpi: acpi_gpio_resource_lookup: return info even if there is no desc
Date: Fri, 10 Mar 2017 21:58:45 +0100
Message-ID: <20170310205846.16530-2-hdegoede@redhat.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44352 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750897AbdCJU6x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Mar 2017 15:58:53 -0500
In-Reply-To: <20170310205846.16530-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Make acpi_gpio_resource_lookup fill acpi_gpio_info even if there is
no gpio_desc for the gpio and add a found flag to lookup which is
used to indicate that valid info was found.

This is a preparation patch for making acpi_dev_gpio_irq_get actually
skip interrupts which do not match the requested index, rather then
bailing if it cannot retreive a gpio_desc for them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 3fe63d8..86fabdd 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -475,6 +475,7 @@ struct acpi_gpio_lookup {
 	int index;
 	int pin_index;
 	bool active_low;
+	bool found;
 	struct acpi_device *adev;
 	struct gpio_desc *desc;
 	int n;
@@ -513,6 +514,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		} else {
 			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 		}
+		lookup->found = true;
 	}
 
 	return 1;
@@ -534,15 +536,13 @@ static int acpi_gpio_resource_lookup(struct acpi_gpio_lookup *lookup,
 
 	acpi_dev_free_resource_list(&res_list);
 
-	if (!lookup->desc)
-		return -ENOENT;
-
 	if (info) {
 		*info = lookup->info;
 		if (lookup->active_low)
 			info->polarity = lookup->active_low;
 	}
-	return 0;
+
+	return lookup->desc ? 0 : -ENOENT;
 }
 
 static int acpi_gpio_property_lookup(struct fwnode_handle *fwnode,
-- 
2.9.3

