From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 8/9] ARM: sa1100: move per-IRQ PWER settings to core code
Date: Fri, 15 Nov 2013 12:47:59 +0400
Message-ID: <1384505280-25389-9-git-send-email-dbaryshkov@gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:40448 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754893Ab3KOIsc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2013 03:48:32 -0500
Received: by mail-we0-f177.google.com with SMTP id t60so3154320wes.8
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2013 00:48:31 -0800 (PST)
In-Reply-To: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

In attempt to limit register access from non-core code, move PWER access
to generic.c, having irqchip code call sa11x0_sc_set_wake() function
to set wake status.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/arm/mach-sa1100/irq.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm/mach-sa1100/irq.c b/arch/arm/mach-sa1100/irq.c
index 59c1617..d96f65f 100644
--- a/arch/arm/mach-sa1100/irq.c
+++ b/arch/arm/mach-sa1100/irq.c
@@ -18,8 +18,6 @@
 #include <linux/syscore_ops.h>
 
 #include <mach/hardware.h>
-#include <mach/irqs.h>
-#include <asm/mach/irq.h>
 #include <asm/exception.h>
 
 #include "generic.h"
@@ -43,14 +41,7 @@ static void sa1100_unmask_irq(struct irq_data *d)
  */
 static int sa1100_set_wake(struct irq_data *d, unsigned int on)
 {
-	if (d->irq == IRQ_RTCAlrm) {
-		if (on)
-			PWER |= PWER_RTC;
-		else
-			PWER &= ~PWER_RTC;
-		return 0;
-	}
-	return -EINVAL;
+	return sa11x0_sc_set_wake(d->irq, on);
 }
 
 static struct irq_chip sa1100_normal_chip = {
-- 
1.8.4.2

