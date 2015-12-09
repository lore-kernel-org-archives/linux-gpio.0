From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 116/182] pinctrl: sirf: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:41 +0100
Message-ID: <1449668021-3293-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34646 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451AbbLINdp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:45 -0500
Received: by lffu14 with SMTP id u14so34340520lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Barry Song <baohua@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index ae97bdc75a69..aa87fa90b884 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -399,11 +399,6 @@ static int __init sirfsoc_pinmux_init(void)
 }
 arch_initcall(sirfsoc_pinmux_init);
 
-static inline struct sirfsoc_gpio_chip *to_sirfsoc_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct sirfsoc_gpio_chip, chip.gc);
-}
-
 static inline struct sirfsoc_gpio_bank *
 sirfsoc_gpio_to_bank(struct sirfsoc_gpio_chip *sgpio, unsigned int offset)
 {
@@ -418,7 +413,7 @@ static inline int sirfsoc_gpio_to_bankoff(unsigned int offset)
 static void sirfsoc_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(gc);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, d->hwirq);
 	int idx = sirfsoc_gpio_to_bankoff(d->hwirq);
 	u32 val, offset;
@@ -457,7 +452,7 @@ static void __sirfsoc_gpio_irq_mask(struct sirfsoc_gpio_chip *sgpio,
 static void sirfsoc_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(gc);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, d->hwirq);
 
 	__sirfsoc_gpio_irq_mask(sgpio, bank, d->hwirq % SIRFSOC_GPIO_BANK_SIZE);
@@ -466,7 +461,7 @@ static void sirfsoc_gpio_irq_mask(struct irq_data *d)
 static void sirfsoc_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(gc);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, d->hwirq);
 	int idx = sirfsoc_gpio_to_bankoff(d->hwirq);
 	u32 val, offset;
@@ -487,7 +482,7 @@ static void sirfsoc_gpio_irq_unmask(struct irq_data *d)
 static int sirfsoc_gpio_irq_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(gc);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, d->hwirq);
 	int idx = sirfsoc_gpio_to_bankoff(d->hwirq);
 	u32 val, offset;
@@ -549,7 +544,7 @@ static void sirfsoc_gpio_handle_irq(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(gc);
 	struct sirfsoc_gpio_bank *bank;
 	u32 status, ctrl;
 	int idx = 0;
@@ -607,7 +602,7 @@ static inline void sirfsoc_gpio_set_input(struct sirfsoc_gpio_chip *sgpio,
 
 static int sirfsoc_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, offset);
 	unsigned long flags;
 
@@ -630,7 +625,7 @@ static int sirfsoc_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void sirfsoc_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, offset);
 	unsigned long flags;
 
@@ -646,7 +641,7 @@ static void sirfsoc_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int sirfsoc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, gpio);
 	int idx = sirfsoc_gpio_to_bankoff(gpio);
 	unsigned long flags;
@@ -689,7 +684,7 @@ static inline void sirfsoc_gpio_set_output(struct sirfsoc_gpio_chip *sgpio,
 static int sirfsoc_gpio_direction_output(struct gpio_chip *chip,
 	unsigned gpio, int value)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, gpio);
 	int idx = sirfsoc_gpio_to_bankoff(gpio);
 	u32 offset;
@@ -708,7 +703,7 @@ static int sirfsoc_gpio_direction_output(struct gpio_chip *chip,
 
 static int sirfsoc_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, offset);
 	u32 val;
 	unsigned long flags;
@@ -725,7 +720,7 @@ static int sirfsoc_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 static void sirfsoc_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 	int value)
 {
-	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(chip);
+	struct sirfsoc_gpio_chip *sgpio = gpiochip_get_data(chip);
 	struct sirfsoc_gpio_bank *bank = sirfsoc_gpio_to_bank(sgpio, offset);
 	u32 ctrl;
 	unsigned long flags;
@@ -814,7 +809,7 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	sgpio->chip.gc.parent = &pdev->dev;
 	sgpio->chip.regs = regs;
 
-	err = gpiochip_add(&sgpio->chip.gc);
+	err = gpiochip_add_data(&sgpio->chip.gc, sgpio);
 	if (err) {
 		dev_err(&pdev->dev, "%s: error in probe function with status %d\n",
 			np->full_name, err);
-- 
2.4.3

