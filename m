From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 4/4] gpio: Clarify kerneldoc on gpiochip_set_chained_irqchip()
Date: Mon,  8 Oct 2018 09:32:16 -0700
Message-ID: <20181008163216.97436-5-swboyd@chromium.org>
References: <20181008163216.97436-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008163216.97436-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Evan Green <evgreen@chromium.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

This doesn't support nested anymore, so drivers shouldn't call it with
the handler set to NULL.

Cc: Evan Green <evgreen@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 37c6fc73b179..1729d0f698e7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1693,8 +1693,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
  * @parent_irq: the irq number corresponding to the parent IRQ for this
  * chained irqchip
  * @parent_handler: the parent interrupt handler for the accumulated IRQ
- * coming out of the gpiochip. If the interrupt is nested rather than
- * cascaded, pass NULL in this handler argument
+ * coming out of the gpiochip.
  */
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 				  struct irq_chip *irqchip,
-- 
Sent by a computer through tubes
