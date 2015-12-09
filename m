From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 140/182] MIPS: rb532: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:40:01 +0100
Message-ID: <1449668401-4687-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33998 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbbLINkG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:40:06 -0500
Received: by lffu14 with SMTP id u14so34464822lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:40:05 -0800 (PST)
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
 arch/mips/rb532/gpio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 650d5d39f34d..97a5e2c3797b 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -32,7 +32,7 @@
 #include <linux/export.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <asm/mach-rc32434/rb.h>
 #include <asm/mach-rc32434/gpio.h>
@@ -88,7 +88,7 @@ static int rb532_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct rb532_gpio_chip	*gpch;
 
-	gpch = container_of(chip, struct rb532_gpio_chip, chip);
+	gpch = gpiochip_get_data(chip);
 	return rb532_get_bit(offset, gpch->regbase + GPIOD);
 }
 
@@ -100,7 +100,7 @@ static void rb532_gpio_set(struct gpio_chip *chip,
 {
 	struct rb532_gpio_chip	*gpch;
 
-	gpch = container_of(chip, struct rb532_gpio_chip, chip);
+	gpch = gpiochip_get_data(chip);
 	rb532_set_bit(value, offset, gpch->regbase + GPIOD);
 }
 
@@ -111,7 +111,7 @@ static int rb532_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct rb532_gpio_chip	*gpch;
 
-	gpch = container_of(chip, struct rb532_gpio_chip, chip);
+	gpch = gpiochip_get_data(chip);
 
 	/* disable alternate function in case it's set */
 	rb532_set_bit(0, offset, gpch->regbase + GPIOFUNC);
@@ -128,7 +128,7 @@ static int rb532_gpio_direction_output(struct gpio_chip *chip,
 {
 	struct rb532_gpio_chip	*gpch;
 
-	gpch = container_of(chip, struct rb532_gpio_chip, chip);
+	gpch = gpiochip_get_data(chip);
 
 	/* disable alternate function in case it's set */
 	rb532_set_bit(0, offset, gpch->regbase + GPIOFUNC);
@@ -200,7 +200,7 @@ int __init rb532_gpio_init(void)
 	}
 
 	/* Register our GPIO chip */
-	gpiochip_add(&rb532_gpio_chip->chip);
+	gpiochip_add_data(&rb532_gpio_chip->chip, rb532_gpio_chip);
 
 	return 0;
 }
-- 
2.4.3

