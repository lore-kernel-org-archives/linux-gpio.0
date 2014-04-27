From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 3/4] gpio: omap: use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 02:00:49 +0200
Message-ID: <1398556850-27751-4-git-send-email-javier@dowhile0.org>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:60580 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbaD0ABJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Apr 2014 20:01:09 -0400
Received: by mail-we0-f178.google.com with SMTP id u56so4916523wes.37
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2014 17:01:07 -0700 (PDT)
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, inux-omap@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Using the BIT() macro instead of manually shifting bits
makes the code less error prone and also more readable.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 drivers/gpio/gpio-omap.c | 50 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 47c6056..01d50a0 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -83,11 +83,11 @@ struct gpio_bank {
 };
 
 #define GPIO_INDEX(bank, gpio) (gpio % bank->width)
-#define GPIO_BIT(bank, gpio) (1 << GPIO_INDEX(bank, gpio))
+#define GPIO_BIT(bank, gpio) (BIT(GPIO_INDEX(bank, gpio)))
 #define GPIO_MOD_CTRL_BIT	BIT(0)
 
 #define BANK_USED(bank) (bank->mod_usage || bank->irq_usage)
-#define LINE_USED(line, offset) (line & (1 << offset))
+#define LINE_USED(line, offset) (line & (BIT(offset)))
 
 static int irq_to_gpio(struct gpio_bank *bank, unsigned int gpio_irq)
 {
@@ -108,9 +108,9 @@ static void _set_gpio_direction(struct gpio_bank *bank, int gpio, int is_input)
 	reg += bank->regs->direction;
 	l = readl_relaxed(reg);
 	if (is_input)
-		l |= 1 << gpio;
+		l |= BIT(gpio);
 	else
-		l &= ~(1 << gpio);
+		l &= ~(BIT(gpio));
 	writel_relaxed(l, reg);
 	bank->context.oe = l;
 }
@@ -153,14 +153,14 @@ static int _get_gpio_datain(struct gpio_bank *bank, int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->datain;
 
-	return (readl_relaxed(reg) & (1 << offset)) != 0;
+	return (readl_relaxed(reg) & (BIT(offset))) != 0;
 }
 
 static int _get_gpio_dataout(struct gpio_bank *bank, int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->dataout;
 
-	return (readl_relaxed(reg) & (1 << offset)) != 0;
+	return (readl_relaxed(reg) & (BIT(offset))) != 0;
 }
 
 static inline void _gpio_rmw(void __iomem *base, u32 reg, u32 mask, bool set)
@@ -297,7 +297,7 @@ static inline void set_gpio_trigger(struct gpio_bank *bank, int gpio,
 						unsigned trigger)
 {
 	void __iomem *base = bank->base;
-	u32 gpio_bit = 1 << gpio;
+	u32 gpio_bit = BIT(gpio);
 
 	_gpio_rmw(base, bank->regs->leveldetect0, gpio_bit,
 		  trigger & IRQ_TYPE_LEVEL_LOW);
@@ -366,9 +366,9 @@ static void _toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
 
 	l = readl_relaxed(reg);
 	if ((l >> gpio) & 1)
-		l &= ~(1 << gpio);
+		l &= ~(BIT(gpio));
 	else
-		l |= 1 << gpio;
+		l |= BIT(gpio);
 
 	writel_relaxed(l, reg);
 }
