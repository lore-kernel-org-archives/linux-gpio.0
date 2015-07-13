From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 14/22] pinctrl/samsung: Use irq_set_handler_locked()
Date: Mon, 13 Jul 2015 20:47:55 -0000
Message-ID: <20150713072815.467278047@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl-samsung-Use-irq_set_handler_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |   10 +++++-----
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c |   10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

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
@@ -180,8 +180,8 @@ static int s3c24xx_eint_type(struct irq_
 		dev_err(d->dev, "unsupported external interrupt type\n");
 		return -EINVAL;
 	}
-
-	s3c24xx_eint_set_handler(data->irq, type);
+x
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
