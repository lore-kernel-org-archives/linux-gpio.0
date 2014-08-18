From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when reporting a IRQ
Date: Mon, 18 Aug 2014 11:54:56 +0200
Message-ID: <1408355696-9998-2-git-send-email-lars@metafoo.de>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-006.synserver.de ([212.40.185.6]:1120 "EHLO
	smtp-out-002.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754234AbaHRJzD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 18 Aug 2014 05:55:03 -0400
In-Reply-To: <1408355696-9998-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

When looking up the IRQ the bank offset needs to be taken into account.
Otherwise interrupts for banks other than bank 0 get incorrectly reported as
interrupts for bank 0.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
Changes since v1:
	* Use lookup table instead of switch-case.
---
 drivers/gpio/gpio-zynq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index f440317..5db1af7 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -138,6 +138,13 @@ static inline void zynq_gpio_get_bank_pin(unsigned int pin_num,
 	}
 }
 
+static const unsigned int zynq_gpio_bank_offset[] = {
+	ZYNQ_GPIO_BANK0_PIN_MIN,
+	ZYNQ_GPIO_BANK1_PIN_MIN,
+	ZYNQ_GPIO_BANK2_PIN_MIN,
+	ZYNQ_GPIO_BANK3_PIN_MIN,
+};
+
 /**
  * zynq_gpio_get_value - Get the state of the specified pin of GPIO device
  * @chip:	gpio_chip instance to be worked on
@@ -461,6 +468,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
 				      unsigned int bank_num,
 				      unsigned long pending)
 {
+	unsigned int bank_offset = zynq_gpio_bank_offset[bank_num];
 	struct irq_domain *irqdomain = gpio->chip.irqdomain;
 	int offset;
 
@@ -470,7 +478,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
 	for_each_set_bit(offset, &pending, 32) {
 		unsigned int gpio_irq;
 
-		gpio_irq = irq_find_mapping(irqdomain, offset);
+		gpio_irq = irq_find_mapping(irqdomain, offset + bank_offset);
 		generic_handle_irq(gpio_irq);
 	}
 }
-- 
1.8.0

