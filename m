From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 3/4] gpio: Remove unused 'irqchip' argument to gpiochip_set_cascaded_irqchip()
Date: Mon,  8 Oct 2018 09:32:15 -0700
Message-ID: <20181008163216.97436-4-swboyd@chromium.org>
References: <20181008163216.97436-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008163216.97436-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Evan Green <evgreen@chromium.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

This argument hasn't ever been used since it was introduced in commit
1425052097b5 ("gpio: add IRQ chip helpers in gpiolib"). Let's drop it to
reduce reading confusion.

Cc: Evan Green <evgreen@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8fccfcf559ee..37c6fc73b179 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1651,7 +1651,6 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
 /**
  * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
  * @gpiochip: the gpiochip to set the irqchip chain to
- * @irqchip: the irqchip to chain to the gpiochip
  * @parent_irq: the irq number corresponding to the parent IRQ for this
  * chained irqchip
  * @parent_handler: the parent interrupt handler for the accumulated IRQ
@@ -1659,7 +1658,6 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
  * cascaded, pass NULL in this handler argument
  */
 static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
-					  struct irq_chip *irqchip,
 					  unsigned int parent_irq,
 					  irq_flow_handler_t parent_handler)
 {
@@ -1708,8 +1706,7 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		return;
 	}
 
-	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
-				      parent_handler);
+	gpiochip_set_cascaded_irqchip(gpiochip, parent_irq, parent_handler);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
@@ -1724,8 +1721,7 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
-				      NULL);
+	gpiochip_set_cascaded_irqchip(gpiochip, parent_irq, NULL);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
 
-- 
Sent by a computer through tubes
