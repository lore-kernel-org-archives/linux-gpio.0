From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: sch311x: fix compilation error
Date: Mon, 23 Dec 2013 18:13:54 +0100
Message-ID: <1387818834-3985-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:52817 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754146Ab3LWROC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Dec 2013 12:14:02 -0500
Received: by mail-lb0-f169.google.com with SMTP id u14so2459990lbd.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2013 09:14:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Compilation failed on some platforms due to implicit inclusion of
<linux/io.h>, make this dependency explicit.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sch311x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 483a6f8bd958..0357387b3645 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/bitops.h>
+#include <linux/io.h>
 
 #define DRV_NAME			"gpio-sch311x"
 
-- 
1.8.3.1

