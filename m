From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 166/182] mfd: tc6393xb: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:48:00 +0100
Message-ID: <1449668880-6404-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36026 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINsF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:48:05 -0500
Received: by lfs39 with SMTP id 39so34757095lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:48:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Baryshkov <dbaryshkov@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/tc6393xb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
index 8c84a513016b..a5253f9a5089 100644
--- a/drivers/mfd/tc6393xb.c
+++ b/drivers/mfd/tc6393xb.c
@@ -24,7 +24,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tmio.h>
 #include <linux/mfd/tc6393xb.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 
 #define SCR_REVID	0x08		/* b Revision ID	*/
@@ -434,7 +434,7 @@ static struct mfd_cell tc6393xb_cells[] = {
 static int tc6393xb_gpio_get(struct gpio_chip *chip,
 		unsigned offset)
 {
-	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
+	struct tc6393xb *tc6393xb = gpiochip_get_data(chip);
 
 	/* XXX: does dsr also represent inputs? */
 	return tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
@@ -444,7 +444,7 @@ static int tc6393xb_gpio_get(struct gpio_chip *chip,
 static void __tc6393xb_gpio_set(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
-	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
+	struct tc6393xb *tc6393xb = gpiochip_get_data(chip);
 	u8  dsr;
 
 	dsr = tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8));
@@ -459,7 +459,7 @@ static void __tc6393xb_gpio_set(struct gpio_chip *chip,
 static void tc6393xb_gpio_set(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
-	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
+	struct tc6393xb *tc6393xb = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tc6393xb->lock, flags);
@@ -472,7 +472,7 @@ static void tc6393xb_gpio_set(struct gpio_chip *chip,
 static int tc6393xb_gpio_direction_input(struct gpio_chip *chip,
 			unsigned offset)
 {
-	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
+	struct tc6393xb *tc6393xb = gpiochip_get_data(chip);
 	unsigned long flags;
 	u8 doecr;
 
@@ -490,7 +490,7 @@ static int tc6393xb_gpio_direction_input(struct gpio_chip *chip,
 static int tc6393xb_gpio_direction_output(struct gpio_chip *chip,
 			unsigned offset, int value)
 {
-	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
+	struct tc6393xb *tc6393xb = gpiochip_get_data(chip);
 	unsigned long flags;
 	u8 doecr;
 
@@ -517,7 +517,7 @@ static int tc6393xb_register_gpio(struct tc6393xb *tc6393xb, int gpio_base)
 	tc6393xb->gpio.direction_input = tc6393xb_gpio_direction_input;
 	tc6393xb->gpio.direction_output = tc6393xb_gpio_direction_output;
 
-	return gpiochip_add(&tc6393xb->gpio);
+	return gpiochip_add_data(&tc6393xb->gpio, tc6393xb);
 }
 
 /*--------------------------------------------------------------------------*/
-- 
2.4.3

