From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] pinctrl/gpio: Unify namespace for cross-calls
Date: Fri, 22 Sep 2017 11:22:40 +0200
Message-ID: <20170922092243.7546-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:56533 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751809AbdIVJWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 05:22:50 -0400
Received: by mail-lf0-f53.google.com with SMTP id a18so544254lfl.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 02:22:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The pinctrl_request_gpio() and pinctrl_free_gpio() break the nice
namespacing in the other cross-calls like pinctrl_gpio_foo().
Just rename them and all references so we have one namespace
with all cross-calls under pinctrl_gpio_*().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/pinctl.rst       |  6 +++---
 Documentation/gpio/gpio-legacy.txt        | 10 +++++-----
 Documentation/translations/zh_CN/gpio.txt |  6 +++---
 drivers/gpio/gpio-aspeed.c                |  4 ++--
 drivers/gpio/gpio-em.c                    |  4 ++--
 drivers/gpio/gpio-pxa.c                   |  4 ++--
 drivers/gpio/gpio-rcar.c                  |  4 ++--
 drivers/gpio/gpio-tegra.c                 |  4 ++--
 drivers/gpio/gpio-tz1090.c                |  4 ++--
 drivers/gpio/gpiolib.c                    |  4 ++--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c  |  4 ++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c    |  4 ++--
 drivers/pinctrl/core.c                    | 12 ++++++------
 drivers/pinctrl/core.h                    |  2 +-
 drivers/pinctrl/meson/pinctrl-meson.c     |  4 ++--
 drivers/pinctrl/sh-pfc/gpio.c             |  4 ++--
 drivers/pinctrl/sirf/pinctrl-atlas7.c     |  4 ++--
 drivers/pinctrl/sirf/pinctrl-sirf.c       |  4 ++--
 drivers/pinctrl/spear/pinctrl-plgpio.c    |  6 +++---
 drivers/pinctrl/stm32/pinctrl-stm32.c     |  4 ++--
 include/linux/pinctrl/consumer.h          |  8 ++++----
 21 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
index 48f15b4f9d3e..6cb68d67fa75 100644
--- a/Documentation/driver-api/pinctl.rst
+++ b/Documentation/driver-api/pinctl.rst
@@ -757,8 +757,8 @@ that your datasheet calls "GPIO mode", but actually is just an electrical
 configuration for a certain device. See the section below named
 "GPIO mode pitfalls" for more details on this scenario.
 
-The public pinmux API contains two functions named pinctrl_request_gpio()
-and pinctrl_free_gpio(). These two functions shall *ONLY* be called from
+The public pinmux API contains two functions named pinctrl_gpio_request()
+and pinctrl_gpio_free(). These two functions shall *ONLY* be called from
 gpiolib-based drivers as part of their gpio_request() and
 gpio_free() semantics. Likewise the pinctrl_gpio_direction_[input|output]
 shall only be called from within respective gpio_direction_[input|output]
@@ -790,7 +790,7 @@ gpiolib driver and the affected GPIO range, pin offset and desired direction
 will be passed along to this function.
 
 Alternatively to using these special functions, it is fully allowed to use
-named functions for each GPIO pin, the pinctrl_request_gpio() will attempt to
+named functions for each GPIO pin, the pinctrl_gpio_request() will attempt to
 obtain the function "gpioN" where "N" is the global GPIO pin number if no
 special GPIO-handler is registered.
 
diff --git a/Documentation/gpio/gpio-legacy.txt b/Documentation/gpio/gpio-legacy.txt
index 5eacc147ea87..8356d0e78f67 100644
--- a/Documentation/gpio/gpio-legacy.txt
+++ b/Documentation/gpio/gpio-legacy.txt
@@ -273,8 +273,8 @@ easily, gating off unused clocks.
 
 For GPIOs that use pins known to the pinctrl subsystem, that subsystem should
 be informed of their use; a gpiolib driver's .request() operation may call
-pinctrl_request_gpio(), and a gpiolib driver's .free() operation may call
-pinctrl_free_gpio(). The pinctrl subsystem allows a pinctrl_request_gpio()
+pinctrl_gpio_request(), and a gpiolib driver's .free() operation may call
+pinctrl_gpio_free(). The pinctrl subsystem allows a pinctrl_gpio_request()
 to succeed concurrently with a pin or pingroup being "owned" by a device for
 pin multiplexing.
 
