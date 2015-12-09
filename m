From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 133/182] blackfin: extgpio: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:37:50 +0100
Message-ID: <1449668270-4255-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35889 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbbLINiG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:38:06 -0500
Received: by lbblt2 with SMTP id lt2so30246700lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:38:04 -0800 (PST)
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

BTW: consider cleaning this up and moving it to drivers/gpio
at some point. Also GPIO drivers should be including
to not knowing how <asm/gpio.h> is thought out. But please abstract
it out if you find the time.
---
 arch/blackfin/mach-bf538/ext-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/blackfin/mach-bf538/ext-gpio.c b/arch/blackfin/mach-bf538/ext-gpio.c
index 471a9b184d5b..c878b57d29aa 100644
--- a/arch/blackfin/mach-bf538/ext-gpio.c
+++ b/arch/blackfin/mach-bf538/ext-gpio.c
@@ -116,9 +116,9 @@ static struct gpio_chip bf538_porte_chip = {
 
 static int __init bf538_extgpio_setup(void)
 {
-	return gpiochip_add(&bf538_portc_chip) |
-		gpiochip_add(&bf538_portd_chip) |
-		gpiochip_add(&bf538_porte_chip);
+	return gpiochip_add_data(&bf538_portc_chip, NULL) |
+		gpiochip_add_data(&bf538_portd_chip, NULL) |
+		gpiochip_add_data(&bf538_porte_chip, NULL);
 }
 arch_initcall(bf538_extgpio_setup);
 
-- 
2.4.3

