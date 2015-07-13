From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 01/19] gpio/mpc8xxx: Consolidate chained IRQ handler
 install/remove
Date: Mon, 13 Jul 2015 20:41:16 -0000
Message-ID: <20150712232404.790176669@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:55707 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753096AbbGMUlY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:41:24 -0400
Content-Disposition: inline;
 filename=gpio-mpc8xxx-Consolidate-chained-IRQ-handler-install.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Julia Lawall <Julia.Lawall@lip6.fr>

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
 drivers/gpio/gpio-mpc8xxx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a65b75161aa4..6822520f6cf3 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -396,8 +396,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	out_be32(mm_gc->regs + GPIO_IER, 0xffffffff);
 	out_be32(mm_gc->regs + GPIO_IMR, 0);
 
-	irq_set_handler_data(mpc8xxx_gc->irqn, mpc8xxx_gc);
-	irq_set_chained_handler(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade);
+	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
+					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
 
 	return 0;
 }
@@ -407,8 +407,7 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
 
 	if (mpc8xxx_gc->irq) {
-		irq_set_handler_data(mpc8xxx_gc->irqn, NULL);
-		irq_set_chained_handler(mpc8xxx_gc->irqn, NULL);
+		irq_set_chained_handler_and_data(mpc8xxx_gc->irqn, NULL, NULL);
 		irq_domain_remove(mpc8xxx_gc->irq);
 	}
 
-- 
2.1.4



