From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 21/22] pinctrl/sirf:
 Prepare-x-gpio-handle-irq-for-irq-argument-removal.patch
Date: Mon, 13 Jul 2015 20:48:06 -0000
Message-ID: <20150713072816.059848290@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56180 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754322AbbGMUsO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:48:14 -0400
Content-Disposition: inline;
 filename=pinctrl-sirf-prepare-x-gpio-handle-irq-for-irq-argument-removal.patch
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
 drivers/pinctrl/sirf/pinctrl-atlas7.c |    4 ++--
 drivers/pinctrl/sirf/pinctrl-sirf.c   |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

Index: tip/drivers/pinctrl/sirf/pinctrl-atlas7.c
===================================================================
--- tip.orig/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ tip/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -4286,14 +4286,14 @@ static struct irq_chip atlas7_gpio_irq_c
 	.irq_set_type = atlas7_gpio_irq_type,
 };
 
-static void atlas7_gpio_handle_irq(unsigned int irq, struct irq_desc *desc)
+static void atlas7_gpio_handle_irq(unsigned int __irq, struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
 	struct atlas7_gpio_bank *bank = NULL;
 	u32 status, ctrl;
 	int pin_in_bank = 0, idx;
-	struct irq_chip *chip = irq_get_chip(irq);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	for (idx = 0; idx < a7gc->nbank; idx++) {
 		bank = &a7gc->banks[idx];
Index: tip/drivers/pinctrl/sirf/pinctrl-sirf.c
===================================================================
--- tip.orig/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ tip/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -545,8 +545,9 @@ static struct irq_chip sirfsoc_irq_chip
 	.irq_set_type = sirfsoc_gpio_irq_type,
 };
 
-static void sirfsoc_gpio_handle_irq(unsigned int irq, struct irq_desc *desc)
+static void sirfsoc_gpio_handle_irq(unsigned int __irq, struct irq_desc *desc)
 {
+	unsigned int irq = irq_desc_get_irq(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct sirfsoc_gpio_chip *sgpio = to_sirfsoc_gpio(gc);
 	struct sirfsoc_gpio_bank *bank;


