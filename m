From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 7/8] gpio: mxc: use devres for irq generic chip
Date: Wed,  9 Aug 2017 14:25:06 +0200
Message-ID: <20170809122507.11149-8-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:34212 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752810AbdHIMZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2017 08:25:17 -0400
Received: by mail-wm0-f50.google.com with SMTP id t138so13484858wmt.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2017 05:25:16 -0700 (PDT)
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Use resource managed variants of irq_alloc_generic_chip() and
irq_setup_generic_chip().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mxc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index a4d4a3527a24..78da5cbce056 100644
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

