From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/5] gpio: dwapb: drop irq_setup_generic_chip()
Date: Mon,  7 Apr 2014 12:13:05 +0200
Message-ID: <1396865589-9972-2-git-send-email-bigeasy@linutronix.de>
References: <1396865589-9972-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396865589-9972-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: jamie@jamieiles.com
Cc: atull@altera.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, linus.walleij@linaro.org, sebastian.hesselbarth@gmail.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

The driver calls irq_alloc_domain_generic_chips() which creates a gc and
adds it to gc_list. The driver later then calls irq_setup_generic_chip()
which also initializes the gc and adds it to the gc_list() and this
corrupts the list. Enable LIST_DEBUG and you see the kernel complain.
This isn't required, irq_alloc_domain_generic_chips() did the init.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpio/gpio-dwapb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index ed5711f..4d25a06b 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -260,9 +260,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	ct->regs.ack = GPIO_PORTA_EOI;
 	ct->regs.mask = GPIO_INTMASK;
 
-	irq_setup_generic_chip(irq_gc, IRQ_MSK(port->bgc.gc.ngpio),
-			IRQ_GC_INIT_NESTED_LOCK, IRQ_NOREQUEST, 0);
-
 	irq_set_chained_handler(irq, dwapb_irq_handler);
 	irq_set_handler_data(irq, gpio);
 
-- 
1.9.1
