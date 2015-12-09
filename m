From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 149/182] powerpc: simple-gpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:41:55 +0100
Message-ID: <1449668515-5167-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:33847 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINl7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:41:59 -0500
Received: by lbbcs9 with SMTP id cs9so30123407lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:41:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <anton@enomsg.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Anton Vorontsov <anton@enomsg.org>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Power maintainers: please ACK this. This looks like a pretty clean
GPIO driver that should ideally move to drivers/gpio. It should be
fine to change the include from <linux/gpio.h> to
<linux/gpio/driver.h> on this as it does not appear to use the
consumer API.

I wonder if this can even use the simple DT bound platform driver
inside drivers/gpio/gpio-generic these days?
---
 arch/powerpc/sysdev/simple_gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/sysdev/simple_gpio.c b/arch/powerpc/sysdev/simple_gpio.c
index ff5e73230a36..c2fa46cfa4cd 100644
--- a/arch/powerpc/sysdev/simple_gpio.c
+++ b/arch/powerpc/sysdev/simple_gpio.c
@@ -19,7 +19,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <asm/prom.h>
 #include "simple_gpio.h"
@@ -32,11 +32,6 @@ struct u8_gpio_chip {
 	u8 data;
 };
 
-static struct u8_gpio_chip *to_u8_gpio_chip(struct of_mm_gpio_chip *mm_gc)
-{
-	return container_of(mm_gc, struct u8_gpio_chip, mm_gc);
-}
-
 static u8 u8_pin2mask(unsigned int pin)
 {
 	return 1 << (8 - 1 - pin);
@@ -52,7 +47,7 @@ static int u8_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static void u8_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct u8_gpio_chip *u8_gc = to_u8_gpio_chip(mm_gc);
+	struct u8_gpio_chip *u8_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&u8_gc->lock, flags);
@@ -80,7 +75,7 @@ static int u8_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static void u8_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct u8_gpio_chip *u8_gc = to_u8_gpio_chip(mm_gc);
+	struct u8_gpio_chip *u8_gc = gpiochip_get_data(&mm_gc->gc);
 
 	u8_gc->data = in_8(mm_gc->regs);
 }
@@ -108,7 +103,7 @@ static int __init u8_simple_gpiochip_add(struct device_node *np)
 	gc->get = u8_gpio_get;
 	gc->set = u8_gpio_set;
 
-	ret = of_mm_gpiochip_add(np, mm_gc);
+	ret = of_mm_gpiochip_add_data(np, mm_gc, u8_gc);
 	if (ret)
 		goto err;
 	return 0;
-- 
2.4.3

