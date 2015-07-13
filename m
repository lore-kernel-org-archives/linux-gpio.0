From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 07/19] gpio/ep93xx: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:41:25 -0000
Message-ID: <20150712232405.320570261@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-ep93xx-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and replacement was done with coccinelle:

@@
struct irq_data *d;
expression E1;
@@

-__irq_set_handler_locked(d->irq, E1);
+irq_set_handler_locked(d, E1);

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-ep93xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: tip/drivers/gpio/gpio-ep93xx.c
===================================================================
--- tip.orig/drivers/gpio/gpio-ep93xx.c
+++ tip/drivers/gpio/gpio-ep93xx.c
@@ -208,7 +208,7 @@ static int ep93xx_gpio_irq_type(struct i
 		return -EINVAL;
 	}
 
-	__irq_set_handler_locked(d->irq, handler);
+	irq_set_handler_locked(d, handler);
 
 	gpio_int_enabled[port] |= port_mask;
 
