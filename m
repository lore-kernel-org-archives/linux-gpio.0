From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 132/182] blackfin: gpio: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:37:40 +0100
Message-ID: <1449668260-4207-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:36752 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754136AbbLINhq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:37:46 -0500
Received: by lbblt2 with SMTP id lt2so30241226lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:37:45 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Sonic Zhang <sonic.zhang@analog.com>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Sonic Zhang <sonic.zhang@analog.com>
Cc: Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Blackfin maintainers: please ACK this so I can take it through
the GPIO tree.

BTW: isn't this going away? I liked Sonic's
drivers/pinctrl/pinctrl-adi2.c driver, is this adi1? It should be
modernized and moved to drivers/pinctrl.
---
 arch/blackfin/kernel/bfin_gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/blackfin/kernel/bfin_gpio.c b/arch/blackfin/kernel/bfin_gpio.c
index a017359c1826..7a91cc6ea4b2 100644
--- a/arch/blackfin/kernel/bfin_gpio.c
+++ b/arch/blackfin/kernel/bfin_gpio.c
@@ -11,6 +11,8 @@
 #include <linux/err.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/gpio/driver.h>
+/* FIXME: consumer API required for gpio_set_value() etc, get rid of this */
 #include <linux/gpio.h>
 #include <linux/irq.h>
 
@@ -1197,7 +1199,7 @@ static struct gpio_chip bfin_chip = {
 
 static int __init bfin_gpiolib_setup(void)
 {
-	return gpiochip_add(&bfin_chip);
+	return gpiochip_add_data(&bfin_chip, NULL);
 }
 arch_initcall(bfin_gpiolib_setup);
 #endif
-- 
2.4.3

