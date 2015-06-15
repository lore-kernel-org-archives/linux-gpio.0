From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] gpio: make flags mandatory for gpiod_get functions
Date: Mon, 15 Jun 2015 23:36:09 +0200
Message-ID: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37299 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858AbbFOVgT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2015 17:36:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de

Now that all[1] users of the gpiod_get functions are converted to make
use of the up to now optional flags parameter, make it mandatory which
allows to remove some cpp magic.

[1] all but etraxfs-uart which is broken anyhow and I'm allowed to
    ignore it by Jesper Nilsson :-)

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

the claim that all drivers are fixed is only true in my tree. I sent
several patches, some of them are not in next yet.

The gpiod branch in my repo[2] currently contains (in this order):
 - several patches cherry-picked from next that introduce new users of
   gpiod_get without flags;
 - several patches that fix gpiod_get users to make use of flags that
   are already in next;
 - several patches that fix gpiod_get users to make use of flags that
   are not yet in next;
 - this patch

I loosely agreed to Linus and Alexandre to get this change into next as
soon as 4.2-rc1 arrives. To assert that they have seen it before, I sen=
d
this mail. Also the remaining patches in my tree that don't make it int=
o
4.2-rc1 should probably be taken before. So I plan to rebase my tree on
top of 4.2-rc1 as soon as it arrives and ask Linus to pull it for next
in the hope that it became considerably shorter by then. At least the
first two groups above should disappear.

Some of the patches in the category "not in next yet" didn't get a
response from a maintainer. I just pinged these.

I wrote a cocci-rule that finds all offending users, so I'm fairly
confident that I caught all of them as of next-20150615.

Best regards
Uwe

[2] git://git.pengutronix.de/git/ukl/linux.git gpiod

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
index 6bc612b8a49f..e857d87f7780 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1882,12 +1882,12 @@ EXPORT_SYMBOL_GPL(gpiod_count);
  * dev, -ENOENT if no GPIO has been assigned to the requested function=
, or
  * another IS_ERR() code if an error occured while trying to acquire t=
he GPIO.
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
@@ -1899,13 +1899,13 @@ EXPORT_SYMBOL_GPL(__gpiod_get);
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
@@ -1962,7 +1962,7 @@ static int gpiod_configure_flags(struct gpio_desc=
 *desc, const char *con_id,
  * requested function and/or index, or another IS_ERR() code if an err=
or
  * occured while trying to acquire the GPIO.
  */
-struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
+struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 					       const char *con_id,
 					       unsigned int idx,
 					       enum gpiod_flags flags)
@@ -2011,7 +2011,7 @@ struct gpio_desc *__must_check __gpiod_get_index(=
struct device *dev,
=20
 	return desc;
 }
-EXPORT_SYMBOL_GPL(__gpiod_get_index);
+EXPORT_SYMBOL_GPL(gpiod_get_index);
=20
 /**
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
@@ -2080,7 +2080,7 @@ EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
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
@@ -2095,7 +2095,7 @@ struct gpio_desc *__must_check __gpiod_get_index_=
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
index 3a7c9ffd5ab9..9e8bd65f94fa 100644
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
@@ -145,31 +145,31 @@ static inline int gpiod_count(struct device *dev,=
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
@@ -205,7 +205,7 @@ static inline void gpiod_put_array(struct gpio_desc=
s *descs)
 }
=20
 static inline struct gpio_desc *__must_check
-__devm_gpiod_get(struct device *dev,
+devm_gpiod_get(struct device *dev,
 		 const char *con_id,
 		 enum gpiod_flags flags)
 {
@@ -213,7 +213,7 @@ __devm_gpiod_get(struct device *dev,
 }
 static inline
 struct gpio_desc *__must_check
-__devm_gpiod_get_index(struct device *dev,
+devm_gpiod_get_index(struct device *dev,
 		       const char *con_id,
 		       unsigned int idx,
 		       enum gpiod_flags flags)
@@ -222,14 +222,14 @@ __devm_gpiod_get_index(struct device *dev,
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
@@ -408,42 +408,6 @@ static inline int desc_to_gpio(const struct gpio_d=
esc *desc)
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
