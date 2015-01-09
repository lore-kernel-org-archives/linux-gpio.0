From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH 1/2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Fri, 09 Jan 2015 16:19:47 +0100
Message-ID: <3961090.tifPlxnXvR@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:38198 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758107AbbAIP1z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jan 2015 10:27:55 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Introduce new functions for conveniently obtaining and disposing of an entire
array of GPIOs with one function call.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 Documentation/gpio/consumer.txt |   28 ++++++++++++-
 drivers/gpio/gpiolib.c          |   84 ++++++++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h   |   42 ++++++++++++++++++++
 3 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index c67f806..d02f341 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -58,7 +58,6 @@ pattern where a GPIO is optional, the gpiod_get_optional() and
 gpiod_get_index_optional() functions can be used. These functions return NULL
 instead of -ENOENT if no GPIO has been assigned to the requested function:
 
-
 	struct gpio_desc *gpiod_get_optional(struct device *dev,
 					     const char *con_id,
 					     enum gpiod_flags flags)
@@ -68,6 +67,29 @@ instead of -ENOENT if no GPIO has been assigned to the requested function:
 						   unsigned int index,
 						   enum gpiod_flags flags)
 
+For a function using multiple GPIOs all of those can be obtained with one call:
+
+	int gpiod_get_array(struct device *dev,
+			    const char *con_id,
+			    struct gpio_desc **desc_array,
+			    unsigned int count,
+			    enum gpiod_flags flags)
+
+In this case an array for storing the GPIO descriptors and the number of GPIOs
+are required as additional arguments. This function either returns the
+requested number of GPIOs or an error code. It will not return a positive
+number if some but not all of the requested GPIOs could be obtained.
+The following function behaves differently:
+
+	int gpiod_get_array_optional(struct device *dev,
+				     const char *con_id,
+				     struct gpio_desc **desc_array,
+				     unsigned int could,
+				     enum gpiod_flags flags)
+
+This one returns the number of GPIOs actually available which can be smaller
+than the requested number or even 0.
+
 Device-managed variants of these functions are also defined:
 
 	struct gpio_desc *devm_gpiod_get(struct device *dev, const char *con_id,
@@ -91,6 +113,10 @@ A GPIO descriptor can be disposed of using the gpiod_put() function:
 
 	void gpiod_put(struct gpio_desc *desc)
 
+For an array of GPIOs this function can be used:
+
+	void gpiod_put_array(struct gpio_desc **desc_array, unsigned int count)
+
 It is strictly forbidden to use a descriptor after calling this function. The
 device-managed variant is, unsurprisingly:
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 56b7c5d..d45fa9c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1925,6 +1925,76 @@ struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
 EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
 
 /**
+ * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
+ * @dev:	GPIO consumer, can be NULL for system-global GPIOs
+ * @con_id:	function within the GPIO consumer
+ * @desc_array:	descriptor array for the acquired GPIOs
+ * @count:	number of GPIOs to obtain in the consumer
+ * @flags:	optional GPIO initialization flags
+ *
+ * This function obtains the specified number of GPIOs starting with index 0
+ * for functions that define several GPIOs.
+ *
+ * Return the actual number of acquired GPIOs, -ENOENT if the actual number of
+ * GPIOs assigned to the requested function is smaller than @count,
+ * or another IS_ERR() code if an error occurred while trying to acquire the
+ * GPIOs.
+ */
+int __must_check __gpiod_get_array(struct device *dev, const char *con_id,
+				   struct gpio_desc **desc_array,
+				   unsigned int count,
+				   enum gpiod_flags flags)
+{
+	int r;
+
+	r = gpiod_get_array_optional(dev, con_id, desc_array, count, flags);
+	if ((r >= 0) && (r != count)) {
+		gpiod_put_array(desc_array, r);
+		return -ENOENT;
+	}
+	return r;
+}
+EXPORT_SYMBOL_GPL(__gpiod_get_array);
+
+/**
+ * gpiod_get_array_optional - obtain multiple GPIOs from a multi-index GPIO
+ *                            function
+ * @dev:	GPIO consumer, can be NULL for system-global GPIOs
+ * @con_id:	function within the GPIO consumer
+ * @desc_array:	descriptor array for the acquired GPIOs
+ * @count:	number of GPIOs to obtain in the consumer
+ * @flags:	optional GPIO initialization flags
+ *
+ * This is equivalent to gpiod_get_array(), except that when the actual number
+ * of GPIOs assigned to the requested function is smaller than @count it will
+ * not return an error but the number of GPIOs actually available.
+ */
+int __must_check __gpiod_get_array_optional(struct device *dev,
+					    const char *con_id,
+					    struct gpio_desc **desc_array,
+					    unsigned int count,
+					    enum gpiod_flags flags)
+{
+	struct gpio_desc *desc;
+	unsigned int n;
+
+	for (n = 0; n < count; ) {
+		desc = gpiod_get_index(dev, con_id, n, flags);
+		if (IS_ERR(desc)) {
+			if (PTR_ERR(desc) != -ENOENT) {
+				gpiod_put_array(desc_array, n);
+				return PTR_ERR(desc);
+			}
+			break;
+		}
+		desc_array[n] = desc;
+		n++;
+	}
+	return n;
+}
+EXPORT_SYMBOL_GPL(__gpiod_get_array_optional);
+
+/**
  * gpiod_put - dispose of a GPIO descriptor
  * @desc:	GPIO descriptor to dispose of
  *
@@ -1936,6 +2006,20 @@ void gpiod_put(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
+/**
+ * gpiod_put_array - dispose of multiple GPIO descriptors
+ * @desc_array:	GPIO descriptor array
+ * @count:	number of GPIOs in the array
+ */
+void gpiod_put_array(struct gpio_desc **desc_array, unsigned int count)
+{
+	unsigned int n;
+
+	for (n = 0; n < count; n++)
+		gpiod_put(desc_array[n]);
+}
+EXPORT_SYMBOL_GPL(gpiod_put_array);
+
 #ifdef CONFIG_DEBUG_FS
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index d54d158..f225d25 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -49,7 +49,17 @@ struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
 							const char *con_id,
 							unsigned int index,
 							enum gpiod_flags flags);
