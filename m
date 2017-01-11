From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: provide lockdep keys for nested/unnested irqchips
Date: Wed, 11 Jan 2017 13:43:13 +0100
Message-ID: <20170111124313.4210-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36600 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933649AbdAKMnT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 07:43:19 -0500
Received: by mail-lf0-f51.google.com with SMTP id o140so80952968lff.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 04:43:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>

The helper function for adding a GPIO chip compiles in a lockdep
key for debugging, the same key is needed for nested chips as
well.

The macro construction is unreadable, replace this with two
static inlines instead.

The _gpiochip_irqchip_add prefixed function is not helpful,
rename it with gpiochip_irqchip_add_key() that tell us what the
function is actually doing.

Fixes: d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 18 ++++++------
 include/linux/gpio/driver.h | 70 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86bf3b84ada5..a07ae9e37930 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1723,7 +1723,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 }
 
 /**
- * _gpiochip_irqchip_add() - adds an irqchip to a gpiochip
+ * gpiochip_irqchip_add_key() - adds an irqchip to a gpiochip
  * @gpiochip: the gpiochip to add the irqchip to
  * @irqchip: the irqchip to add to the gpiochip
  * @first_irq: if not dynamically assigned, the base (first) IRQ to
@@ -1749,13 +1749,13 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * the pins on the gpiochip can generate a unique IRQ. Everything else
  * need to be open coded.
  */
-int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
-			  struct irq_chip *irqchip,
-			  unsigned int first_irq,
-			  irq_flow_handler_t handler,
-			  unsigned int type,
-			  bool nested,
-			  struct lock_class_key *lock_key)
+int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
+			     struct irq_chip *irqchip,
+			     unsigned int first_irq,
+			     irq_flow_handler_t handler,
+			     unsigned int type,
+			     bool nested,
+			     struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
 	bool irq_base_set = false;
@@ -1840,7 +1840,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(_gpiochip_irqchip_add);
+EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c2748accea71..3dce976441f9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -274,37 +274,67 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		int parent_irq);
 
-int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
+int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
+			     struct irq_chip *irqchip,
+			     unsigned int first_irq,
+			     irq_flow_handler_t handler,
+			     unsigned int type,
+			     bool nested,
+			     struct lock_class_key *lock_key);
+
+#ifdef CONFIG_LOCKDEP
+
+/*
+ * Lockdep requires that each irqchip instance be created with a
+ * unique key so as to avoid unnecessary warnings. This upfront
+ * boilerplate static inlines provides such a key for each
+ * unique instance.
+ */
+static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
+				       struct irq_chip *irqchip,
+				       unsigned int first_irq,
+				       irq_flow_handler_t handler,
+				       unsigned int type)
+{
+	static struct lock_class_key _key;
+
+	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+					handler, type, false, &_key);
+}
+
+static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 			  struct irq_chip *irqchip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
-			  unsigned int type,
-			  bool nested,
-			  struct lock_class_key *lock_key);
+			  unsigned int type)
+{
+
+	static struct lock_class_key _key;
+
+	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+					handler, type, true, &key);
+}
+#else
+static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
+				       struct irq_chip *irqchip,
+				       unsigned int first_irq,
+				       irq_flow_handler_t handler,
+				       unsigned int type)
+{
+	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+					handler, type, false, NULL);
+}
 
-/* FIXME: I assume threaded IRQchips do not have the lockdep problem */
 static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 			  struct irq_chip *irqchip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
 			  unsigned int type)
 {
-	return _gpiochip_irqchip_add(gpiochip, irqchip, first_irq,
-				     handler, type, true, NULL);
+	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+					handler, type, true, NULL);
 }
-
-#ifdef CONFIG_LOCKDEP
-#define gpiochip_irqchip_add(...)				\
-(								\
-	({							\
-		static struct lock_class_key _key;		\
-		_gpiochip_irqchip_add(__VA_ARGS__, false, &_key); \
-	})							\
-)
-#else
-#define gpiochip_irqchip_add(...)				\
-	_gpiochip_irqchip_add(__VA_ARGS__, false, NULL)
-#endif
+#endif /* CONFIG_LOCKDEP */
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
-- 
2.9.3

