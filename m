From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 125/182] ARM: imx: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:35:25 +0100
Message-ID: <1449668125-3775-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34623 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754214AbbLINff (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:35:35 -0500
Received: by lffu14 with SMTP id u14so34377103lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:35:34 -0800 (PST)
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
 arch/arm/mach-imx/mach-mx27ads.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/mach-mx27ads.c b/arch/arm/mach-imx/mach-mx27ads.c
index eb1c3477c48a..f510c43981d3 100644
--- a/arch/arm/mach-imx/mach-mx27ads.c
+++ b/arch/arm/mach-imx/mach-mx27ads.c
@@ -13,6 +13,8 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  */
+#include <linux/gpio/driver.h>
+/* Needed for gpio_to_irq() */
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
@@ -243,7 +245,7 @@ static void __init mx27ads_regulator_init(void)
 	vchip->ngpio		= 1;
 	vchip->direction_output	= vgpio_dir_out;
 	vchip->set		= vgpio_set;
-	gpiochip_add(vchip);
+	gpiochip_add_data(vchip, NULL);
 
 	platform_device_register_data(NULL, "reg-fixed-voltage",
 				      PLATFORM_DEVID_AUTO,
-- 
2.4.3

