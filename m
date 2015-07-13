From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 05/19] gpiolib: Consolidate chained IRQ handler install/remove
Date: Mon, 13 Jul 2015 20:41:22 -0000
Message-ID: <20150712232405.127041870@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpiolib-Consolidate-chained-IRQ-handler-install-remo.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Julia Lawall <Julia.Lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Chained irq handlers usually set up handler data as well. We now have
a function to set both under irq_desc->lock. Replace the two calls
with one.

Search and conversion was done with coccinelle:

Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpiolib.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/gpio/gpiolib.c
===================================================================
--- tip.orig/drivers/gpio/gpiolib.c
+++ tip/drivers/gpio/gpiolib.c
@@ -443,8 +443,8 @@ void gpiochip_set_chained_irqchip(struct
 		 * The parent irqchip is already using the chip_data for this
 		 * irqchip, so our callbacks simply use the handler_data.
 		 */
-		irq_set_handler_data(parent_irq, gpiochip);
-		irq_set_chained_handler(parent_irq, parent_handler);
+		irq_set_chained_handler_and_data(parent_irq, parent_handler,
+						 gpiochip);
 
 		gpiochip->irq_parent = parent_irq;
 	}
