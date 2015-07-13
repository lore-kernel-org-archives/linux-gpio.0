From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 02/19] gpio/mvebu: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:41:17 -0000
Message-ID: <20150712232404.884061911@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-mvebu-Consolidate-chained-IRQ-handler-install-r.patch
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
 drivers/gpio/gpio-mvebu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 1a54205860f5..ab660e44a672 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -787,8 +787,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 
 		if (irq < 0)
 			continue;
-		irq_set_handler_data(irq, mvchip);
-		irq_set_chained_handler(irq, mvebu_gpio_irq_handler);
+		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
+						 mvchip);
 	}
 
 	mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
-- 
2.1.4
