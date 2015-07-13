From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 14/22] pinctrl/samsung: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 23:09:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507132308100.20072@nanos>
References: <20150713072703.919712512@linutronix.de> <20150713072815.467278047@linutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56538 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752876AbbGMVJz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 17:09:55 -0400
In-Reply-To: <20150713072815.467278047@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>

On Mon, 13 Jul 2015, Thomas Gleixner wrote:
> -	s3c24xx_eint_set_handler(data->irq, type);
> +x

Hrpmf. Fatfingered it after importing to git. The git tree is
correct. Proper patch below.

Thanks,

	tglx
---
From: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 23 Jun 2015 15:52:57 +0200
Subject: pinctrl/samsung: Use irq_set_handler_locked()

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |    8 ++++----
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c |   10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

Index: tip/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
===================================================================
--- tip.orig/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ tip/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -131,13 +131,13 @@ static int s3c24xx_eint_get_trigger(unsi
 	}
 }
 
-static void s3c24xx_eint_set_handler(unsigned int irq, unsigned int type)
+static void s3c24xx_eint_set_handler(struct irq_data *d, unsigned int type)
 {
 	/* Edge- and level-triggered interrupts need different handlers */
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	else
-		__irq_set_handler_locked(irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 }
 
 static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_data *d,
@@ -181,7 +181,7 @@ static int s3c24xx_eint_type(struct irq_
 		return -EINVAL;
 	}
 
-	s3c24xx_eint_set_handler(data->irq, type);
+	s3c24xx_eint_set_handler(data, type);
 
 	/* Set up interrupt trigger */
 	reg = d->virt_base + EINT_REG(index);
Index: tip/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
===================================================================
--- tip.orig/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ tip/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -260,13 +260,13 @@ static int s3c64xx_irq_get_trigger(unsig
 	return trigger;
 }
 
-static void s3c64xx_irq_set_handler(unsigned int irq, unsigned int type)
+static void s3c64xx_irq_set_handler(struct irq_data *d, unsigned int type)
 {
 	/* Edge- and level-triggered interrupts need different handlers */
 	if (type & IRQ_TYPE_EDGE_BOTH)
-		__irq_set_handler_locked(irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 	else
-		__irq_set_handler_locked(irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 }
 
 static void s3c64xx_irq_set_function(struct samsung_pinctrl_drv_data *d,
@@ -356,7 +356,7 @@ static int s3c64xx_gpio_irq_set_type(str
 		return -EINVAL;
 	}
 
-	s3c64xx_irq_set_handler(irqd->irq, type);
+	s3c64xx_irq_set_handler(irqd, type);
 
 	/* Set up interrupt trigger */
 	reg = d->virt_base + EINTCON_REG(bank->eint_offset);
@@ -567,7 +567,7 @@ static int s3c64xx_eint0_irq_set_type(st
 		return -EINVAL;
 	}
 
-	s3c64xx_irq_set_handler(irqd->irq, type);
+	s3c64xx_irq_set_handler(irqd, type);
 
 	/* Set up interrupt trigger */
 	reg = d->virt_base + EINT0CON0_REG;

