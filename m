From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/9] irq/irq_sim: don't share the irq_chip structure between simulators
Date: Wed, 23 Jan 2019 15:15:30 +0100
Message-ID: <20190123141538.29408-2-brgl@bgdev.pl>
References: <20190123141538.29408-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123141538.29408-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want to support multiple instances of irq_sim. Make struct irq_chip
part of the irq_sim structure.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h |  2 ++
 kernel/irq/irq_sim.c    | 12 +++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index 4500d453a63e..eda132c22b57 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -6,6 +6,7 @@
 #ifndef _LINUX_IRQ_SIM_H
 #define _LINUX_IRQ_SIM_H
 
+#include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/device.h>
 
@@ -25,6 +26,7 @@ struct irq_sim_irq_ctx {
 };
 
 struct irq_sim {
+	struct irq_chip		chip;
 	struct irq_sim_work_ctx	work_ctx;
 	int			irq_base;
 	unsigned int		irq_count;
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 98a20e1594ce..b732e4e2e45b 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,12 +25,6 @@ static void irq_sim_irqunmask(struct irq_data *data)
 	irq_ctx->enabled = true;
 }
 
-static struct irq_chip irq_sim_irqchip = {
-	.name		= "irq_sim",
-	.irq_mask	= irq_sim_irqmask,
-	.irq_unmask	= irq_sim_irqunmask,
-};
-
 static void irq_sim_handle_irq(struct irq_work *work)
 {
 	struct irq_sim_work_ctx *work_ctx;
@@ -74,6 +68,10 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 		return sim->irq_base;
 	}
 
+	sim->chip.name = "irq_sim";
+	sim->chip.irq_mask = irq_sim_irqmask;
+	sim->chip.irq_unmask = irq_sim_irqunmask;
+
 	sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
 	if (!sim->work_ctx.pending) {
 		kfree(sim->irqs);
@@ -84,7 +82,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 	for (i = 0; i < num_irqs; i++) {
 		sim->irqs[i].irqnum = sim->irq_base + i;
 		sim->irqs[i].enabled = false;
-		irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
+		irq_set_chip(sim->irq_base + i, &sim->chip);
 		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
 		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
 		irq_modify_status(sim->irq_base + i,
-- 
2.19.1
