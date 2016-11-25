From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5] gpio: pl061: use local state for parent IRQ storage
Date: Fri, 25 Nov 2016 11:09:20 +0100
Message-ID: <1480068564-9447-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35881 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbcKYKJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2016 05:09:39 -0500
Received: by mail-lf0-f51.google.com with SMTP id t196so46963006lff.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2016 02:09:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

The driver is poking around in the struct gpio_chip internals,
which is a no-no. Use a variable in the local state container.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 6e3c1430616f..8838a44351ce 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -55,6 +55,7 @@ struct pl061_gpio {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
+	int			parent_irq;
 
 #ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
@@ -276,8 +277,9 @@ static void pl061_irq_ack(struct irq_data *d)
 static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 
-	return irq_set_irq_wake(gc->irq_parent, state);
+	return irq_set_irq_wake(chip->parent_irq, state);
 }
 
 static struct irq_chip pl061_irqchip = {
@@ -345,6 +347,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		dev_err(&adev->dev, "invalid IRQ\n");
 		return -ENODEV;
 	}
+	chip->parent_irq = irq;
 
 	ret = gpiochip_irqchip_add(&chip->gc, &pl061_irqchip,
 				   irq_base, handle_bad_irq,
-- 
2.7.4

