From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 018/182] gpio: crystalcove: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:11 +0100
Message-ID: <1449666911-30596-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33588 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINPS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:18 -0500
Received: by lfaz4 with SMTP id z4so33961747lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Shobhit Kumar <shobhit.kumar@intel.com>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Shobhit Kumar <shobhit.kumar@intel.com>
Cc: Zhu, Lejun <lejun.zhu@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-crystalcove.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 141093a8cd3f..7865ef0d3352 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -86,11 +86,6 @@ struct crystalcove_gpio {
 	bool set_irq_mask;
 };
 
-static inline struct crystalcove_gpio *to_cg(struct gpio_chip *gc)
-{
-	return container_of(gc, struct crystalcove_gpio, chip);
-}
-
 static inline int to_reg(int gpio, enum ctrl_register reg_type)
 {
 	int reg;
@@ -134,7 +129,7 @@ static void crystalcove_update_irq_ctrl(struct crystalcove_gpio *cg, int gpio)
 
 static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
 {
-	struct crystalcove_gpio *cg = to_cg(chip);
+	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 
 	if (gpio > CRYSTALCOVE_VGPIO_NUM)
 		return 0;
@@ -146,7 +141,7 @@ static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
 static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
 				    int value)
 {
-	struct crystalcove_gpio *cg = to_cg(chip);
+	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 
 	if (gpio > CRYSTALCOVE_VGPIO_NUM)
 		return 0;
@@ -157,7 +152,7 @@ static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
 
 static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
 {
-	struct crystalcove_gpio *cg = to_cg(chip);
+	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int ret;
 	unsigned int val;
 
@@ -174,7 +169,7 @@ static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
 static void crystalcove_gpio_set(struct gpio_chip *chip,
 				 unsigned gpio, int value)
 {
-	struct crystalcove_gpio *cg = to_cg(chip);
+	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 
 	if (gpio > CRYSTALCOVE_VGPIO_NUM)
 		return;
@@ -187,7 +182,8 @@ static void crystalcove_gpio_set(struct gpio_chip *chip,
 
 static int crystalcove_irq_type(struct irq_data *data, unsigned type)
 {
-	struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
+	struct crystalcove_gpio *cg =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 
 	switch (type) {
 	case IRQ_TYPE_NONE:
@@ -213,14 +209,16 @@ static int crystalcove_irq_type(struct irq_data *data, unsigned type)
 
 static void crystalcove_bus_lock(struct irq_data *data)
 {
-	struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
+	struct crystalcove_gpio *cg =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 
 	mutex_lock(&cg->buslock);
 }
 
 static void crystalcove_bus_sync_unlock(struct irq_data *data)
 {
-	struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
+	struct crystalcove_gpio *cg =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 	int gpio = data->hwirq;
 
 	if (cg->update & UPDATE_IRQ_TYPE)
@@ -234,7 +232,8 @@ static void crystalcove_bus_sync_unlock(struct irq_data *data)
 
 static void crystalcove_irq_unmask(struct irq_data *data)
 {
-	struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
+	struct crystalcove_gpio *cg =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 
 	cg->set_irq_mask = false;
 	cg->update |= UPDATE_IRQ_MASK;
@@ -242,7 +241,8 @@ static void crystalcove_irq_unmask(struct irq_data *data)
 
 static void crystalcove_irq_mask(struct irq_data *data)
 {
-	struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
+	struct crystalcove_gpio *cg =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 
 	cg->set_irq_mask = true;
 	cg->update |= UPDATE_IRQ_MASK;
@@ -288,7 +288,7 @@ static irqreturn_t crystalcove_gpio_irq_handler(int irq, void *data)
 static void crystalcove_gpio_dbg_show(struct seq_file *s,
 				      struct gpio_chip *chip)
 {
-	struct crystalcove_gpio *cg = to_cg(chip);
+	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int gpio, offset;
 	unsigned int ctlo, ctli, mirqs0, mirqsx, irq;
 
@@ -345,7 +345,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
 	cg->regmap = pmic->regmap;
 
-	retval = gpiochip_add(&cg->chip);
+	retval = gpiochip_add_data(&cg->chip, cg);
 	if (retval) {
 		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
 		return retval;
-- 
2.4.3

