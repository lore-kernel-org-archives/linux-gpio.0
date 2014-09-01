From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move varargs hack outside #ifdef GPIOLIB
Date: Mon,  1 Sep 2014 15:18:27 +0200
Message-ID: <1409577507-6752-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:49630 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752282AbaIANSd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Sep 2014 09:18:33 -0400
Received: by mail-we0-f179.google.com with SMTP id t60so5437586wes.10
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2014 06:18:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

commit 39b2bbe3d715cf5013b5c48695ccdd25bd3bf120
"gpio: add flags argument to gpiod_get*() functions"
added a dynamic flags argument to all the GPIOD getter
functions, however this did not cover the stubs so
when people used gpiod stubs to compile out descriptor
code, compilation failed.

Solve this by:
- Also rename all the stub functions __gpiod_*
- Moving the vararg hack outside of #ifdef CONFIG_GPIOLIB
  so these will always be available.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/consumer.h | 105 ++++++++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 45 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index c7e17de732f3..12f146fa6604 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -38,60 +38,32 @@ enum gpiod_flags {
 struct gpio_desc *__must_check __gpiod_get(struct device *dev,
 					 const char *con_id,
 					 enum gpiod_flags flags);
-#define __gpiod_get(dev, con_id, flags, ...) __gpiod_get(dev, con_id, flags)
-#define gpiod_get(varargs...) __gpiod_get(varargs, 0)
 struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
 					       const char *con_id,
 					       unsigned int idx,
 					       enum gpiod_flags flags);
-#define __gpiod_get_index(dev, con_id, index, flags, ...)		\
-	__gpiod_get_index(dev, con_id, index, flags)
-#define gpiod_get_index(varargs...) __gpiod_get_index(varargs, 0)
 struct gpio_desc *__must_check __gpiod_get_optional(struct device *dev,
 						  const char *con_id,
 						  enum gpiod_flags flags);
-#define __gpiod_get_optional(dev, con_id, flags, ...)			\
-	__gpiod_get_optional(dev, con_id, flags)
-#define gpiod_get_optional(varargs...) __gpiod_get_optional(varargs, 0)
 struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
 							const char *con_id,
 							unsigned int index,
 							enum gpiod_flags flags);
-#define __gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
-	__gpiod_get_index_optional(dev, con_id, index, flags)
-#define gpiod_get_index_optional(varargs...)				\
-	__gpiod_get_index_optional(varargs, 0)
-
 void gpiod_put(struct gpio_desc *desc);
 
 struct gpio_desc *__must_check __devm_gpiod_get(struct device *dev,
 					      const char *con_id,
 					      enum gpiod_flags flags);
-#define __devm_gpiod_get(dev, con_id, flags, ...)			\
-	__devm_gpiod_get(dev, con_id, flags)
-#define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, 0)
 struct gpio_desc *__must_check __devm_gpiod_get_index(struct device *dev,
 						    const char *con_id,
 						    unsigned int idx,
 						    enum gpiod_flags flags);
-#define __devm_gpiod_get_index(dev, con_id, index, flags, ...)		\
-	__devm_gpiod_get_index(dev, con_id, index, flags)
-#define devm_gpiod_get_index(varargs...) __devm_gpiod_get_index(varargs, 0)
 struct gpio_desc *__must_check __devm_gpiod_get_optional(struct device *dev,
 						       const char *con_id,
 						       enum gpiod_flags flags);
-#define __devm_gpiod_get_optional(dev, con_id, flags, ...)		\
-	__devm_gpiod_get_optional(dev, con_id, flags)
-#define devm_gpiod_get_optional(varargs...)				\
-	__devm_gpiod_get_optional(varargs, 0)
 struct gpio_desc *__must_check
 __devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
 			      unsigned int index, enum gpiod_flags flags);
-#define __devm_gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
-	__devm_gpiod_get_index_optional(dev, con_id, index, flags)
-#define devm_gpiod_get_index_optional(varargs...)			\
-	__devm_gpiod_get_index_optional(varargs, 0)
-
 void devm_gpiod_put(struct device *dev, struct gpio_desc *desc);
 
 int gpiod_get_direction(const struct gpio_desc *desc);
