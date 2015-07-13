From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 06/22] pinctrl/cherryview: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:43 -0000
Message-ID: <20150713072814.772065837@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-cherryview-Use-irq_set_handler_locked.patch
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
 drivers/pinctrl/intel/pinctrl-cherryview.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: tip/drivers/pinctrl/intel/pinctrl-cherryview.c
===================================================================
--- tip.orig/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ tip/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1325,7 +1325,7 @@ static unsigned chv_gpio_irq_startup(str
 
 		spin_lock_irqsave(&pctrl->lock, flags);
 		if (!pctrl->intr_lines[intsel]) {
-			__irq_set_handler_locked(d->irq, handler);
+			irq_set_handler_locked(d, handler);
 			pctrl->intr_lines[intsel] = offset;
 		}
 		spin_unlock_irqrestore(&pctrl->lock, flags);
@@ -1389,9 +1389,9 @@ static int chv_gpio_irq_type(struct irq_
 	pctrl->intr_lines[value] = offset;
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	else if (type & IRQ_TYPE_LEVEL_MASK)
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 
