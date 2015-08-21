From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] gpio: vf610: handle level IRQ's properly
Date: Fri, 21 Aug 2015 15:56:42 -0700
Message-ID: <1440197802-29720-1-git-send-email-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:39953 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752349AbbHUW4y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2015 18:56:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

The GPIO IRQ controller is able to generate level triggered
interrupts, however, these were handled by handle_simple_irq so far
which did not take care of IRQ masking. This lead to "nobody cared
(try booting with the "irqpoll" option)" stack traces.

Use the generic interrupt handlers depending on the IRQ type.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpio/gpio-vf610.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7bd9f20..b6a0887 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -60,6 +60,8 @@ struct vf610_gpio_port {
 #define PORT_INT_EITHER_EDGE	0xb
 #define PORT_INT_LOGIC_ONE	0xc
 
+static struct irq_chip vf610_gpio_irq_chip;
+
 static const struct of_device_id vf610_gpio_dt_ids[] = {
 	{ .compatible = "fsl,vf610-gpio" },
 	{ /* sentinel */ }
@@ -173,6 +175,11 @@ static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
 
 	port->irqc[d->hwirq] = irqc;
 
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		__irq_set_handler_locked(d->irq, handle_level_irq);
+	else
+		__irq_set_handler_locked(d->irq, handle_edge_irq);
+
 	return 0;
 }
 
@@ -263,7 +270,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	vf610_gpio_writel(~0, port->base + PORT_ISFR);
 
 	ret = gpiochip_irqchip_add(gc, &vf610_gpio_irq_chip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
+				   handle_edge_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(dev, "failed to add irqchip\n");
 		gpiochip_remove(gc);
-- 
2.5.0

