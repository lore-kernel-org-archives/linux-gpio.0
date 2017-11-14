From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: always include linux/gpio/consumer.h in linux/gpio.h
Date: Tue, 14 Nov 2017 12:39:47 +0100
Message-ID: <20171114114002.234250-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

linux/gpio/consumer.h is a bit odd, it contains definitions for a number
of the advanced gpio interfaces, in variants for both gpiolib-based
platforms and those not using gpiolib.

The file gets included implicitly by linux/gpio.h, but only if gpiolib
is enabled. Driver writers regularly fail to notice this and include
the top-level linux/gpio.h but use the newer interfaces.

The latest such driver is a new touchscreen driver that produced this
build failure on an x86 randconfig build:

drivers/input/touchscreen/hideep.c: In function 'hideep_power_on':
drivers/input/touchscreen/hideep.c:670:3: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
   gpiod_set_value_cansleep(ts->reset_gpio, 0);

I don't want to manually add linux/gpio/consumer.h inclusions to each
such file any more, so let's just include this in linux/gpio.h for everyone.

Fixes: 842ff286166e ("Input: add support for HiDeep touchscreen")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/gpio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 8ef7fc0ce0f0..7f6c6d31949f 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -89,6 +89,7 @@ void devm_gpio_free(struct device *dev, unsigned int gpio);
 
 #else /* ! CONFIG_GPIOLIB */
 
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/bug.h>
-- 
2.9.0
