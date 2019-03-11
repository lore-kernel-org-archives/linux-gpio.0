From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 1/7] gpio: vf610: Do not share irq_chip
Date: Sun, 10 Mar 2019 23:27:31 -0700
Message-ID: <20190311062737.6652-2-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Fix the warning produced by gpiochip_set_irq_hooks() by allocating a
dedicated IRQ chip per GPIO chip/port.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-imx@nxp.com
---
 drivers/gpio/gpio-vf610.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 541fa6ac399d..7e9451f47efe 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -29,6 +29,7 @@ struct fsl_gpio_soc_data {
 
 struct vf610_gpio_port {
 	struct gpio_chip gc;
+	struct irq_chip ic;
 	void __iomem *base;
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
@@ -60,8 +61,6 @@ struct vf610_gpio_port {
 #define PORT_INT_EITHER_EDGE	0xb
 #define PORT_INT_LOGIC_ONE	0xc
 
-static struct irq_chip vf610_gpio_irq_chip;
-
 static const struct fsl_gpio_soc_data imx_data = {
 	.have_paddr = true,
 };
@@ -237,15 +236,6 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 	return 0;
 }
 
-static struct irq_chip vf610_gpio_irq_chip = {
-	.name		= "gpio-vf610",
-	.irq_ack	= vf610_gpio_irq_ack,
-	.irq_mask	= vf610_gpio_irq_mask,
-	.irq_unmask	= vf610_gpio_irq_unmask,
-	.irq_set_type	= vf610_gpio_irq_set_type,
-	.irq_set_wake	= vf610_gpio_irq_set_wake,
-};
-
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -253,6 +243,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct resource *iores;
 	struct gpio_chip *gc;
+	struct irq_chip *ic;
 	int i;
 	int ret;
 
@@ -316,6 +307,14 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc->direction_output = vf610_gpio_direction_output;
 	gc->set = vf610_gpio_set;
 
+	ic = &port->ic;
+	ic->name = "gpio-vf610";
+	ic->irq_ack = vf610_gpio_irq_ack;
+	ic->irq_mask = vf610_gpio_irq_mask;
+	ic->irq_unmask = vf610_gpio_irq_unmask;
+	ic->irq_set_type = vf610_gpio_irq_set_type;
+	ic->irq_set_wake = vf610_gpio_irq_set_wake;
+
 	ret = gpiochip_add_data(gc, port);
 	if (ret < 0)
 		return ret;
@@ -327,14 +326,13 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	/* Clear the interrupt status register for all GPIO's */
 	vf610_gpio_writel(~0, port->base + PORT_ISFR);
 
-	ret = gpiochip_irqchip_add(gc, &vf610_gpio_irq_chip, 0,
-				   handle_edge_irq, IRQ_TYPE_NONE);
+	ret = gpiochip_irqchip_add(gc, ic, 0, handle_edge_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(dev, "failed to add irqchip\n");
 		gpiochip_remove(gc);
 		return ret;
 	}
-	gpiochip_set_chained_irqchip(gc, &vf610_gpio_irq_chip, port->irq,
+	gpiochip_set_chained_irqchip(gc, ic, port->irq,
 				     vf610_gpio_irq_handler);
 
 	return 0;
-- 
2.20.1
