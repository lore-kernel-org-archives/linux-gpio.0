From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: max732x: convert to GPIOLIB_IRQCHIP
Date: Fri, 30 Jan 2015 11:46:04 +0100
Message-ID: <1422614764-5430-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:38932 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760059AbbA3KqL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 05:46:11 -0500
Received: by mail-la0-f50.google.com with SMTP id hs14so22877586lab.9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 02:46:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Semen Protsenko <semen.protsenko@globallogic.com>, Mans Rullgard <mans@mansr.com>

Take a sweep to bring the irq support for the MAX732x expanders
into the gpiolib core to cut down on duplicated code.

Only compile tested! I need some feedback from people using this
expander with interrupts to tell me if things go right or
wrong when I do this.

Cc: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Mans Rullgard <mans@mansr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig        |   2 +-
 drivers/gpio/gpio-max732x.c | 134 ++++++++++++++------------------------------
 2 files changed, 43 insertions(+), 93 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae5cb4d517c6..d0c9399a17b3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -543,7 +543,6 @@ config GPIO_MAX7300
 config GPIO_MAX732X
 	tristate "MAX7319, MAX7320-7327 I2C Port Expanders"
 	depends on I2C
-	select IRQ_DOMAIN
 	help
 	  Say yes here to support the MAX7319, MAX7320-7327 series of I2C
 	  Port Expanders. Each IO port on these chips has a fixed role of
@@ -563,6 +562,7 @@ config GPIO_MAX732X
 config GPIO_MAX732X_IRQ
 	bool "Interrupt controller support for MAX732x"
 	depends on GPIO_MAX732X=y
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable the max732x to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a095b2393fe9..0fa4543c5e02 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -4,6 +4,7 @@
  *  Copyright (C) 2007 Marvell International Ltd.
  *  Copyright (C) 2008 Jack Ren <jack.ren@marvell.com>
  *  Copyright (C) 2008 Eric Miao <eric.miao@marvell.com>
+ *  Copyright (C) 2015 Linus Walleij <linus.walleij@linaro.org>
  *
  *  Derived from drivers/gpio/pca953x.c
  *
@@ -16,10 +17,8 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/i2c.h>
 #include <linux/i2c/max732x.h>
 #include <linux/of.h>
@@ -150,9 +149,7 @@ struct max732x_chip {
 	uint8_t		reg_out[2];
 
 #ifdef CONFIG_GPIO_MAX732X_IRQ
-	struct irq_domain	*irq_domain;
 	struct mutex		irq_lock;
-	int			irq_base;
 	uint8_t			irq_mask;
 	uint8_t			irq_mask_cur;
 	uint8_t			irq_trig_raise;
@@ -356,35 +353,26 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 	mutex_unlock(&chip->lock);
 }
 
-static int max732x_gpio_to_irq(struct gpio_chip *gc, unsigned off)
-{
-	struct max732x_chip *chip = to_max732x(gc);
-
-	if (chip->irq_domain) {
-		return irq_create_mapping(chip->irq_domain,
-				chip->irq_base + off);
-	} else {
-		return -ENXIO;
-	}
-}
-
 static void max732x_irq_mask(struct irq_data *d)
 {
-	struct max732x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max732x_chip *chip = to_max732x(gc);
 
 	chip->irq_mask_cur &= ~(1 << d->hwirq);
 }
 
 static void max732x_irq_unmask(struct irq_data *d)
 {
-	struct max732x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max732x_chip *chip = to_max732x(gc);
 
 	chip->irq_mask_cur |= 1 << d->hwirq;
 }
 
 static void max732x_irq_bus_lock(struct irq_data *d)
 {
-	struct max732x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max732x_chip *chip = to_max732x(gc);
 
 	mutex_lock(&chip->irq_lock);
 	chip->irq_mask_cur = chip->irq_mask;
@@ -392,7 +380,8 @@ static void max732x_irq_bus_lock(struct irq_data *d)
 
 static void max732x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct max732x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max732x_chip *chip = to_max732x(gc);
 	uint16_t new_irqs;
 	uint16_t level;
 
@@ -410,7 +399,8 @@ static void max732x_irq_bus_sync_unlock(struct irq_data *d)
 
 static int max732x_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct max732x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max732x_chip *chip = to_max732x(gc);
 	uint16_t off = d->hwirq;
 	uint16_t mask = 1 << off;
 
@@ -492,7 +482,8 @@ static irqreturn_t max732x_irq_handler(int irq, void *devid)
 
 	do {
 		level = __ffs(pending);
-		handle_nested_irq(irq_find_mapping(chip->irq_domain, level));
+		handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
+						   level));
 
 		pending &= ~(1 << level);
 	} while (pending);
