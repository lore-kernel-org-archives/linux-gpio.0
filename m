From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 8/8] gpio: mxs: use devres for irq generic chip
Date: Wed,  9 Aug 2017 14:25:07 +0200
Message-ID: <20170809122507.11149-9-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Use resource managed variants of irq_alloc_generic_chip() and
irq_setup_generic_chip().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mxs.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 159927876577..435def22445d 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -66,6 +66,7 @@ struct mxs_gpio_port {
 	int irq;
 	struct irq_domain *domain;
 	struct gpio_chip gc;
+	struct device *dev;
 	enum mxs_gpio_id devid;
 	u32 both_edges;
 };
@@ -209,9 +210,10 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int rv;
 
-	gc = irq_alloc_generic_chip("gpio-mxs", 2, irq_base,
-				    port->base, handle_level_irq);
+	gc = devm_irq_alloc_generic_chip(port->dev, "gpio-mxs", 2, irq_base,
+					 port->base, handle_level_irq);
 	if (!gc)
 		return -ENOMEM;
 
@@ -242,10 +244,11 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	ct->regs.disable = PINCTRL_IRQEN(port) + MXS_CLR;
 	ct->handler = handle_level_irq;
 
-	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
-			       IRQ_NOREQUEST, 0);
+	rv = devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32),
+					 IRQ_GC_INIT_NESTED_LOCK,
+					 IRQ_NOREQUEST, 0);
 
-	return 0;
+	return rv;
 }
 
 static int mxs_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -304,6 +307,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	if (port->id < 0)
 		return port->id;
 	port->devid = (enum mxs_gpio_id) of_id->data;
+	port->dev = &pdev->dev;
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
 		return port->irq;
-- 
2.13.2
