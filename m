From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: 74x164: Introduce 'enable-gpios' property
Date: Mon,  7 Aug 2017 09:41:50 -0300
Message-ID: <1502109710-31624-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:37183 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752567AbdHGMmL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 08:42:11 -0400
Received: by mail-qk0-f194.google.com with SMTP id x77so284206qka.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 05:42:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, robh+dt@kernel.org, peng.fan@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>

From: Fabio Estevam <fabio.estevam@nxp.com>

74HC595 has an /OE (output enable) pin that can be controlled by a GPIO.

Introduce an optional property called 'enable-gpios' that allows
controlling the /OE pin.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-74x164.txt |  3 +++
 drivers/gpio/gpio-74x164.c                             | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index ce1b223..2a97553 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -12,6 +12,9 @@ Required properties:
       1 = active low
 - registers-number: Number of daisy-chained shift registers
 
+Optional properties:
+- enable-gpios: GPIO connected to the OE (Output Enable) pin.
+
 Example:
 
 gpio5: gpio5@0 {
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index a6607fa..6b535ec 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -9,6 +9,7 @@
  *  published by the Free Software Foundation.
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/spi/spi.h>
@@ -31,6 +32,7 @@ struct gen_74x164_chip {
 	 * numbering, store the bytes in reverse order.
 	 */
 	u8			buffer[0];
+	struct gpio_desc	*gpiod_oe;
 };
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
@@ -126,6 +128,13 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (!chip)
 		return -ENOMEM;
 
+	chip->gpiod_oe = devm_gpiod_get_optional(&spi->dev, "enable",
+						 GPIOD_OUT_LOW);
+	if (IS_ERR(chip->gpiod_oe))
+		return PTR_ERR(chip->gpiod_oe);
+
+	gpiod_set_value_cansleep(chip->gpiod_oe, 1);
+
 	spi_set_drvdata(spi, chip);
 
 	chip->gpio_chip.label = spi->modalias;
@@ -164,6 +173,7 @@ static int gen_74x164_remove(struct spi_device *spi)
 {
 	struct gen_74x164_chip *chip = spi_get_drvdata(spi);
 
+	gpiod_set_value_cansleep(chip->gpiod_oe, 0);
 	gpiochip_remove(&chip->gpio_chip);
 	mutex_destroy(&chip->lock);
 
-- 
2.7.4

