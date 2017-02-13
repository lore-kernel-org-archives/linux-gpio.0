From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] gpio: return NULL from gpiod_get_optional when GPIOLIB is
 disabled
Date: Sun, 12 Feb 2017 17:13:55 -0800
Message-ID: <20170213011355.GA13075@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35584 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751193AbdBMBN6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Feb 2017 20:13:58 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Given the intent behind gpiod_get_optional() and friends it does not make
sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
work just fine without gpio so let's behave as if gpio was not found.
Otherwise we have to special-case -ENOSYS in drivers.

Note that there was objection that someone might forget to enable GPIOLIB
when dealing with a platform that has device that actually specifies
optional gpio and we'll break it. I find this unconvincing as that would
have to be the *only GPIO* in the system, which is extremely unlikely.

Suggested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is a resend of a similar patch from a couple years ago.

V2:

- added paragraph to Documentation/gpio/consumer.txt at request of
  Alexandre Courbot
- added Suggested-by: Uwe Kleine-König at request of Alexandre Courbot
- hopefully addressed Uwe's concern about gpiolib being disabled in the
  patch description: I find it extremely unlikely that the optional GPIO
  would happen to be the only GPIO in the whole system.
- added handling for more _optional() calls appeared since V1 was
  posted.

 Documentation/gpio/consumer.txt |  6 ++++++
 include/linux/gpio/consumer.h   | 12 ++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 05676fdacfe3..912568baabb9 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -70,6 +70,12 @@ instead of -ENOENT if no GPIO has been assigned to the requested function:
 						   unsigned int index,
 						   enum gpiod_flags flags)
 
+Note that gpio_get*_optional() functions (and their managed variants), unlike
+the rest of gpiolib API, also return NULL when gpiolib support is disabled.
+This is helpful to driver authors, since they do not need to special case
+-ENOSYS return codes.  System integrators should however be careful to enable
+gpiolib on systems that need it.
+
 For a function using multiple GPIOs all of those can be obtained with one call:
 
 	struct gpio_descs *gpiod_get_array(struct device *dev,
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fb0fde686cb1..a0431f4aa6cc 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -165,14 +165,14 @@ static inline struct gpio_desc *__must_check
 gpiod_get_optional(struct device *dev, const char *con_id,
 		   enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_desc *__must_check
 gpiod_get_index_optional(struct device *dev, const char *con_id,
 			 unsigned int index, enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_descs *__must_check
@@ -186,7 +186,7 @@ static inline struct gpio_descs *__must_check
 gpiod_get_array_optional(struct device *dev, const char *con_id,
 			 enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline void gpiod_put(struct gpio_desc *desc)
@@ -226,14 +226,14 @@ static inline struct gpio_desc *__must_check
 devm_gpiod_get_optional(struct device *dev, const char *con_id,
 			  enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_desc *__must_check
 devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
 				unsigned int index, enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline struct gpio_descs *__must_check
@@ -247,7 +247,7 @@ static inline struct gpio_descs *__must_check
 devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
 			      enum gpiod_flags flags)
 {
-	return ERR_PTR(-ENOSYS);
+	return NULL;
 }
 
 static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
-- 
2.11.0.483.g087da7b7c-goog


-- 
Dmitry
