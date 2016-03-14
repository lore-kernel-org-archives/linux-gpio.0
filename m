From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: 74x164: Implement gpiochip.set_multiple()
Date: Mon, 14 Mar 2016 16:19:18 +0100
Message-ID: <1457968758-22670-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46924 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934381AbcCNPTW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 11:19:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

This allows to set multiple outputs using a single SPI transfer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-74x164.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c81224ff2dca988b..62291a81c97f7140 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -75,6 +75,29 @@ static void gen_74x164_set_value(struct gpio_chip *gc,
 	mutex_unlock(&chip->lock);
 }
 
+static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				    unsigned long *bits)
+{
+	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
+	unsigned int i, idx, shift;
+	u8 bank, bankmask;
+
+	mutex_lock(&chip->lock);
+	for (i = 0, bank = chip->registers - 1; i < chip->registers;
+	     i++, bank--) {
+		idx = i / sizeof(*mask);
+		shift = i % sizeof(*mask) * BITS_PER_BYTE;
+		bankmask = mask[idx] >> shift;
+		if (!bankmask)
+			continue;
+
+		chip->buffer[bank] &= ~bankmask;
+		chip->buffer[bank] |= bankmask & (bits[idx] >> shift);
+	}
+	__gen_74x164_write_config(chip);
+	mutex_unlock(&chip->lock);
+}
+
 static int gen_74x164_direction_output(struct gpio_chip *gc,
 		unsigned offset, int val)
 {
@@ -114,6 +137,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.direction_output = gen_74x164_direction_output;
 	chip->gpio_chip.get = gen_74x164_get_value;
 	chip->gpio_chip.set = gen_74x164_set_value;
+	chip->gpio_chip.set_multiple = gen_74x164_set_multiple;
 	chip->gpio_chip.base = -1;
 
 	chip->registers = nregs;
-- 
1.9.1

