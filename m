From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: altera: staticize probe function
Date: Fri, 27 Mar 2015 09:27:42 +0100
Message-ID: <1427444862-5812-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:32828 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753113AbbC0I1s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 04:27:48 -0400
Received: by labto5 with SMTP id to5so64964689lab.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 01:27:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This is not to be globally visible.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 4d41196b3f13..449fb46cb8a0 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -256,7 +256,7 @@ static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
 	chained_irq_exit(chip, desc);
 }
 
-int altera_gpio_probe(struct platform_device *pdev)
+static int altera_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	int reg, ret;
-- 
1.9.3

