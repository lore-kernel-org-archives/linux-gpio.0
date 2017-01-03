From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO
Date: Tue,  3 Jan 2017 19:01:19 +0200
Message-ID: <20170103170119.35950-3-andriy.shevchenko@linux.intel.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:29421 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753285AbdACRCo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Jan 2017 12:02:44 -0500
In-Reply-To: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Make fwnode_get_named_gpiod() consistent with the rest of gpiod_get() like API,
i.e. configure GPIO pin immediately after request.

Besides obvious clean up it will help to configure pins based on firmware
provided resources.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/devres.c                     |  9 +++++++--
 drivers/gpio/gpiolib.c                    | 20 ++++++++++++++++----
 drivers/input/keyboard/gpio_keys.c        |  9 +--------
 drivers/input/keyboard/gpio_keys_polled.c | 11 ++---------
 drivers/leds/leds-gpio.c                  |  2 +-
 drivers/video/fbdev/amba-clcd-nomadik.c   | 15 +++++----------
 include/linux/gpio/consumer.h             | 19 +++++++++++++------
 7 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index 54da61112752..3da9c39fed04 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -129,13 +129,18 @@ EXPORT_SYMBOL(devm_gpiod_get_index);
  * @dev:	GPIO consumer
  * @con_id:	function within the GPIO consumer
  * @child:	firmware node (child of @dev)
+ * @flags:	GPIO initialization flags
  *
  * GPIO descriptors returned from this function are automatically disposed on
  * driver detach.
+ *
+ * On successfull request the GPIO pin is configured in accordance with
+ * provided @flags.
  */
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child)
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags)
 {
 	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
@@ -155,7 +160,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 			snprintf(prop_name, sizeof(prop_name), "%s",
 					    gpio_suffixes[i]);
 
-		desc = fwnode_get_named_gpiod(child, prop_name);
+		desc = fwnode_get_named_gpiod(child, prop_name, flags);
 		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7f51c9bf5533..38e415642e03 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3303,6 +3303,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
  * @propname:	name of the firmware property representing the GPIO
+ * @dflags:	GPIO initialization flags
  *
  * This function can be used for drivers that get their configuration
  * from firmware.
@@ -3311,12 +3312,17 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * underlying firmware interface and then makes sure that the GPIO
  * descriptor is requested before it is returned to the caller.
  *
+ * On successfull request the GPIO pin is configured in accordance with
+ * provided @dflags.
+ *
  * In case of error an ERR_PTR() is returned.
  */
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname)
+					 const char *propname,
+					 enum gpiod_flags dflags)
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	unsigned long lflags = 0;
 	bool active_low = false;
 	bool single_ended = false;
 	int ret;
@@ -3349,13 +3355,19 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		return ERR_PTR(ret);
 
 	if (active_low)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		lflags |= GPIO_ACTIVE_LOW;
 
 	if (single_ended) {
 		if (active_low)
-			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+			lflags |= GPIO_OPEN_DRAIN;
 		else
-			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+			lflags |= GPIO_OPEN_SOURCE;
+	}
+
+	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
+	if (ret < 0) {
+		gpiod_put(desc);
+		return ERR_PTR(ret);
 	}
 
 	return desc;
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 582462d0af75..9de4b876100a 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -481,7 +481,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	spin_lock_init(&bdata->lock);
 
 	if (child) {
-		bdata->gpiod = devm_get_gpiod_from_child(dev, NULL, child);
+		bdata->gpiod = devm_get_gpiod_from_child(dev, NULL, child, GPIOD_IN);
 		if (IS_ERR(bdata->gpiod)) {
 			error = PTR_ERR(bdata->gpiod);
 			if (error == -ENOENT) {
@@ -496,13 +496,6 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 						error);
 				return error;
 			}
-		} else {
-			error = gpiod_direction_input(bdata->gpiod);
-			if (error) {
-				dev_err(dev, "Failed to configure GPIO %d as input: %d\n",
-					desc_to_gpio(bdata->gpiod), error);
-				return error;
-			}
 		}
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index bed4f2086158..fd7ab4dad87b 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -304,7 +304,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 			}
 
 			bdata->gpiod = devm_get_gpiod_from_child(dev, NULL,
-								 child);
+								 child,
+								 GPIOD_IN);
 			if (IS_ERR(bdata->gpiod)) {
 				error = PTR_ERR(bdata->gpiod);
 				if (error != -EPROBE_DEFER)
@@ -314,14 +315,6 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				fwnode_handle_put(child);
 				return error;
 			}
-
-			error = gpiod_direction_input(bdata->gpiod);
-			if (error) {
-				dev_err(dev, "Failed to configure GPIO %d as input: %d\n",
-					desc_to_gpio(bdata->gpiod), error);
-				fwnode_handle_put(child);
-				return error;
-			}
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dcaf4d29..00cc671cddcc 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -174,7 +174,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		const char *state = NULL;
 		struct device_node *np = to_of_node(child);
 
-		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
+		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child, GPIOD_ASIS);
 		if (IS_ERR(led.gpiod)) {
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
diff --git a/drivers/video/fbdev/amba-clcd-nomadik.c b/drivers/video/fbdev/amba-clcd-nomadik.c
index 0c06fcaaa6e8..2e800d70b0e5 100644
--- a/drivers/video/fbdev/amba-clcd-nomadik.c
+++ b/drivers/video/fbdev/amba-clcd-nomadik.c
@@ -184,32 +184,27 @@ static void tpg110_init(struct device *dev, struct device_node *np,
 {
 	dev_info(dev, "TPG110 display init\n");
 
-	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode);
+	/* This asserts the GRESTB signal, putting the display into reset */
+	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode, GPIOD_OUT_HIGH);
 	if (IS_ERR(grestb)) {
 		dev_err(dev, "no GRESTB GPIO\n");
 		return;
 	}
-	/* This asserts the GRESTB signal, putting the display into reset */
-	gpiod_direction_output(grestb, 1);
-
-	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode);
+	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(scen)) {
 		dev_err(dev, "no SCEN GPIO\n");
 		return;
 	}
-	gpiod_direction_output(scen, 0);
-	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode);
+	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(scl)) {
 		dev_err(dev, "no SCL GPIO\n");
 		return;
 	}
-	gpiod_direction_output(scl, 0);
-	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode);
+	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(sda)) {
 		dev_err(dev, "no SDA GPIO\n");
 		return;
 	}
-	gpiod_direction_output(sda, 0);
 	board->enable = tpg110_enable;
 	board->disable = tpg110_disable;
 }
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fb0fde686cb1..930d10049d8d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -135,10 +135,12 @@ int desc_to_gpio(const struct gpio_desc *desc);
 struct fwnode_handle;
 
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname);
+					 const char *propname,
+					 enum gpiod_flags dflags);
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child);
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags);
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -411,14 +413,19 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 /* Child properties interface */
 struct fwnode_handle;
 
-static inline struct gpio_desc *fwnode_get_named_gpiod(
-	struct fwnode_handle *fwnode, const char *propname)
+static inline
+struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
+					 const char *propname,
+					 enum gpiod_flags dflags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline struct gpio_desc *devm_get_gpiod_from_child(
-	struct device *dev, const char *con_id, struct fwnode_handle *child)
+static inline
+struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
+					    const char *con_id,
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.11.0

