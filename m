From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] gpio: generic: add get_direction support
Date: Fri, 12 Jun 2015 18:20:35 +0200
Message-ID: <1434126035-18596-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60272 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752697AbbFLQUj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2015 12:20:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

Allow to determine the current direction configuration by
reading back from the direction register.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpio/gpio-generic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b92a690..fb9c572 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -291,6 +291,14 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	return 0;
 }
 
+static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	return (bgc->read_reg(bgc->reg_dir) & bgc->pin2mask(bgc, gpio)) ?
+	       GPIOF_DIR_OUT : GPIOF_DIR_IN;
+}
+
 static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
@@ -340,6 +348,14 @@ static int bgpio_dir_out_inv(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int bgpio_get_dir_inv(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+
+	return (bgc->read_reg(bgc->reg_dir) & bgc->pin2mask(bgc, gpio)) ?
+	       GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
 static int bgpio_setup_accessors(struct device *dev,
 				 struct bgpio_chip *bgc,
 				 bool bit_be,
@@ -452,10 +468,12 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 		bgc->reg_dir = dirout;
 		bgc->gc.direction_output = bgpio_dir_out;
 		bgc->gc.direction_input = bgpio_dir_in;
+		bgc->gc.get_direction = bgpio_get_dir;
 	} else if (dirin) {
 		bgc->reg_dir = dirin;
 		bgc->gc.direction_output = bgpio_dir_out_inv;
 		bgc->gc.direction_input = bgpio_dir_in_inv;
+		bgc->gc.get_direction = bgpio_get_dir_inv;
 	} else {
 		bgc->gc.direction_output = bgpio_simple_dir_out;
 		bgc->gc.direction_input = bgpio_simple_dir_in;
-- 
2.1.4

