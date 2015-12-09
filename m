From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 138/182] MIPS: jz4740: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:39:32 +0100
Message-ID: <1449668372-4587-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35528 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbLINjm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:39:42 -0500
Received: by lfdl133 with SMTP id l133so34261949lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:39:40 -0800 (PST)
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
to drivers/gpio in the long run.
---
 arch/mips/jz4740/gpio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/jz4740/gpio.c b/arch/mips/jz4740/gpio.c
index 8c6d76c9b2d6..c2607e8ec758 100644
--- a/arch/mips/jz4740/gpio.c
+++ b/arch/mips/jz4740/gpio.c
@@ -18,6 +18,8 @@
 #include <linux/init.h>
 
 #include <linux/io.h>
+#include <linux/gpio/driver.h>
+/* FIXME: needed for gpio_request(), try to remove consumer API from driver */
 #include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -91,9 +93,9 @@ static inline struct jz_gpio_chip *gpio_to_jz_gpio_chip(unsigned int gpio)
 	return &jz4740_gpio_chips[gpio >> 5];
 }
 
-static inline struct jz_gpio_chip *gpio_chip_to_jz_gpio_chip(struct gpio_chip *gpio_chip)
+static inline struct jz_gpio_chip *gpio_chip_to_jz_gpio_chip(struct gpio_chip *gc)
 {
-	return container_of(gpio_chip, struct jz_gpio_chip, gpio_chip);
+	return gpiochip_get_data(gc);
 }
 
 static inline struct jz_gpio_chip *irq_to_jz_gpio_chip(struct irq_data *data)
@@ -234,7 +236,7 @@ static int jz_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 
 static int jz_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 {
-	struct jz_gpio_chip *jz_gpio = gpio_chip_to_jz_gpio_chip(chip);
+	struct jz_gpio_chip *jz_gpio = gpiochip_get_data(chip);
 
 	return jz_gpio->irq_base + gpio;
 }
@@ -449,7 +451,7 @@ static void jz4740_gpio_chip_init(struct jz_gpio_chip *chip, unsigned int id)
 	irq_setup_generic_chip(gc, IRQ_MSK(chip->gpio_chip.ngpio),
 		IRQ_GC_INIT_NESTED_LOCK, 0, IRQ_NOPROBE | IRQ_LEVEL);
 
-	gpiochip_add(&chip->gpio_chip);
+	gpiochip_add_data(&chip->gpio_chip, chip);
 }
 
 static int __init jz4740_gpio_init(void)
-- 
2.4.3

