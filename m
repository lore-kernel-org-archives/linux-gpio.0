From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 01/22] pinctrl/rockchip: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:47:34 -0000
Message-ID: <20150713072814.334902056@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-rockchip-Consolidate-chained-IRQ-handler-ins.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Julia Lawall <Julia.Lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Chained irq handlers usually set up handler data as well. We now have
a function to set both under irq_desc->lock. Replace the two calls
with one.

Search and conversion was done with coccinelle.

Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-rockchip.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-rockchip.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-rockchip.c
+++ tip/drivers/pinctrl/pinctrl-rockchip.c
@@ -1689,8 +1689,8 @@ static int rockchip_interrupts_register(
 		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
 		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
 
-		irq_set_handler_data(bank->irq, bank);
-		irq_set_chained_handler(bank->irq, rockchip_irq_demux);
+		irq_set_chained_handler_and_data(bank->irq,
+						 rockchip_irq_demux, bank);
 	}
 
 	return 0;
