From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpiolib: drop irq_base field from gpio_chip struct
Date: Mon, 9 Oct 2017 17:16:05 -0500
Message-ID: <20171009221605.19108-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Hence, the last user of irq_base field was removed by commit b4c495f03ae3
("gpio: mockup: use irq_sim") it can be removed safely.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 include/linux/gpio/driver.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c97f832..1de5dd1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -165,7 +165,6 @@ struct gpio_chip {
 	 */
 	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
-	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-- 
2.10.5
