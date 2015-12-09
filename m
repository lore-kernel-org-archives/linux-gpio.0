From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 141/182] MIPS: txx9: iocled: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:40:09 +0100
Message-ID: <1449668409-4738-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:32871 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbbLINkO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:40:14 -0500
Received: by lbbkw15 with SMTP id kw15so30175634lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:40:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ralf: please ACK this so I can take it through the GPIO tree.
BTW: would be nice if the MIPS GPIO drivers could move down
to drivers/gpio in the long run. This should compile with
just #include <linux/gpio/driver.h>, I hope that works.
---
 arch/mips/txx9/generic/setup.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 9d9962ab7d25..78cffd8e63d3 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/mtd/physmap.h>
@@ -687,16 +687,14 @@ struct txx9_iocled_data {
 
 static int txx9_iocled_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct txx9_iocled_data *data =
-		container_of(chip, struct txx9_iocled_data, chip);
+	struct txx9_iocled_data *data = gpiochip_get_data(chip);
 	return data->cur_val & (1 << offset);
 }
 
 static void txx9_iocled_set(struct gpio_chip *chip, unsigned int offset,
 			    int value)
 {
-	struct txx9_iocled_data *data =
-		container_of(chip, struct txx9_iocled_data, chip);
+	struct txx9_iocled_data *data = gpiochip_get_data(chip);
 	unsigned long flags;
 	spin_lock_irqsave(&txx9_iocled_lock, flags);
 	if (value)
@@ -749,7 +747,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	iocled->chip.label = "iocled";
 	iocled->chip.base = basenum;
 	iocled->chip.ngpio = num;
-	if (gpiochip_add(&iocled->chip))
+	if (gpiochip_add_data(&iocled->chip, iocled))
 		goto out_unmap;
 	if (basenum < 0)
 		basenum = iocled->chip.base;
-- 
2.4.3

