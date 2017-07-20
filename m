From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: sirf: atlas7: Initialize GPIO offset
Date: Thu, 20 Jul 2017 19:01:07 +0200
Message-ID: <20170720170107.14612-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37472 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965335AbdGTRBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 13:01:10 -0400
Received: by mail-wm0-f65.google.com with SMTP id m4so4255858wmi.4
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2017 10:01:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Thierry Reding <treding@nvidia.com>

The GPIO offset is never initialized, which means that it will end up
being zero as per the devm_kzalloc() of the parent structure.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
I have no idea how the driver could've ever worked for anything other
than instances with a single bank, but maybe it did and I missed some
detail.

 drivers/pinctrl/sirf/pinctrl-atlas7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 36b5c8d5471e..a2ca4a9472c7 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -6078,6 +6078,7 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 		bank = &a7gc->banks[idx];
 		/* Set ctrl registers' base of this bank */
 		bank->base = ATLAS7_GPIO_BASE(a7gc, idx);
+		bank->gpio_offset = idx * NGPIO_OF_BANK;
 
 		/* Get interrupt number from DTS */
 		ret = of_irq_get(np, idx);
-- 
2.13.3