@@ -124,27 +96,31 @@ int desc_to_gpio(const struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
-static inline struct gpio_desc *__must_check gpiod_get(struct device *dev,
-						       const char *con_id)
+static inline struct gpio_desc *__must_check __gpiod_get(struct device *dev,
+						const char *con_id,
+						enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
-static inline struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
-							     const char *con_id,
-							     unsigned int idx)
+static inline struct gpio_desc *__must_check
+__gpiod_get_index(struct device *dev,
+		  const char *con_id,
+		  unsigned int idx,
+		  enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct gpio_desc *__must_check
-gpiod_get_optional(struct device *dev, const char *con_id)
+__gpiod_get_optional(struct device *dev, const char *con_id,
+		     enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct gpio_desc *__must_check
-gpiod_get_index_optional(struct device *dev, const char *con_id,
-			 unsigned int index)
+__gpiod_get_index_optional(struct device *dev, const char *con_id,
+			   unsigned int index, enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -157,28 +133,33 @@ static inline void gpiod_put(struct gpio_desc *desc)
 	WARN_ON(1);
 }
 
-static inline struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
-							    const char *con_id)
+static inline struct gpio_desc *__must_check
+__devm_gpiod_get(struct device *dev,
+		 const char *con_id,
+		 enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 static inline
-struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
-						    const char *con_id,
-						    unsigned int idx)
+struct gpio_desc *__must_check
+__devm_gpiod_get_index(struct device *dev,
+		       const char *con_id,
+		       unsigned int idx,
+		       enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct gpio_desc *__must_check
-devm_gpiod_get_optional(struct device *dev, const char *con_id)
+__devm_gpiod_get_optional(struct device *dev, const char *con_id,
+			  enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct gpio_desc *__must_check
-devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
-			      unsigned int index)
+__devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
+				unsigned int index, enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -303,9 +284,43 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 	return -EINVAL;
 }
 
-
 #endif /* CONFIG_GPIOLIB */
 
+/*
+ * Vararg-hacks! This is done to transition the kernel to always pass
+ * the options flags argument to the below functions. During a transition
+ * phase these vararg macros make both old-and-newstyle code compile,
+ * but when all calls to the elder API are removed, these should go away
+ * and the __gpiod_get() etc functions above be renamed just gpiod_get()
+ * etc.
+ */
+#define __gpiod_get(dev, con_id, flags, ...) __gpiod_get(dev, con_id, flags)
+#define gpiod_get(varargs...) __gpiod_get(varargs, 0)
+#define __gpiod_get_index(dev, con_id, index, flags, ...)		\
+	__gpiod_get_index(dev, con_id, index, flags)
+#define gpiod_get_index(varargs...) __gpiod_get_index(varargs, 0)
+#define __gpiod_get_optional(dev, con_id, flags, ...)			\
+	__gpiod_get_optional(dev, con_id, flags)
+#define gpiod_get_optional(varargs...) __gpiod_get_optional(varargs, 0)
+#define __gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
+	__gpiod_get_index_optional(dev, con_id, index, flags)
+#define gpiod_get_index_optional(varargs...)				\
+	__gpiod_get_index_optional(varargs, 0)
+#define __devm_gpiod_get(dev, con_id, flags, ...)			\
+	__devm_gpiod_get(dev, con_id, flags)
+#define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, 0)
+#define __devm_gpiod_get_index(dev, con_id, index, flags, ...)		\
+	__devm_gpiod_get_index(dev, con_id, index, flags)
+#define devm_gpiod_get_index(varargs...) __devm_gpiod_get_index(varargs, 0)
+#define __devm_gpiod_get_optional(dev, con_id, flags, ...)		\
+	__devm_gpiod_get_optional(dev, con_id, flags)
+#define devm_gpiod_get_optional(varargs...)				\
+	__devm_gpiod_get_optional(varargs, 0)
+#define __devm_gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
+	__devm_gpiod_get_index_optional(dev, con_id, index, flags)
+#define devm_gpiod_get_index_optional(varargs...)			\
+	__devm_gpiod_get_index_optional(varargs, 0)
+
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
 
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
-- 
1.9.3

