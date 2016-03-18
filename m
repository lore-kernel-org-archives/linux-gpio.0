From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: mcp23s08: switch to use gpiolib irqchip helpers
Date: Fri, 18 Mar 2016 16:07:06 +0800
Message-ID: <1458288426-39144-2-git-send-email-preid@electromag.com.au>
References: <1458288426-39144-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:53242 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751673AbcCRIHQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 18 Mar 2016 04:07:16 -0400
In-Reply-To: <1458288426-39144-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

This switches the mcp23s08 driver to use the gpiolib irqchip
helpers.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/Kconfig         |  1 +
 drivers/gpio/gpio-mcp23s08.c | 85 ++++++++++++++++----------------------------
 2 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 914e904..5c68890 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1018,6 +1018,7 @@ menu "SPI or I2C GPIO expanders"
 
 config GPIO_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
+	select GPIOLIB_IRQCHIP
 	help
 	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
 	  I/O expanders.
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index b42524f..2bbcaff 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -77,7 +77,6 @@ struct mcp23s08 {
 	/* lock protects the cached values */
 	struct mutex		lock;
 	struct mutex		irq_lock;
-	struct irq_domain	*irq_domain;
 
 	struct gpio_chip	chip;
 
@@ -96,11 +95,6 @@ struct mcp23s08_driver_data {
 	struct mcp23s08		chip[];
 };
 
-/* This lock class tells lockdep that GPIO irqs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key gpio_lock_class;
-
 /*----------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_I2C)
@@ -369,7 +363,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		if ((BIT(i) & mcp->cache[MCP_INTF]) &&
 		    ((BIT(i) & intcap & mcp->irq_rise) ||
 		     (mcp->irq_fall & ~intcap & BIT(i)))) {
-			child_irq = irq_find_mapping(mcp->irq_domain, i);
+			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
 			handle_nested_irq(child_irq);
 		}
 	}
@@ -377,16 +371,10 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int mcp23s08_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct mcp23s08 *mcp = gpiochip_get_data(chip);
-
-	return irq_find_mapping(mcp->irq_domain, offset);
-}
-
 static void mcp23s08_irq_mask(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
 
 	mcp->cache[MCP_GPINTEN] &= ~BIT(pos);
@@ -394,7 +382,8 @@ static void mcp23s08_irq_mask(struct irq_data *data)
 
 static void mcp23s08_irq_unmask(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
 
 	mcp->cache[MCP_GPINTEN] |= BIT(pos);
@@ -402,7 +391,8 @@ static void mcp23s08_irq_unmask(struct irq_data *data)
 
 static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
 	int status = 0;
 
@@ -426,14 +416,16 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 
 static void mcp23s08_irq_bus_lock(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
 	mutex_lock(&mcp->irq_lock);
 }
 
 static void mcp23s08_irq_bus_unlock(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
 	mutex_lock(&mcp->lock);
 	mcp->ops->write(mcp, MCP_GPINTEN, mcp->cache[MCP_GPINTEN]);
@@ -445,7 +437,8 @@ static void mcp23s08_irq_bus_unlock(struct irq_data *data)
 
 static int mcp23s08_irq_reqres(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
 	if (gpiochip_lock_as_irq(&mcp->chip, data->hwirq)) {
 		dev_err(mcp->chip.parent,
@@ -459,7 +452,8 @@ static int mcp23s08_irq_reqres(struct irq_data *data)
 
 static void mcp23s08_irq_relres(struct irq_data *data)
 {
-	struct mcp23s08 *mcp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
 	gpiochip_unlock_as_irq(&mcp->chip, data->hwirq);
 }
@@ -478,17 +472,11 @@ static struct irq_chip mcp23s08_irq_chip = {
 static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 {
 	struct gpio_chip *chip = &mcp->chip;
-	int err, irq, j;
+	int err;
 	unsigned long irqflags = IRQF_ONESHOT | IRQF_SHARED;
 
 	mutex_init(&mcp->irq_lock);
 
-	mcp->irq_domain = irq_domain_add_linear(chip->parent->of_node,
-						chip->ngpio,
-						&irq_domain_simple_ops, mcp);
-	if (!mcp->irq_domain)
-		return -ENODEV;
-
 	if (mcp->irq_active_high)
 		irqflags |= IRQF_TRIGGER_HIGH;
 	else
@@ -503,30 +491,23 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 		return err;
 	}
 
-	chip->to_irq = mcp23s08_gpio_to_irq;
-
-	for (j = 0; j < mcp->chip.ngpio; j++) {
-		irq = irq_create_mapping(mcp->irq_domain, j);
-		irq_set_lockdep_class(irq, &gpio_lock_class);
-		irq_set_chip_data(irq, mcp);
-		irq_set_chip(irq, &mcp23s08_irq_chip);
-		irq_set_nested_thread(irq, true);
-		irq_set_noprobe(irq);
+	err =  gpiochip_irqchip_add(chip,
+				    &mcp23s08_irq_chip,
+				    0,
+				    handle_simple_irq,
+				    IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(chip->parent,
+			"could not connect irqchip to gpiochip: %d\n", err);
+		return err;
 	}
-	return 0;
-}
 
-static void mcp23s08_irq_teardown(struct mcp23s08 *mcp)
-{
-	unsigned int irq, i;
+	gpiochip_set_chained_irqchip(chip,
+				     &mcp23s08_irq_chip,
+				     mcp->irq,
+				     NULL);
 
-	for (i = 0; i < mcp->chip.ngpio; i++) {
-		irq = irq_find_mapping(mcp->irq_domain, i);
-		if (irq > 0)
-			irq_dispose_mapping(irq);
-	}
-
-	irq_domain_remove(mcp->irq_domain);
+	return 0;
 }
 
 /*----------------------------------------------------------------------*/
@@ -721,7 +702,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (mcp->irq && mcp->irq_controller) {
 		status = mcp23s08_irq_setup(mcp);
 		if (status) {
-			mcp23s08_irq_teardown(mcp);
 			goto fail;
 		}
 	}
@@ -845,9 +825,6 @@ static int mcp230xx_remove(struct i2c_client *client)
 {
 	struct mcp23s08 *mcp = i2c_get_clientdata(client);
 
-	if (client->irq && mcp->irq_controller)
-		mcp23s08_irq_teardown(mcp);
-
 	gpiochip_remove(&mcp->chip);
 	kfree(mcp);
 
@@ -1015,8 +992,6 @@ static int mcp23s08_remove(struct spi_device *spi)
 		if (!data->mcp[addr])
 			continue;
 
-		if (spi->irq && data->mcp[addr]->irq_controller)
-			mcp23s08_irq_teardown(data->mcp[addr]);
 		gpiochip_remove(&data->mcp[addr]->chip);
 	}
 
-- 
1.8.3.1

