From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH 1/2] gpio: mxc: need to check return value of irq_alloc_generic_chip
Date: Sun, 23 Aug 2015 21:11:52 +0800
Message-ID: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, shawn.guo@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, van.freenix@gmail.com
List-Id: linux-gpio@vger.kernel.org

Need to check return value of irq_alloc_generic_chip, because
it may return NULL.
1. Change mxc_gpio_init_gc return type from void to int.
2. Add a new lable out_irqdomain_remove to remove the irq domain
   when mxc_gpio_init_gc fail.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f7446a..45bbe729 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -339,13 +339,16 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	return 0;
 }
 
-static void __init mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
+static int __init mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	gc = irq_alloc_generic_chip("gpio-mxc", 1, irq_base,
 				    port->base, handle_level_irq);
+	if (!gc)
+		return -ENOMEM;
+
 	gc->private = port;
 
 	ct = gc->chip_types;
@@ -359,6 +362,8 @@ static void __init mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
 			       IRQ_NOREQUEST, 0);
+
+	return 0;
 }
 
 static void mxc_gpio_get_hw(struct platform_device *pdev)
@@ -476,12 +481,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* gpio-mxc can be a generic irq chip */
-	mxc_gpio_init_gc(port, irq_base);
+	err = mxc_gpio_init_gc(port, irq_base);
+	if (err < 0)
+		goto out_irqdomain_remove;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	return 0;
 
+out_irqdomain_remove:
+	irq_domain_remove(port->domain);
 out_irqdesc_free:
 	irq_free_descs(irq_base, 32);
 out_gpiochip_remove:
-- 
1.8.4.5
