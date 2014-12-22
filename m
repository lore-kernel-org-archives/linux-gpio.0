From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 5/5] ARM: sa1100: use handle_domain_irq
Date: Mon, 22 Dec 2014 13:05:40 +0300
Message-ID: <1419242740-20219-5-git-send-email-dbaryshkov@gmail.com>
References: <1419242740-20219-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:59623 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754237AbaLVKGC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Dec 2014 05:06:02 -0500
Received: by mail-pa0-f49.google.com with SMTP id eu11so5619512pac.36
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2014 02:06:02 -0800 (PST)
In-Reply-To: <1419242740-20219-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Use handle_domain_irq instead of handle_IRQ to automatically map
hardware irq number to virq.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/arm/mach-sa1100/irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/irq.c b/arch/arm/mach-sa1100/irq.c
index a7d116a..65aebfa 100644
--- a/arch/arm/mach-sa1100/irq.c
+++ b/arch/arm/mach-sa1100/irq.c
@@ -147,7 +147,8 @@ sa1100_handle_irq(struct pt_regs *regs)
 		if (mask == 0)
 			break;
 
-		handle_IRQ(ffs(mask) - 1 + IRQ_GPIO0_SC, regs);
+		handle_domain_irq(sa1100_normal_irqdomain,
+				ffs(mask) - 1, regs);
 	} while (1);
 }
 
-- 
2.1.3

