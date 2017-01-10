From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from a gpiolib based drivers
Date: Tue, 10 Jan 2017 17:31:58 +0300
Message-ID: <20170110143201.53539-4-mika.westerberg@linux.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When a GPIO driver is backed by a pinctrl driver the GPIO driver often
needs to call the pinctrl driver to configure certain things, like
whether the pin is used as input or output. In addition to this there
are other pin configurations applicable to GPIOs such as debounce
timeout.

To support this we introduce a new function pinctrl_gpio_set_config()
that can be used by gpiolib based driver to pass configuration requests
to the backing pinctrl driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/core.c           | 28 ++++++++++++++++++++++++++++
 drivers/pinctrl/pinconf.c        | 12 ++++++++++++
 drivers/pinctrl/pinconf.h        | 10 ++++++++++
 include/linux/pinctrl/consumer.h |  8 ++++++++
 4 files changed, 58 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index fb38e208f32d..114b7a7bbaea 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -688,6 +688,34 @@ int pinctrl_gpio_direction_output(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
+/**
+ * pinctrl_gpio_set_config() - Apply configs to given GPIO pin
+ * @gpio: the GPIO pin number from the GPIO subsystem number space
+ *
+ * This function should *ONLY* be used from gpiolib-based GPIO drivers, if
+ * they need to call the underlying pin controller to change GPIO config
+ * (for example set debounce time).
+ */
+int pinctrl_gpio_set_config(unsigned gpio, unsigned long *configs,
+			    size_t nconfigs)
+{
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
+	ret = pinconf_gpio_set_config(pctldev, pin, configs, nconfigs);
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
index 799048f3c8d4..537c219a4f60 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -200,6 +200,18 @@ int pinconf_apply_setting(struct pinctrl_setting const *setting)
 	return 0;
 }
 
+int pinconf_gpio_set_config(struct pinctrl_dev *pctldev, unsigned pin,
+			    unsigned long *configs, size_t nconfigs)
+{
+	const struct pinconf_ops *ops;
+
+	ops = pctldev->desc->confops;
+	if (!ops)
+		return -EINVAL;
+
+	return ops->pin_config_set(pctldev, pin, configs, nconfigs);
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 55c75780b3b2..6e94e101357f 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -20,6 +20,9 @@ int pinconf_map_to_setting(struct pinctrl_map const *map,
 void pinconf_free_setting(struct pinctrl_setting const *setting);
 int pinconf_apply_setting(struct pinctrl_setting const *setting);
 
+int pinconf_gpio_set_config(struct pinctrl_dev *pctldev, unsigned pin,
+			    unsigned long *configs, size_t nconfigs);
+
 /*
  * You will only be interested in these if you're using PINCONF
  * so don't supply any stubs for these.
@@ -56,6 +59,13 @@ static inline int pinconf_apply_setting(struct pinctrl_setting const *setting)
 	return 0;
 }
 
+static inline int pinconf_gpio_set_config(struct pinctrl_dev *pctldev,
+					  unsigned pin, unsigned long *configs,
+					  size_t nconfigs)
+{
+	return -ENXIO;
+}
+
 #endif
 
 #if defined(CONFIG_PINCONF) && defined(CONFIG_DEBUG_FS)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index d7e5d608faa7..bf4dce0c04ea 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -29,6 +29,8 @@ extern int pinctrl_request_gpio(unsigned gpio);
 extern void pinctrl_free_gpio(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
 extern int pinctrl_gpio_direction_output(unsigned gpio);
+extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long *configs,
+				  size_t nconfigs);
 
 extern struct pinctrl * __must_check pinctrl_get(struct device *dev);
 extern void pinctrl_put(struct pinctrl *p);
@@ -80,6 +82,12 @@ static inline int pinctrl_gpio_direction_output(unsigned gpio)
 	return 0;
 }
 
+static inline int pinctrl_gpio_set_config(unsigned gpio, unsigned long *configs,
+					  size_t nconfigs)
+{
+	return 0;
+}
+
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)
 {
 	return NULL;
-- 
2.11.0
