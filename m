From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] gpio: Propagate errors from gpiod_set_array_value_complex()
Date: Wed,  5 Sep 2018 11:05:54 +0200
Message-ID: <20180905090555.9888-3-geert+renesas@glider.be>
References: <20180905090555.9888-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905090555.9888-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Internal helper function gpiod_set_array_value_complex() was changed to
return an error value, but not all gpiolib callers were updated to
propagate the new error up.

Fixes: 3027743f83f867d8 ("gpio: Remove VLA from gpiolib")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/driver-api/gpio/consumer.rst | 12 ++++++------
 drivers/gpio/gpiolib.c                     | 22 +++++++++++-----------
 include/linux/gpio/consumer.h              | 20 +++++++++++---------
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index a4e340c1859439ad..c7302c7e0f858995 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -334,15 +334,15 @@ The following functions get or set the values of an array of GPIOs::
 					   struct gpio_desc **desc_array,
 					   int *value_array);
 
-	void gpiod_set_array_value(unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   int *value_array)
+	int gpiod_set_array_value(unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array)
 	int gpiod_set_raw_array_value(unsigned int array_size,
 				      struct gpio_desc **desc_array,
 				      int *value_array)
-	void gpiod_set_array_value_cansleep(unsigned int array_size,
-					    struct gpio_desc **desc_array,
-					    int *value_array)
+	int gpiod_set_array_value_cansleep(unsigned int array_size,
+					   struct gpio_desc **desc_array,
+					   int *value_array)
 	int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 					       struct gpio_desc **desc_array,
 					       int *value_array)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8f8a199939350a9..b8486e204b9e8c69 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3184,13 +3184,13 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value);
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
-void gpiod_set_array_value(unsigned int array_size,
-			   struct gpio_desc **desc_array, int *value_array)
+int gpiod_set_array_value(unsigned int array_size,
+			  struct gpio_desc **desc_array, int *value_array)
 {
 	if (!desc_array)
-		return;
-	gpiod_set_array_value_complex(false, false, array_size, desc_array,
-				      value_array);
+		return -EINVAL;
+	return gpiod_set_array_value_complex(false, false, array_size,
+					     desc_array, value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_array_value);
 
@@ -3542,15 +3542,15 @@ void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n)
  *
  * This function is to be called from contexts that can sleep.
  */
-void gpiod_set_array_value_cansleep(unsigned int array_size,
-				    struct gpio_desc **desc_array,
-				    int *value_array)
+int gpiod_set_array_value_cansleep(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array)
 {
 	might_sleep_if(extra_checks);
 	if (!desc_array)
-		return;
-	gpiod_set_array_value_complex(false, true, array_size, desc_array,
-				      value_array);
+		return -EINVAL;
+	return gpiod_set_array_value_complex(false, true, array_size,
+					     desc_array, value_array);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 21ddbe4400308ee5..54ca52f67e8cf38b 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -106,8 +106,8 @@ int gpiod_get_value(const struct gpio_desc *desc);
 int gpiod_get_array_value(unsigned int array_size,
 			  struct gpio_desc **desc_array, int *value_array);
 void gpiod_set_value(struct gpio_desc *desc, int value);
-void gpiod_set_array_value(unsigned int array_size,
-			   struct gpio_desc **desc_array, int *value_array);
+int gpiod_set_array_value(unsigned int array_size,
+			  struct gpio_desc **desc_array, int *value_array);
 int gpiod_get_raw_value(const struct gpio_desc *desc);
 int gpiod_get_raw_array_value(unsigned int array_size,
 			      struct gpio_desc **desc_array,
@@ -123,9 +123,9 @@ int gpiod_get_array_value_cansleep(unsigned int array_size,
 				   struct gpio_desc **desc_array,
 				   int *value_array);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
-void gpiod_set_array_value_cansleep(unsigned int array_size,
-				    struct gpio_desc **desc_array,
-				    int *value_array);
+int gpiod_set_array_value_cansleep(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
 int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
 				       struct gpio_desc **desc_array,
@@ -341,12 +341,13 @@ static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_array_value(unsigned int array_size,
-					 struct gpio_desc **desc_array,
-					 int *value_array)
+static inline int gpiod_set_array_value(unsigned int array_size,
+					struct gpio_desc **desc_array,
+					int *value_array)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
+	return 0;
 }
 static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
@@ -395,12 +396,13 @@ static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_array_value_cansleep(unsigned int array_size,
+static inline int gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
 					    int *value_array)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
+	return 0;
 }
 static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
-- 
2.17.1
