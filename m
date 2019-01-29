From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/9] irq/irq_sim: use irq domain
Date: Tue, 29 Jan 2019 09:44:04 +0100
Message-ID: <20190129084411.30495-3-brgl@bgdev.pl>
References: <20190129084411.30495-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129084411.30495-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Delegate the offset to virq number mapping to the provided framework
instead of handling it locally. Use the legacy domain as we want to
preallocate the irq descriptors.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h |  6 +--
 kernel/irq/irq_sim.c    | 94 +++++++++++++++++++++++++++++------------
 2 files changed, 71 insertions(+), 29 deletions(-)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index eda132c22b57..b96c2f752320 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -8,6 +8,7 @@
 
 #include <linux/irq.h>
 #include <linux/irq_work.h>
+#include <linux/irqdomain.h>
 #include <linux/device.h>
 
 /*
@@ -21,16 +22,15 @@ struct irq_sim_work_ctx {
 };
 
 struct irq_sim_irq_ctx {
-	int			irqnum;
 	bool			enabled;
 };
 
 struct irq_sim {
 	struct irq_chip		chip;
+	struct irq_domain	*domain;
 	struct irq_sim_work_ctx	work_ctx;
-	int			irq_base;
+	int			virq_base;
 	unsigned int		irq_count;
-	struct irq_sim_irq_ctx	*irqs;
 };
 
 int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index b732e4e2e45b..2bcdbab1bc5a 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -44,6 +44,43 @@ static void irq_sim_handle_irq(struct irq_work *work)
 	}
 }
 
+static int irq_sim_domain_map(struct irq_domain *domain,
+			      unsigned int virq, irq_hw_number_t hw)
+{
+	struct irq_sim *sim = domain->host_data;
+	struct irq_sim_irq_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	irq_set_chip(virq, &sim->chip);
+	irq_set_chip_data(virq, ctx);
+	irq_set_handler(virq, handle_simple_irq);
+	irq_modify_status(virq, IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
+
+	return 0;
+}
+
+static void irq_sim_domain_free(struct irq_domain *domain,
+				unsigned int virq, unsigned int num_irqs)
+{
+	struct irq_sim_irq_ctx *ctx;
+	struct irq_data *irq;
+	int i;
+
+	for (i = 0; i < num_irqs; i++) {
+		irq = irq_domain_get_irq_data(domain, virq + i);
+		ctx = irq_data_get_irq_chip_data(irq);
+		kfree(ctx);
+	}
+}
+
+static const struct irq_domain_ops irq_sim_domain_ops = {
+	.map = irq_sim_domain_map,
+	.free = irq_sim_domain_free,
+};
+
 /**
  * irq_sim_init - Initialize the interrupt simulator: allocate a range of
  *                dummy interrupts.
@@ -56,16 +93,15 @@ static void irq_sim_handle_irq(struct irq_work *work)
  */
 int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 {
-	int i;
-
-	sim->irqs = kmalloc_array(num_irqs, sizeof(*sim->irqs), GFP_KERNEL);
-	if (!sim->irqs)
+	sim->virq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
+	if (sim->virq_base < 0)
+		return sim->virq_base;
+
+	sim->domain = irq_domain_add_legacy(NULL, num_irqs, sim->virq_base,
+					    0, &irq_sim_domain_ops, sim);
+	if (!sim->domain) {
+		irq_free_descs(sim->virq_base, num_irqs);
 		return -ENOMEM;
-
-	sim->irq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
-	if (sim->irq_base < 0) {
-		kfree(sim->irqs);
-		return sim->irq_base;
 	}
 
 	sim->chip.name = "irq_sim";
@@ -74,25 +110,15 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 
 	sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
 	if (!sim->work_ctx.pending) {
-		kfree(sim->irqs);
-		irq_free_descs(sim->irq_base, num_irqs);
+		irq_domain_remove(sim->domain);
+		irq_free_descs(sim->virq_base, num_irqs);
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < num_irqs; i++) {
-		sim->irqs[i].irqnum = sim->irq_base + i;
-		sim->irqs[i].enabled = false;
-		irq_set_chip(sim->irq_base + i, &sim->chip);
-		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
-		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
-		irq_modify_status(sim->irq_base + i,
-				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
-	}
-
 	init_irq_work(&sim->work_ctx.work, irq_sim_handle_irq);
 	sim->irq_count = num_irqs;
 
-	return sim->irq_base;
+	return sim->virq_base;
 }
 EXPORT_SYMBOL_GPL(irq_sim_init);
 
@@ -106,8 +132,8 @@ void irq_sim_fini(struct irq_sim *sim)
 {
 	irq_work_sync(&sim->work_ctx.work);
 	bitmap_free(sim->work_ctx.pending);
-	irq_free_descs(sim->irq_base, sim->irq_count);
-	kfree(sim->irqs);
+	irq_domain_free_irqs(sim->virq_base, sim->irq_count);
+	irq_domain_remove(sim->domain);
 }
 EXPORT_SYMBOL_GPL(irq_sim_fini);
 
@@ -151,6 +177,20 @@ int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
 }
 EXPORT_SYMBOL_GPL(devm_irq_sim_init);
 
+static struct irq_sim_irq_ctx *
+irq_sim_get_ctx(struct irq_sim *sim, unsigned int offset)
+{
+	struct irq_sim_irq_ctx *ctx;
+	struct irq_data *irq;
+	int virq;
+
+	virq = irq_find_mapping(sim->domain, offset);
+	irq = irq_domain_get_irq_data(sim->domain, virq);
+	ctx = irq_data_get_irq_chip_data(irq);
+
+	return ctx;
+}
+
 /**
  * irq_sim_fire - Enqueue an interrupt.
  *
@@ -159,7 +199,9 @@ EXPORT_SYMBOL_GPL(devm_irq_sim_init);
  */
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
 {
-	if (sim->irqs[offset].enabled) {
+	struct irq_sim_irq_ctx *ctx = irq_sim_get_ctx(sim, offset);
+
+	if (ctx->enabled) {
 		set_bit(offset, sim->work_ctx.pending);
 		irq_work_queue(&sim->work_ctx.work);
 	}
@@ -175,6 +217,6 @@ EXPORT_SYMBOL_GPL(irq_sim_fire);
  */
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
 {
-	return sim->irqs[offset].irqnum;
+	return irq_find_mapping(sim->domain, offset);
 }
 EXPORT_SYMBOL_GPL(irq_sim_irqnum);
-- 
2.19.1
