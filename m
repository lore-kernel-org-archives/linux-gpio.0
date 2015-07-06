From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH gpio-for-next 10/10] gpio: make flags mandatory for gpiod_get functions
Date: Mon,  6 Jul 2015 11:09:50 +0200
Message-ID: <1436173790-29963-10-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:34226 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713AbbGFJKA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 05:10:00 -0400
In-Reply-To: <20150706090759.GS11824@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de

Now that all[1] users of the gpiod_get functions are converted to make
use of the up to now optional flags parameter, make it mandatory which
allows to remove some cpp magic.

[1] all but etraxfs-uart which is broken anyhow and I'm allowed to
    ignore it by Jesper Nilsson :-)

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/devres.c         | 18 +++++-----
 drivers/gpio/gpiolib.c        | 16 ++++-----
 include/linux/gpio/consumer.h | 82 ++++++++++++-----------------------=
--------
 3 files changed, 40 insertions(+), 76 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index 07ba82317ece..903fcf4d04a0 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -59,13 +59,13 @@ static int devm_gpiod_match_array(struct device *de=
v, void *res, void *data)
  * automatically disposed on driver detach. See gpiod_get() for detail=
ed
  * information about behavior and return values.
  */
-struct gpio_desc *__must_check __devm_gpiod_get(struct device *dev,
+struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
 					      const char *con_id,
 					      enum gpiod_flags flags)
 {
 	return devm_gpiod_get_index(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL(__devm_gpiod_get);
+EXPORT_SYMBOL(devm_gpiod_get);
=20
 /**
  * devm_gpiod_get_optional - Resource-managed gpiod_get_optional()
@@ -77,13 +77,13 @@ EXPORT_SYMBOL(__devm_gpiod_get);
  * are automatically disposed on driver detach. See gpiod_get_optional=
() for
  * detailed information about behavior and return values.
  */
-struct gpio_desc *__must_check __devm_gpiod_get_optional(struct device=
 *dev,
+struct gpio_desc *__must_check devm_gpiod_get_optional(struct device *=
dev,
 						       const char *con_id,
 						       enum gpiod_flags flags)
 {
 	return devm_gpiod_get_index_optional(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL(__devm_gpiod_get_optional);
+EXPORT_SYMBOL(devm_gpiod_get_optional);
=20
 /**
  * devm_gpiod_get_index - Resource-managed gpiod_get_index()
@@ -96,7 +96,7 @@ EXPORT_SYMBOL(__devm_gpiod_get_optional);
  * automatically disposed on driver detach. See gpiod_get_index() for =
detailed
  * information about behavior and return values.
  */
-struct gpio_desc *__must_check __devm_gpiod_get_index(struct device *d=
ev,
+struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev=
,
 						    const char *con_id,
 						    unsigned int idx,
 						    enum gpiod_flags flags)
@@ -120,7 +120,7 @@ struct gpio_desc *__must_check __devm_gpiod_get_ind=
ex(struct device *dev,
=20
 	return desc;
 }
-EXPORT_SYMBOL(__devm_gpiod_get_index);
+EXPORT_SYMBOL(devm_gpiod_get_index);
=20
 /**
  * devm_get_gpiod_from_child - get a GPIO descriptor from a device's c=
hild node
@@ -182,10 +182,10 @@ EXPORT_SYMBOL(devm_get_gpiod_from_child);
  * gpiod_get_index_optional() for detailed information about behavior =
and
  * return values.
  */
-struct gpio_desc *__must_check __devm_gpiod_get_index_optional(struct =
device *dev,
+struct gpio_desc *__must_check devm_gpiod_get_index_optional(struct de=
vice *dev,
 							     const char *con_id,
 							     unsigned int index,
-							 enum gpiod_flags flags)
+							     enum gpiod_flags flags)
 {
 	struct gpio_desc *desc;
=20
@@ -197,7 +197,7 @@ struct gpio_desc *__must_check __devm_gpiod_get_ind=
ex_optional(struct device *de
=20
 	return desc;
 }
-EXPORT_SYMBOL(__devm_gpiod_get_index_optional);
+EXPORT_SYMBOL(devm_gpiod_get_index_optional);
=20
 /**
  * devm_gpiod_get_array - Resource-managed gpiod_get_array()
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d120c3..4b2f98168225 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1894,12 +1894,12 @@ EXPORT_SYMBOL_GPL(gpiod_count);
  * dev, -ENOENT if no GPIO has been assigned to the requested function=
, or
  * another IS_ERR() code if an error occurred while trying to acquire =
the GPIO.
  */
-struct gpio_desc *__must_check __gpiod_get(struct device *dev, const c=
har *con_id,
+struct gpio_desc *__must_check gpiod_get(struct device *dev, const cha=
r *con_id,
 					 enum gpiod_flags flags)
 {
 	return gpiod_get_index(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL_GPL(__gpiod_get);
+EXPORT_SYMBOL_GPL(gpiod_get);
=20
 /**
  * gpiod_get_optional - obtain an optional GPIO for a given GPIO funct=
ion
@@ -1911,13 +1911,13 @@ EXPORT_SYMBOL_GPL(__gpiod_get);
  * the requested function it will return NULL. This is convenient for =
drivers
  * that need to handle optional GPIOs.
  */
-struct gpio_desc *__must_check __gpiod_get_optional(struct device *dev=
,
+struct gpio_desc *__must_check gpiod_get_optional(struct device *dev,
 						  const char *con_id,
 						  enum gpiod_flags flags)
 {
 	return gpiod_get_index_optional(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL_GPL(__gpiod_get_optional);
+EXPORT_SYMBOL_GPL(gpiod_get_optional);
=20
=20
 /**
@@ -1974,7 +1974,7 @@ static int gpiod_configure_flags(struct gpio_desc=
 *desc, const char *con_id,
  * requested function and/or index, or another IS_ERR() code if an err=
or
  * occurred while trying to acquire the GPIO.
  */
-struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
+struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 					       const char *con_id,
 					       unsigned int idx,
 					       enum gpiod_flags flags)
@@ -2023,7 +2023,7 @@ struct gpio_desc *__must_check __gpiod_get_index(=
struct device *dev,
=20
 	return desc;
 }
-EXPORT_SYMBOL_GPL(__gpiod_get_index);
+EXPORT_SYMBOL_GPL(gpiod_get_index);
=20
 /**
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
@@ -2092,7 +2092,7 @@ EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
  * specified index was assigned to the requested function it will retu=
rn NULL.
  * This is convenient for drivers that need to handle optional GPIOs.
  */
-struct gpio_desc *__must_check __gpiod_get_index_optional(struct devic=
e *dev,
+struct gpio_desc *__must_check gpiod_get_index_optional(struct device =
*dev,
 							const char *con_id,
 							unsigned int index,
 							enum gpiod_flags flags)
@@ -2107,7 +2107,7 @@ struct gpio_desc *__must_check __gpiod_get_index_=
optional(struct device *dev,
=20
 	return desc;
 }
-EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
+EXPORT_SYMBOL_GPL(gpiod_get_index_optional);
=20
 /**
  * gpiod_hog - Hog the specified GPIO desc given the provided flags
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consume=
r.h
index adac255aee86..14cac67c2012 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -47,17 +47,17 @@ enum gpiod_flags {
 int gpiod_count(struct device *dev, const char *con_id);
=20
 /* Acquire and dispose GPIOs */
-struct gpio_desc *__must_check __gpiod_get(struct device *dev,
+struct gpio_desc *__must_check gpiod_get(struct device *dev,
 					 const char *con_id,
 					 enum gpiod_flags flags);
-struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
+struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 					       const char *con_id,
 					       unsigned int idx,
 					       enum gpiod_flags flags);
-struct gpio_desc *__must_check __gpiod_get_optional(struct device *dev=
,
+struct gpio_desc *__must_check gpiod_get_optional(struct device *dev,
 						  const char *con_id,
 						  enum gpiod_flags flags);
-struct gpio_desc *__must_check __gpiod_get_index_optional(struct devic=
e *dev,
+struct gpio_desc *__must_check gpiod_get_index_optional(struct device =
*dev,
 							const char *con_id,
 							unsigned int index,
 							enum gpiod_flags flags);
@@ -70,18 +70,18 @@ struct gpio_descs *__must_check gpiod_get_array_opt=
ional(struct device *dev,
 void gpiod_put(struct gpio_desc *desc);
 void gpiod_put_array(struct gpio_descs *descs);
=20
-struct gpio_desc *__must_check __devm_gpiod_get(struct device *dev,
+struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
 					      const char *con_id,
 					      enum gpiod_flags flags);
-struct gpio_desc *__must_check __devm_gpiod_get_index(struct device *d=
ev,
+struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev=
,
 						    const char *con_id,
 						    unsigned int idx,
 						    enum gpiod_flags flags);
-struct gpio_desc *__must_check __devm_gpiod_get_optional(struct device=
 *dev,
+struct gpio_desc *__must_check devm_gpiod_get_optional(struct device *=
dev,
 						       const char *con_id,
 						       enum gpiod_flags flags);
 struct gpio_desc *__must_check
-__devm_gpiod_get_index_optional(struct device *dev, const char *con_id=
,
+devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
 			      unsigned int index, enum gpiod_flags flags);
 struct gpio_descs *__must_check devm_gpiod_get_array(struct device *de=
v,
 						     const char *con_id,
@@ -146,31 +146,31 @@ static inline int gpiod_count(struct device *dev,=
 const char *con_id)
 	return 0;
 }
=20
-static inline struct gpio_desc *__must_check __gpiod_get(struct device=
 *dev,
-						const char *con_id,
-						enum gpiod_flags flags)
+static inline struct gpio_desc *__must_check gpiod_get(struct device *=
dev,
+						       const char *con_id,
+						       enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 static inline struct gpio_desc *__must_check
-__gpiod_get_index(struct device *dev,
-		  const char *con_id,
-		  unsigned int idx,
-		  enum gpiod_flags flags)
+gpiod_get_index(struct device *dev,
+		const char *con_id,
+		unsigned int idx,
+		enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
=20
 static inline struct gpio_desc *__must_check
-__gpiod_get_optional(struct device *dev, const char *con_id,
-		     enum gpiod_flags flags)
+gpiod_get_optional(struct device *dev, const char *con_id,
+		   enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
=20
 static inline struct gpio_desc *__must_check
-__gpiod_get_index_optional(struct device *dev, const char *con_id,
-			   unsigned int index, enum gpiod_flags flags)
+gpiod_get_index_optional(struct device *dev, const char *con_id,
+			 unsigned int index, enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -206,7 +206,7 @@ static inline void gpiod_put_array(struct gpio_desc=
s *descs)
 }
=20
 static inline struct gpio_desc *__must_check
-__devm_gpiod_get(struct device *dev,
+devm_gpiod_get(struct device *dev,
 		 const char *con_id,
 		 enum gpiod_flags flags)
 {
@@ -214,7 +214,7 @@ __devm_gpiod_get(struct device *dev,
 }
 static inline
 struct gpio_desc *__must_check
-__devm_gpiod_get_index(struct device *dev,
+devm_gpiod_get_index(struct device *dev,
 		       const char *con_id,
 		       unsigned int idx,
 		       enum gpiod_flags flags)
@@ -223,14 +223,14 @@ __devm_gpiod_get_index(struct device *dev,
 }
=20
 static inline struct gpio_desc *__must_check
-__devm_gpiod_get_optional(struct device *dev, const char *con_id,
+devm_gpiod_get_optional(struct device *dev, const char *con_id,
 			  enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
=20
 static inline struct gpio_desc *__must_check
-__devm_gpiod_get_index_optional(struct device *dev, const char *con_id=
,
+devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
 				unsigned int index, enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
@@ -424,42 +424,6 @@ static inline struct gpio_desc *devm_get_gpiod_fro=
m_child(
=20
 #endif /* CONFIG_GPIOLIB */
=20
-/*
- * Vararg-hacks! This is done to transition the kernel to always pass
- * the options flags argument to the below functions. During a transit=
ion
- * phase these vararg macros make both old-and-newstyle code compile,
- * but when all calls to the elder API are removed, these should go aw=
ay
- * and the __gpiod_get() etc functions above be renamed just gpiod_get=
()
- * etc.
- */
-#define __gpiod_get(dev, con_id, flags, ...) __gpiod_get(dev, con_id, =
flags)
-#define gpiod_get(varargs...) __gpiod_get(varargs, GPIOD_ASIS)
-#define __gpiod_get_index(dev, con_id, index, flags, ...)		\
-	__gpiod_get_index(dev, con_id, index, flags)
-#define gpiod_get_index(varargs...) __gpiod_get_index(varargs, GPIOD_A=
SIS)
-#define __gpiod_get_optional(dev, con_id, flags, ...)			\
-	__gpiod_get_optional(dev, con_id, flags)
-#define gpiod_get_optional(varargs...) __gpiod_get_optional(varargs, G=
PIOD_ASIS)
-#define __gpiod_get_index_optional(dev, con_id, index, flags, ...)	\
-	__gpiod_get_index_optional(dev, con_id, index, flags)
-#define gpiod_get_index_optional(varargs...)				\
-	__gpiod_get_index_optional(varargs, GPIOD_ASIS)
-#define __devm_gpiod_get(dev, con_id, flags, ...)			\
-	__devm_gpiod_get(dev, con_id, flags)
-#define devm_gpiod_get(varargs...) __devm_gpiod_get(varargs, GPIOD_ASI=
S)
-#define __devm_gpiod_get_index(dev, con_id, index, flags, ...)		\
-	__devm_gpiod_get_index(dev, con_id, index, flags)
-#define devm_gpiod_get_index(varargs...)				\
-	__devm_gpiod_get_index(varargs, GPIOD_ASIS)
-#define __devm_gpiod_get_optional(dev, con_id, flags, ...)		\
-	__devm_gpiod_get_optional(dev, con_id, flags)
-#define devm_gpiod_get_optional(varargs...)				\
-	__devm_gpiod_get_optional(varargs, GPIOD_ASIS)
-#define __devm_gpiod_get_index_optional(dev, con_id, index, flags, ...=
)	\
-	__devm_gpiod_get_index_optional(dev, con_id, index, flags)
-#define devm_gpiod_get_index_optional(varargs...)			\
-	__devm_gpiod_get_index_optional(varargs, GPIOD_ASIS)
-
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
=20
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
