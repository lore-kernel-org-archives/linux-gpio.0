From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 046/182] gpio: omap: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:10 +0100
Message-ID: <1449667150-31930-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36063 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINTP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:15 -0500
Received: by lbblt2 with SMTP id lt2so29923606lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7e4f7c5f999a..c764a135048a 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -93,7 +93,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d);
 static inline struct gpio_bank *omap_irq_data_get_bank(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	return container_of(chip, struct gpio_bank, chip);
+	return gpiochip_get_data(chip);
 }
 
 static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
@@ -661,7 +661,7 @@ static int omap_gpio_wake_enable(struct irq_data *d, unsigned int enable)
 
 static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_bank *bank = container_of(chip, struct gpio_bank, chip);
+	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	/*
@@ -681,7 +681,7 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_bank *bank = container_of(chip, struct gpio_bank, chip);
+	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -954,7 +954,7 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	void __iomem *reg;
 	int dir;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 	reg = bank->base + bank->regs->direction;
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	dir = !!(readl_relaxed(reg) & BIT(offset));
@@ -967,7 +967,7 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
 	struct gpio_bank *bank;
 	unsigned long flags;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap_set_gpio_direction(bank, offset, 1);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
@@ -978,7 +978,7 @@ static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 
 	if (omap_gpio_is_input(bank, offset))
 		return omap_get_gpio_datain(bank, offset);
@@ -991,7 +991,7 @@ static int omap_gpio_output(struct gpio_chip *chip, unsigned offset, int value)
 	struct gpio_bank *bank;
 	unsigned long flags;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->set_dataout(bank, offset, value);
 	omap_set_gpio_direction(bank, offset, 0);
@@ -1005,7 +1005,7 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 	struct gpio_bank *bank;
 	unsigned long flags;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap2_set_gpio_debounce(bank, offset, debounce);
@@ -1019,7 +1019,7 @@ static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	struct gpio_bank *bank;
 	unsigned long flags;
 
-	bank = container_of(chip, struct gpio_bank, chip);
+	bank = gpiochip_get_data(chip);
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->set_dataout(bank, offset, value);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
@@ -1098,7 +1098,7 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	}
 	bank->chip.ngpio = bank->width;
 
-	ret = gpiochip_add(&bank->chip);
+	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret) {
 		dev_err(bank->dev, "Could not register gpio chip %d\n", ret);
 		return ret;
-- 
2.4.3

