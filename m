From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] gpio: zynq: Reduce level of indention in zynq_gpio_irqhandler()
Date: Mon, 18 Aug 2014 11:54:55 +0200
Message-ID: <1408355696-9998-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-006.synserver.de ([212.40.185.6]:1102 "EHLO
	smtp-out-002.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754233AbaHRJzC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 18 Aug 2014 05:55:02 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

zynq_gpio_irqhandler() uses up to 7 tabs of indention in some parts. Refactor
things to use a helper function for the inner loop to reduce the indention to a
sane level.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/gpio-zynq.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 31ad5df..f440317 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -457,6 +457,24 @@ static struct irq_chip zynq_gpio_edge_irqchip = {
 	.irq_set_wake	= zynq_gpio_set_wake,
 };
 
+static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
+				      unsigned int bank_num,
+				      unsigned long pending)
+{
+	struct irq_domain *irqdomain = gpio->chip.irqdomain;
+	int offset;
+
+	if (!pending)
+		return;
+
+	for_each_set_bit(offset, &pending, 32) {
+		unsigned int gpio_irq;
+
+		gpio_irq = irq_find_mapping(irqdomain, offset);
+		generic_handle_irq(gpio_irq);
+	}
+}
+
 /**
  * zynq_gpio_irqhandler - IRQ handler for the gpio banks of a gpio device
  * @irq:	irq number of the gpio bank where interrupt has occurred
@@ -482,18 +500,7 @@ static void zynq_gpio_irqhandler(unsigned int irq, struct irq_desc *desc)
 					ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
 		int_enb = readl_relaxed(gpio->base_addr +
 					ZYNQ_GPIO_INTMASK_OFFSET(bank_num));
-		int_sts &= ~int_enb;
-		if (int_sts) {
-			int offset;
-			unsigned long pending = int_sts;
-
-			for_each_set_bit(offset, &pending, 32) {
-				unsigned int gpio_irq =
-					irq_find_mapping(gpio->chip.irqdomain,
-							offset);
-				generic_handle_irq(gpio_irq);
-			}
-		}
+		zynq_gpio_handle_bank_irq(gpio, bank_num, int_sts & ~int_enb);
 	}
 
 	chained_irq_exit(irqchip, desc);
-- 
1.8.0