@@ -390,11 +390,11 @@ static int _set_gpio_triggering(struct gpio_bank *bank, int gpio,
 
 		l = readl_relaxed(reg);
 		if ((trigger & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
-			bank->toggle_mask |= 1 << gpio;
+			bank->toggle_mask |= BIT(gpio);
 		if (trigger & IRQ_TYPE_EDGE_RISING)
-			l |= 1 << gpio;
+			l |= BIT(gpio);
 		else if (trigger & IRQ_TYPE_EDGE_FALLING)
-			l &= ~(1 << gpio);
+			l &= ~(BIT(gpio));
 		else
 			return -EINVAL;
 
@@ -411,10 +411,10 @@ static int _set_gpio_triggering(struct gpio_bank *bank, int gpio,
 		if (trigger & IRQ_TYPE_EDGE_RISING)
 			l |= 2 << (gpio << 1);
 		if (trigger & IRQ_TYPE_EDGE_FALLING)
-			l |= 1 << (gpio << 1);
+			l |= BIT(gpio << 1);
 
 		/* Enable wake-up during idle for dynamic tick */
-		_gpio_rmw(base, bank->regs->wkup_en, 1 << gpio, trigger);
+		_gpio_rmw(base, bank->regs->wkup_en, BIT(gpio), trigger);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 		writel_relaxed(l, reg);
@@ -428,7 +428,7 @@ static void _enable_gpio_module(struct gpio_bank *bank, unsigned offset)
 		void __iomem *reg = bank->base + bank->regs->pinctrl;
 
 		/* Claim the pin for MPU */
-		writel_relaxed(readl_relaxed(reg) | (1 << offset), reg);
+		writel_relaxed(readl_relaxed(reg) | (BIT(offset)), reg);
 	}
 
 	if (bank->regs->ctrl && !BANK_USED(bank)) {
@@ -451,7 +451,7 @@ static void _disable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	    !LINE_USED(bank->mod_usage, offset) &&
 	    !LINE_USED(bank->irq_usage, offset)) {
 		/* Disable wake-up during idle for dynamic tick */
-		_gpio_rmw(base, bank->regs->wkup_en, 1 << offset, 0);
+		_gpio_rmw(base, bank->regs->wkup_en, BIT(offset), 0);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 	}
@@ -507,12 +507,12 @@ static int gpio_irq_type(struct irq_data *d, unsigned type)
 	if (!LINE_USED(bank->mod_usage, offset)) {
 		_enable_gpio_module(bank, offset);
 		_set_gpio_direction(bank, offset, 1);
-	} else if (!gpio_is_input(bank, 1 << offset)) {
+	} else if (!gpio_is_input(bank, BIT(offset))) {
 		spin_unlock_irqrestore(&bank->lock, flags);
 		return -EINVAL;
 	}
 
-	bank->irq_usage |= 1 << GPIO_INDEX(bank, gpio);
+	bank->irq_usage |= BIT(GPIO_INDEX(bank, gpio));
 	spin_unlock_irqrestore(&bank->lock, flags);
 
 	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
@@ -549,7 +549,7 @@ static u32 _get_gpio_irqbank_mask(struct gpio_bank *bank)
 {
 	void __iomem *reg = bank->base;
 	u32 l;
-	u32 mask = (1 << bank->width) - 1;
+	u32 mask = (BIT(bank->width)) - 1;
 
 	reg += bank->regs->irqenable;
 	l = readl_relaxed(reg);
@@ -681,7 +681,7 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 		_set_gpio_triggering(bank, offset, IRQ_TYPE_NONE);
 		_enable_gpio_module(bank, offset);
 	}
-	bank->mod_usage |= 1 << offset;
+	bank->mod_usage |= BIT(offset);
 	spin_unlock_irqrestore(&bank->lock, flags);
 
 	return 0;
@@ -693,7 +693,7 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 	unsigned long flags;
 
 	spin_lock_irqsave(&bank->lock, flags);
-	bank->mod_usage &= ~(1 << offset);
+	bank->mod_usage &= ~(BIT(offset));
 	_disable_gpio_module(bank, offset);
 	_reset_gpio(bank, bank->chip.base + offset);
 	spin_unlock_irqrestore(&bank->lock, flags);
@@ -763,7 +763,7 @@ static void gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 
 		while (isr) {
 			bit = __ffs(isr);
-			isr &= ~(1 << bit);
+			isr &= ~(BIT(bit));
 
 			/*
 			 * Some chips can't respond to both rising and falling
@@ -772,7 +772,7 @@ static void gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 			 * to respond to the IRQ for the opposite direction.
 			 * This will be indicated in the bank toggle_mask.
 			 */
-			if (bank->toggle_mask & (1 << bit))
+			if (bank->toggle_mask & (BIT(bit)))
 				_toggle_gpio_edge_triggering(bank, bit);
 
 			generic_handle_irq(irq_find_mapping(bank->chip.irqdomain,
@@ -798,7 +798,7 @@ static void gpio_irq_shutdown(struct irq_data *d)
 
 	spin_lock_irqsave(&bank->lock, flags);
 	gpio_unlock_as_irq(&bank->chip, offset);
-	bank->irq_usage &= ~(1 << offset);
+	bank->irq_usage &= ~(BIT(offset));
 	_disable_gpio_module(bank, offset);
 	_reset_gpio(bank, gpio);
 	spin_unlock_irqrestore(&bank->lock, flags);
@@ -961,7 +961,7 @@ static int gpio_get(struct gpio_chip *chip, unsigned offset)
 	u32 mask;
 
 	bank = container_of(chip, struct gpio_bank, chip);
-	mask = (1 << offset);
+	mask = (BIT(offset));
 
 	if (gpio_is_input(bank, mask))
 		return _get_gpio_datain(bank, offset);
-- 
1.9.1

