From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/7] gpio: mockup: readability tweaks
Date: Mon,  6 Feb 2017 13:10:35 +0100
Message-ID: <1486383041-16758-2-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36503 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751911AbdBFMKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 07:10:48 -0500
Received: by mail-wm0-f47.google.com with SMTP id c85so117353730wmi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 04:10:48 -0800 (PST)
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

The following patch tries to improve the readability of the mockup
driver.

The driver is called gpio-mockup, so add the same prefix to all
functions and structures.

Add some newlines and use a temporary pointer in gpio_mockup_add().

Drop the name of the direction enum and rename the enum values to
better reflect their purpose.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 123 ++++++++++++++++++++++++---------------------
 1 file changed, 66 insertions(+), 57 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 82a9efd..5f6ed4b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -16,12 +16,12 @@
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 
-#define GPIO_NAME	"gpio-mockup"
-#define	MAX_GC		10
+#define GPIO_MOCKUP_NAME	"gpio-mockup"
+#define	GPIO_MOCKUP_MAX_GC	10
 
-enum direction {
-	OUT,
-	IN
+enum {
+	DIR_IN = 0,
+	DIR_OUT,
 };
 
 /*
@@ -29,98 +29,104 @@ enum direction {
  * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
  * @value:     Configures status of the gpio as 0(low) or 1(high)
  */
-struct gpio_pin_status {
-	enum direction dir;
+struct gpio_mockup_line_status {
+	int dir;
 	bool value;
 };
 
-struct mockup_gpio_controller {
+struct gpio_mockup_chip {
 	struct gpio_chip gc;
-	struct gpio_pin_status *stats;
+	struct gpio_mockup_line_status *lines;
 };
 
-static int gpio_mockup_ranges[MAX_GC << 1];
+static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_GC << 1];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
 
-static const char pins_name_start = 'A';
+static const char gpio_mockup_name_start = 'A';
 
-static int mockup_gpio_get(struct gpio_chip *gc, unsigned int offset)
+static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 {
-	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	return cntr->stats[offset].value;
+	return chip->lines[offset].value;
 }
 
-static void mockup_gpio_set(struct gpio_chip *gc, unsigned int offset,
+static void gpio_mockup_set(struct gpio_chip *gc, unsigned int offset,
 			    int value)
 {
-	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	cntr->stats[offset].value = !!value;
+	chip->lines[offset].value = !!value;
 }
 
-static int mockup_gpio_dirout(struct gpio_chip *gc, unsigned int offset,
+static int gpio_mockup_dirout(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
-	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	gpio_mockup_set(gc, offset, value);
+	chip->lines[offset].dir = DIR_OUT;
 
-	mockup_gpio_set(gc, offset, value);
-	cntr->stats[offset].dir = OUT;
 	return 0;
 }
 
-static int mockup_gpio_dirin(struct gpio_chip *gc, unsigned int offset)
+static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 {
-	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	chip->lines[offset].dir = DIR_IN;
 
-	cntr->stats[offset].dir = IN;
 	return 0;
 }
 
-static int mockup_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
-	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	return cntr->stats[offset].dir;
+	return chip->lines[offset].dir;
 }
 
-static int mockup_gpio_add(struct device *dev,
-			   struct mockup_gpio_controller *cntr,
+static int gpio_mockup_add(struct device *dev,
+			   struct gpio_mockup_chip *chip,
 			   const char *name, int base, int ngpio)
 {
+	struct gpio_chip *gc = &chip->gc;
 	int ret;
 
-	cntr->gc.base = base;
-	cntr->gc.ngpio = ngpio;
-	cntr->gc.label = name;
-	cntr->gc.owner = THIS_MODULE;
-	cntr->gc.parent = dev;
-	cntr->gc.get = mockup_gpio_get;
-	cntr->gc.set = mockup_gpio_set;
-	cntr->gc.direction_output = mockup_gpio_dirout;
-	cntr->gc.direction_input = mockup_gpio_dirin;
-	cntr->gc.get_direction = mockup_gpio_get_direction;
-	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * cntr->gc.ngpio,
+	gc->base = base;
+	gc->ngpio = ngpio;
+	gc->label = name;
+	gc->owner = THIS_MODULE;
+	gc->parent = dev;
+	gc->get = gpio_mockup_get;
+	gc->set = gpio_mockup_set;
+	gc->direction_output = gpio_mockup_dirout;
+	gc->direction_input = gpio_mockup_dirin;
+	gc->get_direction = gpio_mockup_get_direction;
+
+	chip->lines = devm_kzalloc(dev, sizeof(*chip->lines) * gc->ngpio,
 				   GFP_KERNEL);
-	if (!cntr->stats) {
+	if (!chip->lines) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ret = devm_gpiochip_add_data(dev, &cntr->gc, cntr);
+
+	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
 	if (ret)
 		goto err;
 
 	dev_info(dev, "gpio<%d..%d> add successful!", base, base + ngpio);
 	return 0;
+
 err:
 	dev_err(dev, "gpio<%d..%d> add failed!", base, base + ngpio);
 	return ret;
 }
 
-static int mockup_gpio_probe(struct platform_device *pdev)
+static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	struct mockup_gpio_controller *cntr;
+	struct gpio_mockup_chip *chips;
 	struct device *dev = &pdev->dev;
 	int ret, i, base, ngpio;
 	char *chip_name;
@@ -128,15 +134,17 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 	if (gpio_mockup_params_nr < 2)
 		return -EINVAL;
 
-	cntr = devm_kzalloc(dev, sizeof(*cntr) * (gpio_mockup_params_nr >> 1),
-			    GFP_KERNEL);
-	if (!cntr)
+	chips = devm_kzalloc(dev,
+			     sizeof(*chips) * (gpio_mockup_params_nr >> 1),
+			     GFP_KERNEL);
+	if (!chips)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, cntr);
+	platform_set_drvdata(pdev, chips);
 
 	for (i = 0; i < gpio_mockup_params_nr >> 1; i++) {
 		base = gpio_mockup_ranges[i * 2];
+
 		if (base == -1)
 			ngpio = gpio_mockup_ranges[i * 2 + 1];
 		else
@@ -144,16 +152,17 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 
 		if (ngpio >= 0) {
 			chip_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "%s-%c", GPIO_NAME,
-						   pins_name_start + i);
+						   "%s-%c", GPIO_MOCKUP_NAME,
+						   gpio_mockup_name_start + i);
 			if (!chip_name)
 				return -ENOMEM;
 
-			ret = mockup_gpio_add(dev, &cntr[i],
+			ret = gpio_mockup_add(dev, &chips[i],
 					      chip_name, base, ngpio);
 		} else {
 			ret = -1;
 		}
+
 		if (ret) {
 			if (base < 0)
 				dev_err(dev, "gpio<%d..%d> add failed\n",
@@ -169,11 +178,11 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver mockup_gpio_driver = {
+static struct platform_driver gpio_mockup_driver = {
 	.driver = {
-		.name = GPIO_NAME,
+		.name = GPIO_MOCKUP_NAME,
 	},
-	.probe = mockup_gpio_probe,
+	.probe = gpio_mockup_probe,
 };
 
 static struct platform_device *pdev;
@@ -181,7 +190,7 @@ static int __init mock_device_init(void)
 {
 	int err;
 
-	pdev = platform_device_alloc(GPIO_NAME, -1);
+	pdev = platform_device_alloc(GPIO_MOCKUP_NAME, -1);
 	if (!pdev)
 		return -ENOMEM;
 
@@ -191,7 +200,7 @@ static int __init mock_device_init(void)
 		return err;
 	}
 
-	err = platform_driver_register(&mockup_gpio_driver);
+	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
 		platform_device_unregister(pdev);
 		return err;
@@ -202,7 +211,7 @@ static int __init mock_device_init(void)
 
 static void __exit mock_device_exit(void)
 {
-	platform_driver_unregister(&mockup_gpio_driver);
+	platform_driver_unregister(&gpio_mockup_driver);
 	platform_device_unregister(pdev);
 }
 
-- 
2.9.3

