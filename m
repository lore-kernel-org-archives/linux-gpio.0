From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] gpio: mvebu: Do not hard code error code
Date: Sat, 21 Dec 2013 13:05:58 +0530
Message-ID: <1387611358-28946-2-git-send-email-sachin.kamat@linaro.org>
References: <1387611358-28946-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:47264 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067Ab3LUHjT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2013 02:39:19 -0500
Received: by mail-pa0-f46.google.com with SMTP id kp14so1668370pab.19
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 23:39:19 -0800 (PST)
In-Reply-To: <1387611358-28946-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

Return the appropriate error code instead of hardcoding it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-mvebu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index bc78a9da5502..3b1fd1ce460f 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -676,7 +676,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
 	if (mvchip->irqbase < 0) {
 		dev_err(&pdev->dev, "no irqs\n");
-		return -ENOMEM;
+		return mvchip->irqbase;
 	}
 
 	gc = irq_alloc_generic_chip("mvebu_gpio_irq", 2, mvchip->irqbase,
-- 
1.7.9.5

