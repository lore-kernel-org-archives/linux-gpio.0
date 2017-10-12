From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 2/5] gpio: Introduce ->get_multiple callback
Date: Thu, 12 Oct 2017 12:40:10 +0200
Message-ID: <487b9e42a3c3f5f50f4e9e90cbce65cdbeef0a79.1507797496.git.lukas@wunner.de>
References: <cover.1507797496.git.lukas@wunner.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:58285 "EHLO
        mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755835AbdJLKkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2017 06:40:55 -0400
In-Reply-To: <cover.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, Rojhalat Ibrahim <imr@rtschenk.de>

SPI-attached GPIO controllers typically read out all inputs in one go.
If callers desire the values of multipe inputs, ideally a single readout
should take place to return the desired values.  However the current
driver API only offers a ->get callback but no ->get_multiple (unlike
->set_multiple, which is present).  Thus, to read multiple inputs, a
full readout needs to be performed for every single value (barring
driver-internal caching), which is inefficient.

In fact, the lack of a ->get_multiple callback has been bemoaned
repeatedly by the gpio subsystem maintainer:
http://www.spinics.net/lists/linux-gpio/msg10571.html
http://www.spinics.net/lists/devicetree/msg121734.html

Introduce the missing callback.  Add corresponding consumer functions
such as gpiod_get_array_value().  Amend linehandle_ioctl() to take
advantage of the newly added infrastructure.  Update the documentation.

Cc: Rojhalat Ibrahim <imr@rtschenk.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Changes v1 -> v2:

- Update documentation. (Linus Walleij)
  Drop const qualifier from struct gpio_desc ** in all function
  signatures to avoid a cast when passing a non-const array created
  with gpiod_get_array(), which is likely the most common use case.

 Documentation/gpio/consumer.txt |  41 ++++++---
 drivers/gpio/gpiolib.c          | 179 +++++++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h          |   4 +
 include/linux/gpio/consumer.h   |  43 ++++++++++
 include/linux/gpio/driver.h     |   5 ++
 5 files changed, 250 insertions(+), 22 deletions(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index ddbfa775a78a..63e1bd1d88e3 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -295,9 +295,22 @@ as possible, especially by drivers which should not care about the actual
 physical line level and worry about the logical value instead.
 
 
-Set multiple GPIO outputs with a single function call
------------------------------------------------------
-The following functions set the output values of an array of GPIOs:
+Access multiple GPIOs with a single function call
+-------------------------------------------------
+The following functions get or set the values of an array of GPIOs:
+
+	int gpiod_get_array_value(unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array);
+	int gpiod_get_raw_array_value(unsigned int array_size,
+				      struct gpio_desc **desc_array,
+				      int *value_array);
+	int gpiod_get_array_value_cansleep(unsigned int array_size,
+					   struct gpio_desc **desc_array,
+					   int *value_array);
+	int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
+					   struct gpio_desc **desc_array,
+					   int *value_array);
 
 	void gpiod_set_array_value(unsigned int array_size,
 				   struct gpio_desc **desc_array,
@@ -312,34 +325,40 @@ The following functions set the output values of an array of GPIOs:
 						struct gpio_desc **desc_array,
 						int *value_array)
 
-The array can be an arbitrary set of GPIOs. The functions will try to set
+The array can be an arbitrary set of GPIOs. The functions will try to access
 GPIOs belonging to the same bank or chip simultaneously if supported by the
 corresponding chip driver. In that case a significantly improved performance
-can be expected. If simultaneous setting is not possible the GPIOs will be set
-sequentially.
+can be expected. If simultaneous access is not possible the GPIOs will be
+accessed sequentially.
 
-The gpiod_set_array() functions take three arguments:
+The functions take three arguments:
 	* array_size	- the number of array elements
 	* desc_array	- an array of GPIO descriptors
