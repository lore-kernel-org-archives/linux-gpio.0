From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: davinci: fix missed parent conversion
Date: Fri,  4 Dec 2015 14:15:20 +0100
Message-ID: <1449234920-27375-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34941 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbbLDNPZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 08:15:25 -0500
Received: by lbbed20 with SMTP id ed20so5862337lbb.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2015 05:15:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

I missed to convert this driver properly to use .parent to
point to the parent device. ARMv7 multiplatform would not
compile.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 9fd32f76ffa7..65ebaef935e1 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -254,7 +254,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF_GPIO
 		chips[i].chip.of_gpio_n_cells = 2;
 		chips[i].chip.of_xlate = davinci_gpio_of_xlate;
-		chips[i].chip.dev = dev;
+		chips[i].chip.parent = dev;
 		chips[i].chip.of_node = dev->of_node;
 #endif
 		spin_lock_init(&chips[i].lock);
-- 
2.4.3

