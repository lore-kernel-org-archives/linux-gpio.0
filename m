From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed,  2 Aug 2017 09:51:24 +0200
Message-ID: <20170802075126.17637-5-brgl@bgdev.pl>
References: <20170802075126.17637-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802075126.17637-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Use resource managed variants of irq_alloc_generic_chip() and
irq_setup_generic_chip().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mxc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3abea3f0b307..d5f3db49f48e 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -66,6 +66,7 @@ struct mxc_gpio_port {
 	int irq_high;
 	struct irq_domain *domain;
 	struct gpio_chip gc;
+	struct device *dev;
 	u32 both_edges;
 };
 
@@ -344,9 +345,10 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int rv;
 
-	gc = irq_alloc_generic_chip("gpio-mxc", 1, irq_base,
-				    port->base, handle_level_irq);
+	gc = devm_irq_alloc_generic_chip(port->dev, "gpio-mxc", 1, irq_base,
+					 port->base, handle_level_irq);
 	if (!gc)
 		return -ENOMEM;
 	gc->private = port;
@@ -361,10 +363,11 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 	ct->regs.ack = GPIO_ISR;
 	ct->regs.mask = GPIO_IMR;
 
-	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
-			       IRQ_NOREQUEST, 0);
+	rv = devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32),
+					 IRQ_GC_INIT_NESTED_LOCK,
+					 IRQ_NOREQUEST, 0);
 
-	return 0;
+	return rv;
 }
 
 static void mxc_gpio_get_hw(struct platform_device *pdev)
@@ -418,6 +421,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
+	port->dev = &pdev->dev;
+
 	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	port->base = devm_ioremap_resource(&pdev->dev, iores);
 	if (IS_ERR(port->base))
-- 
2.13.2
