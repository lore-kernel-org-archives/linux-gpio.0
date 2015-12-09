From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 137/182] MIPS: bcm63xx: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:39:19 +0100
Message-ID: <1449668359-4540-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:35710 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINj3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:39:29 -0500
Received: by lbpu9 with SMTP id u9so29948294lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:39:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ralf: please ACK this so I can take it through the GPIO tree.
BTW: would be nice if the MIPS GPIO drivers could move down
to drivers/gpio in the long run. This should compile with
just #include <linux/gpio/driver.h>, I hope that works.
---
 arch/mips/bcm63xx/gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/gpio.c b/arch/mips/bcm63xx/gpio.c
index 468bc7b99cd3..7c256dadb166 100644
--- a/arch/mips/bcm63xx/gpio.c
+++ b/arch/mips/bcm63xx/gpio.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <bcm63xx_cpu.h>
 #include <bcm63xx_gpio.h>
@@ -147,5 +147,5 @@ int __init bcm63xx_gpio_init(void)
 	bcm63xx_gpio_chip.ngpio = bcm63xx_gpio_count();
 	pr_info("registering %d GPIOs\n", bcm63xx_gpio_chip.ngpio);
 
-	return gpiochip_add(&bcm63xx_gpio_chip);
+	return gpiochip_add_data(&bcm63xx_gpio_chip, NULL);
 }
-- 
2.4.3

