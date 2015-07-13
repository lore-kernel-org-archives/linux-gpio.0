From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 08/22] pinctrl/adi2: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:46 -0000
Message-ID: <20150713072814.949588935@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-adi2-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and update was done with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-adi2.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-adi2.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-adi2.c
+++ tip/drivers/pinctrl/pinctrl-adi2.c
@@ -427,10 +427,10 @@ static int adi_gpio_irq_type(struct irq_
 
 	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
 		writel(pintmask, &pint_regs->edge_set);
-		__irq_set_handler_locked(irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	} else {
 		writel(pintmask, &pint_regs->edge_clear);
-		__irq_set_handler_locked(irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 	}
 
 out:
