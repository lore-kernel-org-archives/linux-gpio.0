From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 3/3] gpio: zynq: Fix IRQ handlers
Date: Fri, 18 Jul 2014 11:52:13 +0200
Message-ID: <1405677133-8706-3-git-send-email-lars@metafoo.de>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-181.synserver.de ([212.40.185.181]:1098 "EHLO
	smtp-out-181.synserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934416AbaGRJwO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jul 2014 05:52:14 -0400
In-Reply-To: <1405677133-8706-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

The Zynq GPIO interrupt handling code as two main issues:
1) It does not support IRQF_ONESHOT interrupt since it uses handle_simple_irq()
for the interrupt handler. handle_simple_irq() does not do masking and unmasking
of the IRQ that is required for this chip to be able to support IRQF_ONESHOT
IRQs, causing the CPU to lock up in a interrupt storm if such a interrupt is
requested.
2) Interrupts are acked after the primary interrupt handlers for all asserted
interrupts in a bank have been called. For edge triggered interrupt this is to
late and may cause a interrupt to be missed. For level triggered oneshot
interrupts this is to early and causes the interrupt handler to run twice per
interrupt.

This patch addresses the issue by updating the driver to use the correct IRQ
chip handler functions that are appropriate for this kind of IRQ controller.

The following diagram gives an overview of how the interrupt detection circuit
works, it is not necessarily a accurate depiction of the real hardware though.

     INT_POL/INT_ON_ANY
           |
           | +---+                       INT_STATUS
           `-|   |                            |
             | E |-.                          |
         ,---|   |  \     |\          +----+  |  +---+
         |   +---+   `----| | ,-------|S   | ,*--|   |
