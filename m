From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 3/7] irqdomain: Factor out code to add and remove items to and from the revmap
Date: Thu, 17 Aug 2017 17:53:32 -0700
Message-ID: <1503017616-3252-4-git-send-email-david.daney@cavium.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: linux-gpio@vger.kernel.org

The code to add and remove items to and from the revmap occurs several
times.

In preparation for the follow on patches that add more uses of this
code, factor this out in to separate static functions.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 kernel/irq/irqdomain.c | 58 +++++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index f1f2514..2093b88 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -455,6 +455,31 @@ void irq_set_default_host(struct irq_domain *domain)
 }
 EXPORT_SYMBOL_GPL(irq_set_default_host);
 
+static void irq_domain_clear_mapping(struct irq_domain *domain,
+				     irq_hw_number_t hwirq)
+{
+	if (hwirq < domain->revmap_size) {
+		domain->linear_revmap[hwirq] = 0;
+	} else {
+		mutex_lock(&revmap_trees_mutex);
+		radix_tree_delete(&domain->revmap_tree, hwirq);
+		mutex_unlock(&revmap_trees_mutex);
+	}
+}
+
+static void irq_domain_set_mapping(struct irq_domain *domain,
+				   irq_hw_number_t hwirq,
+				   struct irq_data *irq_data)
+{
+	if (hwirq < domain->revmap_size) {
+		domain->linear_revmap[hwirq] = irq_data->irq;
+	} else {
+		mutex_lock(&revmap_trees_mutex);
+		radix_tree_insert(&domain->revmap_tree, hwirq, irq_data);
+		mutex_unlock(&revmap_trees_mutex);
+	}
+}
+
 void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 {
 	struct irq_data *irq_data = irq_get_irq_data(irq);
@@ -483,13 +508,7 @@ void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 	domain->mapcount--;
 
 	/* Clear reverse map for this hwirq */
-	if (hwirq < domain->revmap_size) {
-		domain->linear_revmap[hwirq] = 0;
-	} else {
-		mutex_lock(&revmap_trees_mutex);
-		radix_tree_delete(&domain->revmap_tree, hwirq);
-		mutex_unlock(&revmap_trees_mutex);
-	}
+	irq_domain_clear_mapping(domain, hwirq);
 }
 
 int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
@@ -533,13 +552,7 @@ int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 	}
 
 	domain->mapcount++;
-	if (hwirq < domain->revmap_size) {
-		domain->linear_revmap[hwirq] = virq;
-	} else {
-		mutex_lock(&revmap_trees_mutex);
-		radix_tree_insert(&domain->revmap_tree, hwirq, irq_data);
-		mutex_unlock(&revmap_trees_mutex);
-	}
+	irq_domain_set_mapping(domain, hwirq, irq_data);
 	mutex_unlock(&irq_domain_mutex);
 
 	irq_clear_status_flags(virq, IRQ_NOREQUEST);
@@ -1138,16 +1151,9 @@ static void irq_domain_insert_irq(int virq)
 
 	for (data = irq_get_irq_data(virq); data; data = data->parent_data) {
 		struct irq_domain *domain = data->domain;
-		irq_hw_number_t hwirq = data->hwirq;
 
 		domain->mapcount++;
-		if (hwirq < domain->revmap_size) {
-			domain->linear_revmap[hwirq] = virq;
-		} else {
-			mutex_lock(&revmap_trees_mutex);
-			radix_tree_insert(&domain->revmap_tree, hwirq, data);
-			mutex_unlock(&revmap_trees_mutex);
-		}
+		irq_domain_set_mapping(domain, data->hwirq, data);
 
 		/* If not already assigned, give the domain the chip's name */
 		if (!domain->name && data->chip)
@@ -1171,13 +1177,7 @@ static void irq_domain_remove_irq(int virq)
 		irq_hw_number_t hwirq = data->hwirq;
 
 		domain->mapcount--;
-		if (hwirq < domain->revmap_size) {
-			domain->linear_revmap[hwirq] = 0;
-		} else {
-			mutex_lock(&revmap_trees_mutex);
-			radix_tree_delete(&domain->revmap_tree, hwirq);
-			mutex_unlock(&revmap_trees_mutex);
-		}
+		irq_domain_clear_mapping(domain, hwirq);
 	}
 }
 
-- 
1.8.3.1
