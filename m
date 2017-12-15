From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] gpio: fix "gpio-line-names" property retrieval
Date: Fri, 15 Dec 2017 09:09:15 +0100 (CET)
Message-ID: <20171215080915.DDA106C974@localhost.localdomain>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Following commit 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
to use device property accessors"), "gpio-line-names" DT property is
not retrieved anymore when chip->parent is not set by the driver.

This patch fixes that.

Fixes: 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
to use device property accessors")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpiolib-devprop.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
index 27f383bda7d9..310dbc451a85 100644
--- a/drivers/gpio/gpiolib-devprop.c
+++ b/drivers/gpio/gpiolib-devprop.c
@@ -30,20 +30,24 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip)
 	struct gpio_device *gdev = chip->gpiodev;
 	const char **names;
 	int ret, i;
+	struct device *dev;
 
-	if (!chip->parent) {
+	if (chip->parent) {
+		dev = chip->parent;
+	} else if (gdev->dev.of_node) {
+		dev = &gdev->dev;
+	} else {
 		dev_warn(&gdev->dev, "GPIO chip parent is NULL\n");
 		return;
 	}
 
-	ret = device_property_read_string_array(chip->parent, "gpio-line-names",
+	ret = device_property_read_string_array(dev, "gpio-line-names",
 						NULL, 0);
 	if (ret < 0)
 		return;
 
 	if (ret != gdev->ngpio) {
-		dev_warn(chip->parent,
-			 "names %d do not match number of GPIOs %d\n", ret,
+		dev_warn(dev, "names %d do not match number of GPIOs %d\n", ret,
 			 gdev->ngpio);
 		return;
 	}
@@ -52,10 +56,10 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip)
 	if (!names)
 		return;
 
-	ret = device_property_read_string_array(chip->parent, "gpio-line-names",
+	ret = device_property_read_string_array(dev, "gpio-line-names",
 						names, gdev->ngpio);
 	if (ret < 0) {
-		dev_warn(chip->parent, "failed to read GPIO line names\n");
+		dev_warn(dev, "failed to read GPIO line names\n");
 		kfree(names);
 		return;
 	}
-- 
2.13.3
