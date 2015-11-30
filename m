From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] gpio: 74x164: Use a single SPI transfer instead of multiple transfers
Date: Mon, 30 Nov 2015 15:35:26 +0100
Message-ID: <1448894126-9309-3-git-send-email-geert+renesas@glider.be>
References: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:42185 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353AbbK3Ofh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 09:35:37 -0500
In-Reply-To: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>

Currently the 74x164 driver assembles an SPI message from an array of
one-byte SPI transfers, one for each daisy-chained shift register, as
the first byte sent will end up in the last register.
This array is allocated and deallocated on each GPIO write access.

By storing the data in the internal buffer in reverse order, we can
use a single SPI transfer with the internal buffer directly, simplifying
the code a lot, and avoiding memory (de)allocations.

This also avoids transient values on the GPIO outputs when using an SPI
master that cannot keep the hardware chip select asserted in between
multiple transfers (and would need cs-gpios for proper operation).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/gpio/gpio-74x164.c | 46 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 6664b26523084e12..2eca859ce8da9854 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -23,6 +23,13 @@ struct gen_74x164_chip {
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
 	u32			registers;
+	/*
+	 * Since the registers are chained, every byte sent will make
+	 * the previous byte shift to the next register in the
+	 * chain. Thus, the first byte sent will end up in the last
+	 * register at the end of the transfer. So, to have a logical
+	 * numbering, store the bytes in reverse order.
+	 */
 	u8			buffer[0];
 };
 
@@ -33,43 +40,18 @@ static struct gen_74x164_chip *gpio_to_74x164_chip(struct gpio_chip *gc)
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
-	struct spi_device *spi = to_spi_device(chip->gpio_chip.dev);
-	struct spi_message message;
-	struct spi_transfer *msg_buf;
-	int i, ret = 0;
-
-	msg_buf = kzalloc(chip->registers * sizeof(struct spi_transfer),
-			GFP_KERNEL);
-	if (!msg_buf)
-		return -ENOMEM;
-
-	spi_message_init(&message);
+	struct spi_transfer xfer = {
+		.tx_buf = chip->buffer,
+		.len = chip->registers,
+	};
 
-	/*
-	 * Since the registers are chained, every byte sent will make
-	 * the previous byte shift to the next register in the
-	 * chain. Thus, the first byte send will end up in the last
-	 * register at the end of the transfer. So, to have a logical
-	 * numbering, send the bytes in reverse order so that the last
-	 * byte of the buffer will end up in the last register.
-	 */
-	for (i = chip->registers - 1; i >= 0; i--) {
-		msg_buf[i].tx_buf = chip->buffer + i;
-		msg_buf[i].len = sizeof(u8);
-		spi_message_add_tail(msg_buf + i, &message);
-	}
-
-	ret = spi_sync(spi, &message);
-
-	kfree(msg_buf);
-
-	return ret;
+	return spi_sync_transfer(to_spi_device(chip->gpio_chip.dev), &xfer, 1);
 }
 
 static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct gen_74x164_chip *chip = gpio_to_74x164_chip(gc);
-	u8 bank = offset / 8;
+	u8 bank = chip->registers - 1 - offset / 8;
 	u8 pin = offset % 8;
 	int ret;
 
@@ -84,7 +66,7 @@ static void gen_74x164_set_value(struct gpio_chip *gc,
 		unsigned offset, int val)
 {
 	struct gen_74x164_chip *chip = gpio_to_74x164_chip(gc);
-	u8 bank = offset / 8;
+	u8 bank = chip->registers - 1 - offset / 8;
 	u8 pin = offset % 8;
 
 	mutex_lock(&chip->lock);
-- 
1.9.1