@@ -448,8 +448,8 @@ together with an optional gpio feature. We have already covered the
 case where e.g. a GPIO controller need to reserve a pin or set the
 direction of a pin by calling any of:
 
-pinctrl_request_gpio()
-pinctrl_free_gpio()
+pinctrl_gpio_request()
+pinctrl_gpio_free()
 pinctrl_gpio_direction_input()
 pinctrl_gpio_direction_output()
 
@@ -466,7 +466,7 @@ gpio (under gpiolib) is still maintained by gpio drivers. It may happen
 that different pin ranges in a SoC is managed by different gpio drivers.
 
 This makes it logical to let gpio drivers announce their pin ranges to
-the pin ctrl subsystem before it will call 'pinctrl_request_gpio' in order
+the pin ctrl subsystem before it will call 'pinctrl_gpio_request' in order
 to request the corresponding pin to be prepared by the pinctrl subsystem
 before any gpio usage.
 
diff --git a/Documentation/translations/zh_CN/gpio.txt b/Documentation/translations/zh_CN/gpio.txt
index bce972521065..4f8bf30a41dc 100644
--- a/Documentation/translations/zh_CN/gpio.txt
+++ b/Documentation/translations/zh_CN/gpio.txt
@@ -257,9 +257,9 @@ GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其
 简单地关闭未使用时钟)。
 
 对于 GPIO 使用 pinctrl 子系统已知的引脚，子系统应该被告知其使用情况；
-一个 gpiolib 驱动的 .request()操作应调用 pinctrl_request_gpio()，
-而 gpiolib 驱动的 .free()操作应调用 pinctrl_free_gpio()。pinctrl
-子系统允许 pinctrl_request_gpio()在某个引脚或引脚组以复用形式“属于”
+一个 gpiolib 驱动的 .request()操作应调用 pinctrl_gpio_request()，
+而 gpiolib 驱动的 .free()操作应调用 pinctrl_gpio_free()。pinctrl
+子系统允许 pinctrl_gpio_request()在某个引脚或引脚组以复用形式“属于”
 一个设备时都成功返回。
 
 任何须将 GPIO 信号导向适当引脚的引脚复用硬件的编程应该发生在 GPIO
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index bfc53995064a..c269cc199707 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -536,12 +536,12 @@ static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (!have_gpio(gpiochip_get_data(chip), offset))
 		return -ENODEV;
 
