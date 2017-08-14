From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 1/3] irq/irq_sim: add a simple interrupt simulator framework
Date: Mon, 14 Aug 2017 16:53:16 +0200
Message-ID: <20170814145318.6495-2-brgl@bgdev.pl>
References: <20170814145318.6495-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814145318.6495-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Implement a simple, irq_work-based framework for simulating
interrupts. Currently the API exposes routines for initializing and
deinitializing the simulator object, enqueueing the interrupts and
retrieving the allocated interrupt numbers based on the offset of the
dummy interrupt in the simulator struct.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/linux/irq_sim.h |  44 ++++++++++++++++++
 kernel/irq/Kconfig      |   5 ++
 kernel/irq/Makefile     |   1 +
 kernel/irq/irq_sim.c    | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 include/linux/irq_sim.h
 create mode 100644 kernel/irq/irq_sim.c

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
new file mode 100644
index 000000000000..9ee1a4f8bd94
--- /dev/null
+++ b/include/linux/irq_sim.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef _LINUX_IRQ_SIM_H
+#define _LINUX_IRQ_SIM_H
+
+#include <linux/irq_work.h>
+
+/*
+ * Provides a framework for allocating simulated interrupts which can be
+ * requested like normal irqs and enqueued from process context.
+ */
+
+struct irq_sim_work_ctx {
+	struct irq_work work;
+	int irq;
+};
+
+struct irq_sim_irq_ctx {
+	int irqnum;
+	bool enabled;
+};
+
+struct irq_sim {
+	struct irq_sim_work_ctx work_ctx;
+	int irq_base;
+	unsigned int irq_count;
+	struct irq_sim_irq_ctx *irqs;
+};
+
+int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
+void irq_sim_fini(struct irq_sim *sim);
+
+void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
+
+int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
+
+#endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 27c4e774071c..1d06af787932 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -63,6 +63,11 @@ config GENERIC_IRQ_CHIP
 config IRQ_DOMAIN
 	bool
 
+# Support for simulated interrupts
+config IRQ_SIM
+	bool
+	select IRQ_WORK
+
 # Support for hierarchical irq domains
 config IRQ_DOMAIN_HIERARCHY
 	bool
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index e4aef7351f2b..1970cafe8f2a 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_IRQ_TIMINGS) += timings.o
 obj-$(CONFIG_GENERIC_IRQ_CHIP) += generic-chip.o
 obj-$(CONFIG_GENERIC_IRQ_PROBE) += autoprobe.o
 obj-$(CONFIG_IRQ_DOMAIN) += irqdomain.o
+obj-$(CONFIG_IRQ_SIM) += irq_sim.o
 obj-$(CONFIG_PROC_FS) += proc.o
 obj-$(CONFIG_GENERIC_PENDING_IRQ) += migration.o
 obj-$(CONFIG_GENERIC_IRQ_MIGRATION) += cpuhotplug.o
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
new file mode 100644
index 000000000000..31a2c12a79ae
--- /dev/null
+++ b/kernel/irq/irq_sim.c
@@ -0,0 +1,121 @@
+/*
+ * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/irq_sim.h>
+#include <linux/irq.h>
+
+static void irq_sim_irqmask(struct irq_data *data)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+
+	irq_ctx->enabled = false;
+}
+
+static void irq_sim_irqunmask(struct irq_data *data)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+
+	irq_ctx->enabled = true;
+}
+
+static struct irq_chip irq_sim_irqchip = {
+	.name		= "irq_sim",
+	.irq_mask	= irq_sim_irqmask,
+	.irq_unmask	= irq_sim_irqunmask,
+};
+
+static void irq_sim_handle_irq(struct irq_work *work)
+{
+	struct irq_sim_work_ctx *work_ctx;
+
+	work_ctx = container_of(work, struct irq_sim_work_ctx, work);
+	handle_simple_irq(irq_to_desc(work_ctx->irq));
+}
+
+/**
+ * irq_sim_init - Initialize the interrupt simulator: allocate a range of
+ *                dummy interrupts.
+ *
+ * @sim:        The interrupt simulator object to initialize.
+ * @num_irqs:   Number of interrupts to allocate
+ *
+ * Returns 0 on success and a negative error number on failure.
+ */
+int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
+{
+	int i;
+
+	sim->irqs = kmalloc_array(num_irqs, sizeof(*sim->irqs), GFP_KERNEL);
+	if (!sim->irqs)
+		return -ENOMEM;
+
+	sim->irq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
+	if (sim->irq_base < 0) {
+		kfree(sim->irqs);
+		return sim->irq_base;
+	}
+
+	for (i = 0; i < num_irqs; i++) {
+		sim->irqs[i].irqnum = sim->irq_base + i;
+		sim->irqs[i].enabled = false;
+		irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
+		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
+		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
+		irq_modify_status(sim->irq_base + i,
+				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
+	}
+
+	init_irq_work(&sim->work_ctx.work, irq_sim_handle_irq);
+	sim->irq_count = num_irqs;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(irq_sim_init);
+
+/**
+ * irq_sim_fini - Deinitialize the interrupt simulator: free the interrupt
+ *                descriptors and allocated memory.
+ *
+ * @sim:        The interrupt simulator to tear down.
+ */
+void irq_sim_fini(struct irq_sim *sim)
+{
+	irq_work_sync(&sim->work_ctx.work);
+	irq_free_descs(sim->irq_base, sim->irq_count);
+	kfree(sim->irqs);
+}
+EXPORT_SYMBOL_GPL(irq_sim_fini);
+
+/**
+ * irq_sim_fire - Enqueue an interrupt.
+ *
+ * @sim:        The interrupt simulator object.
+ * @offset:     Offset of the simulated interrupt which should be fired.
+ */
+void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
+{
+	if (sim->irqs[offset].enabled) {
+		sim->work_ctx.irq = irq_sim_irqnum(sim, offset);
+		irq_work_queue(&sim->work_ctx.work);
+	}
+}
+EXPORT_SYMBOL_GPL(irq_sim_fire);
+
+/**
+ * irq_sim_irqnum - Get the allocated number of a dummy interrupt.
+ *
+ * @sim:        The interrupt simulator object.
+ * @offset:     Offset of the simulated interrupt for which to retrieve
+ *              the number.
+ */
+int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
+{
+	return sim->irqs[offset].irqnum;
+}
+EXPORT_SYMBOL_GPL(irq_sim_irqnum);
-- 
2.13.2
