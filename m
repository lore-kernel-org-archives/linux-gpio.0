From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 08/19] gpio/msm-v2: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:41:27 -0000
Message-ID: <20150712232405.399058029@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-msm-v2-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and replacement was done with coccinelle:

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-msm-v2.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/gpio/gpio-msm-v2.c
===================================================================
--- tip.orig/drivers/gpio/gpio-msm-v2.c
+++ tip/drivers/gpio/gpio-msm-v2.c
@@ -281,14 +281,14 @@ static int msm_gpio_irq_set_type(struct
 
 	if (flow_type & IRQ_TYPE_EDGE_BOTH) {
 		bits |= BIT(INTR_DECT_CTL);
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		if ((flow_type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
 			__set_bit(gpio, msm_gpio.dual_edge_irqs);
 		else
 			__clear_bit(gpio, msm_gpio.dual_edge_irqs);
 	} else {
 		bits &= ~BIT(INTR_DECT_CTL);
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		__clear_bit(gpio, msm_gpio.dual_edge_irqs);
 	}
 
