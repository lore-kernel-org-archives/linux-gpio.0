From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/3] gpio: zynq: Clear pending interrupt when enabling a IRQ
Date: Fri, 18 Jul 2014 11:52:12 +0200
Message-ID: <1405677133-8706-2-git-send-email-lars@metafoo.de>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-181.synserver.de ([212.40.185.181]:1085 "EHLO
	smtp-out-181.synserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755203AbaGRJwO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jul 2014 05:52:14 -0400
In-Reply-To: <1405677133-8706-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

The Zynq GPIO controller does not disable the interrupt detection when the
interrupt is masked and only disables the propagation of the interrupt. This
means when the controller detects an interrupt condition while the interrupt is
logically disabled (and masked) it will propagate the recorded interrupt event
once the interrupt is enabled. This will cause the interrupt consumer to see
spurious interrupts to prevent this first make sure that the interrupt is not
asserted and then enable it.

E.g. when a interrupt is requested with request_irq() it will be configured
according to the requested type (edge/level triggered, etc.) after that it will
be enabled. But the detection circuit might have already registered a false
interrupt before the interrupt type was correctly configured and once the
interrupt is unmasked this false interrupt will be propagated and the interrupt
handler for the just request interrupt will called.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/gpio-zynq.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 8e6a32f..fa3ad23 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -324,6 +324,48 @@ static void zynq_gpio_irq_unmask(struct irq_data *irq_data)
 }
 
 /**
+ * zynq_gpio_irq_ack - Acknowledge the interrupt of a gpio pin
+ * @irq_data:	irq data containing irq number of gpio pin for the interrupt
+ *		to ack
+ *
+ * This function calculates gpio pin number from irq number and sets the bit
+ * in the Interrupt Status Register of the corresponding bank, to ACK the irq.
+ */
+static void zynq_gpio_irq_ack(struct irq_data *irq_data)
+{
+	unsigned int device_pin_num, bank_num, bank_pin_num;
+	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(irq_data);
+
+	device_pin_num = irq_data->hwirq;
+	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num);
+	writel_relaxed(BIT(bank_pin_num),
+		       gpio->base_addr + ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
+}
+
+/**
+ * zynq_gpio_irq_enable - Enable the interrupts for a gpio pin
+ * @irq_data:	irq data containing irq number of gpio pin for the interrupt
+ *		to enable
+ *
+ * Clears the INTSTS bit and unmasks the given interrrupt.
+ */
+static void zynq_gpio_irq_enable(struct irq_data *irq_data)
+{
+	/*
+	 * The Zynq GPIO controller does not disable interrupt detection when
+	 * the interrupt is masked and only disables the propagation of the
+	 * interrupt. This means when the controller detects an interrupt
+	 * condition while the interrupt is logically disabled it will propagate
+	 * that interrupt event once the interrupt is enabled. This will cause
+	 * the interrupt consumer to see spurious interrupts to prevent this
+	 * first make sure that the interrupt is not asserted and then enable
+	 * it.
+	 */
+	zynq_gpio_irq_ack(irq_data);
+	zynq_gpio_irq_unmask(irq_data);
+}
+
+/**
  * zynq_gpio_set_irq_type - Set the irq type for a gpio pin
  * @irq_data:	irq data containing irq number of gpio pin
  * @type:	interrupt type that is to be set for the gpio pin
@@ -407,6 +449,7 @@ static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
 /* irq chip descriptor */
 static struct irq_chip zynq_gpio_irqchip = {
 	.name		= DRIVER_NAME,
+	.irq_enable	= zynq_gpio_irq_enable,
 	.irq_mask	= zynq_gpio_irq_mask,
 	.irq_unmask	= zynq_gpio_irq_unmask,
 	.irq_set_type	= zynq_gpio_set_irq_type,
-- 
1.8.0

