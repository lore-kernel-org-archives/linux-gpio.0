From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] gpio: Restore indentation of continued lines
Date: Thu, 27 Sep 2018 13:38:10 +0200
Message-ID: <20180927113810.30721-4-geert+renesas@glider.be>
References: <20180927113810.30721-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927113810.30721-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laura Abbott <labbott@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Fixes: 3027743f83f867d8 ("gpio: Remove VLA from gpiolib")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of gpio array rework.
---
 drivers/gpio/gpiolib.c        | 20 ++++++++++----------
 drivers/gpio/gpiolib.h        |  8 ++++----
 include/linux/gpio/consumer.h | 18 +++++++++---------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 843a8075ac437d57..8f2bae4c0f3ac80b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3104,10 +3104,10 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 }
 
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
-				   unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   struct gpio_array *array_info,
-				   unsigned long *value_bitmap)
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  struct gpio_array *array_info,
+				  unsigned long *value_bitmap)
 {
 	int i = 0;
 
@@ -3282,9 +3282,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_value);
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_set_raw_array_value(unsigned int array_size,
-			 struct gpio_desc **desc_array,
-			 struct gpio_array *array_info,
-			 unsigned long *value_bitmap)
+			      struct gpio_desc **desc_array,
+			      struct gpio_array *array_info,
+			      unsigned long *value_bitmap)
 {
 	if (!desc_array)
 		return -EINVAL;
@@ -3683,9 +3683,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
  * This function is to be called from contexts that can sleep.
  */
 int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-					struct gpio_desc **desc_array,
-					struct gpio_array *array_info,
-					unsigned long *value_bitmap)
+				       struct gpio_desc **desc_array,
+				       struct gpio_array *array_info,
+				       unsigned long *value_bitmap)
 {
 	might_sleep_if(extra_checks);
 	if (!desc_array)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index f23a0c6814940ca7..85b84a02ba622ea1 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -199,10 +199,10 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap);
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
-				   unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   struct gpio_array *array_info,
-				   unsigned long *value_bitmap);
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  struct gpio_array *array_info,
+				  unsigned long *value_bitmap);
 
 /* This is just passed between gpiolib and devres */
 struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 136aeca37740decf..0f350616d37219a2 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -128,9 +128,9 @@ int gpiod_get_raw_array_value(unsigned int array_size,
 			      unsigned long *value_bitmap);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
 int gpiod_set_raw_array_value(unsigned int array_size,
-			       struct gpio_desc **desc_array,
-			       struct gpio_array *array_info,
-			       unsigned long *value_bitmap);
+			      struct gpio_desc **desc_array,
+			      struct gpio_array *array_info,
+			      unsigned long *value_bitmap);
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
@@ -150,9 +150,9 @@ int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
 				       unsigned long *value_bitmap);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
 int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-					struct gpio_desc **desc_array,
-					struct gpio_array *array_info,
-					unsigned long *value_bitmap);
+				       struct gpio_desc **desc_array,
+				       struct gpio_array *array_info,
+				       unsigned long *value_bitmap);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
@@ -391,9 +391,9 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	WARN_ON(1);
 }
 static inline int gpiod_set_raw_array_value(unsigned int array_size,
-					     struct gpio_desc **desc_array,
-					     struct gpio_array *array_info,
-					     unsigned long *value_bitmap)
+					    struct gpio_desc **desc_array,
+					    struct gpio_array *array_info,
+					    unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
-- 
2.17.1
