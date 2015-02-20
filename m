From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] gpio: return NULL from gpiod_get_optional when GPIOLIB is
 disabled
Date: Thu, 19 Feb 2015 16:30:35 -0800
Message-ID: <20150220003035.GA22334@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:45479 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753905AbbBTAaj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Feb 2015 19:30:39 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Given the intent behind gpiod_get_optional() and friends it does not make
sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
work just fine without gpio so let's behave as if gpio was not found.
Otherwise we have to special-case -ENOSYS in drivers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/consumer.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fd85cb1..f68244f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -132,14 +132,14 @@ static inline struct gpio_desc *__must_check
 __gpiod_get_optional(struct device *dev, const char *con_id,
 		     enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_desc *__must_check
 __gpiod_get_index_optional(struct device *dev, const char *con_id,
 			   unsigned int index, enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline void gpiod_put(struct gpio_desc *desc)
@@ -171,14 +171,14 @@ static inline struct gpio_desc *__must_check
 __devm_gpiod_get_optional(struct device *dev, const char *con_id,
 			  enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_desc *__must_check
 __devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
 				unsigned int index, enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
-- 
2.2.0.rc0.207.ga3a616c


-- 
Dmitry
