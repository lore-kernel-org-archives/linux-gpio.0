From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: stmpe: fix up interrupt enable logic
Date: Thu,  2 Oct 2014 07:55:27 +0200
Message-ID: <1412229327-2122-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:60391 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbaJBFzi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Oct 2014 01:55:38 -0400
Received: by mail-lb0-f174.google.com with SMTP id p9so1622928lbv.33
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2014 22:55:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The STMPE driver assumes that the passed in IRQ type is
for rising or falling IRQs, not both, even though the
hardware actually supports this perfectly well. Likewise
the check for level IRQs is done against just high or low
level types, not for the case where it is combined with
other IRQs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 845025a57240..a888e6ec5c6e 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -127,19 +127,19 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
 
-	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_LEVEL_HIGH)
+	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
 		return -EINVAL;
 
 	/* STMPE801 doesn't have RE and FE registers */
 	if (stmpe_gpio->stmpe->partnum == STMPE801)
 		return 0;
 
-	if (type == IRQ_TYPE_EDGE_RISING)
+	if (type & IRQ_TYPE_EDGE_RISING)
 		stmpe_gpio->regs[REG_RE][regoffset] |= mask;
 	else
 		stmpe_gpio->regs[REG_RE][regoffset] &= ~mask;
 
-	if (type == IRQ_TYPE_EDGE_FALLING)
+	if (type & IRQ_TYPE_EDGE_FALLING)
 		stmpe_gpio->regs[REG_FE][regoffset] |= mask;
 	else
 		stmpe_gpio->regs[REG_FE][regoffset] &= ~mask;
-- 
1.9.3

