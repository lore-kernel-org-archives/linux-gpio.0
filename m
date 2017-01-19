From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] pinctrl: Allow configuration of pins from gpiolib based drivers
Date: Thu, 19 Jan 2017 12:48:19 +0300
Message-ID: <20170119094820.83595-3-mika.westerberg@linux.intel.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:23827 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751577AbdASJtK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Jan 2017 04:49:10 -0500
In-Reply-To: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When a GPIO driver is backed by a pinctrl driver the GPIO driver
sometimes needs to call the pinctrl driver to configure certain things,
like whether the pin is used as input or output. In addition to this
there are other configurations applicable to GPIOs such as setting
debounce time of the GPIO.

To support this we introduce a new function pinctrl_gpio_set_config()
that can be used by gpiolib based driver to pass configuration requests
to the backing pinctrl driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/core.c           | 28 ++++++++++++++++++++++++++++
 drivers/pinctrl/pinconf.c        | 12 ++++++++++++
 drivers/pinctrl/pinconf.h        |  9 +++++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index fb38e208f32d..8f6b2631c244 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -688,6 +688,34 @@ int pinctrl_gpio_direction_output(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
+/**
+ * pinctrl_gpio_set_config() - Apply config to given GPIO pin
+ * @gpio: the GPIO pin number from the GPIO subsystem number space
+ *
+ * This function should *ONLY* be used from gpiolib-based GPIO drivers, if
+ * they need to call the underlying pin controller to change GPIO config
+ * (for example set debounce time).
+ */
+int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
+{
+	unsigned long configs[] = { config };
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gpio);
+	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 799048f3c8d4..c1c1ccc58267 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -200,6 +200,18 @@ int pinconf_apply_setting(struct pinctrl_setting const *setting)
 	return 0;
 }
 
+int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
+		       unsigned long *configs, size_t nconfigs)
+{
+	const struct pinconf_ops *ops;
+
+	ops = pctldev->desc->confops;
+	if (!ops)
+		return -ENOTSUPP;
+
+	return ops->pin_config_set(pctldev, pin, configs, nconfigs);
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 55c75780b3b2..bf8aff9abf32 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -20,6 +20,9 @@ int pinconf_map_to_setting(struct pinctrl_map const *map,
 void pinconf_free_setting(struct pinctrl_setting const *setting);
 int pinconf_apply_setting(struct pinctrl_setting const *setting);
 
+int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
+		       unsigned long *configs, size_t nconfigs);
+
 /*
  * You will only be interested in these if you're using PINCONF
  * so don't supply any stubs for these.
@@ -56,6 +59,12 @@ static inline int pinconf_apply_setting(struct pinctrl_setting const *setting)
 	return 0;
 }
 
+static inline int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned pin,
+				     unsigned long *configs, size_t nconfigs)
+{
+	return -ENOTSUPP;
+}
+
 #endif
 
 #if defined(CONFIG_PINCONF) && defined(CONFIG_DEBUG_FS)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index d7e5d608faa7..a0f2aba72fa9 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -29,6 +29,7 @@ extern int pinctrl_request_gpio(unsigned gpio);
 extern void pinctrl_free_gpio(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
 extern int pinctrl_gpio_direction_output(unsigned gpio);
+extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
 
 extern struct pinctrl * __must_check pinctrl_get(struct device *dev);
 extern void pinctrl_put(struct pinctrl *p);
@@ -80,6 +81,11 @@ static inline int pinctrl_gpio_direction_output(unsigned gpio)
 	return 0;
 }
 
+static inline int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
+{
+	return 0;
+}
+
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)
 {
 	return NULL;
-- 
2.11.0

