From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 18/22] pinctrl/pistachio: Prepare pistachio_gpio_irq_handler
 for irq argument removal
Date: Mon, 13 Jul 2015 20:48:01 -0000
Message-ID: <20150713072815.803039611@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-pistachio-prepare-pistachio_gpio_irq_handler-for-irq-argument-removal.patch
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
 drivers/pinctrl/pinctrl-pistachio.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-pistachio.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-pistachio.c
+++ tip/drivers/pinctrl/pinctrl-pistachio.c
@@ -1310,9 +1310,11 @@ static int pistachio_gpio_irq_set_type(s
 	return 0;
 }
 
-static void pistachio_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+static void pistachio_gpio_irq_handler(unsigned int __irq,
+				       struct irq_desc *desc)
 {
-	struct gpio_chip *gc = irq_get_handler_data(irq);
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct pistachio_gpio_bank *bank = gc_to_bank(gc);
 	struct irq_chip *chip = irq_get_chip(irq);
 	unsigned long pending;
