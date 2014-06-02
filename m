From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH 1/2][v4] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Mon, 02 Jun 2014 17:28:50 +0200
Message-ID: <2025835.bJlicUAVfz@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:41958 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbaFBP2z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jun 2014 11:28:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
interface which allow setting multiple outputs with just one function call.
Also add an optional set_multiple function to the driver interface. Without an
implementation of that function in the chip driver outputs are set
sequentially.

Implementing the set_multiple function in a chip driver allows for:
- Improved performance for certain use cases. The original motivation for this
  was the task of configuring an FPGA. In that specific case, where 9 GPIO
  lines have to be set many times, configuration time goes down from 48 s to
  20 s when using the new function.
- Simultaneous glitch-free setting of multiple pins on any kind of parallel
  bus attached to GPIOs provided they all reside on the same chip and bank.

Limitations:
  Performance is only improved for normal high-low outputs. Open drain and
  open source outputs are always set separately from each other. Those kinds
  of outputs could probably be accelerated in a similar way if we could
  forgo the error checking when setting GPIO directions.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
Change log:
  v4: - add gpiod_set_array function for setting logical values
      - change interface of the set_multiple driver function to use
        unsigned long as type for the bit fields
      - use generic bitops (which also use unsigned long for bit fields)
      - do not use ARCH_NR_GPIOS any more
  v3: - add documentation
      - change commit message
  v2: - use descriptor interface
      - allow arbitrary groups of GPIOs spanning multiple chips

 Documentation/gpio/consumer.txt |  23 +++++
 drivers/gpio/gpiolib.c          | 180 ++++++++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h   |  38 +++++++++
 include/linux/gpio/driver.h     |   4 +
 4 files changed, 245 insertions(+)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 09854fe..ba02b84 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -163,6 +163,29 @@ The active-low state of a GPIO can also be queried using the following call:
 Note that these functions should only be used with great moderation ; a driver
 should not have to care about the physical line level.
 
+Set multiple GPIO outputs with a single function call
+-----------------------------------------------------
+The following functions set the output values of an array of GPIOs:
+
+	void gpiod_set_array(unsigned int array_size,
+			     struct gpio_desc **desc_array,
+			     int *value_array)
+	void gpiod_set_raw_array(unsigned int array_size,
+				 struct gpio_desc **desc_array,
+				 int *value_array)
+	void gpiod_set_array_cansleep(unsigned int array_size,
+				      struct gpio_desc **desc_array,
+				      int *value_array)
+	void gpiod_set_raw_array_cansleep(unsigned int array_size,
+					  struct gpio_desc **desc_array,
+					  int *value_array)
+
+The array can be an arbitrary set of GPIOs. The functions will try to set
+GPIOs belonging to the same bank or chip simultaneously if supported by the
+corresponding chip driver. In that case a significantly improved performance
+can be expected. If simultaneous setting is not possible the GPIOs will be set
+sequentially.
+
 GPIOs mapped to IRQs
 --------------------
 GPIO lines can quite often be used as IRQs. You can get the IRQ number
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f48817d..a2be195 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2345,6 +2345,84 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
 		chip->set(chip, gpio_chip_hwgpio(desc), value);
 }
 
