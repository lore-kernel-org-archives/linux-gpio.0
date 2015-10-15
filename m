From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] gpio: pl061: assign the apropriate handler for irqs
Date: Thu, 15 Oct 2015 18:04:26 +0200
Message-ID: <1444925066-16934-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36835 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636AbbJOQEc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2015 12:04:32 -0400
Received: by lbcao8 with SMTP id ao8so74367027lbc.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2015 09:04:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jogo@openwrt.org>, Stefan Agner <stefan@agner.ch>

The PL061 can handle level IRQs and edge IRQs, however it is
just utilizing handle_simple_irq() for all IRQs. Inspired by
Stefan Agners patch to vf610, this assigns the right handler
depending on what type is set up, and after this
handle_bad_irq() is only used as default and if the type is
not specified, as is done in the OMAP driver: defining the
IRQ type is really not optional for this driver.

The interrupt handler was just writing the interrupt clearing
register for all lines that were high when entering the handling
loop, this is wrong: that register is only supposed to be
written (on a per-line basis) for edge IRQs, so this ACK
was moved to the .irq_ack() callback as is proper.

Tested with PL061 on the ARM RealView PB11MPCore and the
MMC/SC card detect GPIO.

Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 179339739d60..e15499936c18 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -181,7 +181,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
@@ -190,7 +190,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
@@ -205,7 +205,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
@@ -214,6 +214,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
+		irq_set_handler_locked(d, handle_bad_irq);
 		dev_warn(gc->dev, "no trigger selected for line %d\n",
 			 offset);
 	}
@@ -238,7 +239,6 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irqchip, desc);
 
 	pending = readb(chip->base + GPIOMIS);
-	writeb(pending, chip->base + GPIOIC);
 	if (pending) {
 		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
 			generic_handle_irq(irq_find_mapping(gc->irqdomain,
@@ -274,8 +274,28 @@ static void pl061_irq_unmask(struct irq_data *d)
 	spin_unlock(&chip->lock);
 }
 
+/**
+ * pl061_irq_ack() - ACK an edge IRQ
+ * @d: IRQ data for this IRQ
+ *
+ * This gets called from the edge IRQ handler to ACK the edge IRQ
+ * in the GPIOIC (interrupt-clear) register. For level IRQs this is
+ * not needed: these go away when the level signal goes away.
+ */
+static void pl061_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
+
+	spin_lock(&chip->lock);
+	writeb(mask, chip->base + GPIOIC);
+	spin_unlock(&chip->lock);
+}
+
 static struct irq_chip pl061_irqchip = {
 	.name		= "pl061",
+	.irq_ack	= pl061_irq_ack,
 	.irq_mask	= pl061_irq_mask,
 	.irq_unmask	= pl061_irq_unmask,
 	.irq_set_type	= pl061_irq_type,
@@ -338,7 +358,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	ret = gpiochip_irqchip_add(&chip->gc, &pl061_irqchip,
-				   irq_base, handle_simple_irq,
+				   irq_base, handle_bad_irq,
 				   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_info(&adev->dev, "could not add irqchip\n");
-- 
2.4.3

