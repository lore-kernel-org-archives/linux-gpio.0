From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 134/182] m68k: gpio: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:38:35 +0100
Message-ID: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34253 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754630AbbLINik (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:38:40 -0500
Received: by lffu14 with SMTP id u14so34437570lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:38:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Greg Ungerer <gerg@uclinux.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Coldfire maintainers: please ACK this so I can take it through
the GPIO tree.
Also consider abstracting out GPIO and moving it to drivers/gpio
at some point. It would involve some work though.
---
 arch/m68k/coldfire/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index e7e428681ec5..19c335d5031d 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -178,7 +178,7 @@ static struct gpio_chip mcfgpio_chip = {
 
 static int __init mcfgpio_sysinit(void)
 {
-	gpiochip_add(&mcfgpio_chip);
+	gpiochip_add_data(&mcfgpio_chip, NULL);
 	return subsys_system_register(&mcfgpio_subsys, NULL);
 }
 
-- 
2.4.3

