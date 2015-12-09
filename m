From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 106/182] pinctrl: st: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:26 +0100
Message-ID: <1449667946-2800-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36756 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153AbbLINca (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:30 -0500
Received: by lfs39 with SMTP id 39so34452112lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 52639e65ea67..fac844a85cb4 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -203,9 +203,6 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct st_gpio_bank, range)
 
-#define gpio_chip_to_bank(chip) \
-		container_of(chip, struct st_gpio_bank, gpio_chip)
-
 #define pc_to_bank(pc) \
 		container_of(pc, struct st_gpio_bank, pc)
 
@@ -744,14 +741,14 @@ static void st_gpio_direction(struct st_gpio_bank *bank,
 
 static int st_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct st_gpio_bank *bank = gpio_chip_to_bank(chip);
+	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 
 	return !!(readl(bank->base + REG_PIO_PIN) & BIT(offset));
 }
 
 static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct st_gpio_bank *bank = gpio_chip_to_bank(chip);
+	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 	__st_gpio_set(bank, offset, value);
 }
 
@@ -765,7 +762,7 @@ static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int st_gpio_direction_output(struct gpio_chip *chip,
 	unsigned offset, int value)
 {
-	struct st_gpio_bank *bank = gpio_chip_to_bank(chip);
+	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__st_gpio_set(bank, offset, value);
 	pinctrl_gpio_direction_output(chip->base + offset);
@@ -775,7 +772,7 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
 
 static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct st_gpio_bank *bank = gpio_chip_to_bank(chip);
+	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 	struct st_pio_control pc = bank->pc;
 	unsigned long config;
 	unsigned int direction = 0;
@@ -1325,7 +1322,7 @@ static int st_pctl_parse_functions(struct device_node *np,
 static void st_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct st_gpio_bank *bank = gpio_chip_to_bank(gc);
+	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
 	writel(BIT(d->hwirq), bank->base + REG_PIO_CLR_PMASK);
 }
@@ -1333,7 +1330,7 @@ static void st_gpio_irq_mask(struct irq_data *d)
 static void st_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct st_gpio_bank *bank = gpio_chip_to_bank(gc);
+	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
 	writel(BIT(d->hwirq), bank->base + REG_PIO_SET_PMASK);
 }
@@ -1341,7 +1338,7 @@ static void st_gpio_irq_unmask(struct irq_data *d)
 static int st_gpio_irq_set_type(struct irq_data *d, unsigned type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct st_gpio_bank *bank = gpio_chip_to_bank(gc);
+	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
 	int comp, pin = d->hwirq;
 	u32 val;
@@ -1455,7 +1452,7 @@ static void st_gpio_irq_handler(struct irq_desc *desc)
 	/* interrupt dedicated per bank */
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct st_gpio_bank *bank = gpio_chip_to_bank(gc);
+	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
 	chained_irq_enter(chip, desc);
 	__gpio_irq_handler(bank);
@@ -1532,7 +1529,7 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 	range->pin_base = range->base = range->id * ST_GPIO_PINS_PER_BANK;
 	range->npins = bank->gpio_chip.ngpio;
 	range->gc = &bank->gpio_chip;
-	err  = gpiochip_add(&bank->gpio_chip);
+	err  = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (err) {
 		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_num);
 		return err;
-- 
2.4.3

