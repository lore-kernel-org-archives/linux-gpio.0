From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 04/18] gpio: mockup: rework device probing
Date: Mon, 27 Nov 2017 11:48:40 +0100
Message-ID: <20171127104854.333-5-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

We currently create a single platform device in init and then parse
the configuration passed to us via module parameters in probe() before
creating GPIO chips and registering them with the gpiolib framework.

The relation between platform devices and mockup chips should be 1:1.

Create a separate platform device for each mockup chip using convenient
helpers (platform_device_register_resndata()). Pass a platform data
structure to probe() in which the configuration (GPIO base, number of
lines, chip index) extracted from the module params is stored. Make
probe() create a single mockup chip for every platform device.

This approach has several advantages:
- we only parse the module parameters in init() and can bail out before
  attaching any device if the input is invalid (currently we would
  have to examine kernel logs),
- we'll get notified by the device framework about errors in probe()
  for specific chips,
- probe() gets simplified and only does what it's supposed to.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 122 ++++++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0a269cbe197c..5ba8f2089de8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -62,6 +62,12 @@ struct gpio_mockup_dbgfs_private {
 	int offset;
 };
 
+struct gpio_mockup_platform_data {
+	int base;
+	int ngpio;
+	int index;
+};
+
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
 static int gpio_mockup_params_nr;
 module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
@@ -70,7 +76,6 @@ static bool gpio_mockup_named_lines;
 module_param_named(gpio_mockup_named_lines,
 		   gpio_mockup_named_lines, bool, 0400);
 
-static const char gpio_mockup_name_start = 'A';
 static struct dentry *gpio_mockup_dbg_dir;
 
 static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
@@ -270,48 +275,32 @@ static int gpio_mockup_add(struct device *dev,
 
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	int ret, i, base, ngpio, num_chips;
-	struct device *dev = &pdev->dev;
-	struct gpio_mockup_chip *chips;
-	char *chip_name;
+	struct gpio_mockup_platform_data *pdata;
+	struct gpio_mockup_chip *chip;
+	int rv, base, ngpio;
+	struct device *dev;
+	char *name;
 
-	/* Each chip is described by two values. */
-	num_chips = gpio_mockup_params_nr / 2;
+	dev = &pdev->dev;
+	pdata = dev_get_platdata(dev);
+	base = pdata->base;
+	ngpio = pdata->ngpio;
 
-	chips = devm_kcalloc(dev, num_chips, sizeof(*chips), GFP_KERNEL);
-	if (!chips)
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, chips);
-
-	for (i = 0; i < num_chips; i++) {
-		base = gpio_mockup_ranges[i * 2];
-
-		if (base == -1)
-			ngpio = gpio_mockup_ranges[i * 2 + 1];
-		else
-			ngpio = gpio_mockup_ranges[i * 2 + 1] - base;
-
-		if (ngpio >= 0) {
-			chip_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "%s-%c", GPIO_MOCKUP_NAME,
-						   gpio_mockup_name_start + i);
-			if (!chip_name)
-				return -ENOMEM;
-
-			ret = gpio_mockup_add(dev, &chips[i],
-					      chip_name, base, ngpio);
-		} else {
-			ret = -EINVAL;
-		}
-
-		if (ret) {
-			dev_err(dev,
-				"adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
-				ret, base, base < 0 ? ngpio : base + ngpio);
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
+			      pdev->name, pdata->index);
+	if (!name)
+		return -ENOMEM;
 
-			return ret;
-		}
+	rv = gpio_mockup_add(dev, chip, name, base, ngpio);
+	if (rv) {
+		dev_err(dev,
+			"adding gpiochip failed (base: %d, ngpio: %d)\n",
+			base, base < 0 ? ngpio : base + ngpio);
+		return rv;
 	}
 
 	return 0;
@@ -324,36 +313,67 @@ static struct platform_driver gpio_mockup_driver = {
 	.probe = gpio_mockup_probe,
 };
 
-static struct platform_device *gpio_mockup_pdev;
+static struct platform_device *gpio_mockup_pdevs[GPIO_MOCKUP_MAX_GC];
+
+static void gpio_mockup_unregister_pdevs(void)
+{
+	struct platform_device *pdev;
+	int i;
+
+	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
+		pdev = gpio_mockup_pdevs[i];
+
+		if (pdev)
+			platform_device_unregister(pdev);
+	}
+}
 
 static int __init gpio_mockup_init(void)
 {
-	int err;
+	int i, num_chips, err = 0, index = 'A';
+	struct gpio_mockup_platform_data pdata;
+	struct platform_device *pdev;
 
 	if ((gpio_mockup_params_nr < 2) ||
 	    (gpio_mockup_params_nr % 2) ||
 	    (gpio_mockup_params_nr > GPIO_MOCKUP_MAX_RANGES))
 		return -EINVAL;
 
+	/* Each chip is described by two values. */
+	num_chips = gpio_mockup_params_nr / 2;
+
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
 	if (!gpio_mockup_dbg_dir)
 		pr_err("%s: error creating debugfs directory\n",
 		       GPIO_MOCKUP_NAME);
 
-	gpio_mockup_pdev = platform_device_alloc(GPIO_MOCKUP_NAME, -1);
-	if (!gpio_mockup_pdev)
-		return -ENOMEM;
-
-	err = platform_device_add(gpio_mockup_pdev);
+	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		platform_device_put(gpio_mockup_pdev);
+		pr_err("%s: error registering platform driver\n",
+		       GPIO_MOCKUP_NAME);
 		return err;
 	}
 
-	err = platform_driver_register(&gpio_mockup_driver);
-	if (err) {
-		platform_device_unregister(gpio_mockup_pdev);
-		return err;
+	for (i = 0; i < num_chips; i++) {
+		pdata.index = index++;
+		pdata.base = gpio_mockup_ranges[i * 2];
+		pdata.ngpio = pdata.base < 0
+				? gpio_mockup_ranges[i * 2 + 1]
+				: gpio_mockup_ranges[i * 2 + 1] - pdata.base;
+
+		pdev = platform_device_register_resndata(NULL,
+							 GPIO_MOCKUP_NAME,
+							 i, NULL, 0, &pdata,
+							 sizeof(pdata));
+		if (!pdev) {
+			pr_err("%s: error registering device",
+			       GPIO_MOCKUP_NAME);
+			platform_driver_unregister(&gpio_mockup_driver);
+			gpio_mockup_unregister_pdevs();
+			return -ENOMEM;
+		}
+
+		gpio_mockup_pdevs[i] = pdev;
 	}
 
 	return 0;
@@ -363,7 +383,7 @@ static void __exit gpio_mockup_exit(void)
 {
 	debugfs_remove_recursive(gpio_mockup_dbg_dir);
 	platform_driver_unregister(&gpio_mockup_driver);
-	platform_device_unregister(gpio_mockup_pdev);
+	gpio_mockup_unregister_pdevs();
 }
 
 module_init(gpio_mockup_init);
-- 
2.15.0
