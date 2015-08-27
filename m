From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] gpio: vf610: use container_of() to get state container
Date: Thu, 27 Aug 2015 16:55:55 +0200
Message-ID: <1440687355-17157-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:36799 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960AbbH0O4B (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 10:56:01 -0400
Received: by labia3 with SMTP id ia3so14268876lab.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 07:55:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The state container of the vf610 GPIO driver is sometimes
extracted from the gpio_chip exploiting the fact that offsetof()
the struct gpio_chip inside the struct vf610_gpio_port is 0, so
the container_of() is in practice a noop. However if a member
is added to struct vf610_gpio_port in front of struct gpio_chip,
things will break. Using proper container_of() avoids this
problem.

Semantically this is a noop, the compiler will optimize it away,
but syntactically it makes me happier.

Also replace some explicit container_of() calls with the helper
function.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 3d5714d4f405..f0d78f6cc991 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -62,6 +62,11 @@ struct vf610_gpio_port {
 
 static struct irq_chip vf610_gpio_irq_chip;
 
+static struct vf610_gpio_port *to_vf610_gp(struct gpio_chip *gc)
+{
+	return container_of(gc, struct vf610_gpio_port, gc);
+}
+
 static const struct of_device_id vf610_gpio_dt_ids[] = {
 	{ .compatible = "fsl,vf610-gpio" },
 	{ /* sentinel */ }
@@ -89,16 +94,14 @@ static void vf610_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct vf610_gpio_port *port =
-		container_of(gc, struct vf610_gpio_port, gc);
+	struct vf610_gpio_port *port = to_vf610_gp(gc);
 
 	return !!(vf610_gpio_readl(port->gpio_base + GPIO_PDIR) & BIT(gpio));
 }
 
 static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct vf610_gpio_port *port =
-		container_of(gc, struct vf610_gpio_port, gc);
+	struct vf610_gpio_port *port = to_vf610_gp(gc);
 	unsigned long mask = BIT(gpio);
 
 	if (val)
@@ -122,7 +125,8 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 static void vf610_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 {
-	struct vf610_gpio_port *port = irq_desc_get_handler_data(desc);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	int pin;
 	unsigned long irq_isfr;
@@ -142,7 +146,8 @@ static void vf610_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 
 static void vf610_gpio_irq_ack(struct irq_data *d)
 {
-	struct vf610_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_data_get_irq_chip_data(d));
 	int gpio = d->hwirq;
 
 	vf610_gpio_writel(BIT(gpio), port->base + PORT_ISFR);
@@ -150,7 +155,8 @@ static void vf610_gpio_irq_ack(struct irq_data *d)
 
 static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
 {
-	struct vf610_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_data_get_irq_chip_data(d));
 	u8 irqc;
 
 	switch (type) {
@@ -185,7 +191,8 @@ static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
 
 static void vf610_gpio_irq_mask(struct irq_data *d)
 {
-	struct vf610_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_data_get_irq_chip_data(d));
 	void __iomem *pcr_base = port->base + PORT_PCR(d->hwirq);
 
 	vf610_gpio_writel(0, pcr_base);
@@ -193,7 +200,8 @@ static void vf610_gpio_irq_mask(struct irq_data *d)
 
 static void vf610_gpio_irq_unmask(struct irq_data *d)
 {
-	struct vf610_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_data_get_irq_chip_data(d));
 	void __iomem *pcr_base = port->base + PORT_PCR(d->hwirq);
 
 	vf610_gpio_writel(port->irqc[d->hwirq] << PORT_PCR_IRQC_OFFSET,
@@ -202,7 +210,8 @@ static void vf610_gpio_irq_unmask(struct irq_data *d)
 
 static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 {
-	struct vf610_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct vf610_gpio_port *port =
+		to_vf610_gp(irq_data_get_irq_chip_data(d));
 
 	if (enable)
 		enable_irq_wake(port->irq);
-- 
2.4.3

