From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] irqdomain: Export irq_domain_free_irqs_common
Date: Thu, 17 Mar 2016 12:00:31 +0800
Message-ID: <1458187231.27037.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35139 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbcCQEAg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 00:00:36 -0400
Received: by mail-pf0-f193.google.com with SMTP id u190so9287486pfb.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 21:00:36 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Export irq_domain_free_irqs_common so it can be used by modules.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 3a519a0..245a485 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1099,6 +1099,7 @@ void irq_domain_free_irqs_common(struct irq_domain *domain, unsigned int virq,
 	}
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
+EXPORT_SYMBOL_GPL(irq_domain_free_irqs_common);
 
 /**
  * irq_domain_free_irqs_top - Clear handler and handler data, clear irqdata and free parent
-- 
2.1.4



