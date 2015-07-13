From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 04/19] gpio/tz1090: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:41:21 -0000
Message-ID: <20150712232405.045794604@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-tz1090-Consolidate-chained-IRQ-handler-install-.patch
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
 drivers/gpio/gpio-tz1090.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 445660adc898..bbac92ae4c32 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -510,8 +510,8 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpio_bank_info *info)
 	gc->chip_types[1].chip.flags		= IRQCHIP_MASK_ON_SUSPEND;
 
 	/* Setup chained handler for this GPIO bank */
-	irq_set_handler_data(bank->irq, bank);
-	irq_set_chained_handler(bank->irq, tz1090_gpio_irq_handler);
+	irq_set_chained_handler_and_data(bank->irq, tz1090_gpio_irq_handler,
+					 bank);
 
 	return 0;
 }
-- 
2.1.4
