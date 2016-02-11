From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move the subdriver data pointer into gpio_device
Date: Thu, 11 Feb 2016 11:39:43 +0100
Message-ID: <1455187183-29299-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:35245 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbcBKKjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:39:52 -0500
Received: by mail-lb0-f169.google.com with SMTP id bc4so25286432lbc.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:39:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

We move to manage this pointer under gpiolib control rather than
leave it in the subdevice's gpio_chip. We can not NULL it after
gpiochip_remove so at to keep things tight.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 17 +++++++++++++++--
 drivers/gpio/gpiolib.h      |  2 ++
 include/linux/gpio/driver.h |  7 +------
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 08e93857a7d5..8d5e36635d43 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -480,8 +480,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		goto err_free_gdev;
 	}
 	gdev->ngpio = chip->ngpio;
-	/* FIXME: move driver data into gpio_device dev_set_drvdata() */
-	chip->data = data;
+	gdev->data = data;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -603,6 +602,15 @@ err_free_gdev:
 EXPORT_SYMBOL_GPL(gpiochip_add_data);
 
 /**
+ * gpiochip_get_data() - get per-subdriver data for the chip
+ */
+void *gpiochip_get_data(struct gpio_chip *chip)
+{
+	return chip->gpiodev->data;
+}
+EXPORT_SYMBOL_GPL(gpiochip_get_data);
+
+/**
  * gpiochip_remove() - unregister a gpio_chip
  * @chip: the chip to unregister
  *
@@ -626,6 +634,11 @@ void gpiochip_remove(struct gpio_chip *chip)
 	gpiochip_remove_pin_ranges(chip);
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
+	/*
+	 * We accept no more calls into the driver from this point, so
+	 * NULL the driver data pointer
+	 */
+	gdev->data = NULL;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (i = 0; i < gdev->ngpio; i++) {
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 5a36908fd39d..ddbe409ad48f 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -37,6 +37,7 @@ struct acpi_device;
  * of the @descs array.
  * @base: GPIO base in the DEPRECATED global Linux GPIO numberspace, assigned
  * at device creation time.
+ * @data: per-instance data assigned by the driver
  * @list: links gpio_device:s together for traversal
  *
  * This state container holds most of the runtime variable data
@@ -54,6 +55,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	int			base;
 	u16			ngpio;
+	void			*data;
 	struct list_head        list;
 
 #ifdef CONFIG_PINCTRL
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1babd000bbbe..363bf0eab6d0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -25,7 +25,6 @@ struct gpio_device;
  * @gpiodev: the internal state holder, opaque struct
  * @parent: optional parent device providing the GPIOs
  * @owner: helps prevent removal of modules exporting active GPIOs
- * @data: per-instance data assigned by the driver
  * @request: optional hook for chip-specific activation, such as
  *	enabling module power and clock; may sleep
  * @free: optional hook for chip-specific deactivation, such as
@@ -109,7 +108,6 @@ struct gpio_chip {
 	struct gpio_device	*gpiodev;
 	struct device		*parent;
 	struct module		*owner;
-	void			*data;
 
 	int			(*request)(struct gpio_chip *chip,
 						unsigned offset);
@@ -201,10 +199,7 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 
 /* get driver data */
-static inline void *gpiochip_get_data(struct gpio_chip *chip)
-{
-	return chip->data;
-}
+void *gpiochip_get_data(struct gpio_chip *chip);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-- 
2.4.3

