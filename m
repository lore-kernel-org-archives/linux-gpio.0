From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 17/22] pinctrl/coh901: Prepare u300_gpio_irq_handler for irq
 argument removal
Date: Mon, 13 Jul 2015 20:48:00 -0000
Message-ID: <20150713072815.707536884@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-coh901-prepare-u300_gpio_irq_handler-for-irq-argument-removal.patch
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
 drivers/pinctrl/pinctrl-coh901.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: tip/drivers/pinctrl/pinctrl-coh901.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-coh901.c
+++ tip/drivers/pinctrl/pinctrl-coh901.c
@@ -519,8 +519,9 @@ static struct irq_chip u300_gpio_irqchip
 	.irq_set_type		= u300_gpio_irq_type,
 };
 
-static void u300_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
+static void u300_gpio_irq_handler(unsigned __irq, struct irq_desc *desc)
 {
+	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct u300_gpio *gpio = to_u300_gpio(chip);
