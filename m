From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 144/182] powerpc: mpc8349emitx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:16 +0100
Message-ID: <1449668476-4929-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33371 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753925AbbLINlU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:20 -0500
Received: by lfaz4 with SMTP id z4so34471661lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Power maintainers: please ACK this. I cannot really say if this
should ideally be broken out as a separate driver in drivers/gpio
or if it is better to keep it here. For now just refactoring...
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 15e8021ddef9..dbcd0303afed 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -16,7 +16,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
@@ -99,7 +99,7 @@ static void mcu_power_off(void)
 
 static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct mcu *mcu = container_of(gc, struct mcu, gc);
+	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
 
 	mutex_lock(&mcu->lock);
@@ -136,7 +136,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->of_node = np;
 
-	return gpiochip_add(gc);
+	return gpiochip_add_data(gc, mcu);
 }
 
 static int mcu_gpiochip_remove(struct mcu *mcu)
-- 
2.4.3

