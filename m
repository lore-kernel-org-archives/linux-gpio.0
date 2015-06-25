From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/2] gpiolib: irqchip: prevent driver unloading if gpio is used as irq only
Date: Thu, 25 Jun 2015 20:30:50 +0300
Message-ID: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:45710 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbFYRbA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 13:31:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Johan Hovold <johan@kernel.org>

Now nothing prevents GPIO driver from being unloaded if its gpios
were requested as GPIO IRQs only (without calling gpio_request()).

Hence, add calls of try_module_get()/module_put() into
gpiochip_irq_reqres/relres() to track such scenario properly.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be42ab3..9b1d247 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -522,10 +522,14 @@ static int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
+	if (!try_module_get(chip->owner))
+		return -ENODEV;
+
 	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
 		chip_err(chip,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			d->hwirq);
+		module_put(chip->owner);
 		return -EINVAL;
 	}
 	return 0;
@@ -536,6 +540,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	gpiochip_unlock_as_irq(chip, d->hwirq);
+	module_put(chip->owner);
 }
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
-- 
2.4.4

