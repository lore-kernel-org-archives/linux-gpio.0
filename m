From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] gpio: Fix potentially NULL handler data passed to chained irqchip handler
Date: Tue, 16 Sep 2014 16:23:15 +0300
Message-ID: <1410873795-31980-1-git-send-email-jarkko.nikula@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

There is possibility with misconfigured pins that interrupt occurs instantly
after setting irq_set_chained_handler() in gpiochip_set_chained_irqchip().
Now if handler gets called before irq_set_handler_data() the handler gets
NULL handler data.

Fix this by moving irq_set_handler_data() call before
irq_set_chained_handler() in gpiochip_set_chained_irqchip().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Stable <stable@vger.kernel.org> # 3.15+
---
I noticed this while debugging why commit e1ee5c578fb1 ("pinctrl: baytrail:
Convert to use gpiolib irqchip") was showing a regression on a development
machine with a few misconfigured pins by the BIOS. For those pins
drivers/pinctrl/pinctrl-baytrail.c: byt_gpio_irq_handler() was often called
instantly with handler data being NULL and dummy if (vg == NULL) return;
test there didn't allow code further in byt_gpio_irq_handler() to disable
those flooding pins.
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 15cc0bb65dda..ed3f518e4337 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -413,12 +413,12 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		return;
 	}
 
-	irq_set_chained_handler(parent_irq, parent_handler);
 	/*
 	 * The parent irqchip is already using the chip_data for this
 	 * irqchip, so our callbacks simply use the handler_data.
 	 */
 	irq_set_handler_data(parent_irq, gpiochip);
+	irq_set_chained_handler(parent_irq, parent_handler);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
-- 
2.1.0
