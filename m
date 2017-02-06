From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/7] irqdesc: add memory managed version of irq_alloc_descs()
Date: Mon,  6 Feb 2017 13:10:38 +0100
Message-ID: <1486383041-16758-5-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36544 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751813AbdBFMKv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 07:10:51 -0500
Received: by mail-wm0-f46.google.com with SMTP id c85so117355564wmi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 04:10:50 -0800 (PST)
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a devres flavor of __devm_irq_alloc_descs() and corresponding
helper macros.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irq.h | 19 +++++++++++++++++++
 kernel/irq/devres.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index e798755..d915cae 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -715,6 +715,10 @@ unsigned int arch_dynirq_lower_bound(unsigned int from);
 int __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
 		      struct module *owner, const struct cpumask *affinity);
 
+int __devm_irq_alloc_descs(struct device *dev, int irq, unsigned int from,
+			   unsigned int cnt, int node, struct module *owner,
+			   const struct cpumask *affinity);
+
 /* use macros to avoid needing export.h for THIS_MODULE */
 #define irq_alloc_descs(irq, from, cnt, node)	\
 	__irq_alloc_descs(irq, from, cnt, node, THIS_MODULE, NULL)
@@ -731,6 +735,21 @@ int __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
 #define irq_alloc_descs_from(from, cnt, node)	\
 	irq_alloc_descs(-1, from, cnt, node)
 
+#define devm_irq_alloc_descs(dev, irq, from, cnt, node)		\
+	__devm_irq_alloc_descs(dev, irq, from, cnt, node, THIS_MODULE, NULL)
+
+#define devm_irq_alloc_desc(dev, node)				\
+	devm_irq_alloc_descs(dev, -1, 0, 1, node)
+
+#define devm_irq_alloc_desc_at(dev, at, node)			\
+	devm_irq_alloc_descs(dev, at, at, 1, node)
+
+#define devm_irq_alloc_desc_from(dev, from, node)		\
+	devm_irq_alloc_descs(dev, -1, from, 1, node)
+
+#define devm_irq_alloc_descs_from(dev, from, cnt, node)		\
+	devm_irq_alloc_descs(dev, -1, from, cnt, node)
+
 void irq_free_descs(unsigned int irq, unsigned int cnt);
 static inline void irq_free_desc(unsigned int irq)
 {
diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
index 74d90a7..d1e70d6 100644
--- a/kernel/irq/devres.c
+++ b/kernel/irq/devres.c
@@ -2,6 +2,7 @@
 #include <linux/interrupt.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
+#include <linux/irq.h>
 
 /*
  * Device resource management aware IRQ request/free implementation.
@@ -137,3 +138,40 @@ void devm_free_irq(struct device *dev, unsigned int irq, void *dev_id)
 	free_irq(irq, dev_id);
 }
 EXPORT_SYMBOL(devm_free_irq);
+
+struct irq_desc_devres {
+	int from;
+	int cnt;
+};
+
+static void devm_irq_desc_release(struct device *dev, void *res)
+{
+	struct irq_desc_devres *this = res;
+
+	irq_free_descs(this->from, this->cnt);
+}
+
+int __devm_irq_alloc_descs(struct device *dev, int irq, unsigned int from,
+			   unsigned int cnt, int node, struct module *owner,
+			   const struct cpumask *affinity)
+{
+	struct irq_desc_devres *dr;
+	int base;
+
+	dr = devres_alloc(devm_irq_desc_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	base = __irq_alloc_descs(irq, from, cnt, node, owner, affinity);
+	if (base < 0) {
+		devres_free(dr);
+		return base;
+	}
+
+	dr->from = base;
+	dr->cnt = cnt;
+	devres_add(dev, dr);
+
+	return base;
+}
+EXPORT_SYMBOL_GPL(__devm_irq_alloc_descs);
-- 
2.9.3

