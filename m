From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 128/182] ARM: simpad: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:35:55 +0100
Message-ID: <1449668155-3918-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36582 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754541AbbLINf7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:35:59 -0500
Received: by lfs39 with SMTP id 39so34519634lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:35:58 -0800 (PST)
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
 arch/arm/mach-sa1100/simpad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sa1100/simpad.c b/arch/arm/mach-sa1100/simpad.c
index 41e476e571d7..30c88b9917c1 100644
--- a/arch/arm/mach-sa1100/simpad.c
+++ b/arch/arm/mach-sa1100/simpad.c
@@ -15,7 +15,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <mach/hardware.h>
 #include <asm/setup.h>
@@ -369,7 +369,7 @@ static int __init simpad_init(void)
 	cs3_gpio.get = cs3_gpio_get;
 	cs3_gpio.direction_input = cs3_gpio_direction_input;
 	cs3_gpio.direction_output = cs3_gpio_direction_output;
-	ret = gpiochip_add(&cs3_gpio);
+	ret = gpiochip_add_data(&cs3_gpio, NULL);
 	if (ret)
 		printk(KERN_WARNING "simpad: Unable to register cs3 GPIO device");
 
-- 
2.4.3

