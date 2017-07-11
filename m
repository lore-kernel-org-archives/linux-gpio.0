From: Davide Hug <d@videhug.ch>
Subject: Should irq_enable/disable be flagging/unflagging gpio lines used as
 irq?
Date: Tue, 11 Jul 2017 19:55:18 +0200
Message-ID: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:44994 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755326AbdGKSGn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jul 2017 14:06:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi,

I'm looking at a driver (hwmon/sht15) that does not load with message:

	gpio-48 (SHT15 data): _gpiod_direction_output_raw: tried to set a GPIO tied to an IRQ as output

This happens because the driver uses a GPIO line alternately (and not at the
same time) as IRQ and output. To do this irq_enable/disable are used to
prevent setting a GPIO with enabled IRQ as output. This seems the right
approach to me since in the patch "gpio: add API to be strict about GPIO IRQ
usage"[1] I read:

	The API is symmetric so that lines can also be flagged from
	.irq_enable() and unflagged from IRQ by .irq_disable().

But I didn't find any GPIO driver implementing this API in irq_enable/disable.

Since my platform uses omap_gpio which does not implement
irq_enable/disable at all, I added a default irq_enable/disable
implementation in gpio/gpiolib.c (in the patch below).

Is it the right approach to call gpiochip_lock_as_irq/gpiochip_unlock_as_irq
in irq_enable/irq_disable?

Thanks, Davide

[1]: https://github.com/torvalds/linux/commit/d468bf9ecaabd3bf3a6134e5a369ced82b1d1ca1



diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8b4d721d6d63..c1db0461f29d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1678,6 +1678,22 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	module_put(chip->gpiodev->owner);
 }
 
+static void gpiochip_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	gpiochip_unlock_as_irq(chip, data->hwirq);
+	data->chip->irq_mask(data);
+}
+
+static void gpiochip_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	gpiochip_lock_as_irq(chip, data->hwirq);
+	data->chip->irq_unmask(data);
+}
+
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	return irq_find_mapping(chip->irqdomain, offset);
@@ -1714,6 +1730,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	if (gpiochip->irqchip) {
 		gpiochip->irqchip->irq_request_resources = NULL;
 		gpiochip->irqchip->irq_release_resources = NULL;
+		gpiochip->irqchip->irq_disable = NULL;
+		gpiochip->irqchip->irq_enable  = NULL;
 		gpiochip->irqchip = NULL;
 	}
 
@@ -1814,6 +1832,11 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		irqchip->irq_request_resources = gpiochip_irq_reqres;
 		irqchip->irq_release_resources = gpiochip_irq_relres;
 	}
+	if (!irqchip->irq_disable &&
+	    !irqchip->irq_enable) {
+		irqchip->irq_disable = gpiochip_irq_disable;
+		irqchip->irq_enable  = gpiochip_irq_enable;
+	}
 
 	/*
 	 * Prepare the mapping since the irqchip shall be orthogonal to
