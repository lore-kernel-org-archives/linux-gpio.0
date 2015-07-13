From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 11/22] pinctrl/rockchip: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:50 -0000
Message-ID: <20150713072815.209490110@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-rockchip-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and replacement was done with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-rockchip.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-rockchip.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-rockchip.c
+++ tip/drivers/pinctrl/pinctrl-rockchip.c
@@ -1555,9 +1555,9 @@ static int rockchip_irq_set_type(struct
 	spin_unlock_irqrestore(&bank->slock, flags);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	else
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 
 	spin_lock_irqsave(&bank->slock, flags);
 	irq_gc_lock(gc);
