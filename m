From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/2] gpio: 74x164: Driver cleanup
Date: Sat,  7 Dec 2013 14:08:23 +0400
Message-ID: <1386410903-29788-2-git-send-email-shc_work@mail.ru>
References: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback4.mail.ru ([94.100.176.42]:43421 "EHLO
	fallback4.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959Ab3LGKOO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Dec 2013 05:14:14 -0500
Received: from smtp8.mail.ru (smtp8.mail.ru [94.100.176.53])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id A7EF21415BC
	for <linux-gpio@vger.kernel.org>; Sat,  7 Dec 2013 14:08:44 +0400 (MSK)
In-Reply-To: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Alexander Shiyan <shc_work@mail.ru>

- Removed excess "spi" field from private data.
- Removed excess check for spi_get_drvdata() in remove().
- Removed unneeded message in remove().
- Simplify error path in probe().
- Fixed warnings by cripts/checkfile.pl.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-74x164.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 4d4e15c..e4ae298 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -20,7 +20,6 @@
 #define GEN_74X164_NUMBER_GPIOS	8
 
 struct gen_74x164_chip {
-	struct spi_device	*spi;
 	u8			*buffer;
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
@@ -34,6 +33,7 @@ static struct gen_74x164_chip *gpio_to_74x164_chip(struct gpio_chip *gc)
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
+	struct spi_device *spi = to_spi_device(chip->gpio_chip.dev);
 	struct spi_message message;
 	struct spi_transfer *msg_buf;
 	int i, ret = 0;
@@ -54,12 +54,12 @@ static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 	 * byte of the buffer will end up in the last register.
 	 */
 	for (i = chip->registers - 1; i >= 0; i--) {
-		msg_buf[i].tx_buf = chip->buffer +i;
+		msg_buf[i].tx_buf = chip->buffer + i;
 		msg_buf[i].len = sizeof(u8);
 		spi_message_add_tail(msg_buf + i, &message);
 	}
 
-	ret = spi_sync(chip->spi, &message);
+	ret = spi_sync(spi, &message);
 
 	kfree(msg_buf);
 
@@ -122,35 +122,32 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (!chip)
 		return -ENOMEM;
 
-	mutex_init(&chip->lock);
-
 	spi_set_drvdata(spi, chip);
 
-	chip->spi = spi;
-
 	chip->gpio_chip.label = spi->modalias;
 	chip->gpio_chip.direction_output = gen_74x164_direction_output;
 	chip->gpio_chip.get = gen_74x164_get_value;
 	chip->gpio_chip.set = gen_74x164_set_value;
 	chip->gpio_chip.base = -1;
 
-	if (of_property_read_u32(spi->dev.of_node, "registers-number", &chip->registers)) {
-		dev_err(&spi->dev, "Missing registers-number property in the DT.\n");
-		ret = -EINVAL;
-		goto exit_destroy;
+	if (of_property_read_u32(spi->dev.of_node, "registers-number",
+				 &chip->registers)) {
+		dev_err(&spi->dev,
+			"Missing registers-number property in the DT.\n");
+		return -EINVAL;
 	}
 
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
 	chip->buffer = devm_kzalloc(&spi->dev, chip->registers, GFP_KERNEL);
-	if (!chip->buffer) {
-		ret = -ENOMEM;
-		goto exit_destroy;
-	}
+	if (!chip->buffer)
+		return -ENOMEM;
 
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.dev = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
+	mutex_init(&chip->lock);
+
 	ret = __gen_74x164_write_config(chip);
 	if (ret) {
 		dev_err(&spi->dev, "Failed writing: %d\n", ret);
@@ -158,31 +155,23 @@ static int gen_74x164_probe(struct spi_device *spi)
 	}
 
 	ret = gpiochip_add(&chip->gpio_chip);
-	if (ret)
-		goto exit_destroy;
-
-	return ret;
+	if (!ret)
+		return 0;
 
 exit_destroy:
 	mutex_destroy(&chip->lock);
+
 	return ret;
 }
 
 static int gen_74x164_remove(struct spi_device *spi)
 {
-	struct gen_74x164_chip *chip;
+	struct gen_74x164_chip *chip = spi_get_drvdata(spi);
 	int ret;
 
-	chip = spi_get_drvdata(spi);
-	if (chip == NULL)
-		return -ENODEV;
-
 	ret = gpiochip_remove(&chip->gpio_chip);
 	if (!ret)
 		mutex_destroy(&chip->lock);
-	else
-		dev_err(&spi->dev, "Failed to remove the GPIO controller: %d\n",
-				ret);
 
 	return ret;
 }
-- 
1.8.3.2

