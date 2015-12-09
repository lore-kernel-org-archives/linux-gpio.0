From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 117/182] pinctrl: spear-plgpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:48 +0100
Message-ID: <1449668028-3340-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33436 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205AbbLINdx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:53 -0500
Received: by lfaz4 with SMTP id z4so34325320lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Viresh Kumar <vireshk@kernel.org>, spear-devel@list.st.com

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Viresh Kumar <vireshk@kernel.org>
Cc: spear-devel@list.st.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 925f597de266..4c9b863f8267 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -107,7 +107,7 @@ static inline void plgpio_reg_reset(void __iomem *base, u32 pin, u32 reg)
 /* gpio framework specific routines */
 static int plgpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	/* get correct offset for "offset" pin */
@@ -127,7 +127,7 @@ static int plgpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int plgpio_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 	unsigned long flags;
 	unsigned dir_offset = offset, wdata_offset = offset, tmp;
 
@@ -159,7 +159,7 @@ static int plgpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int plgpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 
 	if (offset >= chip->ngpio)
 		return -EINVAL;
@@ -176,7 +176,7 @@ static int plgpio_get_value(struct gpio_chip *chip, unsigned offset)
 
 static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 
 	if (offset >= chip->ngpio)
 		return;
@@ -196,7 +196,7 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
 
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 	int gpio = chip->base + offset;
 	unsigned long flags;
 	int ret = 0;
@@ -248,7 +248,7 @@ err0:
 
 static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct plgpio *plgpio = container_of(chip, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(chip);
 	int gpio = chip->base + offset;
 	unsigned long flags;
 
@@ -280,7 +280,7 @@ disable_clk:
 static void plgpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct plgpio *plgpio = container_of(gc, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	unsigned long flags;
 
@@ -299,7 +299,7 @@ static void plgpio_irq_disable(struct irq_data *d)
 static void plgpio_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct plgpio *plgpio = container_of(gc, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	unsigned long flags;
 
@@ -318,7 +318,7 @@ static void plgpio_irq_enable(struct irq_data *d)
 static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct plgpio *plgpio = container_of(gc, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	void __iomem *reg_off;
 	unsigned int supported_type = 0, val;
@@ -359,7 +359,7 @@ static struct irq_chip plgpio_irqchip = {
 static void plgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct plgpio *plgpio = container_of(gc, struct plgpio, chip);
+	struct plgpio *plgpio = gpiochip_get_data(gc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	int regs_count, count, pin, offset, i = 0;
 	unsigned long pending;
@@ -573,7 +573,7 @@ static int plgpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = gpiochip_add(&plgpio->chip);
+	ret = gpiochip_add_data(&plgpio->chip, plgpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpio chip\n");
 		goto unprepare_clk;
-- 
2.4.3

