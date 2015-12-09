From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 040/182] gpio: mm-lantiq: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:20 +0100
Message-ID: <1449667100-31646-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33915 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbbLINSZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:25 -0500
Received: by lbbcs9 with SMTP id cs9so29722975lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, John Crispin <blogic@openwrt.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index f67ef2283d64..a2071ed69f79 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -61,9 +61,7 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  */
 static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ltq_mm *chip =
-		container_of(mm_gc, struct ltq_mm, mmchip);
+	struct ltq_mm *chip = gpiochip_get_data(gc);
 
 	if (value)
 		chip->shadow |= (1 << offset);
@@ -93,8 +91,7 @@ static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
  */
 static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct ltq_mm *chip =
-		container_of(mm_gc, struct ltq_mm, mmchip);
+	struct ltq_mm *chip = gpiochip_get_data(&mm_gc->gc);
 
 	/* tell the ebu controller which memory address we will be using */
 	ltq_ebu_w32(CPHYSADDR(chip->mmchip.regs) | 0x1, LTQ_EBU_ADDRSEL1);
@@ -122,7 +119,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "lantiq,shadow", &shadow))
 		chip->shadow = shadow;
 
-	return of_mm_gpiochip_add(pdev->dev.of_node, &chip->mmchip);
+	return of_mm_gpiochip_add_data(pdev->dev.of_node, &chip->mmchip, chip);
 }
 
 static int ltq_mm_remove(struct platform_device *pdev)
-- 
2.4.3

