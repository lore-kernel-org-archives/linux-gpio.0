From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/2] gpio: clps711x: Use of_match_ptr()
Date: Tue, 24 Dec 2013 18:08:53 +0400
Message-ID: <1387894134-11007-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback4.mail.ru ([94.100.176.42]:56614 "EHLO
	fallback4.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751970Ab3LXOMN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2013 09:12:13 -0500
Received: from smtp39.i.mail.ru (smtp39.i.mail.ru [94.100.177.99])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id 7DEA3144829
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2013 18:09:18 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

There is no reason to keep the OF data if the driver was compiled
without DT support.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-clps711x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index 0924f20..d355027 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -77,7 +77,7 @@ static int clps711x_gpio_remove(struct platform_device *pdev)
 	return bgpio_remove(bgc);
 }
 
-static const struct of_device_id clps711x_gpio_ids[] = {
+static const struct of_device_id __maybe_unused clps711x_gpio_ids[] = {
 	{ .compatible = "cirrus,clps711x-gpio" },
 	{ }
 };
@@ -87,7 +87,7 @@ static struct platform_driver clps711x_gpio_driver = {
 	.driver	= {
 		.name		= "clps711x-gpio",
 		.owner		= THIS_MODULE,
-		.of_match_table	= clps711x_gpio_ids,
+		.of_match_table	= of_match_ptr(clps711x_gpio_ids),
 	},
 	.probe	= clps711x_gpio_probe,
 	.remove	= clps711x_gpio_remove,
-- 
1.8.3.2

