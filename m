From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nsp-gpio: fix up parent attribute
Date: Thu, 10 Dec 2015 18:52:10 +0100
Message-ID: <1449769930-8629-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:32982 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbbLJRwR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:52:17 -0500
Received: by lfaz4 with SMTP id z4so62157714lfa.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:52:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

The .dev field has been renamed .parent in the GPIO tree.
Fix it up.

Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 06b7aaf3548c..bb7891e786e3 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -668,7 +668,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = false;
 	gc->ngpio = val;
 	gc->label = dev_name(dev);
-	gc->dev = dev;
+	gc->parent = dev;
 	gc->of_node = dev->of_node;
 	gc->request = nsp_gpio_request;
 	gc->free = nsp_gpio_free;
-- 
2.4.3

