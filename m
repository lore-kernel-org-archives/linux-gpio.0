From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 3/9] irq/irq_sim: provide irq_sim_get_type()
Date: Wed, 23 Jan 2019 15:15:32 +0100
Message-ID: <20190123141538.29408-4-brgl@bgdev.pl>
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

Provide a helper that allows users to retrieve the configured flow type
of dummy interrupts. That allows certain users to decide whether an irq
needs to be fired depending on its edge/level/... configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h |  2 ++
 kernel/irq/irq_sim.c    | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index b96c2f752320..782dfc599632 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -23,6 +23,7 @@ struct irq_sim_work_ctx {
 
 struct irq_sim_irq_ctx {
 	bool			enabled;
+	unsigned int		type;
 };
 
 struct irq_sim {
@@ -39,5 +40,6 @@ int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
 void irq_sim_fini(struct irq_sim *sim);
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
+int irq_sim_get_type(struct irq_sim *sim, unsigned int offset);
 
 #endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 2bcdbab1bc5a..9168e7100559 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,6 +25,15 @@ static void irq_sim_irqunmask(struct irq_data *data)
 	irq_ctx->enabled = true;
 }
 
+static int irq_sim_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+
+	irq_ctx->type = type;
+
+	return 0;
+}
+
 static void irq_sim_handle_irq(struct irq_work *work)
 {
 	struct irq_sim_work_ctx *work_ctx;
@@ -107,6 +116,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
 	sim->chip.name = "irq_sim";
 	sim->chip.irq_mask = irq_sim_irqmask;
 	sim->chip.irq_unmask = irq_sim_irqunmask;
+	sim->chip.irq_set_type = irq_sim_set_type;
 
 	sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
 	if (!sim->work_ctx.pending) {
@@ -220,3 +230,18 @@ int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
 	return irq_find_mapping(sim->domain, offset);
 }
 EXPORT_SYMBOL_GPL(irq_sim_irqnum);
+
+/**
+ * irq_sim_get_type - Get the configured flow type of a dummy interrupt.
+ *
+ * @sim:        The interrupt simulator object.
+ * @offset:     Offset of the simulated interrupt for which to retrieve
+ *              the type.
+ */
+int irq_sim_get_type(struct irq_sim *sim, unsigned int offset)
+{
+	struct irq_sim_irq_ctx *ctx = irq_sim_get_ctx(sim, offset);
+
+	return ctx->type;
+}
+EXPORT_SYMBOL_GPL(irq_sim_get_type);
-- 
2.19.1
