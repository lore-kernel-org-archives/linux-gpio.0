From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: sirf: fix a bad conflict resolution
Date: Fri, 30 May 2014 09:57:11 +0200
Message-ID: <1401436631-30576-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:53411 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbaE3H5Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 May 2014 03:57:16 -0400
Received: by mail-we0-f179.google.com with SMTP id q59so1538082wes.24
        for <linux-gpio@vger.kernel.org>; Fri, 30 May 2014 00:57:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Barry Song <Baohua.Song@csr.com>

Commit 294d1351ff47726f0f110b88e816cbafe89512fb
"pinctrl: sirf: switch to using allocated state container"
caused a build conflict due to a bad conflict resolution
when cherry-picking the patch. Fix it up.

Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 0e835219c42e..014f5b1fee55 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -575,7 +575,7 @@ static void sirfsoc_gpio_handle_irq(unsigned int irq, struct irq_desc *desc)
 	int i;
 
 	for (i = 0; i < SIRFSOC_GPIO_NO_OF_BANKS; i++) {
-		bank = &sgpio_chip.sgpio_bank[i];
+		bank = &sgpio->sgpio_bank[i];
 		if (bank->parent_irq == irq)
 			break;
 	}
-- 
1.9.3

