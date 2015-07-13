From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 16/19] gpio/mvebu: Prepare mvebu_gpio_irq_handler for irq
 argument removal
Date: Mon, 13 Jul 2015 20:41:40 -0000
Message-ID: <20150712232406.086334325@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-mvebu-prepare-flowhandler-for-irq-argument-removal.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <Julia.Lawall@lip6.fr>
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
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-mvebu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: tip/drivers/gpio/gpio-mvebu.c
===================================================================
--- tip.orig/drivers/gpio/gpio-mvebu.c
+++ tip/drivers/gpio/gpio-mvebu.c
@@ -458,7 +458,7 @@ static int mvebu_gpio_irq_set_type(struc
 	return 0;
 }
 
-static void mvebu_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+static void mvebu_gpio_irq_handler(unsigned int __irq, struct irq_desc *desc)
 {
 	struct mvebu_gpio_chip *mvchip = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