+int __must_check __gpiod_get_array(struct device *dev, const char *con_id,
+				   struct gpio_desc **desc_array,
+				   unsigned int count,
+				   enum gpiod_flags flags);
+int __must_check __gpiod_get_array_optional(struct device *dev,
+					    const char *con_id,
+					    struct gpio_desc **desc_array,
+					    unsigned int count,
+					    enum gpiod_flags flags);
 void gpiod_put(struct gpio_desc *desc);
+void gpiod_put_array(struct gpio_desc **desc_array, unsigned int count);
 
 struct gpio_desc *__must_check __devm_gpiod_get(struct device *dev,
 					      const char *con_id,
@@ -135,6 +145,22 @@ __gpiod_get_index_optional(struct device *dev, const char *con_id,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int __must_check
+__gpiod_get_array(struct device *dev, const char *con_id,
+		  struct gpio_desc **desc_array, unsigned int count,
+		  enum gpiod_flags flags)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline int __must_check
+__gpiod_get_array_optional(struct device *dev, const char *con_id,
+			   struct gpio_desc **desc_array, unsigned int count,
+			   enum gpiod_flags flags)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void gpiod_put(struct gpio_desc *desc)
 {
 	might_sleep();
@@ -143,6 +169,15 @@ static inline void gpiod_put(struct gpio_desc *desc)
 	WARN_ON(1);
 }
 
+static inline void gpiod_put_array(struct gpio_desc **desc_array,
+				   unsigned int count)
+{
+	might_sleep();
+
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
+
 static inline struct gpio_desc *__must_check
 __devm_gpiod_get(struct device *dev,
 		 const char *con_id,
@@ -344,6 +379,13 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 	__gpiod_get_index_optional(dev, con_id, index, flags)
 #define gpiod_get_index_optional(varargs...)				\
 	__gpiod_get_index_optional(varargs, 0)
+#define __gpiod_get_array(dev, con_id, desc_array, count, flags, ...)	\
+	__gpiod_get_array(dev, con_id, desc_array, count, flags)
+#define gpiod_get_array(varargs...) __gpiod_get_array(varargs, 0)
+#define __gpiod_get_array_optional(dev, con_id, desc_array, count, flags, ...) \
+	__gpiod_get_array_optional(dev, con_id, desc_array, count, flags)
+#define gpiod_get_array_optional(varargs...)				\
+	__gpiod_get_array_optional(varargs, 0)
 #define __devm_gpiod_get(dev, con_id, flags, ...)			\
 	__devm_gpiod_get(dev, con_id, flags)
 #define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, 0)
--
2.0.5