-	return pinctrl_request_gpio(chip->base + offset);
+	return pinctrl_gpio_request(chip->base + offset);
 }
 
 static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 }
 
 static inline void __iomem *bank_debounce_reg(struct aspeed_gpio *gpio,
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 8d32ccc980d9..b86e09e1b13b 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -239,12 +239,12 @@ static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int em_gio_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_request_gpio(chip->base + offset);
+	return pinctrl_gpio_request(chip->base + offset);
 }
 
 static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 
 	/* Set the GPIO as an input to ensure that the next GPIO request won't
 	* drive the GPIO pin as an output.
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 6029899789f3..da68d6cbc1e4 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -332,12 +332,12 @@ static int pxa_gpio_of_xlate(struct gpio_chip *gc,
 
 static int pxa_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_request_gpio(chip->base + offset);
+	return pinctrl_gpio_request(chip->base + offset);
 }
 
 static void pxa_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 }
 
 static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 1f0871553fd2..43b51045aa47 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -249,7 +249,7 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 	if (error < 0)
 		return error;
 
-	error = pinctrl_request_gpio(chip->base + offset);
+	error = pinctrl_gpio_request(chip->base + offset);
 	if (error)
 		pm_runtime_put(&p->pdev->dev);
 
@@ -260,7 +260,7 @@ static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 
 	/*
 	 * Set the GPIO as an input to ensure that the next GPIO request won't
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index fbaf974277df..8db47f671708 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -141,14 +141,14 @@ static void tegra_gpio_disable(struct tegra_gpio_info *tgi, unsigned int gpio)
 
 static int tegra_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_request_gpio(offset);
+	return pinctrl_gpio_request(offset);
 }
 
 static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
-	pinctrl_free_gpio(offset);
+	pinctrl_gpio_free(offset);
 	tegra_gpio_disable(tgi, offset);
 }
 
diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 22c5be65051f..0bb9bb583889 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -232,7 +232,7 @@ static int tz1090_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 	int ret;
 
-	ret = pinctrl_request_gpio(chip->base + offset);
+	ret = pinctrl_gpio_request(chip->base + offset);
 	if (ret)
 		return ret;
 
@@ -246,7 +246,7 @@ static void tz1090_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 
 	tz1090_gpio_clear_bit(bank, REG_GPIO_BIT_EN, offset);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac4e26a..a9cb825ef335 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1859,7 +1859,7 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
  */
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_request_gpio(chip->gpiodev->base + offset);
+	return pinctrl_gpio_request(chip->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
@@ -1870,7 +1870,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  */
 void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_free_gpio(chip->gpiodev->base + offset);
+	pinctrl_gpio_free(chip->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 85a8c97d9dfe..5d08d989b1d0 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -311,7 +311,7 @@ static int iproc_gpio_request(struct gpio_chip *gc, unsigned offset)
 	if (!chip->pinmux_is_supported)
 		return 0;
 
-	return pinctrl_request_gpio(gpio);
+	return pinctrl_gpio_request(gpio);
 }
 
 static void iproc_gpio_free(struct gpio_chip *gc, unsigned offset)
@@ -322,7 +322,7 @@ static void iproc_gpio_free(struct gpio_chip *gc, unsigned offset)
 	if (!chip->pinmux_is_supported)
 		return;
 
-	pinctrl_free_gpio(gpio);
+	pinctrl_gpio_free(gpio);
 }
 
 static int iproc_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 1cfe45fd391f..c1887072936e 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -282,14 +282,14 @@ static int nsp_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned gpio = gc->base + offset;
 
-	return pinctrl_request_gpio(gpio);
+	return pinctrl_gpio_request(gpio);
 }
 
 static void nsp_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned gpio = gc->base + offset;
 
-	pinctrl_free_gpio(gpio);
+	pinctrl_gpio_free(gpio);
 }
 
 static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 56fbe4c3e800..4c8d5b23e4d0 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -733,14 +733,14 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 }
 
 /**
- * pinctrl_request_gpio() - request a single pin to be used as GPIO
+ * pinctrl_gpio_request() - request a single pin to be used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
  *
  * This function should *ONLY* be used from gpiolib-based GPIO drivers,
  * as part of their gpio_request() semantics, platforms and individual drivers
  * shall *NOT* request GPIO pins to be muxed in.
  */
-int pinctrl_request_gpio(unsigned gpio)
+int pinctrl_gpio_request(unsigned gpio)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range;
@@ -765,17 +765,17 @@ int pinctrl_request_gpio(unsigned gpio)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pinctrl_request_gpio);
+EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
 
 /**
- * pinctrl_free_gpio() - free control on a single pin, currently used as GPIO
+ * pinctrl_gpio_free() - free control on a single pin, currently used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
  *
  * This function should *ONLY* be used from gpiolib-based GPIO drivers,
  * as part of their gpio_free() semantics, platforms and individual drivers
  * shall *NOT* request GPIO pins to be muxed out.
  */
-void pinctrl_free_gpio(unsigned gpio)
+void pinctrl_gpio_free(unsigned gpio)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range;
@@ -795,7 +795,7 @@ void pinctrl_free_gpio(unsigned gpio)
 
 	mutex_unlock(&pctldev->mutex);
 }
