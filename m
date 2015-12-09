From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 096/182] pinctrl: nomadik: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:05 +0100
Message-ID: <1449667865-2198-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:32925 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754518AbbLINbL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:11 -0500
Received: by lfaz4 with SMTP id z4so34269795lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index cb4a327425a0..352406108fa0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -646,7 +646,7 @@ static inline int nmk_gpio_get_bitmask(int gpio)
 static void nmk_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct nmk_gpio_chip *nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
 	clk_enable(nmk_chip->clk);
 	writel(nmk_gpio_get_bitmask(d->hwirq), nmk_chip->addr + NMK_GPIO_IC);
@@ -863,7 +863,7 @@ static void __nmk_gpio_irq_handler(struct irq_desc *desc, u32 status)
 static void nmk_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct nmk_gpio_chip *nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 	u32 status;
 
 	clk_enable(nmk_chip->clk);
@@ -876,7 +876,7 @@ static void nmk_gpio_irq_handler(struct irq_desc *desc)
 static void nmk_gpio_latent_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct nmk_gpio_chip *nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 	u32 status = nmk_chip->get_latent_status(nmk_chip->bank);
 
 	__nmk_gpio_irq_handler(desc, status);
@@ -886,8 +886,7 @@ static void nmk_gpio_latent_irq_handler(struct irq_desc *desc)
 
 static int nmk_gpio_make_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct nmk_gpio_chip *nmk_chip =
-		container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
 	clk_enable(nmk_chip->clk);
 
@@ -900,8 +899,7 @@ static int nmk_gpio_make_input(struct gpio_chip *chip, unsigned offset)
 
 static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct nmk_gpio_chip *nmk_chip =
-		container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 	u32 bit = 1 << offset;
 	int value;
 
@@ -917,8 +915,7 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned offset)
 static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned offset,
 				int val)
 {
-	struct nmk_gpio_chip *nmk_chip =
-		container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
 	clk_enable(nmk_chip->clk);
 
@@ -930,8 +927,7 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned offset,
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned offset,
 				int val)
 {
-	struct nmk_gpio_chip *nmk_chip =
-		container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
 	clk_enable(nmk_chip->clk);
 
@@ -951,8 +947,7 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	unsigned offset, unsigned gpio)
 {
 	const char *label = gpiochip_is_requested(chip, offset);
-	struct nmk_gpio_chip *nmk_chip =
-		container_of(chip, struct nmk_gpio_chip, chip);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 	int mode;
 	bool is_out;
 	bool data_out;
@@ -1278,7 +1273,7 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	clk_disable(nmk_chip->clk);
 	chip->of_node = np;
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, nmk_chip);
 	if (ret)
 		return ret;
 
@@ -1789,7 +1784,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 	chip = range->gc;
-	nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
+	nmk_chip = gpiochip_get_data(chip);
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
 
-- 
2.4.3

