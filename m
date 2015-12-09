From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 002/182] gpio: add a data pointer to gpio_chip
Date: Wed,  9 Dec 2015 14:11:19 +0100
Message-ID: <1449666679-29707-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:36437 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINL0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:11:26 -0500
Received: by lbblt2 with SMTP id lt2so29789667lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:11:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This adds a void * pointer to gpio_chip so that driver can
assign and retrieve some states. This is done to get rid of
container_of() calls for gpio_chips embedded inside state
containers, so we can remove the need to have the gpio_chip
or later (planned) struct gpio_device be dynamically allocated
at registration time, so that its struct device can be properly
reference counted and not bound to its parent device (e.g.
a platform_device) but instead live on after unregistration
if it is opened by e.g. a char device or sysfs.

The data is added with the new function gpiochip_add_data()
and for compatibility we add static inline wrapper function
gpiochip_add() that will call gpiochip_add_data() with
NULL as argument. The latter will be removed once we have
exorcised gpiochip_add() from the kernel.

gpiochip_get_data() is added as a static inline accessor
for drivers to quickly get their data out.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 10 ++++++----
 include/linux/gpio/driver.h | 14 +++++++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e63bebc9ae60..6d40cf9426d3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -297,7 +297,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 }
 
 /**
- * gpiochip_add() - register a gpio_chip
+ * gpiochip_add_data() - register a gpio_chip
  * @chip: the chip to register, with chip->base initialized
  * Context: potentially before irqs will work
  *
@@ -305,7 +305,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
  * because the chip->base is invalid or already associated with a
  * different chip.  Otherwise it returns zero as a success code.
  *
- * When gpiochip_add() is called very early during boot, so that GPIOs
+ * When gpiochip_add_data() is called very early during boot, so that GPIOs
  * can be freely used, the chip->parent device must be registered before
  * the gpio framework's arch_initcall().  Otherwise sysfs initialization
  * for GPIOs will fail rudely.
@@ -313,7 +313,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
  * If chip->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
  */
-int gpiochip_add(struct gpio_chip *chip)
+int gpiochip_add_data(struct gpio_chip *chip, void *data)
 {
 	unsigned long	flags;
 	int		status = 0;
@@ -325,6 +325,8 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (!descs)
 		return -ENOMEM;
 
+	chip->data = data;
+
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
 		return -EINVAL;
@@ -411,7 +413,7 @@ err_free_descs:
 		chip->label ? : "generic");
 	return status;
 }
-EXPORT_SYMBOL_GPL(gpiochip_add);
+EXPORT_SYMBOL_GPL(gpiochip_add_data);
 
 /**
  * gpiochip_remove() - unregister a gpio_chip
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b02c43be7859..f066742061f2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -23,6 +23,7 @@ struct seq_file;
  * @parent: optional parent device providing the GPIOs
  * @cdev: class device used by sysfs interface (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
+ * @data: per-instance data assigned by the driver
  * @list: links gpio_chips together for traversal
  * @request: optional hook for chip-specific activation, such as
  *	enabling module power and clock; may sleep
@@ -92,6 +93,7 @@ struct gpio_chip {
 	struct device		*parent;
 	struct device		*cdev;
 	struct module		*owner;
+	void			*data;
 	struct list_head        list;
 
 	int			(*request)(struct gpio_chip *chip,
@@ -166,7 +168,11 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 			unsigned offset);
 
 /* add/remove chips */
-extern int gpiochip_add(struct gpio_chip *chip);
+extern int gpiochip_add_data(struct gpio_chip *chip, void *data);
+static inline int gpiochip_add(struct gpio_chip *chip)
+{
+	return gpiochip_add_data(chip, NULL);
+}
 extern void gpiochip_remove(struct gpio_chip *chip);
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
@@ -175,6 +181,12 @@ extern struct gpio_chip *gpiochip_find(void *data,
 int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 
+/* get driver data */
+static inline void *gpiochip_get_data(struct gpio_chip *chip)
+{
+	return chip->data;
+}
+
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-- 
2.4.3