GPIO_IN -*                | |-        |   Q|-    | & |-- IRQ_OUT
         |   +---+  ,-----| |       ,-|R   |   ,o|   |
         `---|   | /      |/       |  +----+  |  +---+
             | = |-        |       |          |
           ,-|   |    INT_TYPE    ACK     INT_MASK
           | +---+
           |
        INT_POL

GPIO_IN is the raw signal level connected to the hardware pin. This signal is
routed to a edge detector and to a level detector. The edge detector can be
configured to either detect a rising or falling edge or both edges. The level
detector can detect either a level high or level low event. Depending on the
setting of the INT_TYPE register either the edge or level event will be
propagated to the INT_STATUS register. As long as a interrupt condition is
detected the INT_STATUS register will be set to 1. It can be cleared to 0 if
(and only if) the interrupt condition is no longer detected and software
acknowledges the interrupt by writing a 1 to the address of the INT_STATUS
register. There is also the INT_MASK register which can be used to disable the
propagation of the INT_STATUS signal to the upstream IRQ controller. What is
important to note is that the interrupt detection logic itself can not be
disabled, only the propagation of the INT_STATUS register can be delayed. This
means that for level type interrupts the interrupt must only be acknowledged
after the interrupt source has been cleared otherwise it will stay asserted and
the interrupt handler will be run a second time. For IRQF_ONESHOT interrupts
this means that the IRQ must only be acknowledged after the threaded interrupt
has finished running. If a second interrupt comes in between handling the first
interrupt and acknowledging it the external interrupt will be asserted, which
means trying to acknowledge the first interrupt will not clear the INT_STATUS
register and the interrupt handler will be run a second time when the IRQ is
unmasked, so no interrupts will be lost. The handle_fasteoi_irq() handler in
combination with the IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED flags will
have the desired behavior. For edge triggered interrupts a slightly different
strategy is necessary. For edge triggered interrupts the interrupt condition is
only true when the edge itself is detected, this means this is the only time the
INT_STATUS register is set, acknowledging the interrupt any time after that will
clear the INT_STATUS register until the next interrupt happens. This means in
order to not loose any interrupts the interrupt needs to be acknowledged before
running the interrupt handler. If a second interrupt occurs after the first
interrupt handler has finished but before the interrupt is unmasked the
INT_STATUS register will be re-asserted and the interrupt handler runs a second
time once the interrupt is unmasked. This means with this flow handling strategy
no interrupts are lost for edge triggered interrupts. The handle_level_irq()
handler will have the desired behavior. (Note: The handle_edge_irq() only needs
to be used for edge triggered interrupts where the controller stops detecting
the interrupt event when the interrupt is masked, for this controller the
detection logic still works, while only the propagation is delayed when the
interrupt is masked.)

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Conflicts:
	drivers/gpio/gpio-zynq.c
---
 drivers/gpio/gpio-zynq.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index fa3ad23..bfbcf97 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -95,6 +95,9 @@ struct zynq_gpio {
 	struct clk *clk;
 };
 
+static struct irq_chip zynq_gpio_level_irqchip;
+static struct irq_chip zynq_gpio_edge_irqchip;
+
 /**
  * zynq_gpio_get_bank_pin - Get the bank number and pin number within that bank
  * for a given pin in the GPIO device
@@ -433,6 +436,15 @@ static int zynq_gpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 		       gpio->base_addr + ZYNQ_GPIO_INTPOL_OFFSET(bank_num));
 	writel_relaxed(int_any,
 		       gpio->base_addr + ZYNQ_GPIO_INTANY_OFFSET(bank_num));
+
+	if (type & IRQ_TYPE_LEVEL_MASK) {
+		__irq_set_chip_handler_name_locked(irq_data->irq,
+			&zynq_gpio_level_irqchip, handle_fasteoi_irq, NULL);
+	} else {
+		__irq_set_chip_handler_name_locked(irq_data->irq,
+			&zynq_gpio_edge_irqchip, handle_level_irq, NULL);
+	}
+
 	return 0;
 }
 
@@ -447,9 +459,21 @@ static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
 }
 
 /* irq chip descriptor */
-static struct irq_chip zynq_gpio_irqchip = {
+static struct irq_chip zynq_gpio_level_irqchip = {
 	.name		= DRIVER_NAME,
 	.irq_enable	= zynq_gpio_irq_enable,
+	.irq_eoi	= zynq_gpio_irq_ack,
+	.irq_mask	= zynq_gpio_irq_mask,
+	.irq_unmask	= zynq_gpio_irq_unmask,
+	.irq_set_type	= zynq_gpio_set_irq_type,
+	.irq_set_wake	= zynq_gpio_set_wake,
+	.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED,
+};
+
+static struct irq_chip zynq_gpio_edge_irqchip = {
+	.name		= DRIVER_NAME,
+	.irq_enable	= zynq_gpio_irq_enable,
+	.irq_ack	= zynq_gpio_irq_ack,
 	.irq_mask	= zynq_gpio_irq_mask,
 	.irq_unmask	= zynq_gpio_irq_unmask,
 	.irq_set_type	= zynq_gpio_set_irq_type,
@@ -493,10 +517,6 @@ static void zynq_gpio_irqhandler(unsigned int irq, struct irq_desc *desc)
 							 offset + bank_offset);
 				generic_handle_irq(gpio_irq);
 			}
-
-			/* clear IRQ in HW */
-			writel_relaxed(int_sts, gpio->base_addr +
-					ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
 		}
 	}
 
@@ -634,14 +654,14 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
 			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
 
-	ret = gpiochip_irqchip_add(chip, &zynq_gpio_irqchip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
+	ret = gpiochip_irqchip_add(chip, &zynq_gpio_edge_irqchip, 0,
+				   handle_level_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add irq chip\n");
 		goto err_rm_gpiochip;
 	}
 
-	gpiochip_set_chained_irqchip(chip, &zynq_gpio_irqchip, irq,
+	gpiochip_set_chained_irqchip(chip, &zynq_gpio_edge_irqchip, irq,
 				     zynq_gpio_irqhandler);
 
 	pm_runtime_set_active(&pdev->dev);
-- 
1.8.0

