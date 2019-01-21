From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 4/4] gpiolib: Take MUX usage into account
Date: Mon, 21 Jan 2019 08:11:25 +0100
Message-ID: <1548054685-3781-5-git-send-email-stefan.wahren@i2se.com>
References: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The user space like gpioinfo only see the GPIO usage but not the
MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
pin is free/safe to use. So take the MUX usage of strict pinmux controllers
into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpio/gpiolib.c           |  3 ++-
 drivers/pinctrl/core.c           | 23 +++++++++++++++++++++++
 drivers/pinctrl/pinmux.c         | 18 ++++++++++++++++++
 drivers/pinctrl/pinmux.h         |  7 +++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1651d7f..da3b008 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1075,7 +1075,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
 		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 		    test_bit(FLAG_EXPORT, &desc->flags) ||
-		    test_bit(FLAG_SYSFS, &desc->flags))
+		    test_bit(FLAG_SYSFS, &desc->flags) ||
+		    pinctrl_gpio_is_in_use(chip->base + lineinfo.line_offset))
 			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
 		if (test_bit(FLAG_IS_OUT, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c6ff4d5..6e097e4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -760,6 +760,29 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
+bool pinctrl_gpio_is_in_use(unsigned gpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range *range;
+	bool result;
+	int pin;
+
+	if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
+		return false;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gpio);
+
+	result = pinmux_is_in_use(pctldev, pin);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_is_in_use);
+
 /**
  * pinctrl_gpio_request() - request a single pin to be used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 4d0cc18..c1f6d46 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -71,6 +71,24 @@ int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+
+	if (!desc) {
+		dev_err(pctldev->dev,
+			"pin %u is not registered so it cannot be requested\n",
+			pin);
+		return false;
+	}
+
+	if (ops->strict && desc->mux_usecount)
+		return true;
+
+	return ops->strict && !!desc->gpio_owner;
+}
+
 /**
  * pin_request() - request a single pin to be muxed in, typically for GPIO
  * @pin: the pin number in the global pin space
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 3319535..1da2a75 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -16,6 +16,8 @@ int pinmux_check_ops(struct pinctrl_dev *pctldev);
 
 int pinmux_validate_map(const struct pinctrl_map *map, int i);
 
+bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin);
+
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio);
@@ -43,6 +45,11 @@ static inline int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+static inline bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	return false;
+}
+
 static inline int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 0412cc9..0093a2b 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -25,6 +25,7 @@ struct device;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
+extern bool pinctrl_gpio_is_in_use(unsigned gpio);
 extern int pinctrl_gpio_request(unsigned gpio);
 extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
@@ -62,6 +63,11 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 
 #else /* !CONFIG_PINCTRL */
 
+static inline bool pinctrl_gpio_is_in_use(unsigned gpio)
+{
+	return 0;
+}
+
 static inline int pinctrl_gpio_request(unsigned gpio)
 {
 	return 0;
-- 
2.7.4