-	* value_array	- an array of values to assign to the GPIOs
+	* value_array	- an array to store the GPIOs' values (get) or
+			  an array of values to assign to the GPIOs (set)
 
 The descriptor array can be obtained using the gpiod_get_array() function
 or one of its variants. If the group of descriptors returned by that function
-matches the desired group of GPIOs, those GPIOs can be set by simply using
+matches the desired group of GPIOs, those GPIOs can be accessed by simply using
 the struct gpio_descs returned by gpiod_get_array():
 
 	struct gpio_descs *my_gpio_descs = gpiod_get_array(...);
 	gpiod_set_array_value(my_gpio_descs->ndescs, my_gpio_descs->desc,
 			      my_gpio_values);
 
-It is also possible to set a completely arbitrary array of descriptors. The
+It is also possible to access a completely arbitrary array of descriptors. The
 descriptors may be obtained using any combination of gpiod_get() and
 gpiod_get_array(). Afterwards the array of descriptors has to be setup
-manually before it can be used with gpiod_set_array().
+manually before it can be passed to one of the above functions.
 
 Note that for optimal performance GPIOs belonging to the same chip should be
 contiguous within the array of descriptors.
 
+The return value of gpiod_get_array_value() and its variants is 0 on success
+or negative on error. Note the difference to gpiod_get_value(), which returns
+0 or 1 on success to convey the GPIO value. With the array functions, the GPIO
+values are stored in value_array rather than passed back as return value.
+
 
 GPIOs mapped to IRQs
 --------------------
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8113929eb2bd..ff46a1b6299e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -365,28 +365,28 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 	struct linehandle_state *lh = filep->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	int vals[GPIOHANDLES_MAX];
 	int i;
 
 	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
-		int val;
+		/* TODO: check if descriptors are really input */
+		int ret = gpiod_get_array_value_complex(false,
+							true,
+							lh->numdescs,
+							lh->descs,
+							vals);
+		if (ret)
+			return ret;
 
 		memset(&ghd, 0, sizeof(ghd));
-
-		/* TODO: check if descriptors are really input */
-		for (i = 0; i < lh->numdescs; i++) {
-			val = gpiod_get_value_cansleep(lh->descs[i]);
-			if (val < 0)
-				return val;
-			ghd.values[i] = val;
-		}
+		for (i = 0; i < lh->numdescs; i++)
+			ghd.values[i] = vals[i];
 
 		if (copy_to_user(ip, &ghd, sizeof(ghd)))
 			return -EFAULT;
 
 		return 0;
 	} else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
-		int vals[GPIOHANDLES_MAX];
-
 		/* TODO: check if descriptors are really output */
 		if (copy_from_user(&ghd, ip, sizeof(ghd)))
 			return -EFAULT;
@@ -2466,6 +2466,71 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 	return value;
 }
 
