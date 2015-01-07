From: Olliver Schinagl <oliver+list@schinagl.nl>
Subject: [PATCH v1] gpio: Make the vararg hacks not pass magic values
Date: Wed,  7 Jan 2015 09:44:57 +0100
Message-ID: <1420620297-7329-1-git-send-email-oliver+list@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Olliver Schinagl <oliver@schinagl.nl>

Right now, in consumer.h, there's some vararg hacks that pass 0 as the
flags. What actually is passed however is GPIOD_ASIS, which naturally is
also 0. Using the define/enum rather then the magic 0 makes it the
define more readable to a passer by.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 include/linux/gpio/consumer.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fd85cb1..45afc2d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -340,31 +340,32 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
  * etc.
  */
 #define __gpiod_get(dev, con_id, flags, ...) __gpiod_get(dev, con_id, flags)
-#define gpiod_get(varargs...) __gpiod_get(varargs, 0)
+#define gpiod_get(varargs...) __gpiod_get(varargs, GPIOD_ASIS)
 #define __gpiod_get_index(dev, con_id, index, flags, ...)		\
 	__gpiod_get_index(dev, con_id, index, flags)
-#define gpiod_get_index(varargs...) __gpiod_get_index(varargs, 0)
+#define gpiod_get_index(varargs...) __gpiod_get_index(varargs, GPIOD_ASIS)
 #define __gpiod_get_optional(dev, con_id, flags, ...)			\
 	__gpiod_get_optional(dev, con_id, flags)
-#define gpiod_get_optional(varargs...) __gpiod_get_optional(varargs, 0)
+#define gpiod_get_optional(varargs...) __gpiod_get_optional(varargs, GPIOD_ASIS)
 #define __gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
 	__gpiod_get_index_optional(dev, con_id, index, flags)
 #define gpiod_get_index_optional(varargs...)				\
-	__gpiod_get_index_optional(varargs, 0)
+	__gpiod_get_index_optional(varargs, GPIOD_ASIS)
 #define __devm_gpiod_get(dev, con_id, flags, ...)			\
 	__devm_gpiod_get(dev, con_id, flags)
-#define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, 0)
+#define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, GPIOD_ASIS)
 #define __devm_gpiod_get_index(dev, con_id, index, flags, ...)		\
 	__devm_gpiod_get_index(dev, con_id, index, flags)
-#define devm_gpiod_get_index(varargs...) __devm_gpiod_get_index(varargs, 0)
+#define devm_gpiod_get_index(varargs...)				\
+	__devm_gpiod_get_index(varargs, GPIOD_ASIS)
 #define __devm_gpiod_get_optional(dev, con_id, flags, ...)		\
 	__devm_gpiod_get_optional(dev, con_id, flags)
 #define devm_gpiod_get_optional(varargs...)				\
-	__devm_gpiod_get_optional(varargs, 0)
+	__devm_gpiod_get_optional(varargs, GPIOD_ASIS)
 #define __devm_gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
 	__devm_gpiod_get_index_optional(dev, con_id, index, flags)
 #define devm_gpiod_get_index_optional(varargs...)			\
-	__devm_gpiod_get_index_optional(varargs, 0)
+	__devm_gpiod_get_index_optional(varargs, GPIOD_ASIS)
 
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
 
-- 
2.1.4
