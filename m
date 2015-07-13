From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 19/22] pinctrl/rockchip: Prepare rockchip_irq_demux for irq
 argument removal
Date: Mon, 13 Jul 2015 20:48:03 -0000
Message-ID: <20150713072815.884088125@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-rockchip-prepare-rockchip-irq-demux-for-irq-argument-removal.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <Julia.Lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

The irq argument of most interrupt flow handlers is unused or merily
used instead of a local variable. The handlers which need the irq
argument can retrieve the irq number from the irq descriptor.

Search and update was done with coccinelle and the invaluable help of
Julia Lawall.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-rockchip.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-rockchip.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-rockchip.c
+++ tip/drivers/pinctrl/pinctrl-rockchip.c
@@ -1469,7 +1469,7 @@ static const struct gpio_chip rockchip_g
  * Interrupt handling
  */
 
-static void rockchip_irq_demux(unsigned int irq, struct irq_desc *desc)
+static void rockchip_irq_demux(unsigned int __irq, struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
@@ -1482,7 +1482,7 @@ static void rockchip_irq_demux(unsigned
 	pend = readl_relaxed(bank->reg_base + GPIO_INT_STATUS);
 
 	while (pend) {
-		unsigned int virq;
+		unsigned int irq, virq;
 
 		irq = __ffs(pend);
 		pend &= ~BIT(irq);
