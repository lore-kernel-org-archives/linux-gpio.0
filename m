From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: lp3943: Drop pin_used and
 lp3943_gpio_request/lp3943_gpio_free
Date: Mon, 29 Feb 2016 21:08:19 +0800
Message-ID: <1456751299.25756.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:33053 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbcB2NIY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 08:08:24 -0500
Received: by mail-pf0-f177.google.com with SMTP id 124so30664324pfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Feb 2016 05:08:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Milo Kim <milo.kim@ti.com>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org

The implementation of lp3943_gpio_request/lp3943_gpio_free test pin_used
for tracing the pin usage. However, gpiolib already checks FLAG_REQUESTED
flag for the same purpose. So remove the redundant implementation.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-lp3943.c | 22 ----------------------
 include/linux/mfd/lp3943.h |  6 ------
 2 files changed, 28 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 1c8e2ae..9d26ad4 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -45,26 +45,6 @@ struct lp3943_gpio {
 	u16 input_mask;		/* 1 = GPIO is input direction, 0 = output */
 };
 
-static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
-	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
-
-	/* Return an error if the pin is already assigned */
-	if (test_and_set_bit(offset, &lp3943->pin_used))
-		return -EBUSY;
-
-	return 0;
-}
-
-static void lp3943_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
-	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
-
-	clear_bit(offset, &lp3943->pin_used);
-}
-
 static int lp3943_gpio_set_mode(struct lp3943_gpio *lp3943_gpio, u8 offset,
 				u8 val)
 {
@@ -177,8 +157,6 @@ static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 static const struct gpio_chip lp3943_gpio_chip = {
 	.label			= "lp3943",
 	.owner			= THIS_MODULE,
-	.request		= lp3943_gpio_request,
-	.free			= lp3943_gpio_free,
 	.direction_input	= lp3943_gpio_direction_input,
 	.get			= lp3943_gpio_get,
 	.direction_output	= lp3943_gpio_direction_output,
diff --git a/include/linux/mfd/lp3943.h b/include/linux/mfd/lp3943.h
index 3490db7..d3a73811 100644
--- a/include/linux/mfd/lp3943.h
+++ b/include/linux/mfd/lp3943.h
@@ -94,18 +94,12 @@ struct lp3943_reg_cfg {
  * @regmap: Used for I2C communication on accessing registers
  * @pdata: LP3943 platform specific data
  * @mux_cfg: Register configuration for pin MUX
- * @pin_used: Bit mask for output pin used.
- *	      This bitmask is used for pin assignment management.
- *	      1 = pin used, 0 = available.
- *	      Only LSB 16 bits are used, but it is unsigned long type
- *	      for atomic bitwise operations.
  */
 struct lp3943 {
 	struct device *dev;
 	struct regmap *regmap;
 	struct lp3943_platform_data *pdata;
 	const struct lp3943_reg_cfg *mux_cfg;
-	unsigned long pin_used;
 };
 
 int lp3943_read_byte(struct lp3943 *lp3943, u8 reg, u8 *read);
-- 
2.1.4



