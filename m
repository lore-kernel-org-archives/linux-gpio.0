From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/3] gpio: zynq: Take bank offset into account when reporting a IRQ
Date: Fri, 18 Jul 2014 11:52:11 +0200
Message-ID: <1405677133-8706-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-181.synserver.de ([212.40.185.181]:1083 "EHLO
	smtp-out-181.synserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933952AbaGRJwO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jul 2014 05:52:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

When looking up the IRQ the bank offset needs to be taken into account.
Otherwise interrupts for banks other than bank 0 get incorrectly reported as
interrupts for bank 0.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/gpio-zynq.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index c0c53fd..8e6a32f 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -136,6 +136,29 @@ static inline void zynq_gpio_get_bank_pin(unsigned int pin_num,
 }
 
 /**
+ * zynq_gpio_get_bank_pin - Gets the pin number of the first pin in a bank
+ * @bank: The bank for which to return the first pin number
+ *
+ * Returns the pin number of the first pin in the specified bank
+ */
+static int zynq_gpio_get_bank_offset(unsigned int bank)
+{
+	switch (bank) {
+	case 0:
+		return ZYNQ_GPIO_BANK0_PIN_MIN;
+	case 1:
+		return ZYNQ_GPIO_BANK1_PIN_MIN;
+	case 2:
+		return ZYNQ_GPIO_BANK2_PIN_MIN;
+	case 3:
+		return ZYNQ_GPIO_BANK3_PIN_MIN;
+	default:
+		/* We'll never get here */
+		return -1;
+	}
+}
+
+/**
  * zynq_gpio_get_value - Get the state of the specified pin of GPIO device
  * @chip:	gpio_chip instance to be worked on
  * @pin:	gpio pin number within the device
@@ -419,11 +442,12 @@ static void zynq_gpio_irqhandler(unsigned int irq, struct irq_desc *desc)
 		if (int_sts) {
 			int offset;
 			unsigned long pending = int_sts;
+			int bank_offset = zynq_gpio_get_bank_offset(bank_num);
 
 			for_each_set_bit(offset, &pending, 32) {
 				unsigned int gpio_irq =
 					irq_find_mapping(gpio->chip.irqdomain,
-							offset);
+							 offset + bank_offset);
 				generic_handle_irq(gpio_irq);
 			}
 
-- 
1.8.0

