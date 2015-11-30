From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] gpio: 74x164: Allocate buffer with gen_74x164_chip
Date: Mon, 30 Nov 2015 15:35:25 +0100
Message-ID: <1448894126-9309-2-git-send-email-geert+renesas@glider.be>
References: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:43973 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754044AbbK3Off (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 09:35:35 -0500
In-Reply-To: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

By moving the internal buffer to the end of struct gen_74x164_chip and
converting it from a pointer to a zero-sized array, it can be allocated
together with gen_74x164_chip, reducing the number of managed
allocations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-74x164.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 60172f835d15f139..6664b26523084e12 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -20,10 +20,10 @@
 #define GEN_74X164_NUMBER_GPIOS	8
 
 struct gen_74x164_chip {
-	u8			*buffer;
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
 	u32			registers;
+	u8			buffer[0];
 };
 
 static struct gen_74x164_chip *gpio_to_74x164_chip(struct gpio_chip *gc)
@@ -107,6 +107,7 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
 static int gen_74x164_probe(struct spi_device *spi)
 {
 	struct gen_74x164_chip *chip;
+	u32 nregs;
 	int ret;
 
 	/*
@@ -118,7 +119,14 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (ret < 0)
 		return ret;
 
-	chip = devm_kzalloc(&spi->dev, sizeof(*chip), GFP_KERNEL);
+	if (of_property_read_u32(spi->dev.of_node, "registers-number",
+				 &nregs)) {
+		dev_err(&spi->dev,
+			"Missing registers-number property in the DT.\n");
+		return -EINVAL;
+	}
+
+	chip = devm_kzalloc(&spi->dev, sizeof(*chip) + nregs, GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -130,17 +138,8 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.set = gen_74x164_set_value;
 	chip->gpio_chip.base = -1;
 
-	if (of_property_read_u32(spi->dev.of_node, "registers-number",
-				 &chip->registers)) {
-		dev_err(&spi->dev,
-			"Missing registers-number property in the DT.\n");
-		return -EINVAL;
-	}
-
+	chip->registers = nregs;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
-	chip->buffer = devm_kzalloc(&spi->dev, chip->registers, GFP_KERNEL);
-	if (!chip->buffer)
-		return -ENOMEM;
 
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.dev = &spi->dev;
-- 
1.9.1

