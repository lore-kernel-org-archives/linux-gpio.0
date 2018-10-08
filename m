From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 2/4] gpio: Drop parent irq assignment during cascade setup
Date: Mon,  8 Oct 2018 09:32:14 -0700
Message-ID: <20181008163216.97436-3-swboyd@chromium.org>
References: <20181008163216.97436-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008163216.97436-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Evan Green <evgreen@chromium.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

We want to set the irq parent for interrupts that we're setting up to be
cascaded from another interrupt controller, but we may or may not have
already mapped the gpiochip irqs into the kernel's virtual irq number
space at this point. If we have mapped irqs before calling here, then
we've gone through gpiochip_irq_map() and called irq_set_parent()
already. If we haven't mapped irqs, then the gpiochip is dynamically
mapping irqs and we can rely on gpiochip_irq_map() or the gpio driver's
irqdomain ops to setup the irq parent properly.

Either way, setting the parent here when cascading the gpiochip doesn't
make much sense because it should be done at irq mapping time. In the
dynamic mapping case, this code is mapping virq 0 to some parent virq in
a loop. While that's benign, let's drop this code to simplify.

Cc: Evan Green <evgreen@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d9d823e3761b..8fccfcf559ee 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1663,8 +1663,6 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 					  unsigned int parent_irq,
 					  irq_flow_handler_t parent_handler)
 {
-	unsigned int offset;
-
 	if (!gpiochip->irq.domain) {
 		chip_err(gpiochip, "called %s before setting up irqchip\n",
 			 __func__);
@@ -1688,14 +1686,6 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		gpiochip->irq.parents = &gpiochip->irq.parent_irq;
 		gpiochip->irq.num_parents = 1;
 	}
-
-	/* Set the parent IRQ for all affected IRQs */
-	for (offset = 0; offset < gpiochip->ngpio; offset++) {
-		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
-			continue;
-		irq_set_parent(irq_find_mapping(gpiochip->irq.domain, offset),
-			       parent_irq);
-	}
 }
 
 /**
-- 
Sent by a computer through tubes
