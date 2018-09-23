From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: use device properties instead of platform_data
Date: Sun, 23 Sep 2018 13:17:27 +0200
Message-ID: <20180923111727.10378-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Some users want to introduce device tree support to the mockup driver.
Let's make it easier by switching to using generic device properties.
The driver stays compatible with previous use cases and after this
conversion there'll be no need to change the way probing of mockup
GPIO chips works.

Tested with libgpiod test suite.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 82 ++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d66b7a768ecd..4e66bd83b76c 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -18,6 +18,7 @@
 #include <linux/irq_sim.h>
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
+#include <linux/property.h>
 
 #include "gpiolib.h"
 
@@ -28,6 +29,8 @@
  * of GPIO lines.
  */
 #define GPIO_MOCKUP_MAX_RANGES	(GPIO_MOCKUP_MAX_GC * 2)
+/* Maximum of three properties + the sentinel. */
+#define GPIO_MOCKUP_MAX_PROP	4
 
 #define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
 
@@ -59,13 +62,6 @@ struct gpio_mockup_dbgfs_private {
 	int offset;
 };
 
-struct gpio_mockup_platform_data {
-	int base;
-	int ngpio;
-	int index;
-	bool named_lines;
-};
-
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
 static int gpio_mockup_num_ranges;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_num_ranges, 0400);
@@ -255,26 +251,37 @@ static int gpio_mockup_name_lines(struct device *dev,
 
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	struct gpio_mockup_platform_data *pdata;
 	struct gpio_mockup_chip *chip;
 	struct gpio_chip *gc;
-	int rv, base, ngpio;
 	struct device *dev;
-	char *name;
+	const char *name;
+	int rv, base;
+	u16 ngpio;
 
 	dev = &pdev->dev;
-	pdata = dev_get_platdata(dev);
-	base = pdata->base;
-	ngpio = pdata->ngpio;
+
+	rv = device_property_read_u32(dev, "gpio-base", &base);
+	if (rv && rv == -ENOENT)
+		base = -1;
+
+	rv = device_property_read_u16(dev, "nr-gpios", &ngpio);
+	if (rv)
+		return rv;
+
+	rv = device_property_read_string(dev, "chip-name", &name);
+	if (rv)
+		name = NULL;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
-			      pdev->name, pdata->index);
-	if (!name)
-		return -ENOMEM;
+	if (!name) {
+		name = devm_kasprintf(dev, GFP_KERNEL,
+				      "%s-%c", pdev->name, pdev->id + 'A');
+		if (!name)
+			return -ENOMEM;
+	}
 
 	gc = &chip->gc;
 	gc->base = base;
@@ -295,7 +302,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (!chip->lines)
 		return -ENOMEM;
 
-	if (pdata->named_lines) {
+	if (device_property_read_bool(dev, "named-gpio-lines")) {
 		rv = gpio_mockup_name_lines(dev, chip);
 		if (rv)
 			return rv;
@@ -339,9 +346,11 @@ static void gpio_mockup_unregister_pdevs(void)
 
 static int __init gpio_mockup_init(void)
 {
-	int i, num_chips, err = 0, index = 'A';
-	struct gpio_mockup_platform_data pdata;
+	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
+	int i, prop, num_chips, err = 0, base;
+	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
+	u16 ngpio;
 
 	if ((gpio_mockup_num_ranges < 2) ||
 	    (gpio_mockup_num_ranges % 2) ||
@@ -371,17 +380,28 @@ static int __init gpio_mockup_init(void)
 	}
 
 	for (i = 0; i < num_chips; i++) {
-		pdata.index = index++;
-		pdata.base = gpio_mockup_range_base(i);
-		pdata.ngpio = pdata.base < 0
-				? gpio_mockup_range_ngpio(i)
-				: gpio_mockup_range_ngpio(i) - pdata.base;
-		pdata.named_lines = gpio_mockup_named_lines;
-
-		pdev = platform_device_register_resndata(NULL,
-							 GPIO_MOCKUP_NAME,
-							 i, NULL, 0, &pdata,
-							 sizeof(pdata));
+		memset(properties, 0, sizeof(properties));
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		prop = 0;
+
+		base = gpio_mockup_range_base(i);
+		if (base >= 0)
+			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
+								base);
+
+		ngpio = base < 0 ? gpio_mockup_range_ngpio(i)
+				 : gpio_mockup_range_ngpio(i) - base;
+		properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
+
+		if (gpio_mockup_named_lines)
+			properties[prop++] = PROPERTY_ENTRY_BOOL(
+						"named-gpio-lines");
+
+		pdevinfo.name = GPIO_MOCKUP_NAME;
+		pdevinfo.id = i;
+		pdevinfo.properties = properties;
+
+		pdev = platform_device_register_full(&pdevinfo);
 		if (IS_ERR(pdev)) {
 			gpio_mockup_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
-- 
2.18.0
