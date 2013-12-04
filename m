From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: moxart: add missing .owner to struct gpio_chip
Date: Wed, 4 Dec 2013 08:38:36 +0800
Message-ID: <CAPgLHd_rm=YN7OU9X8STWGa-0KaM7LhOFObwbAbsXZGRNsXVWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:46908 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754361Ab3LDAih (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2013 19:38:37 -0500
Received: by mail-bk0-f43.google.com with SMTP id mz12so6320020bkb.16
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2013 16:38:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add missing .owner of struct gpio_chip. This prevents the
module from being removed from underneath its users.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-moxart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index d662cde..4169a78 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -106,6 +106,7 @@ static struct gpio_chip moxart_template_chip = {
 	.base			= 0,
 	.ngpio			= 32,
 	.can_sleep		= 0,
+	.owner			= THIS_MODULE,
 };
 
 static int moxart_gpio_probe(struct platform_device *pdev)

