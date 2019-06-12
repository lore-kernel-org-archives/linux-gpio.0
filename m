From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] include: linux: gpio: fix build warnings on undefined struct pinctrl_dev
Date: Wed, 12 Jun 2019 23:59:36 +0200
Message-ID: <1560376776-21994-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

This fixes the warnings:

* include/linux/gpio.h:254:11: warning: 'struct pinctrl_dev' declared
  inside parameter list will not be visible outside of this definition
  or declaration
* include/linux/gpio/driver.h:602:11: warning: 'struct pinctrl_dev'
  declared inside parameter list will not be visible outside of this
  definition or declaration

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/gpio.h        | 1 +
 include/linux/gpio/driver.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 39745b8..40915b4 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -106,6 +106,7 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 
 struct device;
 struct gpio_chip;
+struct pinctrl_dev;
 
 static inline bool gpio_is_valid(int number)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c..b58b27c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -590,6 +590,8 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 
 #else
 
+struct pinctrl_dev;
+
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
-- 
1.9.1
