From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5] gpio: altera: use container_of() to get state container
Date: Thu, 27 Aug 2015 16:54:48 +0200
Message-ID: <1440687288-17037-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:35853 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495AbbH0Oyz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 10:54:55 -0400
Received: by labia3 with SMTP id ia3so14244904lab.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 07:54:54 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Tien Hock Loh <thloh@altera.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The state container of the Altera GPIO driver is extracted from
the gpio_chip exploiting the fact that offsetof() the
struct gpio_chip inside the struct of_mm_gpio_chip are both 0, so
the container_of() is in practice a noop. However if a member
is added to struct altera_gpio_chip in front of
struct of_mm_gpio_chip, things will break. Using proper
container_of() avoids this problem.

Semantically this is a noop, the compiler will optimize it away,
but syntactically it makes me happier.

Cc: Tien Hock Loh <thloh@altera.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 9b7e0b3db387..9087647e765a 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -42,6 +42,11 @@ struct altera_gpio_chip {
 	int mapped_irq;
 };
 
+static struct altera_gpio_chip *to_altera(struct gpio_chip *gc)
+{
+	return container_of(gc, struct altera_gpio_chip, mmchip.gc);
+}
+
 static void altera_gpio_irq_unmask(struct irq_data *d)
 {
 	struct altera_gpio_chip *altera_gc;
@@ -49,7 +54,7 @@ static void altera_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = irq_data_get_irq_chip_data(d);
+	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
 	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
@@ -67,7 +72,7 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = irq_data_get_irq_chip_data(d);
+	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
 	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
@@ -87,7 +92,7 @@ static int altera_gpio_irq_set_type(struct irq_data *d,
 {
 	struct altera_gpio_chip *altera_gc;
 
-	altera_gc = irq_data_get_irq_chip_data(d);
+	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
 
 	if (type == IRQ_TYPE_NONE)
 		return 0;
@@ -211,7 +216,7 @@ static void altera_gpio_irq_edge_handler(unsigned int irq,
 	unsigned long status;
 	int i;
 
-	altera_gc = irq_desc_get_handler_data(desc);
+	altera_gc = to_altera(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
 	irqdomain = altera_gc->mmchip.gc.irqdomain;
@@ -241,7 +246,7 @@ static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
 	unsigned long status;
 	int i;
 
-	altera_gc = irq_desc_get_handler_data(desc);
+	altera_gc = to_altera(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
 	irqdomain = altera_gc->mmchip.gc.irqdomain;
-- 
2.4.3

