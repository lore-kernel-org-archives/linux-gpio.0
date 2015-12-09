From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 003/182] gpio: of: provide optional of_mm_gpiochip_add_data() function
Date: Wed,  9 Dec 2015 14:11:31 +0100
Message-ID: <1449666691-29754-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35719 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753962AbbLINLg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:11:36 -0500
Received: by lfdl133 with SMTP id l133so33717409lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:11:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

In the same spirit as we add an optional void *data argument
to the gpiochip_add_data() call, we need this also for
of_mm_gpiochip_add().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 12 +++++++-----
 include/linux/of_gpio.h   | 10 ++++++++--
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 6ed465ea2e12..42a4bb7cf49a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -262,9 +262,10 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
 EXPORT_SYMBOL(of_gpio_simple_xlate);
 
 /**
- * of_mm_gpiochip_add - Add memory mapped GPIO chip (bank)
+ * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
  * @np:		device node of the GPIO chip
  * @mm_gc:	pointer to the of_mm_gpio_chip allocated structure
+ * @data:	driver data to store in the struct gpio_chip
  *
  * To use this function you should allocate and fill mm_gc with:
  *
@@ -280,8 +281,9 @@ EXPORT_SYMBOL(of_gpio_simple_xlate);
  * do all necessary work for you. Then you'll able to use .regs
  * to manage GPIOs from the callbacks.
  */
-int of_mm_gpiochip_add(struct device_node *np,
-		       struct of_mm_gpio_chip *mm_gc)
+int of_mm_gpiochip_add_data(struct device_node *np,
+			    struct of_mm_gpio_chip *mm_gc,
+			    void *data)
 {
 	int ret = -ENOMEM;
 	struct gpio_chip *gc = &mm_gc->gc;
@@ -301,7 +303,7 @@ int of_mm_gpiochip_add(struct device_node *np,
 
 	mm_gc->gc.of_node = np;
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, data);
 	if (ret)
 		goto err2;
 
@@ -315,7 +317,7 @@ err0:
 	       np->full_name, ret);
 	return ret;
 }
-EXPORT_SYMBOL(of_mm_gpiochip_add);
+EXPORT_SYMBOL(of_mm_gpiochip_add_data);
 
 /**
  * of_mm_gpiochip_remove - Remove memory mapped GPIO chip (bank)
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 87d6d1632dd4..54a23d6e4892 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -51,8 +51,14 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
 extern int of_get_named_gpio_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags);
 
-extern int of_mm_gpiochip_add(struct device_node *np,
-			      struct of_mm_gpio_chip *mm_gc);
+extern int of_mm_gpiochip_add_data(struct device_node *np,
+				   struct of_mm_gpio_chip *mm_gc,
+				   void *data);
+static inline int of_mm_gpiochip_add(struct device_node *np,
+				     struct of_mm_gpio_chip *mm_gc)
+{
+	return of_mm_gpiochip_add_data(np, mm_gc, NULL);
+}
 extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 
 extern int of_gpiochip_add(struct gpio_chip *gc);
-- 
2.4.3

