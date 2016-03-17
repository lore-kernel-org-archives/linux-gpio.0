From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: xgene-sb: Use irq_domain_free_irqs_common instead
 of open coded
Date: Thu, 17 Mar 2016 12:01:43 +0800
Message-ID: <1458187303.27037.3.camel@ingics.com>
References: <1458187231.27037.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36062 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbcCQEBs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 00:01:48 -0400
Received: by mail-pf0-f196.google.com with SMTP id q129so9400777pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 21:01:47 -0700 (PDT)
In-Reply-To: <1458187231.27037.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Current code calls irq_domain_alloc_irqs_parent() in .alloc,
so it should call irq_domain_free_irqs_parent() accordingly in .free.
Fix it by switching to use irq_domain_free_irqs_common() instead.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xgene-sb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 31cbcb8..0332586 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -216,23 +216,10 @@ static int xgene_gpio_sb_domain_alloc(struct irq_domain *domain,
 			&parent_fwspec);
 }
 
-static void xgene_gpio_sb_domain_free(struct irq_domain *domain,
-		unsigned int virq,
-		unsigned int nr_irqs)
-{
-	struct irq_data *d;
-	unsigned int i;
-
-	for (i = 0; i < nr_irqs; i++) {
-		d = irq_domain_get_irq_data(domain, virq + i);
-		irq_domain_reset_irq_data(d);
-	}
-}
-
 static const struct irq_domain_ops xgene_gpio_sb_domain_ops = {
 	.translate      = xgene_gpio_sb_domain_translate,
 	.alloc          = xgene_gpio_sb_domain_alloc,
-	.free           = xgene_gpio_sb_domain_free,
+	.free           = irq_domain_free_irqs_common,
 	.activate	= xgene_gpio_sb_domain_activate,
 	.deactivate	= xgene_gpio_sb_domain_deactivate,
 };
-- 
2.1.4



