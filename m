From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH][RFC] gpiolib: rename gpiod_set_array to gpiod_set_array_value
Date: Wed, 13 May 2015 11:04:56 +0200
Message-ID: <5305088.q3JD5pGOgN@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:57814 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752022AbbEMJE7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 05:04:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

There have been concerns that the function names gpiod_set_array() and
gpiod_get_array() might be confusing to users. One might expect
gpiod_get_array() to return array values, while it is actually the array
counterpart of gpiod_get(). To be consistent with the single descriptor API
we could rename gpiod_set_array() to gpiod_set_array_value(). This makes
some function names a bit lengthy: gpiod_set_raw_array_value_cansleep().

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 drivers/gpio/gpiolib.c                 |   54 +++++++++++++++++----------------
 drivers/net/phy/mdio-mux-gpio.c        |    3 +
 drivers/tty/serial/serial_mctrl_gpio.c |    2 -
 include/linux/gpio/consumer.h          |   37 +++++++++++-----------
 4 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2ce3df3..37fe323 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1309,10 +1309,10 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 	}
 }
 
-static void gpiod_set_array_priv(bool raw, bool can_sleep,
-				 unsigned int array_size,
-				 struct gpio_desc **desc_array,
-				 int *value_array)
+static void gpiod_set_array_value_priv(bool raw, bool can_sleep,
+				       unsigned int array_size,
+				       struct gpio_desc **desc_array,
+				       int *value_array)
 {
 	int i = 0;
 
@@ -1405,7 +1405,7 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
 /**
- * gpiod_set_raw_array() - assign values to an array of GPIOs
+ * gpiod_set_raw_array_value() - assign values to an array of GPIOs
  * @array_size: number of elements in the descriptor / value arrays
  * @desc_array: array of GPIO descriptors whose values will be assigned
  * @value_array: array of values to assign
@@ -1416,17 +1416,18 @@ EXPORT_SYMBOL_GPL(gpiod_set_value);
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
-void gpiod_set_raw_array(unsigned int array_size,
+void gpiod_set_raw_array_value(unsigned int array_size,
 			 struct gpio_desc **desc_array, int *value_array)
 {
 	if (!desc_array)
 		return;
-	gpiod_set_array_priv(true, false, array_size, desc_array, value_array);
+	gpiod_set_array_value_priv(true, false, array_size, desc_array,
+				   value_array);
 }
-EXPORT_SYMBOL_GPL(gpiod_set_raw_array);
+EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value);
 
 /**
- * gpiod_set_array() - assign values to an array of GPIOs
+ * gpiod_set_array_value() - assign values to an array of GPIOs
  * @array_size: number of elements in the descriptor / value arrays
  * @desc_array: array of GPIO descriptors whose values will be assigned
  * @value_array: array of values to assign
@@ -1437,14 +1438,15 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_array);
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
-void gpiod_set_array(unsigned int array_size,
-		     struct gpio_desc **desc_array, int *value_array)
+void gpiod_set_array_value(unsigned int array_size,
+			   struct gpio_desc **desc_array, int *value_array)
 {
 	if (!desc_array)
 		return;
-	gpiod_set_array_priv(false, false, array_size, desc_array, value_array);
+	gpiod_set_array_value_priv(false, false, array_size, desc_array,
+				   value_array);
 }
-EXPORT_SYMBOL_GPL(gpiod_set_array);
+EXPORT_SYMBOL_GPL(gpiod_set_array_value);
 
 /**
  * gpiod_cansleep() - report whether gpio value access may sleep
@@ -1606,7 +1608,7 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
 
 /**
- * gpiod_set_raw_array_cansleep() - assign values to an array of GPIOs
+ * gpiod_set_raw_array_value_cansleep() - assign values to an array of GPIOs
  * @array_size: number of elements in the descriptor / value arrays
  * @desc_array: array of GPIO descriptors whose values will be assigned
  * @value_array: array of values to assign
@@ -1616,19 +1618,20 @@ EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
  *
  * This function is to be called from contexts that can sleep.
  */
-void gpiod_set_raw_array_cansleep(unsigned int array_size,
-				  struct gpio_desc **desc_array,
-				  int *value_array)
+void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
+					struct gpio_desc **desc_array,
+					int *value_array)
 {
 	might_sleep_if(extra_checks);
 	if (!desc_array)
 		return;
-	gpiod_set_array_priv(true, true, array_size, desc_array, value_array);
+	gpiod_set_array_value_priv(true, true, array_size, desc_array,
+				   value_array);
 }
