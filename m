From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next] spmi: pmic-arb: revert "validate type when mapping IRQ"
Date: Fri,  8 Feb 2019 07:36:35 -0500
Message-ID: <20190208123635.26755-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sboyd@kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Validation of the IRQ type was added to spmi pmic-arb, however spmi-mpp
in device tree still uses IRQ_TYPE_NONE. This commit caused the
spmi-mpp probe to fail since platform_irq_count() would return 0.
Correct this by backing out the previous patch.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: 135ef21ab064 ("spmi: pmic-arb: validate type when mapping IRQ")
---
Linus: I think that the better longer-term approach is to just embed the
IRQ counts similar to what is now in spmi-gpio. Since we are getting
close to the end of the dev cycle, I think it is safer to just drop
the old patch for the time being. I'll commit to doing that work for the
next dev cycle, although I can send you that change this weekend if you
prefer that we go that route instead.

My ssbi-gpio series does not have this issue.

 drivers/spmi/spmi-pmic-arb.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 316e2708f3ba..928759242e42 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -740,9 +740,9 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 }
 
 
-static int qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
-				  struct irq_domain *domain, unsigned int virq,
-				  irq_hw_number_t hwirq, unsigned int type)
+static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
+				   struct irq_domain *domain, unsigned int virq,
+				   irq_hw_number_t hwirq, unsigned int type)
 {
 	irq_flow_handler_t handler;
 
@@ -751,15 +751,11 @@ static int qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		handler = handle_edge_irq;
-	else if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
-		handler = handle_level_irq;
 	else
-		return -EINVAL;
+		handler = handle_level_irq;
 
 	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
 			    handler, NULL, NULL);
-
-	return 0;
 }
 
 static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
@@ -776,12 +772,9 @@ static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < nr_irqs; i++) {
-		ret = qpnpint_irq_domain_map(pmic_arb, domain, virq + i,
-					     hwirq + i, type);
-		if (ret)
-			return ret;
-	}
+	for (i = 0; i < nr_irqs; i++)
+		qpnpint_irq_domain_map(pmic_arb, domain, virq + i, hwirq + i,
+				       type);
 
 	return 0;
 }
-- 
2.17.2
