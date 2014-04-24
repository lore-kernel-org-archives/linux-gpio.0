From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] gpio: mvebu: Remove initcall-based driver initialization
Date: Thu, 24 Apr 2014 17:54:50 -0300
Message-ID: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:41041 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751316AbaDXUzd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 16:55:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

There's no reason to use an initcall to initialize this driver,
and regular module_platform_driver() can be used instead.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/gpio/gpio-mvebu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index d425094..7d64cde 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -738,9 +738,4 @@ static struct platform_driver mvebu_gpio_driver = {
 	},
 	.probe		= mvebu_gpio_probe,
 };
-
-static int __init mvebu_gpio_init(void)
-{
-	return platform_driver_register(&mvebu_gpio_driver);
-}
-postcore_initcall(mvebu_gpio_init);
+module_platform_driver(mvebu_gpio_driver);
-- 
1.9.1

