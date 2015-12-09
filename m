From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 022/182] gpio: davinci: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:42 +0100
Message-ID: <1449666942-30784-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33497 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINPr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:47 -0500
Received: by lbbkw15 with SMTP id kw15so29760549lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:45 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 65ebaef935e1..84c3f777394f 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -41,9 +41,6 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
-#define chip2controller(chip)	\
-	container_of(chip, struct davinci_gpio_controller, chip)
-
 static void __iomem *gpio_base;
 
 static struct davinci_gpio_regs __iomem *gpio2regs(unsigned gpio)
@@ -82,7 +79,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev);
 static inline int __davinci_direction(struct gpio_chip *chip,
 			unsigned offset, bool out, int value)
 {
-	struct davinci_gpio_controller *d = chip2controller(chip);
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g = d->regs;
 	unsigned long flags;
 	u32 temp;
@@ -122,7 +119,7 @@ davinci_direction_out(struct gpio_chip *chip, unsigned offset, int value)
  */
 static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct davinci_gpio_controller *d = chip2controller(chip);
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g = d->regs;
 
 	return (1 << offset) & readl_relaxed(&g->in_data);
@@ -134,7 +131,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void
 davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct davinci_gpio_controller *d = chip2controller(chip);
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g = d->regs;
 
 	writel_relaxed((1 << offset), value ? &g->set_data : &g->clr_data);
@@ -265,7 +262,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		chips[i].clr_data = &regs->clr_data;
 		chips[i].in_data = &regs->in_data;
 
-		gpiochip_add(&chips[i].chip);
+		gpiochip_add_data(&chips[i].chip, &chips[i]);
 	}
 
 	platform_set_drvdata(pdev, chips);
@@ -368,7 +365,7 @@ static void gpio_irq_handler(struct irq_desc *desc)
 
 static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
 {
-	struct davinci_gpio_controller *d = chip2controller(chip);
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 
 	if (d->irq_domain)
 		return irq_create_mapping(d->irq_domain, d->chip.base + offset);
@@ -378,7 +375,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
 
 static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
 {
-	struct davinci_gpio_controller *d = chip2controller(chip);
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 
 	/*
 	 * NOTE:  we assume for now that only irqs in the first gpio_chip
-- 
2.4.3

