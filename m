From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] gpio: OF: localize some gpiochip init functions
Date: Mon,  3 Oct 2016 11:02:40 +0200
Message-ID: <1475485360-15127-3-git-send-email-linus.walleij@linaro.org>
References: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33590 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751583AbcJCJCw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 05:02:52 -0400
Received: by mail-lf0-f53.google.com with SMTP id t81so81371695lfe.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 02:02:51 -0700 (PDT)
In-Reply-To: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

of_gpiochip_add() and of_gpiochip_remove() are only used locally
in the gpio subsystem so move these functions to the local
header.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.h  | 4 ++++
 include/linux/of_gpio.h | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9ef9cfee788d..ba1e383079a3 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -92,6 +92,8 @@ struct gpio_desc *of_find_gpio(struct device *dev,
 			       const char *con_id,
 			       unsigned int idx,
 			       enum gpio_lookup_flags *flags);
+int of_gpiochip_add(struct gpio_chip *gc);
+void of_gpiochip_remove(struct gpio_chip *gc);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device *dev,
 					     const char *con_id,
@@ -100,6 +102,8 @@ static inline struct gpio_desc *of_find_gpio(struct device *dev,
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
+static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 #endif /* CONFIG_OF_GPIO */
 
 #ifdef CONFIG_ACPI
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 092186c62ff4..3f87ea5b8bee 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -61,8 +61,6 @@ static inline int of_mm_gpiochip_add(struct device_node *np,
 }
 extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 
-extern int of_gpiochip_add(struct gpio_chip *gc);
-extern void of_gpiochip_remove(struct gpio_chip *gc);
 extern int of_gpio_simple_xlate(struct gpio_chip *gc,
 				const struct of_phandle_args *gpiospec,
 				u32 *flags);
@@ -86,9 +84,6 @@ static inline int of_gpio_simple_xlate(struct gpio_chip *gc,
 	return -ENOSYS;
 }
 
-static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
-static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
-
 #endif /* CONFIG_OF_GPIO */
 
 /**
-- 
2.7.4

