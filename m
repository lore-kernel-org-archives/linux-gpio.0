From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 1/7] irq/irq_sim: add a notifier chain
Date: Thu, 14 Feb 2019 14:42:26 +0100
Message-ID: <20190214134232.3821-2-brgl@bgdev.pl>
References: <20190214134232.3821-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214134232.3821-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a helper allowing users to register a notifier block with
a simulator. For now the only event we're notifying about is a change
in type configuration.

This is required by the gpio-mockup module which wants to track the
state of GPIO lines and simulate rising and falling edge interrupts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h | 22 ++++++++++++++++++----
 kernel/irq/irq_sim.c    | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index 4500d453a63e..e076693d0af7 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -8,12 +8,21 @@
 
 #include <linux/irq_work.h>
 #include <linux/device.h>
+#include <linux/notifier.h>
 
 /*
  * Provides a framework for allocating simulated interrupts which can be
  * requested like normal irqs and enqueued from process context.
  */
 
+#define IRQ_SIM_TYPE_CHANGED	1
+
+/* Passed to notifier callbacks when type changes. */
+struct irq_sim_irq_type {
+	unsigned int		offset;
+	unsigned int		type;
+};
+
 struct irq_sim_work_ctx {
 	struct irq_work		work;
 	unsigned long		*pending;
@@ -22,13 +31,16 @@ struct irq_sim_work_ctx {
 struct irq_sim_irq_ctx {
 	int			irqnum;
 	bool			enabled;
+	struct irq_sim		*parent;
+	struct irq_sim_irq_type	type;
 };
 
 struct irq_sim {
-	struct irq_sim_work_ctx	work_ctx;
-	int			irq_base;
-	unsigned int		irq_count;
-	struct irq_sim_irq_ctx	*irqs;
+	struct irq_sim_work_ctx		work_ctx;
+	int				irq_base;
+	unsigned int			irq_count;
+	struct irq_sim_irq_ctx		*irqs;
+	struct atomic_notifier_head	notifier;
 };
 
 int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
@@ -37,5 +49,7 @@ int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
 void irq_sim_fini(struct irq_sim *sim);
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
+int irq_sim_notifier_register(struct irq_sim *sim,
+			      struct notifier_block *nb);
 
 #endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 98a20e1594ce..a55641e78125 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,10 +25,34 @@ static void irq_sim_irqunmask(struct irq_data *data)
 	irq_ctx->enabled = true;
 }
 
+static int irq_sim_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+	struct irq_sim *sim = irq_ctx->parent;
+	int rv;
+
+	/* Only support rising and falling edge types. */
+	if (type & ~IRQ_TYPE_EDGE_BOTH)
+		return -EINVAL;
+
+	irq_ctx->type.type = type;
+
+	rv = atomic_notifier_call_chain(&sim->notifier,
+					IRQ_SIM_TYPE_CHANGED,
+					&irq_ctx->type);
+	if (rv < 0) {
+		pr_err("%s: error calling the type notifier chain\n", __func__);
+		return rv;
+	}
+
+	return 0;
+}
+
 static struct irq_chip irq_sim_irqchip = {
 	.name		= "irq_sim",
 	.irq_mask	= irq_sim_irqmask,
 	.irq_unmask	= irq_sim_irqunmask,
+	.irq_set_type	= irq_sim_set_type,
 };
 
 static void irq_sim_handle_irq(struct irq_work *work)
@@ -83,7 +107,9 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 
 	for (i = 0; i < num_irqs; i++) {
 		sim->irqs[i].irqnum = sim->irq_base + i;
+		sim->irqs[i].parent = sim;
 		sim->irqs[i].enabled = false;
+		sim->irqs[i].type.offset = i;
 		irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
 		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
 		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
@@ -91,6 +117,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
 	}
 
+	ATOMIC_INIT_NOTIFIER_HEAD(&sim->notifier);
 	init_irq_work(&sim->work_ctx.work, irq_sim_handle_irq);
 	sim->irq_count = num_irqs;
 
@@ -180,3 +207,16 @@ int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
 	return sim->irqs[offset].irqnum;
 }
 EXPORT_SYMBOL_GPL(irq_sim_irqnum);
+
+/**
+ * irq_sim_notifier_register - Subscribe for interrupt simulator events.
+ *
+ * @sim:       The interrupt simulator object.
+ * @nb:        Notifier block.
+ */
+int irq_sim_notifier_register(struct irq_sim *sim,
+			      struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&sim->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(irq_sim_notifier_register);
-- 
2.20.1
