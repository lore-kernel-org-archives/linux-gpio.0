From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 151/182] sh: x3proto-gpio: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:42:46 +0100
Message-ID: <1449668566-5356-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35198 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINmu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:42:50 -0500
Received: by lfdl133 with SMTP id l133so34323590lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:42:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Paul Mundt <lethal@linux-sh.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sh@vger.kernel.org

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Paul Mundt <lethal@linux-sh.org>
Cc: linux-sh@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SH people: please ACK this so I can take it through the
GPIO tree.
---
 arch/sh/boards/mach-x3proto/gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/boards/mach-x3proto/gpio.c b/arch/sh/boards/mach-x3proto/gpio.c
index 1fb2cbee25f2..cea88b0effa2 100644
--- a/arch/sh/boards/mach-x3proto/gpio.c
+++ b/arch/sh/boards/mach-x3proto/gpio.c
@@ -13,7 +13,7 @@
 
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
@@ -107,7 +107,7 @@ int __init x3proto_gpio_setup(void)
 	if (unlikely(ilsel < 0))
 		return ilsel;
 
-	ret = gpiochip_add(&x3proto_gpio_chip);
+	ret = gpiochip_add_data(&x3proto_gpio_chip, NULL);
 	if (unlikely(ret))
 		goto err_gpio;
 
-- 
2.4.3