+/*
+ * set multiple outputs on the same chip;
+ * use the chip's set_multiple function if available;
+ * otherwise set the outputs sequentially;
+ * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
+ *        defines which outputs are to be changed
+ * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
+ *        defines the values the outputs specified by mask are to be set to
+ */
+static void gpio_chip_set_multiple(struct gpio_chip *chip,
+				   unsigned long *mask, unsigned long *bits)
+{
+	if (chip->set_multiple) {
+		chip->set_multiple(chip, mask, bits);
+	} else {
+		int i;
+		for (i = 0; i < chip->ngpio; i++) {
+			if (mask[BIT_WORD(i)] == 0) {
+				/* no more set bits in this mask word;
+				 * skip ahead to the next word */
+				i = (BIT_WORD(i) + 1) * BITS_PER_LONG - 1;
+				continue;
+			}
+			/* set outputs if the corresponding mask bit is set */
+			if (__test_and_clear_bit(i, mask)) {
+				chip->set(chip, i, test_bit(i, bits));
+			}
+		}
+	}
+}
+
+static void gpiod_set_array_priv(bool raw, unsigned int array_size,
+				 struct gpio_desc **desc_array,
+				 int *value_array)
+{
+	int i = 0;
+
+	while (i < array_size) {
+		struct gpio_chip *chip = desc_array[i]->chip;
+		unsigned long mask[BITS_TO_LONGS(chip->ngpio)];
+		unsigned long bits[BITS_TO_LONGS(chip->ngpio)];
+		int count = 0;
+
+		memset(mask, 0, sizeof(mask));
+		do {
+			struct gpio_desc *desc = desc_array[i];
+			int hwgpio = gpio_chip_hwgpio(desc);
+			int value = value_array[i];
+
+			if (!raw && test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+				value = !value;
+			trace_gpio_value(desc_to_gpio(desc), 0, value);
+			/*
+			 * collect all normal outputs belonging to the same chip
+			 * open drain and open source outputs are set individually
+			 */
+			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
+				_gpio_set_open_drain_value(desc,value);
+			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+				_gpio_set_open_source_value(desc, value);
+			} else {
+				__set_bit(hwgpio, mask);
+				if (value) {
+					__set_bit(hwgpio, bits);
+				} else {
+					__clear_bit(hwgpio, bits);
+				}
+				count++;
+			}
+			i++;
+		} while ((i < array_size) && (desc_array[i]->chip == chip));
+		/* push collected bits to outputs */
+		if (count != 0) {
+			gpio_chip_set_multiple(chip, mask, bits);
+		}
+	}
+}
+
 /**
  * gpiod_set_raw_value() - assign a gpio's raw value
  * @desc: gpio whose value will be assigned
@@ -2390,6 +2468,60 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
 /**
+ * gpiod_set_raw_array() - assign values to an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be assigned
+ * @value_array: array of values to assign
+ *
+ * Set the raw values of the GPIOs, i.e. the values of the physical lines
+ * without regard for their ACTIVE_LOW status.
+ *
+ * This function should be called from contexts where we cannot sleep, and will
+ * complain if the GPIO chip functions potentially sleep.
+ */
+void gpiod_set_raw_array(unsigned int array_size,
+			 struct gpio_desc **desc_array, int *value_array)
+{
+	if (array_size == 0)
+		return;
+	if (!desc_array)
+		return;
+	if (!desc_array[0])
+		return;
+	/* Should be using gpiod_set_raw_array_cansleep() */
+	WARN_ON(desc_array[0]->chip->can_sleep);
+	gpiod_set_array_priv(true, array_size, desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_raw_array);
+
+/**
+ * gpiod_set_array() - assign values to an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be assigned
+ * @value_array: array of values to assign
+ *
+ * Set the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
+ * into account.
+ *
+ * This function should be called from contexts where we cannot sleep, and will
+ * complain if the GPIO chip functions potentially sleep.
+ */
+void gpiod_set_array(unsigned int array_size,
+		     struct gpio_desc **desc_array, int *value_array)
+{
+	if (array_size == 0)
+		return;
+	if (!desc_array)
+		return;
+	if (!desc_array[0])
+		return;
+	/* Should be using gpiod_set_array_cansleep() */
+	WARN_ON(desc_array[0]->chip->can_sleep);
+	gpiod_set_array_priv(false, array_size, desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_array);
+
+/**
  * gpiod_cansleep() - report whether gpio value access may sleep
  * @desc: gpio to check
  *
@@ -2559,6 +2691,54 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
 
 /**
+ * gpiod_set_raw_array_cansleep() - assign values to an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be assigned
+ * @value_array: array of values to assign
+ *
+ * Set the raw values of the GPIOs, i.e. the values of the physical lines
+ * without regard for their ACTIVE_LOW status.
+ *
+ * This function is to be called from contexts that can sleep.
+ */
+void gpiod_set_raw_array_cansleep(unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array)
+{
+	might_sleep_if(extra_checks);
+	if (array_size == 0)
+		return;
+	if (!desc_array)
+		return;
+	gpiod_set_array_priv(true, array_size, desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_raw_array_cansleep);
+
+/**
+ * gpiod_set_array_cansleep() - assign values to an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be assigned
+ * @value_array: array of values to assign
+ *
+ * Set the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
+ * into account.
+ *
+ * This function is to be called from contexts that can sleep.
+ */
+void gpiod_set_array_cansleep(unsigned int array_size,
+			      struct gpio_desc **desc_array,
+			      int *value_array)
+{
+	might_sleep_if(extra_checks);
+	if (array_size == 0)
+		return;
+	if (!desc_array)
+		return;
+	gpiod_set_array_priv(false, array_size, desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_array_cansleep);
+
+/**
  * gpiod_add_lookup_table() - register GPIO device consumers
  * @table: table of consumers to register
  */
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index bed128e..f87315a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -40,14 +40,24 @@ int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
 void gpiod_set_value(struct gpio_desc *desc, int value);
+void gpiod_set_array(unsigned int array_size,
+		     struct gpio_desc **desc_array, int *value_array);
 int gpiod_get_raw_value(const struct gpio_desc *desc);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
+void gpiod_set_raw_array(unsigned int array_size,
+			 struct gpio_desc **desc_array, int *value_array);
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
+void gpiod_set_array_cansleep(unsigned int array_size,
+			      struct gpio_desc **desc_array,
+			      int *value_array);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
+void gpiod_set_raw_array_cansleep(unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 
@@ -139,6 +149,13 @@ static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_array(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -150,6 +167,13 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_raw_array(unsigned int array_size,
+				       struct gpio_desc **desc_array,
+				       int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 
 static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 {
@@ -162,6 +186,13 @@ static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_array_cansleep(unsigned int array_size,
+					    struct gpio_desc **desc_array,
+					    int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -174,6 +205,13 @@ static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_raw_array_cansleep(unsigned int array_size,
+						struct gpio_desc **desc_array,
+						int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 
 static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1827b43..9e9ad1e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -32,6 +32,7 @@ struct seq_file;
  * @get: returns value for signal "offset"; for output signals this
  *	returns either the value actually sensed, or zero
  * @set: assigns output value for signal "offset"
+ * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_debounce: optional hook for setting debounce time for specified gpio in
  *      interrupt triggered gpio chips
  * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
@@ -84,6 +85,9 @@ struct gpio_chip {
 						unsigned offset);
 	void			(*set)(struct gpio_chip *chip,
 						unsigned offset, int value);
+	void			(*set_multiple)(struct gpio_chip *chip,
+						unsigned long *mask,
+						unsigned long *bits);
 	int			(*set_debounce)(struct gpio_chip *chip,
 						unsigned offset,
 						unsigned debounce);

--
1.8.5.5
