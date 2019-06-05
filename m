From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/2] gpio: davinci: Fix the compiler warning with ARM64 config enabled
Date: Wed, 5 Jun 2019 11:25:18 +0530
Message-ID: <20190605055519.24079-2-j-keerthy@ti.com>
References: <20190605055519.24079-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605055519.24079-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: lokeshvutla@ti.com, linux-gpio@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Fix the compiler warning with ARM64 config enabled
as the current mask assumes 32 bit by default.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 3bbf5804bd11..0977590eb996 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -297,7 +297,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 static void gpio_irq_disable(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
-	u32 mask = (u32) irq_data_get_irq_handler_data(d);
+	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 
 	writel_relaxed(mask, &g->clr_falling);
 	writel_relaxed(mask, &g->clr_rising);
@@ -306,7 +306,7 @@ static void gpio_irq_disable(struct irq_data *d)
 static void gpio_irq_enable(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
-	u32 mask = (u32) irq_data_get_irq_handler_data(d);
+	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
 	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
@@ -447,7 +447,7 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 				"davinci_gpio");
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 	irq_set_chip_data(irq, (__force void *)g);
-	irq_set_handler_data(irq, (void *)__gpio_mask(hw));
+	irq_set_handler_data(irq, (void *)(uintptr_t)__gpio_mask(hw));
 
 	return 0;
 }
-- 
2.17.1