+static int gpio_chip_get_multiple(struct gpio_chip *chip,
+				  unsigned long *mask, unsigned long *bits)
+{
+	if (chip->get_multiple) {
+		return chip->get_multiple(chip, mask, bits);
+	} else if (chip->get) {
+		int i, value;
+
+		for_each_set_bit(i, mask, chip->ngpio) {
+			value = chip->get(chip, i);
+			if (value < 0)
+				return value;
+			__assign_bit(i, bits, value);
+		}
+		return 0;
+	}
+	return -EIO;
+}
+
+int gpiod_get_array_value_complex(bool raw, bool can_sleep,
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array)
+{
+	int i = 0;
+
+	while (i < array_size) {
+		struct gpio_chip *chip = desc_array[i]->gdev->chip;
+		unsigned long mask[BITS_TO_LONGS(chip->ngpio)];
+		unsigned long bits[BITS_TO_LONGS(chip->ngpio)];
+		int first, j, ret;
+
+		if (!can_sleep)
+			WARN_ON(chip->can_sleep);
+
+		/* collect all inputs belonging to the same chip */
+		first = i;
+		memset(mask, 0, sizeof(mask));
+		do {
+			const struct gpio_desc *desc = desc_array[i];
+			int hwgpio = gpio_chip_hwgpio(desc);
+
+			__set_bit(hwgpio, mask);
+			i++;
+		} while ((i < array_size) &&
+			 (desc_array[i]->gdev->chip == chip));
+
+		ret = gpio_chip_get_multiple(chip, mask, bits);
+		if (ret)
+			return ret;
+
+		for (j = first; j < i; j++) {
+			const struct gpio_desc *desc = desc_array[j];
+			int hwgpio = gpio_chip_hwgpio(desc);
+			int value = test_bit(hwgpio, bits);
+
+			if (!raw && test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+				value = !value;
+			value_array[j] = value;
+			trace_gpio_value(desc_to_gpio(desc), 1, value);
+		}
+	}
+	return 0;
+}
+
 /**
  * gpiod_get_raw_value() - return a gpio's raw value
  * @desc: gpio whose value will be returned
@@ -2514,6 +2579,51 @@ int gpiod_get_value(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_get_value);
 
+/**
+ * gpiod_get_raw_array_value() - read raw values from an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be read
+ * @value_array: array to store the read values
+ *
+ * Read the raw values of the GPIOs, i.e. the values of the physical lines
+ * without regard for their ACTIVE_LOW status.  Return 0 in case of success,
+ * else an error code.
+ *
+ * This function should be called from contexts where we cannot sleep,
+ * and it will complain if the GPIO chip functions potentially sleep.
+ */
+int gpiod_get_raw_array_value(unsigned int array_size,
+			      struct gpio_desc **desc_array, int *value_array)
+{
+	if (!desc_array)
+		return -EINVAL;
+	return gpiod_get_array_value_complex(true, false, array_size,
+					     desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_get_raw_array_value);
+
+/**
+ * gpiod_get_array_value() - read values from an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be read
+ * @value_array: array to store the read values
+ *
+ * Read the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
+ * into account.  Return 0 in case of success, else an error code.
+ *
+ * This function should be called from contexts where we cannot sleep,
+ * and it will complain if the GPIO chip functions potentially sleep.
+ */
+int gpiod_get_array_value(unsigned int array_size,
+			  struct gpio_desc **desc_array, int *value_array)
+{
+	if (!desc_array)
+		return -EINVAL;
+	return gpiod_get_array_value_complex(false, false, array_size,
+					     desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_get_array_value);
+
 /*
  *  gpio_set_open_drain_value_commit() - Set the open drain gpio's value.
  * @desc: gpio descriptor whose state need to be set.
@@ -2943,6 +3053,53 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 EXPORT_SYMBOL_GPL(gpiod_get_value_cansleep);
 
 /**
+ * gpiod_get_raw_array_value_cansleep() - read raw values from an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be read
+ * @value_array: array to store the read values
+ *
+ * Read the raw values of the GPIOs, i.e. the values of the physical lines
+ * without regard for their ACTIVE_LOW status.  Return 0 in case of success,
+ * else an error code.
+ *
+ * This function is to be called from contexts that can sleep.
+ */
+int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
+				       struct gpio_desc **desc_array,
+				       int *value_array)
+{
+	might_sleep_if(extra_checks);
+	if (!desc_array)
+		return -EINVAL;
+	return gpiod_get_array_value_complex(true, true, array_size,
+					     desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_get_raw_array_value_cansleep);
+
+/**
+ * gpiod_get_array_value_cansleep() - read values from an array of GPIOs
+ * @array_size: number of elements in the descriptor / value arrays
+ * @desc_array: array of GPIO descriptors whose values will be read
+ * @value_array: array to store the read values
+ *
+ * Read the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
+ * into account.  Return 0 in case of success, else an error code.
+ *
+ * This function is to be called from contexts that can sleep.
+ */
+int gpiod_get_array_value_cansleep(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array)
+{
+	might_sleep_if(extra_checks);
+	if (!desc_array)
+		return -EINVAL;
+	return gpiod_get_array_value_complex(false, true, array_size,
+					     desc_array, value_array);
+}
+EXPORT_SYMBOL_GPL(gpiod_get_array_value_cansleep);
+
+/**
  * gpiod_set_raw_value_cansleep() - assign a gpio's raw value
  * @desc: gpio whose value will be assigned
  * @value: value to assign
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d003ccb12781..10a48caf8477 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -180,6 +180,10 @@ static inline bool acpi_can_fallback_to_crs(struct acpi_device *adev,
 #endif
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
+int gpiod_get_array_value_complex(bool raw, bool can_sleep,
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array);
 void gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				   unsigned int array_size,
 				   struct gpio_desc **desc_array,
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8f702fcbe485..d4920ec1f1da 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -99,10 +99,15 @@ int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
+int gpiod_get_array_value(unsigned int array_size,
+			  struct gpio_desc **desc_array, int *value_array);
 void gpiod_set_value(struct gpio_desc *desc, int value);
 void gpiod_set_array_value(unsigned int array_size,
 			   struct gpio_desc **desc_array, int *value_array);
 int gpiod_get_raw_value(const struct gpio_desc *desc);
+int gpiod_get_raw_array_value(unsigned int array_size,
+			      struct gpio_desc **desc_array,
+			      int *value_array);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
 void gpiod_set_raw_array_value(unsigned int array_size,
 			       struct gpio_desc **desc_array,
@@ -110,11 +115,17 @@ void gpiod_set_raw_array_value(unsigned int array_size,
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
+int gpiod_get_array_value_cansleep(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
 void gpiod_set_array_value_cansleep(unsigned int array_size,
 				    struct gpio_desc **desc_array,
 				    int *value_array);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
+int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
+				       struct gpio_desc **desc_array,
+				       int *value_array);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
 void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 					struct gpio_desc **desc_array,
@@ -305,6 +316,14 @@ static inline int gpiod_get_value(const struct gpio_desc *desc)
 	WARN_ON(1);
 	return 0;
 }
+static inline int gpiod_get_array_value(unsigned int array_size,
+					struct gpio_desc **desc_array,
+					int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return 0;
+}
 static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
@@ -323,6 +342,14 @@ static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
 	WARN_ON(1);
 	return 0;
 }
+static inline int gpiod_get_raw_array_value(unsigned int array_size,
+					    struct gpio_desc **desc_array,
+					    int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return 0;
+}
 static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
@@ -342,6 +369,14 @@ static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 	WARN_ON(1);
 	return 0;
 }
+static inline int gpiod_get_array_value_cansleep(unsigned int array_size,
+				     struct gpio_desc **desc_array,
+				     int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return 0;
+}
 static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
@@ -360,6 +395,14 @@ static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 	WARN_ON(1);
 	return 0;
 }
+static inline int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
+					       struct gpio_desc **desc_array,
+					       int *value_array)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return 0;
+}
 static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 						int value)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1de5dd185118..5fe533408b3a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -35,6 +35,8 @@ struct module;
  * @direction_input: configures signal "offset" as input, or returns error
  * @direction_output: configures signal "offset" as output, or returns error
  * @get: returns value for signal "offset", 0=low, 1=high, or negative error
+ * @get_multiple: reads values for multiple signals defined by "mask" and
+ *	stores them in "bits", returns 0 on success or negative error
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_config: optional hook for all kinds of settings. Uses the same
@@ -126,6 +128,9 @@ struct gpio_chip {
 						unsigned offset, int value);
 	int			(*get)(struct gpio_chip *chip,
 						unsigned offset);
+	int			(*get_multiple)(struct gpio_chip *chip,
+						unsigned long *mask,
+						unsigned long *bits);
 	void			(*set)(struct gpio_chip *chip,
 						unsigned offset, int value);
 	void			(*set_multiple)(struct gpio_chip *chip,
-- 
2.11.0

