From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 142/182] MIPS: txx9: rbtx4938: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:40:16 +0100
Message-ID: <1449668416-4785-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35865 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbbLINkV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:40:21 -0500
Received: by lfs39 with SMTP id 39so34603981lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:40:20 -0800 (PST)
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

This one needs to include both <linux/gpio/driver.h> and
<linux/gpio.h> since it is using both the driver and consumer
interface, and looks like one of those cases where the gpio
implementations should be kept local to this file.
---
 arch/mips/txx9/rbtx4938/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/txx9/rbtx4938/setup.c b/arch/mips/txx9/rbtx4938/setup.c
index c9afd05020e0..54de66837103 100644
--- a/arch/mips/txx9/rbtx4938/setup.c
+++ b/arch/mips/txx9/rbtx4938/setup.c
@@ -14,6 +14,7 @@
 #include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio.h>
 #include <linux/mtd/physmap.h>
 
@@ -335,7 +336,7 @@ static void __init rbtx4938_mtd_init(void)
 
 static void __init rbtx4938_arch_init(void)
 {
-	gpiochip_add(&rbtx4938_spi_gpio_chip);
+	gpiochip_add_data(&rbtx4938_spi_gpio_chip, NULL);
 	rbtx4938_pci_setup();
 	rbtx4938_spi_init();
 }
-- 
2.4.3

