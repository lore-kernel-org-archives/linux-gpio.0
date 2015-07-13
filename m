From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 03/22] pinctrl/exynos: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:47:38 -0000
Message-ID: <20150713072814.512097285@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-exynos-Consolidate-chained-IRQ-handler-insta.patch
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
 drivers/pinctrl/samsung/pinctrl-exynos.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/samsung/pinctrl-exynos.c
===================================================================
--- tip.orig/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ tip/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -542,8 +542,9 @@ static int exynos_eint_wkup_init(struct
 			}
 			weint_data[idx].irq = idx;
 			weint_data[idx].bank = bank;
-			irq_set_handler_data(irq, &weint_data[idx]);
-			irq_set_chained_handler(irq, exynos_irq_eint0_15);
+			irq_set_chained_handler_and_data(irq,
+							 exynos_irq_eint0_15,
+							 &weint_data[idx]);
 		}
 	}
 