-EXPORT_SYMBOL_GPL(gpiod_set_raw_array_cansleep);
+EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value_cansleep);
 
 /**
- * gpiod_set_array_cansleep() - assign values to an array of GPIOs
+ * gpiod_set_array_value_cansleep() - assign values to an array of GPIOs
  * @array_size: number of elements in the descriptor / value arrays
  * @desc_array: array of GPIO descriptors whose values will be assigned
  * @value_array: array of values to assign
@@ -1638,16 +1641,17 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_array_cansleep);
  *
  * This function is to be called from contexts that can sleep.
  */
-void gpiod_set_array_cansleep(unsigned int array_size,
-			      struct gpio_desc **desc_array,
-			      int *value_array)
+void gpiod_set_array_value_cansleep(unsigned int array_size,
+				    struct gpio_desc **desc_array,
+				    int *value_array)
 {
 	might_sleep_if(extra_checks);
 	if (!desc_array)
 		return;
-	gpiod_set_array_priv(false, true, array_size, desc_array, value_array);
+	gpiod_set_array_value_priv(false, true, array_size, desc_array,
+				   value_array);
 }
-EXPORT_SYMBOL_GPL(gpiod_set_array_cansleep);
+EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
 /**
  * gpiod_add_lookup_table() - register GPIO device consumers
diff --git a/drivers/net/phy/mdio-mux-gpio.c b/drivers/net/phy/mdio-mux-gpio.c
index 66edd99..7ddb1ab 100644
--- a/drivers/net/phy/mdio-mux-gpio.c
+++ b/drivers/net/phy/mdio-mux-gpio.c
@@ -35,7 +35,8 @@ static int mdio_mux_gpio_switch_fn(int current_child, int desired_child,
 	for (n = 0; n < s->gpios->ndescs; n++)
 		values[n] = (desired_child >> n) & 1;
 
-	gpiod_set_array_cansleep(s->gpios->ndescs, s->gpios->desc, values);
+	gpiod_set_array_value_cansleep(s->gpios->ndescs, s->gpios->desc,
+				       values);
 
 	return 0;
 }
diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 0ec756c..d7b846d 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -55,7 +55,7 @@ void mctrl_gpio_set(struct mctrl_gpios *gpios, unsigned int mctrl)
 			value_array[count] = !!(mctrl & mctrl_gpios_desc[i].mctrl);
 			count++;
 		}
-	gpiod_set_array(count, desc_array, value_array);
+	gpiod_set_array_value(count, desc_array, value_array);
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_set);
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 09a7fb0..fd09816 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -100,24 +100,25 @@ int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
 void gpiod_set_value(struct gpio_desc *desc, int value);
-void gpiod_set_array(unsigned int array_size,
-		     struct gpio_desc **desc_array, int *value_array);
+void gpiod_set_array_value(unsigned int array_size,
+			   struct gpio_desc **desc_array, int *value_array);
 int gpiod_get_raw_value(const struct gpio_desc *desc);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
-void gpiod_set_raw_array(unsigned int array_size,
-			 struct gpio_desc **desc_array, int *value_array);
+void gpiod_set_raw_array_value(unsigned int array_size,
+			       struct gpio_desc **desc_array,
+			       int *value_array);
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
-void gpiod_set_array_cansleep(unsigned int array_size,
-			      struct gpio_desc **desc_array,
-			      int *value_array);
+void gpiod_set_array_value_cansleep(unsigned int array_size,
+				    struct gpio_desc **desc_array,
+				    int *value_array);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
-void gpiod_set_raw_array_cansleep(unsigned int array_size,
-				  struct gpio_desc **desc_array,
-				  int *value_array);
+void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
+					struct gpio_desc **desc_array,
+					int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 
@@ -304,9 +305,9 @@ static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_array(unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   int *value_array)
+static inline void gpiod_set_array_value(unsigned int array_size,
+					 struct gpio_desc **desc_array,
+					 int *value_array)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
@@ -322,9 +323,9 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_raw_array(unsigned int array_size,
-				       struct gpio_desc **desc_array,
-				       int *value_array)
+static inline void gpiod_set_raw_array_value(unsigned int array_size,
+					     struct gpio_desc **desc_array,
+					     int *value_array)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
@@ -341,7 +342,7 @@ static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_array_cansleep(unsigned int array_size,
+static inline void gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
 					    int *value_array)
 {
@@ -360,7 +361,7 @@ static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
-static inline void gpiod_set_raw_array_cansleep(unsigned int array_size,
+static inline void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 						struct gpio_desc **desc_array,
 						int *value_array)
 {

--
2.3.6

