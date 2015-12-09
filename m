From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 102/182] pinctrl: u300: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:55 +0100
Message-ID: <1449667915-2562-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36450 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754132AbbLINb7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:59 -0500
Received: by lfs39 with SMTP id 39so34441419lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index e1cbf56df4b2..49da5c69845d 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -208,25 +208,16 @@ bs335_gpio_config[U300_GPIO_NUM_PORTS][U300_GPIO_PINS_PER_PORT] = {
 	}
 };
 
-/**
- * to_u300_gpio() - get the pointer to u300_gpio
- * @chip: the gpio chip member of the structure u300_gpio
- */
-static inline struct u300_gpio *to_u300_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct u300_gpio, chip);
-}
-
 static int u300_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 
 	return readl(U300_PIN_REG(offset, dir)) & U300_PIN_BIT(offset);
 }
 
 static void u300_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
 
@@ -243,7 +234,7 @@ static void u300_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int u300_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
 
@@ -259,7 +250,7 @@ static int u300_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int u300_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 oldmode;
 	u32 val;
@@ -290,7 +281,7 @@ int u300_gpio_config_get(struct gpio_chip *chip,
 			 unsigned offset,
 			 unsigned long *config)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	enum pin_config_param param = (enum pin_config_param) *config;
 	bool biasmode;
 	u32 drmode;
@@ -348,7 +339,7 @@ int u300_gpio_config_get(struct gpio_chip *chip,
 int u300_gpio_config_set(struct gpio_chip *chip, unsigned offset,
 			 enum pin_config_param param)
 {
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
 
@@ -429,7 +420,7 @@ static void u300_toggle_trigger(struct u300_gpio *gpio, unsigned offset)
 static int u300_gpio_irq_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	struct u300_gpio_port *port = &gpio->ports[d->hwirq >> 3];
 	int offset = d->hwirq;
 	u32 val;
@@ -466,7 +457,7 @@ static int u300_gpio_irq_type(struct irq_data *d, unsigned trigger)
 static void u300_gpio_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	struct u300_gpio_port *port = &gpio->ports[d->hwirq >> 3];
 	int offset = d->hwirq;
 	u32 val;
@@ -483,7 +474,7 @@ static void u300_gpio_irq_enable(struct irq_data *d)
 static void u300_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	int offset = d->hwirq;
 	u32 val;
 	unsigned long flags;
@@ -506,7 +497,7 @@ static void u300_gpio_irq_handler(struct irq_desc *desc)
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct u300_gpio *gpio = to_u300_gpio(chip);
+	struct u300_gpio *gpio = gpiochip_get_data(chip);
 	struct u300_gpio_port *port = &gpio->ports[irq - chip->base];
 	int pinoffset = port->number << 3; /* get the right stride */
 	unsigned long val;
@@ -684,7 +675,7 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF_GPIO
 	gpio->chip.of_node = pdev->dev.of_node;
 #endif
-	err = gpiochip_add(&gpio->chip);
+	err = gpiochip_add_data(&gpio->chip, gpio);
 	if (err) {
 		dev_err(gpio->dev, "unable to add gpiochip: %d\n", err);
 		goto err_no_chip;
-- 
2.4.3

