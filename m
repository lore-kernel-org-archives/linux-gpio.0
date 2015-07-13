From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 05/22] pinctrl/baytrail: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:41 -0000
Message-ID: <20150713072814.691442938@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-baytrail-Use-irq_set_handler_locked.patch
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
 drivers/pinctrl/intel/pinctrl-baytrail.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/intel/pinctrl-baytrail.c
===================================================================
--- tip.orig/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ tip/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -265,9 +265,9 @@ static int byt_irq_type(struct irq_data
 	writel(value, reg);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	else if (type & IRQ_TYPE_LEVEL_MASK)
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 
 	spin_unlock_irqrestore(&vg->lock, flags);
 
