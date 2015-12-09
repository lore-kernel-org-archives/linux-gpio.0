From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 101/182] pinctrl: at91: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:45 +0100
Message-ID: <1449667905-2505-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36363 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754233AbbLINbu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:50 -0500
Received: by lfs39 with SMTP id 39so34438342lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 667d90607abc..dd300683153f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -45,8 +45,6 @@ struct at91_gpio_chip {
 	struct at91_pinctrl_mux_ops *ops;	/* ops */
 };
 
-#define to_at91_gpio_chip(c) container_of(c, struct at91_gpio_chip, chip)
-
 static struct at91_gpio_chip *gpio_chips[MAX_GPIO_BANKS];
 
 static int gpio_banks;
@@ -811,7 +809,7 @@ static int at91_gpio_request_enable(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 	chip = range->gc;
-	at91_chip = container_of(chip, struct at91_gpio_chip, chip);
+	at91_chip = gpiochip_get_data(chip);
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
 
@@ -1282,7 +1280,7 @@ static int at91_pinctrl_remove(struct platform_device *pdev)
 
 static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 	u32 osr;
@@ -1293,7 +1291,7 @@ static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 static int at91_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 
@@ -1303,7 +1301,7 @@ static int at91_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int at91_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 	u32 pdsr;
@@ -1315,7 +1313,7 @@ static int at91_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void at91_gpio_set(struct gpio_chip *chip, unsigned offset,
 				int val)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 
@@ -1325,7 +1323,7 @@ static void at91_gpio_set(struct gpio_chip *chip, unsigned offset,
 static void at91_gpio_set_multiple(struct gpio_chip *chip,
 				      unsigned long *mask, unsigned long *bits)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 
 #define BITS_MASK(bits) (((bits) == 32) ? ~0U : (BIT(bits) - 1))
@@ -1340,7 +1338,7 @@ static void at91_gpio_set_multiple(struct gpio_chip *chip,
 static int at91_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				int val)
 {
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 
@@ -1355,7 +1353,7 @@ static void at91_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	enum at91_mux mode;
 	int i;
-	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 
 	for (i = 0; i < chip->ngpio; i++) {
@@ -1570,9 +1568,7 @@ static void gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct gpio_chip *gpio_chip = irq_desc_get_handler_data(desc);
-	struct at91_gpio_chip *at91_gpio = container_of(gpio_chip,
-					   struct at91_gpio_chip, chip);
-
+	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(gpio_chip);
 	void __iomem	*pio = at91_gpio->regbase;
 	unsigned long	isr;
 	int		n;
@@ -1648,7 +1644,7 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 		return 0;
 	}
 
-	prev = container_of(gpiochip_prev, struct at91_gpio_chip, chip);
+	prev = gpiochip_get_data(gpiochip_prev);
 
 	/* we can only have 2 banks before */
 	for (i = 0; i < 2; i++) {
@@ -1783,7 +1779,7 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	range->npins = chip->ngpio;
 	range->gc = chip;
 
-	ret = gpiochip_add(chip);
+	ret = gpiochip_add_data(chip, at91_chip);
 	if (ret)
 		goto gpiochip_add_err;
 
-- 
2.4.3

