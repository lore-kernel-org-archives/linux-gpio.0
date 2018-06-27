From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] pinctrl: Add API function pinctrl_gpio_get_direction
Date: Wed, 27 Jun 2018 13:49:01 +0200
Message-ID: <20180627114904.10890-3-paul@crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

This function can be used to retrieve the direction (input/output) of a
given GPIO.

It should *ONLY* be used from gpiolib-based GPIO drivers, as part of their
gpio_get_direction() semantics, platforms and individual drivers shall
*NOT* touch pin control GPIO calls.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index e5a303002021..7fee8347fb51 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -849,6 +849,37 @@ int pinctrl_gpio_direction_output(unsigned gpio)
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
 /**
+ * pinctrl_gpio_get_direction() - Get the direction (input/output) of a GPIO pin
+ * @gpio: the GPIO pin number from the GPIO subsystem number space
+ *
+ * This function should *ONLY* be used from gpiolib-based GPIO drivers,
+ * as part of their gpio_get_direction() semantics, platforms and individual
+ * drivers shall *NOT* touch pin control GPIO calls.
+ */
+int pinctrl_gpio_get_direction(unsigned int gpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range *range;
+	int ret;
+	int pin;
+
+	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gpio);
+	ret = pinmux_gpio_get_direction(pctldev, range, pin);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_direction);
+
+/**
  * pinctrl_gpio_set_config() - Apply config to given GPIO pin
  * @gpio: the GPIO pin number from the GPIO subsystem number space
  * @config: the configuration to apply to the GPIO
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 0412cc9833e9..5f945c329f1c 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -29,6 +29,7 @@ extern int pinctrl_gpio_request(unsigned gpio);
 extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
 extern int pinctrl_gpio_direction_output(unsigned gpio);
+extern int pinctrl_gpio_get_direction(unsigned gpio);
 extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
 
 extern struct pinctrl * __must_check pinctrl_get(struct device *dev);
-- 
2.11.0
