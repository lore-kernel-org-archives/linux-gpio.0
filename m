From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: aspeed: add MODULE_LICENSE()
Date: Tue, 13 Sep 2016 13:45:18 +0200
Message-ID: <1473767118-11118-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35584 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753038AbcIMLpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 07:45:24 -0400
Received: by mail-lf0-f47.google.com with SMTP id l131so107532828lfl.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 04:45:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>

The build complains about missing MODULE_LICENSE() in
the Aspeed GPIO driver. The license is evident from the
file header, put in "GPL".

Cc: Joel Stanley <joel@jms.id.au>
Cc: Alistair Popple <alistair@popple.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
2.7.4

