From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 124/182] ARM: gemini: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:35:16 +0100
Message-ID: <1449668116-3728-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36255 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754284AbbLINfW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:35:22 -0500
Received: by lfs39 with SMTP id 39so34507875lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:35:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, arm@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC guys: please ACK this so I can take it through the
GPIO tree.
---
 arch/arm/mach-gemini/gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-gemini/gpio.c b/arch/arm/mach-gemini/gpio.c
index 2478d9f4d92d..469a76ea0459 100644
--- a/arch/arm/mach-gemini/gpio.c
+++ b/arch/arm/mach-gemini/gpio.c
@@ -17,7 +17,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
@@ -227,5 +227,5 @@ void __init gemini_gpio_init(void)
 						 (void *)i);
 	}
 
-	BUG_ON(gpiochip_add(&gemini_gpio_chip));
+	BUG_ON(gpiochip_add_data(&gemini_gpio_chip, NULL));
 }
-- 
2.4.3

