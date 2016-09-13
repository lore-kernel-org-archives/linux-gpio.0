From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] gpio: aspeed: Fix missing licence warning in modpost
Date: Tue, 13 Sep 2016 13:50:44 +0930
Message-ID: <20160913042044.31764-1-joel@jms.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36635 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbcIMEU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 00:20:58 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Jeffery <andrew@aj.id.au>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

 > After merging the gpio tree, today's linux-next build (x86_64
 > allmodconfig) produced this warning:
 >
 > WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-aspeed.o
 >
 > Introduced by commit
 >
 >   361b79119a4b ("gpio: Add Aspeed driver")

Fix it by adding the correct licence.

Fixes: 361b79119a4b ("gpio: Add Aspeed driver")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpio/gpio-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 64348a6fb60f..9f7266e05f0a 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -455,3 +455,4 @@ static struct platform_driver aspeed_gpio_driver = {
 module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
 
 MODULE_DESCRIPTION("Aspeed GPIO Driver");
+MODULE_LICENSE("GPL");
-- 
2.9.3

