From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 07/18] gpio: mockup: merge gpio_mockup_add() into gpio_mockup_probe()
Date: Mon, 27 Nov 2017 11:48:43 +0100
Message-ID: <20171127104854.333-8-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Now that the probe() function only does what is should, there's no
need to split the chip adding logic into a separate routine. Merge
gpio_mockup_add() into gpio_mockup_probe().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 78 ++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 9b2823a33538..2dbaeb69d2d2 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -231,13 +231,30 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	dev_err(dev, "error creating debugfs directory\n");
 }
 
-static int gpio_mockup_add(struct device *dev,
-			   struct gpio_mockup_chip *chip,
-			   const char *name, int base, int ngpio)
+static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	struct gpio_chip *gc = &chip->gc;
-	int ret;
+	struct gpio_mockup_platform_data *pdata;
+	struct gpio_mockup_chip *chip;
+	struct gpio_chip *gc;
+	int rv, base, ngpio;
+	struct device *dev;
+	char *name;
+
+	dev = &pdev->dev;
+	pdata = dev_get_platdata(dev);
+	base = pdata->base;
+	ngpio = pdata->ngpio;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
+			      pdev->name, pdata->index);
+	if (!name)
+		return -ENOMEM;
 
+	gc = &chip->gc;
 	gc->base = base;
 	gc->ngpio = ngpio;
 	gc->label = name;
@@ -256,18 +273,18 @@ static int gpio_mockup_add(struct device *dev,
 		return -ENOMEM;
 
 	if (gpio_mockup_named_lines) {
-		ret = gpio_mockup_name_lines(dev, chip);
-		if (ret)
-			return ret;
+		rv = gpio_mockup_name_lines(dev, chip);
+		if (rv)
+			return rv;
 	}
 
-	ret = devm_irq_sim_init(dev, &chip->irqsim, gc->ngpio);
-	if (ret)
-		return ret;
+	rv = devm_irq_sim_init(dev, &chip->irqsim, gc->ngpio);
+	if (rv)
+		return rv;
 
-	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
-	if (ret)
-		return ret;
+	rv = devm_gpiochip_add_data(dev, &chip->gc, chip);
+	if (rv)
+		return rv;
 
 	if (gpio_mockup_dbg_dir)
 		gpio_mockup_debugfs_setup(dev, chip);
@@ -275,39 +292,6 @@ static int gpio_mockup_add(struct device *dev,
 	return 0;
 }
 
-static int gpio_mockup_probe(struct platform_device *pdev)
-{
-	struct gpio_mockup_platform_data *pdata;
-	struct gpio_mockup_chip *chip;
-	int rv, base, ngpio;
-	struct device *dev;
-	char *name;
-
-	dev = &pdev->dev;
-	pdata = dev_get_platdata(dev);
-	base = pdata->base;
-	ngpio = pdata->ngpio;
-
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
-			      pdev->name, pdata->index);
-	if (!name)
-		return -ENOMEM;
-
-	rv = gpio_mockup_add(dev, chip, name, base, ngpio);
-	if (rv) {
-		dev_err(dev,
-			"adding gpiochip failed (base: %d, ngpio: %d)\n",
-			base, base < 0 ? ngpio : base + ngpio);
-		return rv;
-	}
-
-	return 0;
-}
-
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
 		.name = GPIO_MOCKUP_NAME,
-- 
2.15.0
