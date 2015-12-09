From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 152/182] unicore32: gpio: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:43:07 +0100
Message-ID: <1449668587-5452-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:36386 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754083AbbLINnN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:43:13 -0500
Received: by lfs39 with SMTP id 39so34659628lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:43:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Guan please ACK this so I can take it through the GPIO tree.
BTW this could possibly move to drivers/gpio but I don't have
the whole picture here. The internal consumers should be
converted to the GPIO descriptor API.
---
 arch/unicore32/kernel/gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/unicore32/kernel/gpio.c b/arch/unicore32/kernel/gpio.c
index cb12ec39552c..54a54c335a72 100644
--- a/arch/unicore32/kernel/gpio.c
+++ b/arch/unicore32/kernel/gpio.c
@@ -14,6 +14,8 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/gpio/driver.h>
+/* FIXME: needed for gpio_set_value() - convert to use descriptors or hogs */
 #include <linux/gpio.h>
 #include <mach/hardware.h>
 
@@ -118,5 +120,5 @@ void __init puv3_init_gpio(void)
  *	gpio_set_value(GPO_SET_V2, 1);
  */
 #endif
-	gpiochip_add(&puv3_gpio_chip);
+	gpiochip_add_data(&puv3_gpio_chip, NULL);
 }
-- 
2.4.3

