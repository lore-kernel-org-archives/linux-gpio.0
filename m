From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: coh901: mark GPIO lines used for IRQ
Date: Mon, 14 Oct 2013 10:27:04 +0200
Message-ID: <1381739224-5439-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:43568 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777Ab3JNI1L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 04:27:11 -0400
Received: by mail-we0-f175.google.com with SMTP id t61so6534647wes.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 01:27:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
the gpiolib so we can keep track of the usage centrally.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index f22a219..162ac0d 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -529,6 +529,10 @@ static void u300_gpio_irq_enable(struct irq_data *d)
 
 	dev_dbg(gpio->dev, "enable IRQ for hwirq %lu on port %s, offset %d\n",
 		 d->hwirq, port->name, offset);
+	if (gpio_lock_as_irq(&gpio->chip, d->hwirq))
+		dev_err(gpio->dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			d->hwirq);
 	local_irq_save(flags);
 	val = readl(U300_PIN_REG(offset, ien));
 	writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
@@ -547,6 +551,7 @@ static void u300_gpio_irq_disable(struct irq_data *d)
 	val = readl(U300_PIN_REG(offset, ien));
 	writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
 	local_irq_restore(flags);
+	gpio_unlock_as_irq(&gpio->chip, d->hwirq);
 }
 
 static struct irq_chip u300_gpio_irqchip = {
-- 
1.8.3.1

