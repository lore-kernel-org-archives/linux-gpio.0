From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: delete stray debug print
Date: Wed,  9 Apr 2014 09:18:55 +0200
Message-ID: <1397027935-14926-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:65488 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbaDIHTC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Apr 2014 03:19:02 -0400
Received: by mail-wi0-f177.google.com with SMTP id cc10so2649472wib.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2014 00:19:00 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

I left this in by mistake, get rid of it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
index 208341fd57d2..8f6f16ef73f3 100644
--- a/drivers/pinctrl/pinctrl-nomadik.c
+++ b/drivers/pinctrl/pinctrl-nomadik.c
@@ -877,7 +877,6 @@ static void nmk_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 	struct nmk_gpio_chip *nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
 	u32 status;
 
-	pr_err("PLONK IRQ %d\n", irq);
 	clk_enable(nmk_chip->clk);
 	status = readl(nmk_chip->addr + NMK_GPIO_IS);
 	clk_disable(nmk_chip->clk);
-- 
1.9.0

