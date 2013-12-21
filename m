From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] gpio: mxc: Do not hard code return value
Date: Sat, 21 Dec 2013 13:05:57 +0530
Message-ID: <1387611358-28946-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:56706 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067Ab3LUHjR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2013 02:39:17 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so3394202pde.41
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 23:39:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

Silences the following warning:
why not propagate 'port->irq' from platform_get_irq() instead of (-22)?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-mxc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3307f6db3a92..db83b3c0a449 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -422,7 +422,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->irq_high = platform_get_irq(pdev, 1);
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
-		return -EINVAL;
+		return port->irq;
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
-- 
1.7.9.5

