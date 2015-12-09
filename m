From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 083/182] gpio: xilinx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:28:24 +0100
Message-ID: <1449667704-1395-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:34553 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN2b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:28:31 -0500
Received: by lbbcs9 with SMTP id cs9so29892930lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:28:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 5c2971e1cb08..3345ab0ba1b3 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -92,8 +92,7 @@ static inline int xgpio_offset(struct xgpio_instance =
*chip, int gpio)
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
-	struct xgpio_instance *chip =3D
-	    container_of(mm_gc, struct xgpio_instance, mmchip);
+	struct xgpio_instance *chip =3D gpiochip_get_data(gc);
 	u32 val;
=20
 	val =3D xgpio_readreg(mm_gc->regs + XGPIO_DATA_OFFSET +
@@ -115,8 +114,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigne=
d int gpio, int val)
 {
 	unsigned long flags;
 	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
-	struct xgpio_instance *chip =3D
-	    container_of(mm_gc, struct xgpio_instance, mmchip);
+	struct xgpio_instance *chip =3D gpiochip_get_data(gc);
 	int index =3D  xgpio_index(chip, gpio);
 	int offset =3D  xgpio_offset(chip, gpio);
=20
@@ -147,8 +145,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsig=
ned int gpio)
 {
 	unsigned long flags;
 	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
-	struct xgpio_instance *chip =3D
-	    container_of(mm_gc, struct xgpio_instance, mmchip);
+	struct xgpio_instance *chip =3D gpiochip_get_data(gc);
 	int index =3D  xgpio_index(chip, gpio);
 	int offset =3D  xgpio_offset(chip, gpio);
=20
@@ -180,8 +177,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsi=
gned int gpio, int val)
 {
 	unsigned long flags;
 	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
-	struct xgpio_instance *chip =3D
-	    container_of(mm_gc, struct xgpio_instance, mmchip);
+	struct xgpio_instance *chip =3D gpiochip_get_data(gc);
 	int index =3D  xgpio_index(chip, gpio);
 	int offset =3D  xgpio_offset(chip, gpio);
=20
@@ -211,8 +207,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsi=
gned int gpio, int val)
  */
 static void xgpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct xgpio_instance *chip =3D
-	    container_of(mm_gc, struct xgpio_instance, mmchip);
+	struct xgpio_instance *chip =3D gpiochip_get_data(&mm_gc->gc);
=20
 	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
 	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
@@ -314,7 +309,7 @@ static int xgpio_probe(struct platform_device *pdev=
)
 	chip->mmchip.save_regs =3D xgpio_save_regs;
=20
 	/* Call the OF gpio helper to setup and register the GPIO device */
-	status =3D of_mm_gpiochip_add(np, &chip->mmchip);
+	status =3D of_mm_gpiochip_add_data(np, &chip->mmchip, chip);
 	if (status) {
 		pr_err("%s: error in probe function with status %d\n",
 		       np->full_name, status);
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
