From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 09/22] pinctrl/amd: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:47 -0000
Message-ID: <20150713072815.031304664@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56108 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754159AbbGMUrz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:47:55 -0400
Content-Disposition: inline;
 filename=pinctrl-amd-Use-irq_set_handler_locked.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <julia.lawall@lip6.fr>

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Search and replacement was done with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-amd.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: tip/drivers/pinctrl/pinctrl-amd.c
===================================================================
--- tip.orig/drivers/pinctrl/pinctrl-amd.c
+++ tip/drivers/pinctrl/pinctrl-amd.c
@@ -420,7 +420,7 @@ static int amd_gpio_irq_set_type(struct
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
 		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
 	case IRQ_TYPE_EDGE_FALLING:
@@ -428,7 +428,7 @@ static int amd_gpio_irq_set_type(struct
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
 		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
@@ -436,7 +436,7 @@ static int amd_gpio_irq_set_type(struct
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
 		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
 	case IRQ_TYPE_LEVEL_HIGH:
@@ -445,7 +445,7 @@ static int amd_gpio_irq_set_type(struct
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
 		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 		pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		break;
 
 	case IRQ_TYPE_LEVEL_LOW:
@@ -454,7 +454,7 @@ static int amd_gpio_irq_set_type(struct
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
 		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 		pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		break;
 
 	case IRQ_TYPE_NONE:


