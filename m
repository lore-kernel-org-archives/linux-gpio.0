From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 15/19] gpio/ep93xx: Prepare ep93xx_gpio_f_irq_handler for irq
 argument removal
Date: Mon, 13 Jul 2015 20:41:38 -0000
Message-ID: <20150712232405.988906210@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-ep93xx-prepare-flowhandler-for-irq-argument-removal.patch
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
 drivers/gpio/gpio-ep93xx.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: tip/drivers/gpio/gpio-ep93xx.c
===================================================================
--- tip.orig/drivers/gpio/gpio-ep93xx.c
+++ tip/drivers/gpio/gpio-ep93xx.c
@@ -100,13 +100,15 @@ static void ep93xx_gpio_ab_irq_handler(u
 	}
 }
 
-static void ep93xx_gpio_f_irq_handler(unsigned int irq, struct irq_desc *desc)
+static void ep93xx_gpio_f_irq_handler(unsigned int __irq,
+				      struct irq_desc *desc)
 {
 	/*
 	 * map discontiguous hw irq range to continuous sw irq range:
 	 *
 	 *  IRQ_EP93XX_GPIO{0..7}MUX -> gpio_to_irq(EP93XX_GPIO_LINE_F({0..7})
 	 */
+	unsigned int irq = irq_desc_get_irq(desc);
 	int port_f_idx = ((irq + 1) & 7) ^ 4; /* {19..22,47..50} -> {0..7} */
 	int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_F(0)) + port_f_idx;
 
