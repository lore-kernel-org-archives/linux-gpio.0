From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 139/182] MIPS: txx9: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:39:44 +0100
Message-ID: <1449668384-4634-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:34892 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINj4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:39:56 -0500
Received: by lbpu9 with SMTP id u9so29955773lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:39:55 -0800 (PST)
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
 arch/mips/kernel/gpio_txx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/gpio_txx9.c b/arch/mips/kernel/gpio_txx9.c
index c6854d9df926..2cfde19b6893 100644
--- a/arch/mips/kernel/gpio_txx9.c
+++ b/arch/mips/kernel/gpio_txx9.c
@@ -10,7 +10,7 @@
 
 #include <linux/init.h>
 #include <linux/spinlock.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <asm/txx9pio.h>
@@ -85,5 +85,5 @@ int __init txx9_gpio_init(unsigned long baseaddr,
 		return -ENODEV;
 	txx9_gpio_chip.base = base;
 	txx9_gpio_chip.ngpio = num;
-	return gpiochip_add(&txx9_gpio_chip);
+	return gpiochip_add_data(&txx9_gpio_chip, NULL);
 }
-- 
2.4.3

