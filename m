From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 03/19] gpio/timberdale: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:41:19 -0000
Message-ID: <20150712232404.964774292@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-timberdale-Consolidate-chained-IRQ-handler-inst.patch
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
 drivers/gpio/gpio-timberdale.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index e8f97e03c9bb..fd1970ed15e6 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -299,8 +299,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 #endif
 	}
 
-	irq_set_handler_data(irq, tgpio);
-	irq_set_chained_handler(irq, timbgpio_irq);
+	irq_set_chained_handler_and_data(irq, timbgpio_irq, tgpio);
 
 	return 0;
 }
-- 
2.1.4
