From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: mb86s7x: Remove redundant platform_set_drvdata() call
Date: Wed, 09 Mar 2016 20:48:15 +0800
Message-ID: <1457527695.720.4.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36653 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753502AbcCIMsT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:48:19 -0500
Received: by mail-pf0-f181.google.com with SMTP id u190so10557060pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 04:48:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Set it once is enough, so remove the second platform_set_drvdata() call.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-mb86s7x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7fffc1d..d23a942 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -185,8 +185,6 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.parent = &pdev->dev;
 	gchip->gc.base = -1;
 
-	platform_set_drvdata(pdev, gchip);
-
 	ret = gpiochip_add_data(&gchip->gc, gchip);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't register gpio driver\n");
-- 
2.1.4



