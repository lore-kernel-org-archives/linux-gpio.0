From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: f7188x: use BIT() macro
Date: Sat,  9 Apr 2016 16:13:24 +0200
Message-ID: <1460211204-2761-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33832 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244AbcDIONb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 10:13:31 -0400
Received: by mail-lf0-f43.google.com with SMTP id j11so107761212lfb.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 07:13:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Hung <hpeter@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>

Align to how we handle bitmasks in most drivers in the
subsystem: using the BIT(n) macro over (1 << n).

Cc: Peter Hung <hpeter@gmail.com>
Cc: Andreas Bofjall <andreas@gazonk.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-f7188x.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index daac2d480db1..8b10fbf787f8 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -15,7 +15,8 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitops.h>
 
 #define DRVNAME "gpio-f7188x"
 
@@ -217,7 +218,7 @@ static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	superio_select(sio->addr, SIO_LD_GPIO);
 
 	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
-	dir &= ~(1 << offset);
+	dir &= ~BIT(offset);
 	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
 
 	superio_exit(sio->addr);
@@ -238,7 +239,7 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
 	superio_select(sio->addr, SIO_LD_GPIO);
 
 	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
-	dir = !!(dir & (1 << offset));
+	dir = !!(dir & BIT(offset));
 	if (dir)
 		data = superio_inb(sio->addr, gpio_data_out(bank->regbase));
 	else
@@ -246,7 +247,7 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 	superio_exit(sio->addr);
 
-	return !!(data & 1 << offset);
+	return !!(data & BIT(offset));
 }
 
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
@@ -264,13 +265,13 @@ static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 
 	data_out = superio_inb(sio->addr, gpio_data_out(bank->regbase));
 	if (value)
-		data_out |= (1 << offset);
+		data_out |= BIT(offset);
 	else
-		data_out &= ~(1 << offset);
+		data_out &= ~BIT(offset);
 	superio_outb(sio->addr, gpio_data_out(bank->regbase), data_out);
 
 	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
-	dir |= (1 << offset);
+	dir |= BIT(offset);
 	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
 
 	superio_exit(sio->addr);
@@ -292,9 +293,9 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	data_out = superio_inb(sio->addr, gpio_data_out(bank->regbase));
 	if (value)
-		data_out |= (1 << offset);
+		data_out |= BIT(offset);
 	else
-		data_out &= ~(1 << offset);
+		data_out &= ~BIT(offset);
 	superio_outb(sio->addr, gpio_data_out(bank->regbase), data_out);
 
 	superio_exit(sio->addr);
-- 
2.4.3

