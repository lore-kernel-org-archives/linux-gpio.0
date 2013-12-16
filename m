From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next v2] gpio: moxart: add missing .owner to struct gpio_chip
Date: Mon, 16 Dec 2013 10:11:34 +0800
Message-ID: <CAPgLHd-S6JJU+dO4dMb_1JXaESbVo6AsX3L9PL3buNGtPcF0KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:48014 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3LPCLf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2013 21:11:35 -0500
Received: by mail-bk0-f47.google.com with SMTP id mx12so2121103bkb.34
        for <linux-gpio@vger.kernel.org>; Sun, 15 Dec 2013 18:11:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, jonas.jensen@gmail.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add missing .owner of struct gpio_chip. This prevents the
module from being removed from underneath its users.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
v1 -> v2: rebased and include Jonas.
---
 drivers/gpio/gpio-moxart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 4ecd195..79b9341 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -102,6 +102,7 @@ static struct gpio_chip moxart_template_chip = {
 	.set			= moxart_gpio_set,
 	.get			= moxart_gpio_get,
 	.ngpio			= 32,
+	.owner			= THIS_MODULE,
 };
 
 static int moxart_gpio_probe(struct platform_device *pdev)

