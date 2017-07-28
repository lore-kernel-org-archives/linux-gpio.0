From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is disabled
Date: Fri, 28 Jul 2017 13:21:26 -0300
Message-ID: <1501258886-12376-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0053.outbound.protection.outlook.com ([104.47.33.53]:8460
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751882AbdG1QVd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Jul 2017 12:21:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sergei.shtylyov@cogentembedded.com, andrew@lunn.ch, dmitry.torokhov@gmail.com, linux-gpio@vger.kernel.org, festevam@gmail.com, Fabio Estevam <fabio.estevam@nxp.com>

gpiod_get_optional() returns NULL when GPIOLIB is disabled since
commit 22c403676dbbb7c6 ("gpio: return NULL from gpiod_get_optional when
GPIOLIB is disabled").

However, many gpiod functions still have WARN_ON(1) in their
GPIOLIB=n stubs, which causes warnings in drivers even if the
GPIO descriptor is requested via gpiod_get_optional().

Prior to commit 22c403676dbbb7c6 ("gpio: return NULL from
gpiod_get_optional when GPIOLIB is disabled") it was indeed true
the comment: "GPIO can never have been requested" as gpiod_get_optional()
used to return an error.

After this commit the returned value is NULL, so the comment and
WARN_ON(1) are no longer accurate.

An example of this kernel warning can be see in this report:
https://www.spinics.net/lists/kernel/msg2563045.html

Remove the WARN_ON(1) so that drivers can silently work fine
without kernel warnings when GPIOLIB is disabled.

Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since RFC:
- Expand a bit on the commit log
- Include the kernel warning example

 include/linux/gpio/consumer.h | 59 -------------------------------------------
 1 file changed, 59 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8f702fc..40c1be5 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -197,17 +197,11 @@ gpiod_get_array_optional(struct device *dev, const char *con_id,
 static inline void gpiod_put(struct gpio_desc *desc)
 {
 	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 
 static inline void gpiod_put_array(struct gpio_descs *descs)
 {
 	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 
 static inline struct gpio_desc *__must_check
@@ -254,150 +248,99 @@ devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
 {
 	return NULL;
 }
-
 static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
 {
 	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
-
 static inline void devm_gpiod_put_array(struct device *dev,
 					struct gpio_descs *descs)
 {
 	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
-
-
 static inline int gpiod_get_direction(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_input(struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -ENOSYS;
 }
 
-
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline void gpiod_set_array_value(unsigned int array_size,
 					 struct gpio_desc **desc_array,
 					 int *value_array)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline void gpiod_set_raw_array_value(unsigned int array_size,
 					     struct gpio_desc **desc_array,
 					     int *value_array)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 
 static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline void gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
 					    int *value_array)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 						int value)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 static inline void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 						struct gpio_desc **desc_array,
 						int *value_array)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 }
 
 static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -ENOSYS;
 }
 
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 static inline int gpiod_cansleep(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return 0;
 }
 
 static inline int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -EINVAL;
 }
 
@@ -408,8 +351,6 @@ static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 
 static inline int desc_to_gpio(const struct gpio_desc *desc)
 {
-	/* GPIO can never have been requested */
-	WARN_ON(1);
 	return -EINVAL;
 }
 
-- 
2.7.4

