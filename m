From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Tue, 20 Nov 2018 14:40:31 +0100
Message-ID: <20181120134032.31645-2-brgl@bgdev.pl>
References: <20181120134032.31645-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120134032.31645-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The irq_sim irqchip doesn't allow to configure the sensitivity so every
call to irq_sim_fire() fires a dummy interrupt. This used to not matter
for gpio-mockup (one of the irq_sim users) until commit fa38869b0161
("gpiolib: Don't support irq sharing for userspace") which made it
impossible for gpio-mockup to ignore certain events (e.g. only receive
notifications about rising edge events).

Introduce a specialized variant of irq_sim_fire() which takes another
argument called edge. allowing to specify the trigger type for the
dummy interrupt.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h |  2 ++
 kernel/irq/irq_sim.c    | 30 ++++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index 4500d453a63e..f55148e77792 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -22,6 +22,7 @@ struct irq_sim_work_ctx {
 struct irq_sim_irq_ctx {
 	int			irqnum;
 	bool			enabled;
+	int			edge;
 };
 
 struct irq_sim {
@@ -36,6 +37,7 @@ int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
 		      unsigned int num_irqs);
 void irq_sim_fini(struct irq_sim *sim);
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
+void irq_sim_fire_edge(struct irq_sim *sim, unsigned int offset, int edge);
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
 
 #endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 98a20e1594ce..a9330050f751 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,10 +25,20 @@ static void irq_sim_irqunmask(struct irq_data *data)
 	irq_ctx->enabled = true;
 }
 
+static int irq_sim_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+
+	irq_ctx->edge = type & IRQ_TYPE_EDGE_BOTH;
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
@@ -161,12 +171,28 @@ EXPORT_SYMBOL_GPL(devm_irq_sim_init);
  */
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
 {
-	if (sim->irqs[offset].enabled) {
+	/* Don't care about the edge. */
+	irq_sim_fire_edge(sim, offset, IRQ_TYPE_EDGE_BOTH);
+}
+EXPORT_SYMBOL_GPL(irq_sim_fire);
+
+/**
+ * irq_sim_fire_edge - Enqueue an interrupt, specify the edge.
+ *
+ * @sim:        The interrupt simulator object.
+ * @offset:     Offset of the simulated interrupt which should be fired.
+ * edge:        Edge of the interrupt (IRQ_TYPE_EDGE_RISING/FALLING).
+ */
+void irq_sim_fire_edge(struct irq_sim *sim, unsigned int offset, int edge)
+{
+	struct irq_sim_irq_ctx *irq = &sim->irqs[offset];
+
+	if (irq->enabled && (irq->edge & edge)) {
 		set_bit(offset, sim->work_ctx.pending);
 		irq_work_queue(&sim->work_ctx.work);
 	}
 }
-EXPORT_SYMBOL_GPL(irq_sim_fire);
+EXPORT_SYMBOL_GPL(irq_sim_fire_edge);
 
 /**
  * irq_sim_irqnum - Get the allocated number of a dummy interrupt.
-- 
2.19.1
