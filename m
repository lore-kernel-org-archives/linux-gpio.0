From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 22/22] pinctrl/sunxi: Prepare sunxi_pinctrl_irq_handler for
 irq argument removal
Date: Mon, 13 Jul 2015 20:48:07 -0000
Message-ID: <20150713072816.137686428@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56186 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754325AbbGMUsP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:48:15 -0400
Content-Disposition: inline;
 filename=pinctrl-sunxi-prepare-sunxi_pinctrl_irq_handler-for-irq-argument-removal.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <Julia.Lawall@lip6.fr>

The irq argument of most interrupt flow handlers is unused or merily
used instead of a local variable. The handlers which need the irq
argument can retrieve the irq number from the irq descriptor.

Search and update was done with coccinelle and the invaluable help of
Julia Lawall.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: tip/drivers/pinctrl/sunxi/pinctrl-sunxi.c
===================================================================
--- tip.orig/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ tip/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -709,8 +709,9 @@ static struct irq_chip sunxi_pinctrl_lev
 			  IRQCHIP_EOI_IF_HANDLED,
 };
 
-static void sunxi_pinctrl_irq_handler(unsigned irq, struct irq_desc *desc)
+static void sunxi_pinctrl_irq_handler(unsigned __irq, struct irq_desc *desc)
 {
+	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct sunxi_pinctrl *pctl = irq_desc_get_handler_data(desc);
 	unsigned long bank, reg, val;


