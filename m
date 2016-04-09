From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: sx150x: use the new open drain callback
Date: Sat,  9 Apr 2016 13:30:32 +0200
Message-ID: <1460201432-32652-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36844 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752721AbcDILaj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 07:30:39 -0400
Received: by mail-lf0-f45.google.com with SMTP id g184so105338059lfb.3
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 04:30:38 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>, Peter Rosin <peda@axentia.se>

One variant of the SX150X GPIO chip supports setting the pins in
open drain mode. This is currently available to set from platform
data, but completely unused in the kernel.

Activate the new .set_single_ended() callback so users can set
this up from e.g. device tree or board files using the new
GPIO descriptors.

As part of this, delete the platform data open drain setting
method.

Cc: Wei Chen <Wei.Chen@csr.com>
Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sx150x.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index d4501d5f8b8e..a177ebd921d5 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -105,13 +105,6 @@ struct sx150x_device_data {
  *                 bit at position n will enable the pull-down for the IO at
  *                 the corresponding offset.  For chips with fewer than
  *                 16 IO pins, high-end bits are ignored.
- * @io_open_drain_ena: A bit-mask which enables-or disables open-drain
- *                     operation for each IO line in the expander. Setting the
- *                     bit at position n enables open-drain operation for
- *                     the IO at the corresponding offset.  Clearing the bit
- *                     enables regular push-pull operation for that IO.
- *                     For chips with fewer than 16 IO pins, high-end bits
- *                     are ignored.
  * @io_polarity: A bit-mask which enables polarity inversion for each IO line
  *               in the expander.  Setting the bit at position n inverts
  *               the polarity of that IO line, while clearing it results
@@ -136,7 +129,6 @@ struct sx150x_platform_data {
 	bool     oscio_is_gpo;
 	u16      io_pullup_ena;
 	u16      io_pulldn_ena;
-	u16      io_open_drain_ena;
 	u16      io_polarity;
 	int      irq_summary;
 	unsigned irq_base;
@@ -415,6 +407,32 @@ static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
 	mutex_unlock(&chip->lock);
 }
 
+static int sx150x_gpio_set_single_ended(struct gpio_chip *gc,
+					unsigned offset,
+                                        enum single_ended_mode mode)
+{
+	struct sx150x_chip *chip = gpiochip_get_data(gc);
+
+	/* On the SX160X 789 we can set open drain */
+	if (chip->dev_cfg->model != SX150X_789)
+		return -ENOTSUPP;
+
+	if (mode == LINE_MODE_PUSH_PULL)
+		return sx150x_write_cfg(chip,
+					offset,
+					1,
+					chip->dev_cfg->pri.x789.reg_drain,
+					0);
+
+	if (mode == LINE_MODE_OPEN_DRAIN)
+		return sx150x_write_cfg(chip,
+					offset,
+					1,
+					chip->dev_cfg->pri.x789.reg_drain,
+					1);
+	return -ENOTSUPP;
+}
+
 static int sx150x_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct sx150x_chip *chip = gpiochip_get_data(gc);
@@ -569,6 +587,7 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.direction_output = sx150x_gpio_direction_output;
 	chip->gpio_chip.get              = sx150x_gpio_get;
 	chip->gpio_chip.set              = sx150x_gpio_set;
+	chip->gpio_chip.set_single_ended = sx150x_gpio_set_single_ended;
 	chip->gpio_chip.base             = pdata->gpio_base;
 	chip->gpio_chip.can_sleep        = true;
 	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
@@ -658,12 +677,6 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 
 	if (chip->dev_cfg->model == SX150X_789) {
 		err = sx150x_init_io(chip,
-				chip->dev_cfg->pri.x789.reg_drain,
-				pdata->io_open_drain_ena);
-		if (err < 0)
-			return err;
-
-		err = sx150x_init_io(chip,
 				chip->dev_cfg->pri.x789.reg_polarity,
 				pdata->io_polarity);
 		if (err < 0)
-- 
2.4.3

