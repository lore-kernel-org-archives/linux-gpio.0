From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] pinctrl: coh901: move irq line locking to resource callbacks
Date: Mon, 17 Mar 2014 14:56:16 +0100
Message-ID: <1395064576-21219-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:61790 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756531AbaCQN4V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Mar 2014 09:56:21 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so2177295wiv.15
        for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2014 06:56:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>

This switches the COH901 GPIO driver over to using the
.request_resources() and .release_resources() callbacks from
the irqchip vtable and separate the calls from the .enable()
and .disable() callbacks as the latter cannot really say no
to a request, whereas the resource callbacks can.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 162ac0d73739..749db595640c 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -529,10 +529,6 @@ static void u300_gpio_irq_enable(struct irq_data *d)
 
 	dev_dbg(gpio->dev, "enable IRQ for hwirq %lu on port %s, offset %d\n",
 		 d->hwirq, port->name, offset);
-	if (gpio_lock_as_irq(&gpio->chip, d->hwirq))
-		dev_err(gpio->dev,
-			"unable to lock HW IRQ %lu for IRQ\n",
-			d->hwirq);
 	local_irq_save(flags);
 	val = readl(U300_PIN_REG(offset, ien));
 	writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
@@ -551,6 +547,27 @@ static void u300_gpio_irq_disable(struct irq_data *d)
 	val = readl(U300_PIN_REG(offset, ien));
 	writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
 	local_irq_restore(flags);
+}
+
+static int u300_gpio_irq_reqres(struct irq_data *d)
+{
+	struct u300_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct u300_gpio *gpio = port->gpio;
+
+	if (gpio_lock_as_irq(&gpio->chip, d->hwirq)) {
+		dev_err(gpio->dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			d->hwirq);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void u300_gpio_irq_relres(struct irq_data *d)
+{
+	struct u300_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct u300_gpio *gpio = port->gpio;
+
 	gpio_unlock_as_irq(&gpio->chip, d->hwirq);
 }
 
@@ -559,7 +576,8 @@ static struct irq_chip u300_gpio_irqchip = {
 	.irq_enable		= u300_gpio_irq_enable,
 	.irq_disable		= u300_gpio_irq_disable,
 	.irq_set_type		= u300_gpio_irq_type,
-
+	.irq_request_resources	= u300_gpio_irq_reqres,
+	.irq_release_resources	= u300_gpio_irq_relres,
 };
 
 static void u300_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
-- 
1.8.5.3

