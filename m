From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: bcm-kona: add missing .owner to struct gpio_chip
Date: Tue, 29 Oct 2013 11:49:20 +0800
Message-ID: <CAPgLHd99TN_wZ50T3KwbxsqHK7TmcM7JoD_6GcNu_6dpXGghcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:40257 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758040Ab3J2DtW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2013 23:49:22 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so2151674bkb.20
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2013 20:49:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add missing .owner of struct gpio_chip. This prevents the
module from being removed from underneath its users.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-bcm-kona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b3d0f81..72c927d 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -280,6 +280,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 
 static struct gpio_chip template_chip = {
 	.label = "bcm-kona-gpio",
+	.owner = THIS_MODULE,
 	.direction_input = bcm_kona_gpio_direction_input,
 	.get = bcm_kona_gpio_get,
 	.direction_output = bcm_kona_gpio_direction_output,