-EXPORT_SYMBOL_GPL(pinctrl_free_gpio);
+EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
 
 static int pinctrl_gpio_direction(unsigned gpio, bool input)
 {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7880c3adc450..8cf2eba17c8c 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -154,7 +154,7 @@ struct pinctrl_setting {
  *	or pin, and each of these will increment the @usecount.
  * @mux_owner: The name of device that called pinctrl_get().
  * @mux_setting: The most recent selected mux setting for this pin, if any.
- * @gpio_owner: If pinctrl_request_gpio() was called for this pin, this is
+ * @gpio_owner: If pinctrl_gpio_request() was called for this pin, this is
  *	the name of the GPIO that "owns" this pin.
  */
 struct pin_desc {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c12733..e6e12a7b21e0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -412,14 +412,14 @@ static const struct pinconf_ops meson_pinconf_ops = {
 
 static int meson_gpio_request(struct gpio_chip *chip, unsigned gpio)
 {
-	return pinctrl_request_gpio(chip->base + gpio);
+	return pinctrl_gpio_request(chip->base + gpio);
 }
 
 static void meson_gpio_free(struct gpio_chip *chip, unsigned gpio)
 {
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
 
-	pinctrl_free_gpio(pc->data->pin_base + gpio);
+	pinctrl_gpio_free(pc->data->pin_base + gpio);
 }
 
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 6b5422766f13..946d9be50b62 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -139,12 +139,12 @@ static int gpio_pin_request(struct gpio_chip *gc, unsigned offset)
 	if (idx < 0 || pfc->info->pins[idx].enum_id == 0)
 		return -EINVAL;
 
-	return pinctrl_request_gpio(offset);
+	return pinctrl_gpio_request(offset);
 }
 
 static void gpio_pin_free(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_free_gpio(offset);
+	return pinctrl_gpio_free(offset);
 }
 
 static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 4db9323251e3..f4b192b493a0 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5860,7 +5860,7 @@ static int atlas7_gpio_request(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	if (pinctrl_request_gpio(chip->base + gpio))
+	if (pinctrl_gpio_request(chip->base + gpio))
 		return -ENODEV;
 
 	raw_spin_lock_irqsave(&a7gc->lock, flags);
@@ -5890,7 +5890,7 @@ static void atlas7_gpio_free(struct gpio_chip *chip,
 
 	raw_spin_unlock_irqrestore(&a7gc->lock, flags);
 
-	pinctrl_free_gpio(chip->base + gpio);
+	pinctrl_gpio_free(chip->base + gpio);
 }
 
 static int atlas7_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index d3ef05973901..d64add0b84cc 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -614,7 +614,7 @@ static int sirfsoc_gpio_request(struct gpio_chip *chip, unsigned offset)
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, offset);
 	unsigned long flags;
 
-	if (pinctrl_request_gpio(chip->base + offset))
+	if (pinctrl_gpio_request(chip->base + offset))
 		return -ENODEV;
 
 	spin_lock_irqsave(&bank->lock, flags);
@@ -644,7 +644,7 @@ static void sirfsoc_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 	spin_unlock_irqrestore(&bank->lock, flags);
 
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 }
 
 static int sirfsoc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index cf6d68c7345b..7a33e2e1e3e7 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -204,7 +204,7 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 	if (offset >= chip->ngpio)
 		return -EINVAL;
 
-	ret = pinctrl_request_gpio(gpio);
+	ret = pinctrl_gpio_request(gpio);
 	if (ret)
 		return ret;
 
@@ -242,7 +242,7 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 err0:
-	pinctrl_free_gpio(gpio);
+	pinctrl_gpio_free(gpio);
 	return ret;
 }
 
@@ -273,7 +273,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 
-	pinctrl_free_gpio(gpio);
+	pinctrl_gpio_free(gpio);
 }
 
 /* PLGPIO IRQ */
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 50299ad96659..a954d25bac4e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -150,12 +150,12 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
-	return pinctrl_request_gpio(chip->base + offset);
+	return pinctrl_gpio_request(chip->base + offset);
 }
 
 static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_free_gpio(chip->base + offset);
+	pinctrl_gpio_free(chip->base + offset);
 }
 
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index a0f2aba72fa9..0412cc9833e9 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -25,8 +25,8 @@ struct device;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
-extern int pinctrl_request_gpio(unsigned gpio);
-extern void pinctrl_free_gpio(unsigned gpio);
+extern int pinctrl_gpio_request(unsigned gpio);
+extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
 extern int pinctrl_gpio_direction_output(unsigned gpio);
 extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
@@ -62,12 +62,12 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 
 #else /* !CONFIG_PINCTRL */
 
-static inline int pinctrl_request_gpio(unsigned gpio)
+static inline int pinctrl_gpio_request(unsigned gpio)
 {
 	return 0;
 }
 
-static inline void pinctrl_free_gpio(unsigned gpio)
+static inline void pinctrl_gpio_free(unsigned gpio)
 {
 }
 
-- 
2.13.5

