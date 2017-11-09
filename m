From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: bcm2835: Fix some merge fallout
Date: Thu,  9 Nov 2017 09:37:10 +0100
Message-ID: <20171109083710.3567-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:51196 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753360AbdKIIhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2017 03:37:15 -0500
Received: by mail-lf0-f66.google.com with SMTP id a132so6207481lfa.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Nov 2017 00:37:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>

Fixing a small merge problem in BCM2835 related to the
new irqchip code.

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index fb85ab3cf662..72d122748293 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -383,7 +383,7 @@ static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
 		/* FIXME: no clue why the code looks up the type here */
 		type = pc->irq_type[gpio];
 
-		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.irqdomain,
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
 						     gpio));
 	}
 }
-- 
2.13.6

