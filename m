From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move pincontrol calls to <linux/gpio/driver.h>
Date: Wed, 18 Mar 2015 02:04:43 +0100
Message-ID: <1426640683-22185-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:36496 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932090AbbCRBEv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:04:51 -0400
Received: by lamx15 with SMTP id x15so23582792lam.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:04:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

These functions do not belong in <asm-generic/gpio.h> since the
split into separate GPIO headers under <linux/gpio/*>. Move them
to <linux/gpio/driver.h> as is apropriate.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/asm-generic/gpio.h  | 48 ---------------------------------------------
 include/linux/gpio/driver.h | 48 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 383ade1a211b..9bb0d11729c9 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -5,7 +5,6 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <linux/of.h>
-#include <linux/pinctrl/pinctrl.h>
 
 #ifdef CONFIG_GPIOLIB
 
@@ -139,53 +138,6 @@ static inline void gpio_unexport(unsigned gpio)
 	gpiod_unexport(gpio_to_desc(gpio));
 }
 
-#ifdef CONFIG_PINCTRL
-
-/**
- * struct gpio_pin_range - pin range controlled by a gpio chip
- * @head: list for maintaining set of pin ranges, used internally
- * @pctldev: pinctrl device which handles corresponding pins
- * @range: actual range of pins controlled by a gpio controller
- */
-
-struct gpio_pin_range {
-	struct list_head node;
-	struct pinctrl_dev *pctldev;
-	struct pinctrl_gpio_range range;
-};
-
-int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
-			   unsigned int gpio_offset, unsigned int pin_offset,
-			   unsigned int npins);
-int gpiochip_add_pingroup_range(struct gpio_chip *chip,
-			struct pinctrl_dev *pctldev,
-			unsigned int gpio_offset, const char *pin_group);
-void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
-
-#else
-
-static inline int
-gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
-		       unsigned int gpio_offset, unsigned int pin_offset,
-		       unsigned int npins)
-{
-	return 0;
-}
-static inline int
-gpiochip_add_pingroup_range(struct gpio_chip *chip,
-			struct pinctrl_dev *pctldev,
-			unsigned int gpio_offset, const char *pin_group)
-{
-	return 0;
-}
-
-static inline void
-gpiochip_remove_pin_ranges(struct gpio_chip *chip)
-{
-}
-
-#endif /* CONFIG_PINCTRL */
-
 #else	/* !CONFIG_GPIOLIB */
 
 static inline bool gpio_is_valid(int number)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c497c62889d1..f1b36593ec9f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -6,6 +6,7 @@
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/pinctrl/pinctrl.h>
 
 struct device;
 struct gpio_desc;
@@ -173,6 +174,53 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
+#ifdef CONFIG_PINCTRL
+
+/**
+ * struct gpio_pin_range - pin range controlled by a gpio chip
+ * @head: list for maintaining set of pin ranges, used internally
+ * @pctldev: pinctrl device which handles corresponding pins
+ * @range: actual range of pins controlled by a gpio controller
+ */
+
+struct gpio_pin_range {
+	struct list_head node;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range range;
+};
+
+int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
+			   unsigned int gpio_offset, unsigned int pin_offset,
+			   unsigned int npins);
+int gpiochip_add_pingroup_range(struct gpio_chip *chip,
+			struct pinctrl_dev *pctldev,
+			unsigned int gpio_offset, const char *pin_group);
+void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
+
+#else
+
+static inline int
+gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
+		       unsigned int gpio_offset, unsigned int pin_offset,
+		       unsigned int npins)
+{
+	return 0;
+}
+static inline int
+gpiochip_add_pingroup_range(struct gpio_chip *chip,
+			struct pinctrl_dev *pctldev,
+			unsigned int gpio_offset, const char *pin_group)
+{
+	return 0;
+}
+
+static inline void
+gpiochip_remove_pin_ranges(struct gpio_chip *chip)
+{
+}
+
+#endif /* CONFIG_PINCTRL */
+
 struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 					    const char *label);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
-- 
1.9.3

