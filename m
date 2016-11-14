From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Mon, 14 Nov 2016 18:52:05 +0100
Message-ID: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34806 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbcKNRwQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2016 12:52:16 -0500
Received: by mail-lf0-f48.google.com with SMTP id o141so63999800lff.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2016 09:52:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>

It should be possible to use the GPIOLIB_IRQCHIP helper
library with the BCM2835 driver since it is a pretty straight
forward cascaded irqchip.

The only difference from other drivers is that the BCM2835
has several banks for a single gpiochip, and each bank has
a separate IRQ line. Instead of creating one gpiochip per
bank, a single gpiochip covers all banks GPIO lines. This
makes it necessary to resolve the bank ID in the IRQ
handler.

The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
the same gpiochip by calling gpiochip_set_chained_irqchip()
repeatedly, but we have been a bit short on examples
for how this should be handled in practice, so this is intended
as an example of how this can be achieved.

The old code did not model the chip as a chained interrupt
handler, but this patch also rectifies that situation.

Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on top of the two new patches from the vendor tree.
ChangeLog v1->v2:
- Forgot to convert the driver to chained IRQ handler. Now fixed.

Rpi folks: I have no clue if this works or not, but would be happy
if you could test it to see if IRQs fire as expected and provide
some feedback.
---
 drivers/pinctrl/bcm/Kconfig           |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 140 ++++++++++++++++------------------
 2 files changed, 65 insertions(+), 76 deletions(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 63246770bd74..8968dd7aebed 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -20,6 +20,7 @@ config PINCTRL_BCM2835
 	bool
 	select PINMUX
 	select PINCONF
+	select GPIOLIB_IRQCHIP
 
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 6128359d3281..1bb38d0493eb 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -24,11 +24,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
-#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
@@ -87,11 +85,6 @@ enum bcm2835_pinconf_pull {
 #define BCM2835_PINCONF_UNPACK_PARAM(_conf_) ((_conf_) >> 16)
 #define BCM2835_PINCONF_UNPACK_ARG(_conf_) ((_conf_) & 0xffff)
 
-struct bcm2835_gpio_irqdata {
-	struct bcm2835_pinctrl *pc;
-	int irqgroup;
-};
-
 struct bcm2835_pinctrl {
 	struct device *dev;
 	void __iomem *base;
@@ -102,16 +95,13 @@ struct bcm2835_pinctrl {
 	unsigned int irq_type[BCM2835_NUM_GPIOS];
 
 	struct pinctrl_dev *pctl_dev;
-	struct irq_domain *irq_domain;
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range gpio_range;
 
-	struct bcm2835_gpio_irqdata irq_data[BCM2835_NUM_IRQS];
+	int irq_group[BCM2835_NUM_IRQS];
 	spinlock_t irq_lock[BCM2835_NUM_BANKS];
 };
 
-static struct lock_class_key gpio_lock_class;
-
 /* pins are just named GPIO0..GPIO53 */
 #define BCM2835_GPIO_PIN(a) PINCTRL_PIN(a, "gpio" #a)
 static struct pinctrl_pin_desc bcm2835_gpio_pins[] = {
@@ -369,13 +359,6 @@ static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
 	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
-static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
-
-	return irq_linear_revmap(pc->irq_domain, offset);
-}
-
 static struct gpio_chip bcm2835_gpio_chip = {
 	.label = MODULE_NAME,
 	.owner = THIS_MODULE,
@@ -386,14 +369,13 @@ static struct gpio_chip bcm2835_gpio_chip = {
 	.get_direction = bcm2835_gpio_get_direction,
 	.get = bcm2835_gpio_get,
 	.set = bcm2835_gpio_set,
-	.to_irq = bcm2835_gpio_to_irq,
 	.base = -1,
 	.ngpio = BCM2835_NUM_GPIOS,
 	.can_sleep = false,
 };
 
-static int bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
-					unsigned int bank, u32 mask)
+static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
+					 unsigned int bank, u32 mask)
 {
 	unsigned long events;
 	unsigned offset;
@@ -405,34 +387,49 @@ static int bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
 	events &= pc->enabled_irq_map[bank];
 	for_each_set_bit(offset, &events, 32) {
 		gpio = (32 * bank) + offset;
+		/* FIXME: no clue why the code looks up the type here */
 		type = pc->irq_type[gpio];
 
-		generic_handle_irq(irq_linear_revmap(pc->irq_domain, gpio));
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irqdomain,
+						     gpio));
 	}
-
-	return (events != 0);
 }
 
-static irqreturn_t bcm2835_gpio_irq_handler(int irq, void *dev_id)
+static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 {
-	struct bcm2835_gpio_irqdata *irqdata = dev_id;
-	struct bcm2835_pinctrl *pc = irqdata->pc;
-	int handled = 0;
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	int irq = irq_desc_get_irq(desc);
+	int group;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pc->irq); i++) {
+		if (pc->irq[i] == irq) {
+			group = pc->irq_group[i];
+			break;
+		}
+	}
+	/* This should not happen, every IRQ has a bank */
+	if (i == ARRAY_SIZE(pc->irq))
+		BUG();
 
