From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 10/22] pinctrl/at91: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:49 -0000
Message-ID: <20150713072815.127791552@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-at91-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and replacement was done with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-at91.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-at91.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-at91.c
+++ tip/drivers/pinctrl/pinctrl-at91.c
@@ -1444,22 +1444,22 @@ static int alt_gpio_irq_type(struct irq_
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		__irq_set_handler_locked(d->irq, handle_simple_irq);
+		irq_set_handler_locked(d, handle_simple_irq);
 		writel_relaxed(mask, pio + PIO_ESR);
 		writel_relaxed(mask, pio + PIO_REHLSR);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		__irq_set_handler_locked(d->irq, handle_simple_irq);
+		irq_set_handler_locked(d, handle_simple_irq);
 		writel_relaxed(mask, pio + PIO_ESR);
 		writel_relaxed(mask, pio + PIO_FELLSR);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		writel_relaxed(mask, pio + PIO_LSR);
 		writel_relaxed(mask, pio + PIO_FELLSR);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		writel_relaxed(mask, pio + PIO_LSR);
 		writel_relaxed(mask, pio + PIO_REHLSR);
 		break;
@@ -1468,7 +1468,7 @@ static int alt_gpio_irq_type(struct irq_
 		 * disable additional interrupt modes:
 		 * fall back to default behavior
 		 */
-		__irq_set_handler_locked(d->irq, handle_simple_irq);
+		irq_set_handler_locked(d, handle_simple_irq);
 		writel_relaxed(mask, pio + PIO_AIMDR);
 		return 0;
 	case IRQ_TYPE_NONE:
