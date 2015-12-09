From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 076/182] gpio: vf610: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:22 +0100
Message-ID: <1449667642-1015-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34291 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbbLIN11 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:27 -0500
Received: by lffu14 with SMTP id u14so34217811lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 9031e60c815c..6284bdbe1e0c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -62,11 +62,6 @@ struct vf610_gpio_port {
 
 static struct irq_chip vf610_gpio_irq_chip;
 
-static struct vf610_gpio_port *to_vf610_gp(struct gpio_chip *gc)
-{
-	return container_of(gc, struct vf610_gpio_port, gc);
-}
-
 static const struct of_device_id vf610_gpio_dt_ids[] = {
 	{ .compatible = "fsl,vf610-gpio" },
 	{ /* sentinel */ }
@@ -84,14 +79,14 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
 
 static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct vf610_gpio_port *port = to_vf610_gp(gc);
+	struct vf610_gpio_port *port = gpiochip_get_data(gc);
 
 	return !!(vf610_gpio_readl(port->gpio_base + GPIO_PDIR) & BIT(gpio));
 }
 
 static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct vf610_gpio_port *port = to_vf610_gp(gc);
+	struct vf610_gpio_port *port = gpiochip_get_data(gc);
 	unsigned long mask = BIT(gpio);
 
 	if (val)
@@ -116,7 +111,7 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_desc_get_handler_data(desc));
+		gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	int pin;
 	unsigned long irq_isfr;
@@ -137,7 +132,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 static void vf610_gpio_irq_ack(struct irq_data *d)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_data_get_irq_chip_data(d));
+		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	int gpio = d->hwirq;
 
 	vf610_gpio_writel(BIT(gpio), port->base + PORT_ISFR);
@@ -146,7 +141,7 @@ static void vf610_gpio_irq_ack(struct irq_data *d)
 static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_data_get_irq_chip_data(d));
+		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	u8 irqc;
 
 	switch (type) {
@@ -182,7 +177,7 @@ static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
 static void vf610_gpio_irq_mask(struct irq_data *d)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_data_get_irq_chip_data(d));
+		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	void __iomem *pcr_base = port->base + PORT_PCR(d->hwirq);
 
 	vf610_gpio_writel(0, pcr_base);
@@ -191,7 +186,7 @@ static void vf610_gpio_irq_mask(struct irq_data *d)
 static void vf610_gpio_irq_unmask(struct irq_data *d)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_data_get_irq_chip_data(d));
+		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	void __iomem *pcr_base = port->base + PORT_PCR(d->hwirq);
 
 	vf610_gpio_writel(port->irqc[d->hwirq] << PORT_PCR_IRQC_OFFSET,
@@ -201,7 +196,7 @@ static void vf610_gpio_irq_unmask(struct irq_data *d)
 static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 {
 	struct vf610_gpio_port *port =
-		to_vf610_gp(irq_data_get_irq_chip_data(d));
+		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
 	if (enable)
 		enable_irq_wake(port->irq);
@@ -261,7 +256,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc->direction_output = vf610_gpio_direction_output;
 	gc->set = vf610_gpio_set;
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, port);
 	if (ret < 0)
 		return ret;
 
-- 
2.4.3

