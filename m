From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] RFT: gpio: pca953x: use gpiolib irqchip helpers
Date: Fri,  9 May 2014 13:35:39 +0200
Message-ID: <1399635339-16812-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:54815 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754716AbaEILfr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 07:35:47 -0400
Received: by mail-wi0-f177.google.com with SMTP id f8so1166619wiw.4
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 04:35:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, Graeme Smecher <gsmecher@threespeedlogic.com>, Andrew Ruder <andy@aeruder.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This switches the PCA953x driver over to using the gpiolib irqchip
helpers to handle the threaded interrups cascaded off this
GPIO chip.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
PCA953x users: please! help testing this. It is just compile-tested
but I'm sure this or something close to it will work just fine.

The patch depends on the GPIO tree devel branch, so I have set up
a branch you can test:

git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#pca953-irqchip-helpers

The branch is on top of Toby's changes. Please help to provide
Tested-by tags.
---
 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpio-pca953x.c | 93 ++++++++++++++++-----------------------------
 2 files changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 664df4d08459..b29427cc7f44 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -519,6 +519,7 @@ config GPIO_PCA953X
 config GPIO_PCA953X_IRQ
 	bool "Interrupt controller support for PCA953x"
 	depends on GPIO_PCA953X=y
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable the pca953x to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6398f8a0f40c..e721a37c3473 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -15,8 +15,6 @@
 #include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/slab.h>
@@ -91,7 +89,6 @@ struct pca953x_chip {
 	u8 irq_stat[MAX_BANK];
 	u8 irq_trig_raise[MAX_BANK];
 	u8 irq_trig_fall[MAX_BANK];
-	struct irq_domain *domain;
 #endif
 
 	struct i2c_client *client;
@@ -100,6 +97,11 @@ struct pca953x_chip {
 	int	chip_type;
 };
 
+static inline struct pca953x_chip *to_pca(struct gpio_chip *gc)
+{
+	return container_of(gc, struct pca953x_chip, gpio_chip);
+}
+
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
 				int off)
 {
@@ -202,12 +204,10 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
-	struct pca953x_chip *chip;
+	struct pca953x_chip *chip = to_pca(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
-	chip = container_of(gc, struct pca953x_chip, gpio_chip);
-
 	mutex_lock(&chip->i2c_lock);
 	reg_val = chip->reg_direction[off / BANK_SZ] | (1u << (off % BANK_SZ));
 
@@ -233,12 +233,10 @@ exit:
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
-	struct pca953x_chip *chip;
+	struct pca953x_chip *chip = to_pca(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
-	chip = container_of(gc, struct pca953x_chip, gpio_chip);
-
 	mutex_lock(&chip->i2c_lock);
 	/* set output level */
 	if (val)
@@ -285,12 +283,10 @@ exit:
 
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
-	struct pca953x_chip *chip;
+	struct pca953x_chip *chip = to_pca(gc);
 	u32 reg_val;
 	int ret, offset = 0;
 
-	chip = container_of(gc, struct pca953x_chip, gpio_chip);
-
 	mutex_lock(&chip->i2c_lock);
 	switch (chip->chip_type) {
 	case PCA953X_TYPE:
@@ -315,12 +311,10 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
-	struct pca953x_chip *chip;
+	struct pca953x_chip *chip = to_pca(gc);
 	u8 reg_val;
 	int ret, offset = 0;
 
-	chip = container_of(gc, struct pca953x_chip, gpio_chip);
-
 	mutex_lock(&chip->i2c_lock);
 	if (val)
 		reg_val = chip->reg_output[off / BANK_SZ]
@@ -367,38 +361,34 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 }
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
-static int pca953x_gpio_to_irq(struct gpio_chip *gc, unsigned off)
-{
-	struct pca953x_chip *chip;
-
-	chip = container_of(gc, struct pca953x_chip, gpio_chip);
-	return irq_create_mapping(chip->domain, off);
-}
-
 static void pca953x_irq_mask(struct irq_data *d)
 {
-	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = to_pca(gc);
 
 	chip->irq_mask[d->hwirq / BANK_SZ] &= ~(1 << (d->hwirq % BANK_SZ));
 }
 
 static void pca953x_irq_unmask(struct irq_data *d)
 {
-	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = to_pca(gc);
 
 	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
 }
 
 static void pca953x_irq_bus_lock(struct irq_data *d)
 {
-	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = to_pca(gc);
 
 	mutex_lock(&chip->irq_lock);
 }
 
 static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = to_pca(gc);
 	u8 new_irqs;
 	int level, i;
 
@@ -420,7 +410,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 
 static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = to_pca(gc);
 	int bank_nb = d->hwirq / BANK_SZ;
 	u8 mask = 1 << (d->hwirq % BANK_SZ);
 
@@ -512,7 +503,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	for (i = 0; i < NBANK(chip); i++) {
 		while (pending[i]) {
 			level = __ffs(pending[i]);
-			handle_nested_irq(irq_find_mapping(chip->domain,
+			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
 							level + (BANK_SZ * i)));
 			pending[i] &= ~(1 << level);
 			nhandled++;
@@ -522,27 +513,6 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	return (nhandled > 0) ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static int pca953x_gpio_irq_map(struct irq_domain *d, unsigned int irq,
-		       irq_hw_number_t hwirq)
-{
-	irq_clear_status_flags(irq, IRQ_NOREQUEST);
-	irq_set_chip_data(irq, d->host_data);
-	irq_set_chip(irq, &pca953x_irq_chip);
-	irq_set_nested_thread(irq, true);
-#ifdef CONFIG_ARM
-	set_irq_flags(irq, IRQF_VALID);
-#else
-	irq_set_noprobe(irq);
-#endif
-
-	return 0;
-}
-
-static const struct irq_domain_ops pca953x_irq_simple_ops = {
-	.map = pca953x_gpio_irq_map,
-	.xlate = irq_domain_xlate_twocell,
-};
-
 static int pca953x_irq_setup(struct pca953x_chip *chip,
 			     const struct i2c_device_id *id,
 			     int irq_base)
@@ -574,14 +544,6 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			chip->irq_stat[i] &= chip->reg_direction[i];
 		mutex_init(&chip->irq_lock);
 
-		chip->domain = irq_domain_add_simple(client->dev.of_node,
-						chip->gpio_chip.ngpio,
-						irq_base,
-						&pca953x_irq_simple_ops,
-						chip);
-		if (!chip->domain)
-			return -ENODEV;
-
 		ret = devm_request_threaded_irq(&client->dev,
 					client->irq,
 					   NULL,
@@ -595,7 +557,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			return ret;
 		}
 
-		chip->gpio_chip.to_irq = pca953x_gpio_to_irq;
+		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
+					    &pca953x_irq_chip,
+					    irq_base,
+					    handle_simple_irq,
+					    IRQ_TYPE_NONE);
+		if (ret) {
+			dev_err(&client->dev,
+				"could not connect irqchip to gpiochip\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -759,11 +730,11 @@ static int pca953x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = pca953x_irq_setup(chip, id, irq_base);
+	ret = gpiochip_add(&chip->gpio_chip);
 	if (ret)
 		return ret;
 
-	ret = gpiochip_add(&chip->gpio_chip);
+	ret = pca953x_irq_setup(chip, id, irq_base);
 	if (ret)
 		return ret;
 
-- 
1.9.0

