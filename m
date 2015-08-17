From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: at91: Use generic irq_{request,release}_resources()
Date: Mon, 17 Aug 2015 15:32:16 +0200
Message-ID: <1439818336-31230-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:56200 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbbHQNcX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 09:32:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

The at91-specific irq_{request,release}_resources() callbacks are
identical to the generic ones, modulo the bug fix in 5b76e79c77264899
("gpiolib: irqchip: prevent driver unloading if gpio is used as irq
only").

Until commit 8b67a1f0ad1f260f ("gpio: don't override irq_*_resources()
callbacks"), the buggy at91-specific callbacks were never used, though.

Hence drop the at91-specific ones in favor of the generic ones.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/pinctrl/pinctrl-at91.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index e1ab69928bba38b4..72a3e632c4d9b495 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1488,28 +1488,6 @@ static void gpio_irq_ack(struct irq_data *d)
 	/* the interrupt is already cleared before by reading ISR */
 }
 
-static int gpio_irq_request_res(struct irq_data *d)
-{
-	struct at91_gpio_chip *at91_gpio = irq_data_get_irq_chip_data(d);
-	unsigned	pin = d->hwirq;
-	int ret;
-
-	ret = gpiochip_lock_as_irq(&at91_gpio->chip, pin);
-	if (ret)
-		dev_err(at91_gpio->chip.dev, "unable to lock pind %lu IRQ\n",
-			d->hwirq);
-
-	return ret;
-}
-
-static void gpio_irq_release_res(struct irq_data *d)
-{
-	struct at91_gpio_chip *at91_gpio = irq_data_get_irq_chip_data(d);
-	unsigned	pin = d->hwirq;
-
-	gpiochip_unlock_as_irq(&at91_gpio->chip, pin);
-}
-
 #ifdef CONFIG_PM
 
 static u32 wakeups[MAX_GPIO_BANKS];
@@ -1585,8 +1563,6 @@ void at91_pinctrl_gpio_resume(void)
 static struct irq_chip gpio_irqchip = {
 	.name		= "GPIO",
 	.irq_ack	= gpio_irq_ack,
-	.irq_request_resources = gpio_irq_request_res,
-	.irq_release_resources = gpio_irq_release_res,
 	.irq_disable	= gpio_irq_mask,
 	.irq_mask	= gpio_irq_mask,
 	.irq_unmask	= gpio_irq_unmask,
-- 
1.9.1

