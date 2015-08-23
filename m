From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH 2/2] gpio: mxs: need to check return value of irq_alloc_generic_chip
Date: Sun, 23 Aug 2015 21:11:53 +0800
Message-ID: <1440335513-14703-2-git-send-email-van.freenix@gmail.com>
References: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, shawn.guo@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, van.freenix@gmail.com
List-Id: linux-gpio@vger.kernel.org

Need to check return value of irq_alloc_generic_chip, because
it may return NULL.
1. Change mxs_gpio_init_gc return type from void to int.
2. Add a new lable out_irqdomain_remove to remove the irq domain
   when mxc_gpio_init_gc fail.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpio-mxs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 84cbda6..f7c3550 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -196,13 +196,16 @@ static int mxs_gpio_set_wake_irq(struct irq_data *d, unsigned int enable)
 	return 0;
 }
 
-static void __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
+static int __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	gc = irq_alloc_generic_chip("gpio-mxs", 1, irq_base,
 				    port->base, handle_level_irq);
+	if (!gc)
+		return -ENOMEM;
+
 	gc->private = port;
 
 	ct = gc->chip_types;
@@ -216,6 +219,8 @@ static void __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
 			       IRQ_NOREQUEST, 0);
+
+	return 0;
 }
 
 static int mxs_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -317,7 +322,9 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* gpio-mxs can be a generic irq chip */
-	mxs_gpio_init_gc(port, irq_base);
+	err = mxs_gpio_init_gc(port, irq_base);
+	if (err < 0)
+		goto out_irqdomain_remove;
 
 	/* setup one handler for each entry */
 	irq_set_chained_handler(port->irq, mxs_gpio_irq_handler);
@@ -343,6 +350,8 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 
 out_bgpio_remove:
 	bgpio_remove(&port->bgc);
+out_irqdomain_remove:
+	irq_domain_remove(port->domain);
 out_irqdesc_free:
 	irq_free_descs(irq_base, 32);
 	return err;
-- 
1.8.4.5
