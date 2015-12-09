From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 061/182] gpio: stmpe: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:00 +0100
Message-ID: <1449667380-32673-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33656 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbbLINXF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:05 -0500
Received: by lfaz4 with SMTP id z4so34112982lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bhupesh Sharma <bhupesh.sharma@st.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Bhupesh Sharma <bhupesh.sharma@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 9e471979aa9e..5197edf1acfd 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -36,14 +36,9 @@ struct stmpe_gpio {
 	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
 };
 
-static inline struct stmpe_gpio *to_stmpe_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct stmpe_gpio, chip);
-}
-
 static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(chip);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPMR_LSB] - (offset / 8);
 	u8 mask = 1 << (offset % 8);
@@ -58,7 +53,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(chip);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	int which = val ? STMPE_IDX_GPSR_LSB : STMPE_IDX_GPCR_LSB;
 	u8 reg = stmpe->regs[which] - (offset / 8);
@@ -77,7 +72,7 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int val)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(chip);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
 	u8 mask = 1 << (offset % 8);
@@ -90,7 +85,7 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 static int stmpe_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(chip);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
 	u8 mask = 1 << (offset % 8);
@@ -100,7 +95,7 @@ static int stmpe_gpio_direction_input(struct gpio_chip *chip,
 
 static int stmpe_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(chip);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 
 	if (stmpe_gpio->norequest_mask & (1 << offset))
@@ -123,7 +118,7 @@ static struct gpio_chip template_chip = {
 static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -151,7 +146,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void stmpe_gpio_irq_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 
 	mutex_lock(&stmpe_gpio->irq_lock);
 }
@@ -159,7 +154,7 @@ static void stmpe_gpio_irq_lock(struct irq_data *d)
 static void stmpe_gpio_irq_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	int num_banks = DIV_ROUND_UP(stmpe->num_gpios, 8);
 	static const u8 regmap[] = {
@@ -193,7 +188,7 @@ static void stmpe_gpio_irq_sync_unlock(struct irq_data *d)
 static void stmpe_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -204,7 +199,7 @@ static void stmpe_gpio_irq_mask(struct irq_data *d)
 static void stmpe_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -216,7 +211,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 			       struct gpio_chip *gc,
 			       unsigned offset, unsigned gpio)
 {
-	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	const char *label = gpiochip_is_requested(gc, offset);
 	int num_banks = DIV_ROUND_UP(stmpe->num_gpios, 8);
@@ -375,7 +370,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
-	ret = gpiochip_add(&stmpe_gpio->chip);
+	ret = gpiochip_add_data(&stmpe_gpio->chip, stmpe_gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
 		goto out_disable;
-- 
2.4.3

