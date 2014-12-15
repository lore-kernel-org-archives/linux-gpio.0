From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH] gpio: mxs: Use PIN2IRQ register to mask interrupts
Date: Mon, 15 Dec 2014 11:28:32 +0100
Message-ID: <1418639312-12520-1-git-send-email-robin@protonic.nl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from protonic.xs4all.nl ([83.163.252.89]:9475 "EHLO
	protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbaLOLB7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Dec 2014 06:01:59 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, david@protonic.nl, Robin van der Gracht <robin@protonic.nl>

The PIN2IRQ register should be used to mask an interrupt. Clearing a
bit in the IRQEN register only prevents the interrupt from propagating but
still allows hardware to set the status bit when triggered. So when
unmasking the interrupt, it will immediately re-trigger if an interrupt
condition occurred during masking.

This is unwanted behavior especially when using level triggered
interrupts. In this case every interrupt triggers twice. If the
interrupt is handled in the handler, the second interrupt will be
the first one to be able to ack the interrupt.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 drivers/gpio/gpio-mxs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 8ffdd7d..13aeae6 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -161,14 +161,12 @@ static void mxs_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 
 	desc->irq_data.chip->irq_ack(&desc->irq_data);
 
-	irq_stat = readl(port->base + PINCTRL_IRQSTAT(port)) &
-			readl(port->base + PINCTRL_IRQEN(port));
+	irq_stat = readl(port->base + PINCTRL_IRQSTAT(port));
 
 	while (irq_stat != 0) {
 		int irqoffset = fls(irq_stat) - 1;
 		if (port->both_edges & (1 << irqoffset))
 			mxs_flip_edge(port, irqoffset);
-
 		generic_handle_irq(irq_find_mapping(port->domain, irqoffset));
 		irq_stat &= ~(1 << irqoffset);
 	}
@@ -212,7 +210,7 @@ static void __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	ct->chip.irq_set_type = mxs_gpio_set_irq_type;
 	ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
 	ct->regs.ack = PINCTRL_IRQSTAT(port) + MXS_CLR;
-	ct->regs.mask = PINCTRL_IRQEN(port);
+	ct->regs.mask = PINCTRL_PIN2IRQ(port);
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
 			       IRQ_NOREQUEST, 0);
@@ -284,11 +282,11 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	port->base = base;
 
 	/*
-	 * select the pin interrupt functionality but initially
-	 * disable the interrupts
+	 * enable interrupts but initially disable
+	 * pin interrupt functionality
 	 */
-	writel(~0U, port->base + PINCTRL_PIN2IRQ(port));
-	writel(0, port->base + PINCTRL_IRQEN(port));
+	writel(0, port->base + PINCTRL_PIN2IRQ(port));
+	writel(~0U, port->base + PINCTRL_IRQEN(port));
 
 	/* clear address has to be used to clear IRQSTAT bits */
 	writel(~0U, port->base + PINCTRL_IRQSTAT(port) + MXS_CLR);
-- 
1.9.1

