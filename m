From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 2/3] irq/irq_sim: add a devres variant of irq_sim_init()
Date: Mon, 14 Aug 2017 13:20:55 +0200
Message-ID: <20170814112056.3751-3-brgl@bgdev.pl>
References: <20170814112056.3751-1-brgl@bgdev.pl>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170814112056.3751-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Add a resource managed version of irq_sim_init(). This can be
conveniently used in device drivers.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/driver-model/devres.txt |  1 +
 include/linux/irq_sim.h               |  4 ++++
 kernel/irq_sim.c                      | 43 +++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 30e04f7a690d..69f08c0f23a8 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -312,6 +312,7 @@ IRQ
   devm_irq_alloc_descs_from()
   devm_irq_alloc_generic_chip()
   devm_irq_setup_generic_chip()
+  devm_irq_sim_init()
 
 LED
   devm_led_classdev_register()
diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index 9ee1a4f8bd94..9ad634fcc662 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -11,6 +11,7 @@
 #define _LINUX_IRQ_SIM_H
 
 #include <linux/irq_work.h>
+#include <linux/device.h>
 
 /*
  * Provides a framework for allocating simulated interrupts which can be
@@ -37,6 +38,9 @@ struct irq_sim {
 int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
 void irq_sim_fini(struct irq_sim *sim);
 
+int devm_irq_sim_init(struct device *dev,
+		      struct irq_sim *sim, unsigned int num_irqs);
+
 void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
 
 int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
diff --git a/kernel/irq_sim.c b/kernel/irq_sim.c
index 31a2c12a79ae..3daa10d62a27 100644
--- a/kernel/irq_sim.c
+++ b/kernel/irq_sim.c
@@ -92,6 +92,49 @@ void irq_sim_fini(struct irq_sim *sim)
 }
 EXPORT_SYMBOL_GPL(irq_sim_fini);
 
+struct irq_sim_devres {
+	struct irq_sim *sim;
+};
+
+static void devm_irq_sim_release(struct device *dev, void *res)
+{
+	struct irq_sim_devres *this = res;
+
+	irq_sim_fini(this->sim);
+}
+
+/**
+ * irq_sim_init - Initialize the interrupt simulator for a managed device.
+ *
+ * @dev:        Device to initialize the simulator object for.
+ * @sim:        The interrupt simulator object to initialize.
+ * @num_irqs:   Number of interrupts to allocate
+ *
+ * Returns 0 on success and a negative error number on failure.
+ */
+int devm_irq_sim_init(struct device *dev,
+		      struct irq_sim *sim, unsigned int num_irqs)
+{
+	struct irq_sim_devres *dr;
+	int rv;
+
+	dr = devres_alloc(devm_irq_sim_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	rv = irq_sim_init(sim, num_irqs);
+	if (rv) {
+		devres_free(dr);
+		return rv;
+	}
+
+	dr->sim = sim;
+	devres_add(dev, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_irq_sim_init);
+
 /**
  * irq_sim_fire - Enqueue an interrupt.
  *
-- 
2.13.2