-	switch (irqdata->irqgroup) {
+	chained_irq_enter(host_chip, desc);
+
+	switch (group) {
 	case 0: /* IRQ0 covers GPIOs 0-27 */
-		handled = bcm2835_gpio_irq_handle_bank(pc, 0, 0x0fffffff);
+		bcm2835_gpio_irq_handle_bank(pc, 0, 0x0fffffff);
 		break;
 	case 1: /* IRQ1 covers GPIOs 28-45 */
-		handled = bcm2835_gpio_irq_handle_bank(pc, 0, 0xf0000000) |
-			  bcm2835_gpio_irq_handle_bank(pc, 1, 0x00003fff);
+		bcm2835_gpio_irq_handle_bank(pc, 0, 0xf0000000);
+		bcm2835_gpio_irq_handle_bank(pc, 1, 0x00003fff);
 		break;
 	case 2: /* IRQ2 covers GPIOs 46-53 */
-		handled = bcm2835_gpio_irq_handle_bank(pc, 1, 0x003fc000);
+		bcm2835_gpio_irq_handle_bank(pc, 1, 0x003fc000);
 		break;
 	}
 
-	return handled ? IRQ_HANDLED : IRQ_NONE;
+	chained_irq_exit(host_chip, desc);
 }
 
 static inline void __bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
@@ -478,7 +475,8 @@ static void bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
 
 static void bcm2835_gpio_irq_enable(struct irq_data *data)
 {
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned gpio = irqd_to_hwirq(data);
 	unsigned offset = GPIO_REG_SHIFT(gpio);
 	unsigned bank = GPIO_REG_OFFSET(gpio);
@@ -492,7 +490,8 @@ static void bcm2835_gpio_irq_enable(struct irq_data *data)
 
 static void bcm2835_gpio_irq_disable(struct irq_data *data)
 {
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned gpio = irqd_to_hwirq(data);
 	unsigned offset = GPIO_REG_SHIFT(gpio);
 	unsigned bank = GPIO_REG_OFFSET(gpio);
@@ -598,7 +597,8 @@ static int __bcm2835_gpio_irq_set_type_enabled(struct bcm2835_pinctrl *pc,
 
 static int bcm2835_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned gpio = irqd_to_hwirq(data);
 	unsigned offset = GPIO_REG_SHIFT(gpio);
 	unsigned bank = GPIO_REG_OFFSET(gpio);
@@ -624,7 +624,8 @@ static int bcm2835_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 static void bcm2835_gpio_irq_ack(struct irq_data *data)
 {
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned gpio = irqd_to_hwirq(data);
 
 	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
@@ -667,10 +668,11 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		unsigned offset)
 {
 	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct gpio_chip *chip = &pc->gpio_chip;
 	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
 	const char *fname = bcm2835_functions[fsel];
 	int value = bcm2835_gpio_get_bit(pc, GPLEV0, offset);
-	int irq = irq_find_mapping(pc->irq_domain, offset);
+	int irq = irq_find_mapping(chip->irqdomain, offset);
 
 	seq_printf(s, "function %s in %s; irq %d (%s)",
 		fname, value ? "hi" : "lo",
@@ -1016,21 +1018,6 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pc->gpio_chip.parent = dev;
 	pc->gpio_chip.of_node = np;
 
-	pc->irq_domain = irq_domain_add_linear(np, BCM2835_NUM_GPIOS,
-			&irq_domain_simple_ops, NULL);
-	if (!pc->irq_domain) {
-		dev_err(dev, "could not create IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < BCM2835_NUM_GPIOS; i++) {
-		int irq = irq_create_mapping(pc->irq_domain, i);
-		irq_set_lockdep_class(irq, &gpio_lock_class);
-		irq_set_chip_and_handler(irq, &bcm2835_gpio_irq_chip,
-				handle_level_irq);
-		irq_set_chip_data(irq, pc);
-	}
-
 	for (i = 0; i < BCM2835_NUM_BANKS; i++) {
 		unsigned long events;
 		unsigned offset;
@@ -1051,34 +1038,35 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		spin_lock_init(&pc->irq_lock[i]);
 	}
 
-	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
-		int len;
-		char *name;
-		pc->irq[i] = irq_of_parse_and_map(np, i);
-		pc->irq_data[i].pc = pc;
-		pc->irq_data[i].irqgroup = i;
-
-		len = strlen(dev_name(pc->dev)) + 16;
-		name = devm_kzalloc(pc->dev, len, GFP_KERNEL);
-		if (!name)
-			return -ENOMEM;
-		snprintf(name, len, "%s:bank%d", dev_name(pc->dev), i);
-
-		err = devm_request_irq(dev, pc->irq[i],
-			bcm2835_gpio_irq_handler, IRQF_SHARED,
-			name, &pc->irq_data[i]);
-		if (err) {
-			dev_err(dev, "unable to request IRQ %d\n", pc->irq[i]);
-			return err;
-		}
-	}
-
 	err = gpiochip_add_data(&pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
 		return err;
 	}
 
+	err = gpiochip_irqchip_add(&pc->gpio_chip, &bcm2835_gpio_irq_chip,
+				   0, handle_level_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_info(dev, "could not add irqchip\n");
+		return err;
+	}
+
+	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
+		pc->irq[i] = irq_of_parse_and_map(np, i);
+		pc->irq_group[i] = i;
+		/*
+		 * Use the same handler for all groups: this is necessary
+		 * since we use one gpiochip to cover all lines - the
+		 * irq handler then needs to figure out which group and
+		 * bank that was firing the IRQ and look up the per-group
+		 * and bank data.
+		 */
+		gpiochip_set_chained_irqchip(&pc->gpio_chip,
+					     &bcm2835_gpio_irq_chip,
+					     pc->irq[i],
+					     bcm2835_gpio_irq_handler);
+	}
+
 	pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
-- 
2.7.4

