From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 14/19] gpio/davinci: Prepare gpio_irq_handler for irq argument
 removal
Date: Mon, 13 Jul 2015 20:41:37 -0000
Message-ID: <20150712232405.907979256@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-davinci-prepare-flowhandler-for-irq-arg-removal.patch
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
 drivers/gpio/gpio-davinci.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: tip/drivers/gpio/gpio-davinci.c
===================================================================
--- tip.orig/drivers/gpio/gpio-davinci.c
+++ tip/drivers/gpio/gpio-davinci.c
@@ -327,8 +327,9 @@ static struct irq_chip gpio_irqchip = {
 };
 
 static void
-gpio_irq_handler(unsigned irq, struct irq_desc *desc)
+gpio_irq_handler(unsigned __irq, struct irq_desc *desc)
 {
+	unsigned int irq = irq_desc_get_irq(desc);
 	struct davinci_gpio_regs __iomem *g;
 	u32 mask = 0xffff;
 	struct davinci_gpio_controller *d;
