From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 02/22] pinctrl: Consolidate chained IRQ handler install/remove
Date: Mon, 13 Jul 2015 20:47:36 -0000
Message-ID: <20150713072814.431352855@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-Consolidate-chained-IRQ-handler-install-remo.patch
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
 drivers/pinctrl/pinctrl-single.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-single.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-single.c
+++ tip/drivers/pinctrl/pinctrl-single.c
@@ -1767,9 +1767,9 @@ static int pcs_irq_init_chained_handler(
 			return res;
 		}
 	} else {
-		irq_set_handler_data(pcs_soc->irq, pcs_soc);
-		irq_set_chained_handler(pcs_soc->irq,
-					pcs_irq_chain_handler);
+		irq_set_chained_handler_and_data(pcs_soc->irq,
+						 pcs_irq_chain_handler,
+						 pcs_soc);
 	}
 
 	/*