@@ -500,86 +491,50 @@ static irqreturn_t max732x_irq_handler(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static int max732x_irq_map(struct irq_domain *h, unsigned int virq,
-		irq_hw_number_t hw)
-{
-	struct max732x_chip *chip = h->host_data;
-
-	if (!(chip->dir_input & (1 << hw))) {
-		dev_err(&chip->client->dev,
-				"Attempt to map output line as IRQ line: %lu\n",
-				hw);
-		return -EPERM;
-	}
-
-	irq_set_chip_data(virq, chip);
-	irq_set_chip_and_handler(virq, &max732x_irq_chip,
-			handle_edge_irq);
-	irq_set_nested_thread(virq, 1);
-#ifdef CONFIG_ARM
-	/* ARM needs us to explicitly flag the IRQ as valid
-	 * and will set them noprobe when we do so. */
-	set_irq_flags(virq, IRQF_VALID);
-#else
-	irq_set_noprobe(virq);
-#endif
-
-	return 0;
-}
-
-static struct irq_domain_ops max732x_irq_domain_ops = {
-	.map	= max732x_irq_map,
-	.xlate	= irq_domain_xlate_twocell,
-};
-
-static void max732x_irq_teardown(struct max732x_chip *chip)
-{
-	if (chip->client->irq && chip->irq_domain)
-		irq_domain_remove(chip->irq_domain);
-}
-
 static int max732x_irq_setup(struct max732x_chip *chip,
 			     const struct i2c_device_id *id)
 {
 	struct i2c_client *client = chip->client;
 	struct max732x_platform_data *pdata = dev_get_platdata(&client->dev);
 	int has_irq = max732x_features[id->driver_data] >> 32;
+	int irq_base = 0;
 	int ret;
 
 	if (((pdata && pdata->irq_base) || client->irq)
 			&& has_irq != INT_NONE) {
 		if (pdata)
-			chip->irq_base = pdata->irq_base;
+			irq_base = pdata->irq_base;
 		chip->irq_features = has_irq;
 		mutex_init(&chip->irq_lock);
 
-		chip->irq_domain = irq_domain_add_simple(client->dev.of_node,
-				chip->gpio_chip.ngpio, chip->irq_base,
-				&max732x_irq_domain_ops, chip);
-		if (!chip->irq_domain) {
-			dev_err(&client->dev, "Failed to create IRQ domain\n");
-			return -ENOMEM;
-		}
-
-		ret = request_threaded_irq(client->irq,
-					   NULL,
-					   max732x_irq_handler,
-					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					   dev_name(&client->dev), chip);
+		ret = devm_request_threaded_irq(&client->dev,
+					client->irq,
+					NULL,
+					max732x_irq_handler,
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					dev_name(&client->dev), chip);
 		if (ret) {
 			dev_err(&client->dev, "failed to request irq %d\n",
 				client->irq);
-			goto out_failed;
+			return ret;
 		}
-
-		chip->gpio_chip.to_irq = max732x_gpio_to_irq;
+		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
+					    &max732x_irq_chip,
+					    irq_base,
+					    handle_edge_irq,
+					    IRQ_TYPE_NONE);
+		if (ret) {
+			dev_err(&client->dev,
+				"could not connect irqchip to gpiochip\n");
+			return ret;
+		}
+		gpiochip_set_chained_irqchip(&chip->gpio_chip,
+					     &max732x_irq_chip,
+					     client->irq,
+					     NULL);
 	}
 
 	return 0;
-
-out_failed:
-	max732x_irq_teardown(chip);
-	return ret;
 }
 
 #else /* CONFIG_GPIO_MAX732X_IRQ */
@@ -595,10 +550,6 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 
 	return 0;
 }
-
-static void max732x_irq_teardown(struct max732x_chip *chip)
-{
-}
 #endif
 
 static int max732x_setup_gpio(struct max732x_chip *chip,
@@ -730,13 +681,15 @@ static int max732x_probe(struct i2c_client *client,
 	if (nr_port > 8)
 		max732x_readb(chip, is_group_a(chip, 8), &chip->reg_out[1]);
 
-	ret = max732x_irq_setup(chip, id);
+	ret = gpiochip_add(&chip->gpio_chip);
 	if (ret)
 		goto out_failed;
 
-	ret = gpiochip_add(&chip->gpio_chip);
-	if (ret)
+	ret = max732x_irq_setup(chip, id);
+	if (ret) {
+		gpiochip_remove(&chip->gpio_chip);
 		goto out_failed;
+	}
 
 	if (pdata && pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
@@ -751,7 +704,6 @@ static int max732x_probe(struct i2c_client *client,
 out_failed:
 	if (chip->client_dummy)
 		i2c_unregister_device(chip->client_dummy);
-	max732x_irq_teardown(chip);
 	return ret;
 }
 
@@ -774,8 +726,6 @@ static int max732x_remove(struct i2c_client *client)
 
 	gpiochip_remove(&chip->gpio_chip);
 
-	max732x_irq_teardown(chip);
-
 	/* unregister any dummy i2c_client */
 	if (chip->client_dummy)
 		i2c_unregister_device(chip->client_dummy);
-- 
1.9.3

