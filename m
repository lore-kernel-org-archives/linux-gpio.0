From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 126/182] ARM: ixp4xx: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:35:38 +0100
Message-ID: <1449668138-3822-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34981 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317AbbLINfp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:35:45 -0500
Received: by lbpu9 with SMTP id u9so29886066lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:35:43 -0800 (PST)
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
 arch/arm/mach-ixp4xx/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 1cb6f2f02880..26874f608ca9 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -27,7 +27,7 @@
 #include <linux/clockchips.h>
 #include <linux/io.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/cpu.h>
 #include <linux/pci.h>
 #include <linux/sched_clock.h>
@@ -461,7 +461,7 @@ void __init ixp4xx_sys_init(void)
 
 	platform_add_devices(ixp4xx_devices, ARRAY_SIZE(ixp4xx_devices));
 
-	gpiochip_add(&ixp4xx_gpio_chip);
+	gpiochip_add_data(&ixp4xx_gpio_chip, NULL);
 
 	if (cpu_is_ixp46x()) {
 		int region;
-- 
2.4.3

