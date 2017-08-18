From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 4/7] irqdomain: Check for NULL function pointer in irq_domain_free_irqs_hierarchy()
Date: Thu, 17 Aug 2017 17:53:33 -0700
Message-ID: <1503017616-3252-5-git-send-email-david.daney@cavium.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: linux-gpio@vger.kernel.org

A follow-on patch will call irq_domain_free_irqs_hierarchy() when the
free() function pointer may be NULL.

Add a NULL pointer check to handle this new use case.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 kernel/irq/irqdomain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 2093b88..24fda75 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1362,7 +1362,8 @@ static void irq_domain_free_irqs_hierarchy(struct irq_domain *domain,
 					   unsigned int irq_base,
 					   unsigned int nr_irqs)
 {
-	domain->ops->free(domain, irq_base, nr_irqs);
+	if (domain->ops->free)
+		domain->ops->free(domain, irq_base, nr_irqs);
 }
 
 int irq_domain_alloc_irqs_hierarchy(struct irq_domain *domain,
-- 
1.8.3.1
