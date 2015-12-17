From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: fixup problematic flag
Date: Thu, 17 Dec 2015 14:52:29 +0100
Message-ID: <1450360349-21175-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35583 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755519AbbLQNwf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 08:52:35 -0500
Received: by mail-lf0-f49.google.com with SMTP id l133so51900461lfd.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 05:52:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

This removes the set_irq_flags() call that unfortunately slipped
into the BCM NSP driver.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 06b7aaf3548c..1f66761c1a25 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -696,7 +696,6 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 
 			irq_set_chip_and_handler(irq, &nsp_gpio_irq_chip,
 						 handle_simple_irq);
-			set_irq_flags(irq, IRQF_VALID);
 			irq_set_chip_data(irq, chip);
 		}
 
-- 
2.4.3

