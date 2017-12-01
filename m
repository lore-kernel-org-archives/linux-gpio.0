From: Daniel Axtens <dja@axtens.net>
Subject: [PATCH] gpio: iop: add MODULE_LICENSE
Date: Fri,  1 Dec 2017 13:10:23 +1100
Message-ID: <20171201021023.25054-1-dja@axtens.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33124 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbdLACKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 21:10:38 -0500
Received: by mail-pf0-f195.google.com with SMTP id y89so3981177pfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 18:10:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: trivial@kernel.org, Daniel Axtens <dja@axtens.net>

This fixes the following warning in an allmodconfig build:
WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-iop.o

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 drivers/gpio/gpio-iop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 98c7ff2a76e7..8a19143e865b 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -58,3 +58,5 @@ static int __init iop3xx_gpio_init(void)
 	return platform_driver_register(&iop3xx_gpio_driver);
 }
 arch_initcall(iop3xx_gpio_init);
+
+MODULE_LICENSE("GPL");
-- 
2.11.0

