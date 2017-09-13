From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v5 1/3] irqdomain: export of_phandle_args_to_fwspec
Date: Wed, 13 Sep 2017 17:56:28 +0900
Message-ID: <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:63482 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdIMI5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2017 04:57:54 -0400
In-Reply-To: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This helper will be useful for irqchip drivers that need to convert
DT binding into IRQ fwspec.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This patch is necessary for my GPIO driver.
Since it is trivial enough, I hope Marc will allow this to go
though the GPIO subsystem.

If this patch is rejected, I can copy this function into my GPIO
driver, but I'd like to avoid code duplication.


 include/linux/irqdomain.h | 2 ++
 kernel/irq/irqdomain.c    | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 81e4889..440772c 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -259,6 +259,8 @@ extern void irq_set_default_host(struct irq_domain *host);
 extern int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
 				  irq_hw_number_t hwirq, int node,
 				  const struct cpumask *affinity);
+extern void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
+				      struct irq_fwspec *fwspec);
 
 static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *node)
 {
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index e84b705..e34cd63 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -727,8 +727,8 @@ static int irq_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
-static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
-				      struct irq_fwspec *fwspec)
+void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
+			       struct irq_fwspec *fwspec)
 {
 	int i;
 
@@ -738,6 +738,7 @@ static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
 	for (i = 0; i < irq_data->args_count; i++)
 		fwspec->param[i] = irq_data->args[i];
 }
+EXPORT_SYMBOL_GPL(of_phandle_args_to_fwspec);
 
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 {
-- 
2.7.4

