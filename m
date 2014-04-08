From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: zevio: Remove of_match_ptr around zevio_gpio_of_match
Date: Tue, 08 Apr 2014 11:44:49 +0800
Message-ID: <1396928689.25334.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:55641 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162AbaDHDoz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 23:44:55 -0400
Received: by mail-pa0-f50.google.com with SMTP id kq14so408356pab.23
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2014 20:44:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Gerhard Sittig <gsi@denx.de>, Fabian Vogt <fabian@ritter-vogt.de>, linux-gpio@vger.kernel.org

This is a DT-only driver and it will be built only when CONFIG_OF is set.
So it's pointless to use of_match_ptr.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-zevio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 29b0150..97721a1 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -215,7 +215,7 @@ static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-zevio",
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(zevio_gpio_of_match),
+		.of_match_table = zevio_gpio_of_match,
 	},
 	.probe		= zevio_gpio_probe,
 };
-- 
1.8.3.2



