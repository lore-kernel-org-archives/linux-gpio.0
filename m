From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: tpic2810: Make sure cached buffer has consistent
 status with h/w status
Date: Wed, 23 Mar 2016 19:49:41 +0800
Message-ID: <1458733781.22226.3.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35749 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbcCWLtr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2016 07:49:47 -0400
Received: by mail-pf0-f194.google.com with SMTP id u190so2952070pfb.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2016 04:49:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

i2c_smbus_write_byte_data() can fail. To ensure the cached buffer has
consistent status with h/w status, don't update the cached gpio->buffer
if write fails.
Also refactor the code a bit by adding a tpic2810_set_mask_bits() helper
and use it to simplify the code.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tpic2810.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 9f020aa..cace79c 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -57,39 +57,34 @@ static int tpic2810_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value)
+static void tpic2810_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
 {
 	struct tpic2810 *gpio = gpiochip_get_data(chip);
+	u8 buffer;
+	int err;
 
 	mutex_lock(&gpio->lock);
 
-	if (value)
-		gpio->buffer |= BIT(offset);
-	else
-		gpio->buffer &= ~BIT(offset);
+	buffer = gpio->buffer & ~mask;
+	buffer |= (mask & bits);
 
-	i2c_smbus_write_byte_data(gpio->client, TPIC2810_WS_COMMAND,
-				  gpio->buffer);
+	err = i2c_smbus_write_byte_data(gpio->client, TPIC2810_WS_COMMAND,
+					buffer);
+	if (!err)
+		gpio->buffer = buffer;
 
 	mutex_unlock(&gpio->lock);
 }
 
+static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	tpic2810_set_mask_bits(chip, BIT(offset), value ? BIT(offset) : 0);
+}
+
 static void tpic2810_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 				  unsigned long *bits)
 {
-	struct tpic2810 *gpio = gpiochip_get_data(chip);
-
-	mutex_lock(&gpio->lock);
-
-	/* clear bits under mask */
-	gpio->buffer &= ~(*mask);
-	/* set bits under mask */
-	gpio->buffer |= ((*mask) & (*bits));
-
-	i2c_smbus_write_byte_data(gpio->client, TPIC2810_WS_COMMAND,
-				  gpio->buffer);
-
-	mutex_unlock(&gpio->lock);
+	tpic2810_set_mask_bits(chip, *mask, *bits);
 }
 
 static struct gpio_chip template_chip = {
-- 
2.1.4



