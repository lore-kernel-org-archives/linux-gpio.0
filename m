From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: provide stubs for devres gpio functions
Date: Fri, 25 Oct 2013 15:48:11 +0200
Message-ID: <1382708891-12071-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:55639 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753244Ab3JYNsX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2013 09:48:23 -0400
Received: by mail-wg0-f43.google.com with SMTP id b13so3762434wgh.34
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2013 06:48:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

commit 6b3d8145dcfdbbb43f13544e16f44f4574f941dd
"gpiolib: make GPIO_DEVRES depend on GPIOLIB"
breaks builds when device drivers are using devm_gpio*
devres functions without enabling GPIOLIB, relying on
the devres code to be compiled anyway.

Provide stubs so that we get these if we're using the
devres functions without GPIOLIB.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio.h | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index c691df044458..09e0906333a2 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -77,6 +77,15 @@ static inline int irq_to_gpio(unsigned int irq)
 
 #endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
 
+/* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
+
+struct device;
+
+int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
+int devm_gpio_request_one(struct device *dev, unsigned gpio,
+			  unsigned long flags, const char *label);
+void devm_gpio_free(struct device *dev, unsigned int gpio);
+
 #else /* ! CONFIG_GPIOLIB */
 
 #include <linux/kernel.h>
@@ -241,14 +250,25 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
 	WARN_ON(1);
 }
 
-#endif /* ! CONFIG_GPIOLIB */
-
-struct device;
+static inline int devm_gpio_request(struct device *dev, unsigned gpio,
+				    const char *label)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
 
-/* bindings for managed devices that want to request gpios */
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
-			  unsigned long flags, const char *label);
-void devm_gpio_free(struct device *dev, unsigned int gpio);
+			  unsigned long flags, const char *label)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+void devm_gpio_free(struct device *dev, unsigned int gpio)
+{
+	WARN_ON(1);
+}
+
+#endif /* ! CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_H */
-- 
1.8.3.1

