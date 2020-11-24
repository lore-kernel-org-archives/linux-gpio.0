Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D057C2D0E4
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 06:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0300D2087C
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 06:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgKXG1h (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 24 Nov 2020 01:27:37 -0500
Received: from ozlabs.ru ([107.174.27.60]:51242 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727731AbgKXG1h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:27:37 -0500
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Nov 2020 01:27:37 EST
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 82CBCAE8022C;
        Tue, 24 Nov 2020 01:17:40 -0500 (EST)
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH kernel v4 1/8] genirq/ipi:  Simplify irq_reserve_ipi
Date:   Tue, 24 Nov 2020 17:17:13 +1100
Message-Id: <20201124061720.86766-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

__irq_domain_alloc_irqs() can already handle virq==-1 and free
descriptors if it failed allocating hardware interrupts so let's skip
this extra step.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/ipi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 43e3d1be622c..1b2807318ea9 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -75,18 +75,12 @@ int irq_reserve_ipi(struct irq_domain *domain,
 		}
 	}
 
-	virq = irq_domain_alloc_descs(-1, nr_irqs, 0, NUMA_NO_NODE, NULL);
-	if (virq <= 0) {
-		pr_warn("Can't reserve IPI, failed to alloc descs\n");
-		return -ENOMEM;
-	}
-
-	virq = __irq_domain_alloc_irqs(domain, virq, nr_irqs, NUMA_NO_NODE,
-				       (void *) dest, true, NULL);
+	virq = __irq_domain_alloc_irqs(domain, -1, nr_irqs, NUMA_NO_NODE,
+				       (void *) dest, false, NULL);
 
 	if (virq <= 0) {
 		pr_warn("Can't reserve IPI, failed to alloc hw irqs\n");
-		goto free_descs;
+		return -EBUSY;
 	}
 
 	for (i = 0; i < nr_irqs; i++) {
@@ -96,10 +90,6 @@ int irq_reserve_ipi(struct irq_domain *domain,
 		irq_set_status_flags(virq + i, IRQ_NO_BALANCING);
 	}
 	return virq;
-
-free_descs:
-	irq_free_descs(virq, nr_irqs);
-	return -EBUSY;
 }
 
 /**
-- 
2.17.1

