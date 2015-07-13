From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 04/22] pinctrl/bcm2835: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:39 -0000
Message-ID: <20150713072814.607722876@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-bcm2835-Use-irq_set_handler_locked.patch
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
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/bcm/pinctrl-bcm2835.c
===================================================================
--- tip.orig/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ tip/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -584,9 +584,9 @@ static int bcm2835_gpio_irq_set_type(str
 		ret = __bcm2835_gpio_irq_set_type_disabled(pc, gpio, type);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(data->irq, handle_edge_irq);
+		irq_set_handler_locked(data, handle_edge_irq);
 	else
-		__irq_set_handler_locked(data->irq, handle_level_irq);
+		irq_set_handler_locked(data, handle_level_irq);
 
 	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
 
