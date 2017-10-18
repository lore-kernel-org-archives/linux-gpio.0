From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] gpiolib: clear irq handler and data in one go
Date: Wed, 18 Oct 2017 18:32:47 +0200
Message-ID: <1508344367-572-1-git-send-email-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: linux-gpio@vger.kernel.org

Replace the two separate calls for clearing the irqchip's chained handler
and its data with a single irq_set_chained_handler_and_data() call.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac..809654a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1718,8 +1718,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	acpi_gpiochip_free_interrupts(gpiochip);
 
 	if (gpiochip->irq_chained_parent) {
-		irq_set_chained_handler(gpiochip->irq_chained_parent, NULL);
-		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
+		irq_set_chained_handler_and_data(
+			gpiochip->irq_chained_parent, NULL, NULL);
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
-- 
2.1.4
