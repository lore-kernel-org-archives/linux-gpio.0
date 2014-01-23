From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [RFC PATCH] gpiolib: introduce gpio_set_multiple function
Date: Thu, 23 Jan 2014 13:19:42 +0100
Message-ID: <2473803.SebQ52F62q@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:32781 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbaAWMTp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 07:19:45 -0500
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3f92bz2zg4z4KKCN
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 13:19:43 +0100 (CET)
Received: from mail.dmz.schenk (host-82-135-47-202.customer.m-online.net [82.135.47.202])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id 3f92bz1DHwzbbhr
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 13:19:43 +0100 (CET)
Received: from gwhaus.rt.schenk (gwhaus.rt.schenk [172.22.0.4])
	by mail.dmz.schenk (Postfix) with SMTP id E87541C054F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 13:19:42 +0100 (CET)
Received: from pcimr.localnet (pcimr.rt.schenk [172.22.10.20])
	by gwhaus.rt.schenk (Postfix) with ESMTP id C45D324075B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 13:19:42 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

This patch introduces a new function gpio_set_multiple which allows setting
multiple GPIO lines on the same chip with just one function call. If a
corresponding set_multi function is defined for the chip performance can be
significantly improved. Otherwise gpio_set_multiple uses the chip's set
function and the performance stays the same as without the new function.
For my application, where I have to frequently set 9 GPIO lines in order to
configure an FPGA, configuration time goes down from 48 s to 15 s when I use
this new function. (Tested with a modified gpio-mpc8xxx module.)

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 drivers/gpio/gpiolib.c        |   59 ++++++++++++++++++++++++++++++++++++++++++
 include/asm-generic/gpio.h    |   17 ++++++++++++
 include/linux/gpio.h          |   20 ++++++++++++++
 include/linux/gpio/consumer.h |   14 +++++++++
 include/linux/gpio/driver.h   |    3 ++
 5 files changed, 113 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 50c4922..8355acb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2099,6 +2099,44 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value);
 
+static void _gpiod_set_raw_multiple(struct gpio_chip *chip,
+				    u64 mask, u64 value)
+{
+	if (chip->set_multi)
+		chip->set_multi(chip, mask, value);
+	else {
+		int i;
+		for (i=0; i<64; i++) {
+			if (i > chip->ngpio - 1)
+				break;
+			if (mask & ((u64)(1) << i))
+				chip->set(chip, i, (value >> i) & 1);
+		}
+	}
+}
+
+/**
+ * gpiod_set_raw_multiple() - assign values to multiple GPIOs
+ * @chip: chip the GPIOs belong to
+ * @mask: only GPIOs with corresponding bits in mask set are modified
+ * @value: value bits to assign to GPIOs
+ *
+ * Set the raw values of multiple GPIOs, i.e. physical line values without
+ * regard for their ACTIVE_LOW status.
+ *
+ * This function should be called from contexts where we cannot sleep, and will
+ * complain if the GPIO chip functions potentially sleep.
+ */
+void gpiod_set_raw_multiple(struct gpio_chip *chip, u64 mask, u64 value)
+{
+	if (!chip)
+		return;
+	/* Should be using gpio_set_multiple_cansleep() */
+	WARN_ON(chip->can_sleep);
+	_gpiod_set_raw_multiple(chip, mask, value);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_raw_multiple);
+
 /**
  * gpiod_cansleep() - report whether gpio value access may sleep
  * @desc: gpio to check
@@ -2272,6 +2310,27 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
 
 /**
+ * gpiod_set_raw_multiple_cansleep() - assign values to multiple GPIOs
+ * @chip: chip the GPIOs belong to
+ * @mask: only GPIOs with corresponding bits in mask set are modified
+ * @value: value bits to assign to GPIOs
+ *
+ * Set the raw values of multiple GPIOs, i.e. physical line values without
+ * regard for their ACTIVE_LOW status.
+ *
+ * This function is to be called from contexts that can sleep.
+ */
+void gpiod_set_raw_multiple_cansleep(struct gpio_chip *chip,
+				     u64 mask, u64 value)
+{
+	might_sleep_if(extra_checks);
+	if (!chip)
+		return;
+	_gpiod_set_raw_multiple(chip, mask, value);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_raw_multiple_cansleep);
+
+/**
  * gpiod_add_lookup_table() - register GPIO device consumers
  * @table: table of consumers to register
  */
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index a5f56a0..c53d8ac 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -85,6 +85,11 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 {
 	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
 }
