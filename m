From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] RFT: gpio: adnp: switch to use irqchip helpers
Date: Mon,  2 Jun 2014 15:22:27 +0200
Message-ID: <1401715347-24996-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:54537 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754617AbaFBNWr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jun 2014 09:22:47 -0400
Received: by mail-wi0-f173.google.com with SMTP id bs8so4578360wib.6
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jun 2014 06:22:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Roland Stigge <stigge@antcom.de>, Thierry Reding <thierry.reding@gmail.com>

This switches the ADNP GPIO driver to use the gpiolib
irqchip helpers. Also do some random refactoring to make it
look like most other GPIO drivers.

Cc: Roland Stigge <stigge@antcom.de>
Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
LPC32XX maintainers: please help out testing this.
---
 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-adnp.c | 155 ++++++++++++++---------------------------------
 2 files changed, 48 insertions(+), 108 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4a1b5113e527..5db53cf49cd7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -660,6 +660,7 @@ config GPIO_ADP5588_IRQ
 config GPIO_ADNP
 	tristate "Avionic Design N-bit GPIO expander"
 	depends on I2C && OF_GPIO
+	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for N GPIOs found on Avionic Design
 	  I2C GPIO expanders. The register space will be extended by powers
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b2239d678d01..c3a0cf497507 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -6,10 +6,9 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/seq_file.h>
@@ -27,8 +26,6 @@ struct adnp {
 	unsigned int reg_shift;
 
 	struct mutex i2c_lock;
-
-	struct irq_domain *domain;
 	struct mutex irq_lock;
 
 	u8 *irq_enable;
@@ -253,6 +250,7 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
 {
 	struct gpio_chip *chip = &adnp->gpio;
+	int err;
 
 	adnp->reg_shift = get_count_order(num_gpios) - 3;
 
@@ -272,6 +270,10 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
 	chip->of_node = chip->dev->of_node;
 	chip->owner = THIS_MODULE;
 
+	err = gpiochip_add(chip);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -326,7 +328,8 @@ static irqreturn_t adnp_irq(int irq, void *data)
 
 		for_each_set_bit(bit, &pending, 8) {
 			unsigned int child_irq;
-			child_irq = irq_find_mapping(adnp->domain, base + bit);
+			child_irq = irq_find_mapping(adnp->gpio.irqdomain,
+						     base + bit);
 			handle_nested_irq(child_irq);
 		}
 	}
@@ -334,35 +337,32 @@ static irqreturn_t adnp_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int adnp_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct adnp *adnp = to_adnp(chip);
-	return irq_create_mapping(adnp->domain, offset);
-}
-
-static void adnp_irq_mask(struct irq_data *data)
+static void adnp_irq_mask(struct irq_data *d)
 {
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
-	unsigned int reg = data->hwirq >> adnp->reg_shift;
-	unsigned int pos = data->hwirq & 7;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adnp *adnp = to_adnp(gc);
+	unsigned int reg = d->hwirq >> adnp->reg_shift;
+	unsigned int pos = d->hwirq & 7;
 
 	adnp->irq_enable[reg] &= ~BIT(pos);
 }
 
-static void adnp_irq_unmask(struct irq_data *data)
+static void adnp_irq_unmask(struct irq_data *d)
 {
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
-	unsigned int reg = data->hwirq >> adnp->reg_shift;
-	unsigned int pos = data->hwirq & 7;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adnp *adnp = to_adnp(gc);
+	unsigned int reg = d->hwirq >> adnp->reg_shift;
+	unsigned int pos = d->hwirq & 7;
 
 	adnp->irq_enable[reg] |= BIT(pos);
 }
 
-static int adnp_irq_set_type(struct irq_data *data, unsigned int type)
+static int adnp_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
-	unsigned int reg = data->hwirq >> adnp->reg_shift;
-	unsigned int pos = data->hwirq & 7;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adnp *adnp = to_adnp(gc);
+	unsigned int reg = d->hwirq >> adnp->reg_shift;
+	unsigned int pos = d->hwirq & 7;
 
 	if (type & IRQ_TYPE_EDGE_RISING)
 		adnp->irq_rise[reg] |= BIT(pos);
@@ -387,16 +387,18 @@ static int adnp_irq_set_type(struct irq_data *data, unsigned int type)
 	return 0;
 }
 
-static void adnp_irq_bus_lock(struct irq_data *data)
+static void adnp_irq_bus_lock(struct irq_data *d)
 {
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adnp *adnp = to_adnp(gc);
 
 	mutex_lock(&adnp->irq_lock);
 }
 
-static void adnp_irq_bus_unlock(struct irq_data *data)
+static void adnp_irq_bus_unlock(struct irq_data *d)
 {
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adnp *adnp = to_adnp(gc);
 	unsigned int num_regs = 1 << adnp->reg_shift, i;
 
 	mutex_lock(&adnp->i2c_lock);
@@ -408,26 +410,6 @@ static void adnp_irq_bus_unlock(struct irq_data *data)
 	mutex_unlock(&adnp->irq_lock);
 }
 
