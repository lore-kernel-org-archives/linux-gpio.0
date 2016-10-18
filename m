From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: [PATCH] Revert "gpio/mvebu: convert to use irq_domain_add_simple()"
Date: Tue, 18 Oct 2016 16:56:36 -0600
Message-ID: <1476831396-24359-1-git-send-email-jgunthorpe@obsidianresearch.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:33318 "EHLO quartz.orcorp.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753715AbcJRW4q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Oct 2016 18:56:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>

This reverts commit ce931f571b6dcf8534e8740e8cd16565cf362536.

The only difference betwen _simple and _legacy is that _simple
calls irq_alloc_descs, however mvebu_gpio_probe already called
irq_alloc_descs a few lines above.

This fixes these kernel error messages from the double call
to irq_alloc_descs:

 irq: Cannot allocate irq_descs @ IRQ34, assuming pre-allocated
 irq: Cannot allocate irq_descs @ IRQ66, assuming pre-allocated

Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>
Fixes: ce931f571b6d ("gpio/mvebu: convert to use irq_domain_add_simple()")
Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 drivers/gpio/gpio-mvebu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index cd5dc27320a2..2e0c8d8b7792 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -807,8 +807,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 			       IRQ_NOREQUEST, IRQ_LEVEL | IRQ_NOPROBE);
 
 	/* Setup irq domain on top of the generic chip. */
-	mvchip->domain = irq_domain_add_simple(np, mvchip->chip.ngpio,
-					       mvchip->irqbase,
+	mvchip->domain = irq_domain_add_legacy(np, mvchip->chip.ngpio,
+					       mvchip->irqbase, 0,
 					       &irq_domain_simple_ops,
 					       mvchip);
 	if (!mvchip->domain) {
-- 
2.1.4

