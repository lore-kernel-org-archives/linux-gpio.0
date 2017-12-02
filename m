From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v2] gpio: ftgpio010: Fix platform_get_irq's error checking
Date: Sat,  2 Dec 2017 22:31:01 +0530
Message-ID: <5abcacf8ee7ecb1e084f93c82cae1768e99fd4e6.1512233762.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41200 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751848AbdLBRBN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 12:01:13 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

The platform_get_irq() function returns negative if an error occurs.
zero or positive number on success. platform_get_irq() error checking
for zero is not correct.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
changes in v2:
             It's should be 'irq <= 0' instead of 'irq < 0'.

 drivers/gpio/gpio-ftgpio010.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 139f73d..fbb12f6 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -176,8 +176,8 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(g->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (!irq)
-		return -EINVAL;
+	if (irq <= 0)
+		return irq ? irq : -EINVAL;
 
 	ret = bgpio_init(&g->gc, dev, 4,
 			 g->base + GPIO_DATA_IN,
-- 
2.7.4

