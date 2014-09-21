From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 3/3] gpio: xgene: Remove unneeded #ifdef CONFIG_OF guard
Date: Sun, 21 Sep 2014 12:32:59 +0800
Message-ID: <1411273979.20539.2.camel@phoenix>
References: <1411273889.20539.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:42322 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbaIUEdE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Sep 2014 00:33:04 -0400
Received: by mail-pa0-f53.google.com with SMTP id hz1so2490126pad.12
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2014 21:33:03 -0700 (PDT)
In-Reply-To: <1411273889.20539.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

This driver depends on OF_GPIO, so it won't be built if !CONFIG_OF.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xgene.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index cef92f4..82263e4 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -223,13 +223,11 @@ static int xgene_gpio_remove(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
-#endif
 
 static struct platform_driver xgene_gpio_driver = {
 	.driver = {
-- 
1.9.1



