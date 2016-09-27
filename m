From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: stmpe: use BIT() macro
Date: Tue, 27 Sep 2016 16:13:20 -0700
Message-ID: <1475018000-5152-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:33507 "EHLO
        mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754307AbcI0XN3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 19:13:29 -0400
Received: by mail-pa0-f44.google.com with SMTP id cd13so6726373pac.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2016 16:13:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>

Avoid custom (1 << bits) shifting by consequently using the
BIT() macro from <linux/bitops.h>.

Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 432b2ee173c7..e7d422a6b90b 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -43,7 +43,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPMR_LSB + (offset / 8)];
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 	int ret;
 
 	ret = stmpe_reg_read(stmpe, reg);
@@ -59,7 +59,7 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	int which = val ? STMPE_IDX_GPSR_LSB : STMPE_IDX_GPCR_LSB;
 	u8 reg = stmpe->regs[which + (offset / 8)];
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 
 	/*
 	 * Some variants have single register for gpio set/clear functionality.
@@ -77,7 +77,7 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 	int ret;
 
 	ret = stmpe_reg_read(stmpe, reg);
@@ -93,7 +93,7 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 
 	stmpe_gpio_set(chip, offset, val);
 
@@ -106,7 +106,7 @@ static int stmpe_gpio_direction_input(struct gpio_chip *chip,
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 
 	return stmpe_set_bits(stmpe, reg, mask, 0);
 }
@@ -116,10 +116,10 @@ static int stmpe_gpio_request(struct gpio_chip *chip, unsigned offset)
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 
-	if (stmpe_gpio->norequest_mask & (1 << offset))
+	if (stmpe_gpio->norequest_mask & BIT(offset))
 		return -EINVAL;
 
-	return stmpe_set_altfunc(stmpe, 1 << offset, STMPE_BLOCK_GPIO);
+	return stmpe_set_altfunc(stmpe, BIT(offset), STMPE_BLOCK_GPIO);
 }
 
 static const struct gpio_chip template_chip = {
@@ -140,7 +140,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
 		return -EINVAL;
@@ -218,7 +218,7 @@ static void stmpe_gpio_irq_mask(struct irq_data *d)
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	stmpe_gpio->regs[REG_IE][regoffset] &= ~mask;
 }
@@ -230,7 +230,7 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
 
@@ -254,7 +254,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	bool val = !!stmpe_gpio_get(gc, offset);
 	u8 bank = offset / 8;
 	u8 dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB + bank];
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 	int ret;
 	u8 dir;
 
@@ -401,7 +401,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 							 line);
 
 			handle_nested_irq(child_irq);
-			stat &= ~(1 << bit);
+			stat &= ~BIT(bit);
 		}
 
 		/*
-- 
2.7.4