+static inline void gpio_set_multiple_cansleep(struct gpio_chip *chip, u64 mask,
+					      u64 value)
+{
+	return gpiod_set_raw_multiple_cansleep(chip, mask, value);
+}
 
 
 /* A platform's <asm/gpio.h> code may want to inline the I/O calls when
@@ -99,6 +104,11 @@ static inline void __gpio_set_value(unsigned gpio, int value)
 {
 	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
 }
+static inline void __gpio_set_multiple(struct gpio_chip *chip, u64 mask,
+				       u64 value)
+{
+	return gpiod_set_raw_multiple(chip, mask, value);
+}
 
 static inline int __gpio_cansleep(unsigned gpio)
 {
@@ -218,6 +228,13 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 	__gpio_set_value(gpio, value);
 }
 
+static inline void gpio_set_multiple_cansleep(struct gpio_chip *chip, u64 mask,
+					      u64 value)
+{
+	might_sleep();
+	__gpio_set_multiple(chip, mask, value);
+}
+
 #endif /* !CONFIG_GPIOLIB */
 
 #endif /* _ASM_GENERIC_GPIO_H */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index b581b13..cbb4725 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -60,6 +60,12 @@ static inline void gpio_set_value(unsigned int gpio, int value)
 	__gpio_set_value(gpio, value);
 }
 
+static inline void gpio_set_multiple(struct gpio_chip *chip, u64 mask,
+				     u64 value)
+{
+	__gpio_set_multiple(chip, mask, value);
+}
+
 static inline int gpio_cansleep(unsigned int gpio)
 {
 	return __gpio_cansleep(gpio);
@@ -161,6 +167,13 @@ static inline void gpio_set_value(unsigned gpio, int value)
 	WARN_ON(1);
 }
 
+static inline void gpio_set_multiple(struct gpio_chip *chip, u64 mask,
+				     u64 value)
+{
+	/* GPIO can never have been requested or set as output */
+	WARN_ON(1);
+}
+
 static inline int gpio_cansleep(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
@@ -181,6 +194,13 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 	WARN_ON(1);
 }
 
+static inline void gpio_set_multiple_cansleep(struct gpio_chip *chip,
+					      u64 mask, u64 value)
+{
+	/* GPIO can never have been requested or set as output */
+	WARN_ON(1);
+}
+
 static inline int gpio_export(unsigned gpio, bool direction_may_change)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 4d34dbb..5ffdbd0 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -42,12 +42,14 @@ int gpiod_get_value(const struct gpio_desc *desc);
 void gpiod_set_value(struct gpio_desc *desc, int value);
 int gpiod_get_raw_value(const struct gpio_desc *desc);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
+void gpiod_set_raw_multiple(struct gpio_chip *chip, u64 mask, u64 value);
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
+void gpiod_set_raw_multiple_cansleep(struct gpio_chip *chip, u64 mask, u64 value);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 
@@ -145,6 +147,12 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_raw_multiple(struct gpio_chip *chip, u64 mask,
+					  u64 value)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 
 static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 {
@@ -169,6 +177,12 @@ static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 	/* GPIO can never have been requested */
 	WARN_ON(1);
 }
+static inline void gpiod_set_raw_multiple_cansleep(struct gpio_chip *chip,
+						   u64 mask, u64 value)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
 
 static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a3e181e..571ad82 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -27,6 +27,7 @@ struct seq_file;
  * @get: returns value for signal "offset"; for output signals this
  *	returns either the value actually sensed, or zero
  * @set: assigns output value for signal "offset"
+ * @set_multi: assigns output values for multiple signals defined by "mask"
  * @set_debounce: optional hook for setting debounce time for specified gpio in
  *      interrupt triggered gpio chips
  * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
@@ -79,6 +80,8 @@ struct gpio_chip {
 						unsigned offset);
 	void			(*set)(struct gpio_chip *chip,
 						unsigned offset, int value);
+	void			(*set_multi)(struct gpio_chip *chip,
+					        u64 mask, u64 value);
 	int			(*set_debounce)(struct gpio_chip *chip,
 						unsigned offset,
 						unsigned debounce);
--
1.8.3.2