-static int adnp_irq_reqres(struct irq_data *data)
-{
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
-
-	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq)) {
-		dev_err(adnp->gpio.dev,
-			"unable to lock HW IRQ %lu for IRQ\n",
-			data->hwirq);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void adnp_irq_relres(struct irq_data *data)
-{
-	struct adnp *adnp = irq_data_get_irq_chip_data(data);
-
-	gpio_unlock_as_irq(&adnp->gpio, data->hwirq);
-}
-
 static struct irq_chip adnp_irq_chip = {
 	.name = "gpio-adnp",
 	.irq_mask = adnp_irq_mask,
@@ -435,29 +417,6 @@ static struct irq_chip adnp_irq_chip = {
 	.irq_set_type = adnp_irq_set_type,
 	.irq_bus_lock = adnp_irq_bus_lock,
 	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
-	.irq_request_resources = adnp_irq_reqres,
-	.irq_release_resources = adnp_irq_relres,
-};
-
-static int adnp_irq_map(struct irq_domain *domain, unsigned int irq,
-			irq_hw_number_t hwirq)
-{
-	irq_set_chip_data(irq, domain->host_data);
-	irq_set_chip(irq, &adnp_irq_chip);
-	irq_set_nested_thread(irq, true);
-
-#ifdef CONFIG_ARM
-	set_irq_flags(irq, IRQF_VALID);
-#else
-	irq_set_noprobe(irq);
-#endif
-
-	return 0;
-}
-
-static const struct irq_domain_ops adnp_irq_domain_ops = {
-	.map = adnp_irq_map,
-	.xlate = irq_domain_xlate_twocell,
 };
 
 static int adnp_irq_setup(struct adnp *adnp)
@@ -503,35 +462,28 @@ static int adnp_irq_setup(struct adnp *adnp)
 		adnp->irq_enable[i] = 0x00;
 	}
 
-	adnp->domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
-					     &adnp_irq_domain_ops, adnp);
-
-	err = request_threaded_irq(adnp->client->irq, NULL, adnp_irq,
-				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-				   dev_name(chip->dev), adnp);
+	err = devm_request_threaded_irq(chip->dev, adnp->client->irq,
+					NULL, adnp_irq,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					dev_name(chip->dev), adnp);
 	if (err != 0) {
 		dev_err(chip->dev, "can't request IRQ#%d: %d\n",
 			adnp->client->irq, err);
 		return err;
 	}
 
-	chip->to_irq = adnp_gpio_to_irq;
-	return 0;
-}
-
-static void adnp_irq_teardown(struct adnp *adnp)
-{
-	unsigned int irq, i;
-
-	free_irq(adnp->client->irq, adnp);
-
-	for (i = 0; i < adnp->gpio.ngpio; i++) {
-		irq = irq_find_mapping(adnp->domain, i);
-		if (irq > 0)
-			irq_dispose_mapping(irq);
+	err = gpiochip_irqchip_add(chip,
+				   &adnp_irq_chip,
+				   0,
+				   handle_simple_irq,
+				   IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(chip->dev,
+			"could not connect irqchip to gpiochip\n");
+		return err;
 	}
 
-	irq_domain_remove(adnp->domain);
+	return 0;
 }
 
 static int adnp_i2c_probe(struct i2c_client *client,
@@ -558,33 +510,23 @@ static int adnp_i2c_probe(struct i2c_client *client,
 	adnp->client = client;
 
 	err = adnp_gpio_setup(adnp, num_gpios);
-	if (err < 0)
+	if (err)
 		return err;
 
 	if (of_find_property(np, "interrupt-controller", NULL)) {
 		err = adnp_irq_setup(adnp);
-		if (err < 0)
-			goto teardown;
+		if (err)
+			return err;
 	}
 
-	err = gpiochip_add(&adnp->gpio);
-	if (err < 0)
-		goto teardown;
-
 	i2c_set_clientdata(client, adnp);
-	return 0;
 
-teardown:
-	if (of_find_property(np, "interrupt-controller", NULL))
-		adnp_irq_teardown(adnp);
-
-	return err;
+	return 0;
 }
 
 static int adnp_i2c_remove(struct i2c_client *client)
 {
 	struct adnp *adnp = i2c_get_clientdata(client);
-	struct device_node *np = client->dev.of_node;
 	int err;
 
 	err = gpiochip_remove(&adnp->gpio);
@@ -594,9 +536,6 @@ static int adnp_i2c_remove(struct i2c_client *client)
 		return err;
 	}
 
-	if (of_find_property(np, "interrupt-controller", NULL))
-		adnp_irq_teardown(adnp);
-
 	return 0;
 }
 
-- 
1.9.3

