From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 4/4] pinctrl: sirf: move to use irq_get_handler_data
Date: Tue, 15 Apr 2014 14:43:49 +0800
Message-ID: <1397544229-20545-5-git-send-email-21cnbao@gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:39553 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751430AbaDOGoo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Apr 2014 02:44:44 -0400
Received: by mail-pa0-f47.google.com with SMTP id lj1so9238966pab.20
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2014 23:44:44 -0700 (PDT)
In-Reply-To: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, workgroup.linux@csr.com, Barry Song <Baohua.Song@csr.com>

From: Barry Song <Baohua.Song@csr.com>

we set bank as handler_data, now we can get bank in ISR directly
instead of looking-up.

Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index c03dcc7..36cc678 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -568,18 +568,10 @@ static struct irq_chip sirfsoc_irq_chip = {
 
 static void sirfsoc_gpio_handle_irq(unsigned int irq, struct irq_desc *desc)
 {
-	struct sirfsoc_gpio_bank *bank;
+	struct sirfsoc_gpio_bank *bank = irq_get_handler_data(irq);
 	u32 status, ctrl;
 	int idx = 0;
 	struct irq_chip *chip = irq_get_chip(irq);
-	int i;
-
-	for (i = 0; i < SIRFSOC_GPIO_BANK_SIZE; i++) {
-		bank = &sgpio_chip.sgpio_bank[i];
-		if (bank->parent_irq == irq)
-			break;
-	}
-	BUG_ON (i == SIRFSOC_GPIO_BANK_SIZE);
 
 	chained_irq_enter(chip, desc);
 
@@ -845,7 +837,7 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 			goto out;
 		}
 
-		gpiochip_set_chained_irqchip(&sgpio_chip.chip.gc,
+		gpiochip_set_chained_irqchip(bank,
 			&sirfsoc_irq_chip,
 			bank->parent_irq,
 			sirfsoc_gpio_handle_irq);
-- 
1.7.5.4

