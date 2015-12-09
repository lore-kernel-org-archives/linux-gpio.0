From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 099/182] pinctrl: amd: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:28 +0100
Message-ID: <1449667888-2402-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36219 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754327AbbLINbe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:34 -0500
Received: by lfs39 with SMTP id 39so34433130lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ken Xue <Ken.Xue@amd.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ken Xue <Ken.Xue@amd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index a74b2b0a75e0..657449431301 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -35,16 +35,11 @@
 #include "pinctrl-utils.h"
 #include "pinctrl-amd.h"
 
-static inline struct amd_gpio *to_amd_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct amd_gpio, gc);
-}
-
 static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned long flags;
 	u32 pin_reg;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
@@ -71,7 +66,7 @@ static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	u32 pin_reg;
 	unsigned long flags;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
@@ -90,7 +85,7 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	u32 pin_reg;
 	unsigned long flags;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
@@ -103,7 +98,7 @@ static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 {
 	u32 pin_reg;
 	unsigned long flags;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
@@ -122,7 +117,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 	u32 pin_reg;
 	int ret = 0;
 	unsigned long flags;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
@@ -186,7 +181,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	u32 pin_reg;
 	unsigned long flags;
 	unsigned int bank, i, pin_num;
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	char *level_trig;
 	char *active_level;
@@ -327,7 +322,7 @@ static void amd_gpio_irq_enable(struct irq_data *d)
 	u32 pin_reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -351,7 +346,7 @@ static void amd_gpio_irq_disable(struct irq_data *d)
 	u32 pin_reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -366,7 +361,7 @@ static void amd_gpio_irq_mask(struct irq_data *d)
 	u32 pin_reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -380,7 +375,7 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	u32 pin_reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -394,7 +389,7 @@ static void amd_gpio_irq_eoi(struct irq_data *d)
 	u32 reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
@@ -409,7 +404,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 pin_reg;
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -504,7 +499,7 @@ static void amd_gpio_irq_handler(struct irq_desc *desc)
 	unsigned long flags;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	chained_irq_enter(chip, desc);
 	/*enable GPIO interrupt again*/
@@ -795,7 +790,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio_dev->pctrl);
 	}
 
-	ret = gpiochip_add(&gpio_dev->gc);
+	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
 	if (ret)
 		goto out1;
 
-- 
2.4.3

