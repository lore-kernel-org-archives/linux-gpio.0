From: dann frazier <dann.frazier@canonical.com>
Subject: [PATCH 3.15] gpio: dwapb: drop irq_setup_generic_chip()
Date: Fri, 25 Jul 2014 14:24:39 -0600
Message-ID: <20140725202439.GA22536@fluid.dannf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from complete.lackof.org ([198.49.126.79]:60543 "EHLO
	complete.lackof.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753354AbaGYUdW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jul 2014 16:33:22 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: stable@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Alan Tull <delicious.quinoa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

commit 11d3d334af07408ce3a68860c40006ddcd343da5 upstream.

The driver calls irq_alloc_domain_generic_chips() which creates a gc and
adds it to gc_list. The driver later then calls irq_setup_generic_chip()
which also initializes the gc and adds it to the gc_list() and this
corrupts the list. Enable LIST_DEBUG and you see the kernel complain.
This isn't required, irq_alloc_domain_generic_chips() did the init.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Tested-by: Alan Tull <delicious.quinoa@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: dann frazier <dann.frazier@canonical.com>
Cc: <stable@vger.kernel.org> # 3.15.x
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
2.0.1

