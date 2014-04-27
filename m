From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 2/4] gpio: kempld: use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 02:00:48 +0200
Message-ID: <1398556850-27751-3-git-send-email-javier@dowhile0.org>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:62183 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbaD0ABG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Apr 2014 20:01:06 -0400
Received: by mail-we0-f176.google.com with SMTP id x48so4910075wes.21
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2014 17:01:05 -0700 (PDT)
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, inux-omap@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Using the BIT() macro instead of manually shifting bits
makes the code less error prone and also more readable.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 drivers/gpio/gpio-kempld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index ebe1023..1e5e519 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -24,7 +24,7 @@
 #include <linux/mfd/kempld.h>
 
 #define KEMPLD_GPIO_MAX_NUM		16
-#define KEMPLD_GPIO_MASK(x)		(1 << ((x) % 8))
+#define KEMPLD_GPIO_MASK(x)		(BIT((x) % 8))
 #define KEMPLD_GPIO_DIR_NUM(x)		(0x40 + (x) / 8)
 #define KEMPLD_GPIO_LVL_NUM(x)		(0x42 + (x) / 8)
 #define KEMPLD_GPIO_EVT_LVL_EDGE	0x46
-- 
1.9.1

