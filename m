From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 1/7] irq/irq_sim: provide irq_sim_get_type()
Date: Tue, 12 Feb 2019 14:15:54 +0100
Message-ID: <20190212131600.18960-2-brgl@bgdev.pl>
References: <20190212131600.18960-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212131600.18960-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a helper that allows users to retrieve the current irq type
of dummy interrupts.

Internally: store the type in the line context when the irq_set_type()
callback is called.

This is required by the gpio-mockup module which wants to track the
state of GPIO lines and simulate rising and falling edge interrupts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq_sim.h |  2 ++
 kernel/irq/irq_sim.c    | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index 4500d453a63e..c73be0a2c15c 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -22,6 +22,7 @@ struct irq_sim_work_ctx {
 struct irq_sim_irq_ctx {
 	int			irqnum;
 	bool			enabled;
+	int			type;
 };
 
 struct irq_sim {
@@ -37,5 +38,6 @@ int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
 void irq_sim_fini(struct irq_sim *sim);
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
+unsigned int irq_sim_get_type(struct irq_sim *sim, unsigned int offset);
 
 #endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 98a20e1594ce..74561a0dca65 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,10 +25,20 @@ static void irq_sim_irqunmask(struct irq_data *data)
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
 static struct irq_chip irq_sim_irqchip = {
 	.name		= "irq_sim",
 	.irq_mask	= irq_sim_irqmask,
 	.irq_unmask	= irq_sim_irqunmask,
+	.irq_set_type	= irq_sim_set_type,
 };
 
 static void irq_sim_handle_irq(struct irq_work *work)
@@ -180,3 +190,16 @@ int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
 	return sim->irqs[offset].irqnum;
 }
 EXPORT_SYMBOL_GPL(irq_sim_irqnum);
+
+/**
+ * irq_sim_get_type - Get the type configuration for a dummy interrupt.
+ *
+ * @sim:        The interrupt simulator object.
+ * @offset:     Offset of the simulated interrupt for which to retrieve
+ *              the type.
+ */
+unsigned int irq_sim_get_type(struct irq_sim *sim, unsigned int offset)
+{
+	return sim->irqs[offset].type;
+}
+EXPORT_SYMBOL_GPL(irq_sim_get_type);
-- 
2.20.1
