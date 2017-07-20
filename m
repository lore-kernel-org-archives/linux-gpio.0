From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: bcm2835: Remove unneeded irq_group field
Date: Thu, 20 Jul 2017 18:59:12 +0200
Message-ID: <20170720165912.14360-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37835 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755536AbdGTQ7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 12:59:16 -0400
Received: by mail-wm0-f65.google.com with SMTP id m4so4250566wmi.4
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2017 09:59:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org

From: Thierry Reding <treding@nvidia.com>

The irq_group field stores a 1:1 mapping. Use the loop variable to
derive the values instead of storing them in an extra array.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index a605d74552b6..834d4862dd15 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -92,7 +92,6 @@ struct bcm2835_pinctrl {
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range gpio_range;
 
-	int irq_group[BCM2835_NUM_IRQS];
 	spinlock_t irq_lock[BCM2835_NUM_BANKS];
 };
 
@@ -400,7 +399,7 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 
 	for (i = 0; i < ARRAY_SIZE(pc->irq); i++) {
 		if (pc->irq[i] == irq) {
-			group = pc->irq_group[i];
+			group = i;
 			break;
 		}
 	}
@@ -1047,7 +1046,6 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 
 	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
 		pc->irq[i] = irq_of_parse_and_map(np, i);
-		pc->irq_group[i] = i;
 
 		if (pc->irq[i] == 0)
 			continue;
-- 
2.13.3

