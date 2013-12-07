From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/2] gpio: 74x164: Remove non-DT support
Date: Sat,  7 Dec 2013 14:08:22 +0400
Message-ID: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback7.mail.ru ([94.100.176.135]:50338 "EHLO
	fallback7.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838Ab3LGKIu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Dec 2013 05:08:50 -0500
Received: from smtp8.mail.ru (smtp8.mail.ru [94.100.176.53])
	by fallback7.mail.ru (mPOP.Fallback_MX) with ESMTP id 108D0F0835FF
	for <linux-gpio@vger.kernel.org>; Sat,  7 Dec 2013 14:08:49 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Alexander Shiyan <shc_work@mail.ru>

Commit 20bc4d5d565159eb2b942bf4b7fae86fba94e32c
(gpio: 74x164: Add support for the daisy-chaining) introduce check
for DT for the driver, so driver cannot be used without DT.
There are no in-tree users of this driver, so remove non-DT support
completely.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/Kconfig       |  6 +++---
 drivers/gpio/gpio-74x164.c | 14 +-------------
 include/linux/spi/74x164.h |  9 ---------
 3 files changed, 4 insertions(+), 25 deletions(-)
 delete mode 100644 include/linux/spi/74x164.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae3682d..4127f68 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -714,10 +714,10 @@ config GPIO_MC33880
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on SPI_MASTER
+	depends on SPI_MASTER && OF
 	help
-	  Platform driver for 74x164 compatible serial-in/parallel-out
-	  8-outputs shift registers. This driver can be used to provide access
+	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
+	  shift registers. This driver can be used to provide access
 	  to more gpio outputs.
 
 comment "AC97 GPIO expanders:"
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index ddb8312..4d4e15c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/spi/spi.h>
-#include <linux/spi/74x164.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
@@ -108,14 +107,8 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
 static int gen_74x164_probe(struct spi_device *spi)
 {
 	struct gen_74x164_chip *chip;
-	struct gen_74x164_chip_platform_data *pdata;
 	int ret;
 
-	if (!spi->dev.of_node) {
-		dev_err(&spi->dev, "No device tree data available.\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * bits_per_word cannot be configured in platform data
 	 */
@@ -129,12 +122,6 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (!chip)
 		return -ENOMEM;
 
-	pdata = dev_get_platdata(&spi->dev);
-	if (pdata && pdata->base)
-		chip->gpio_chip.base = pdata->base;
-	else
-		chip->gpio_chip.base = -1;
-
 	mutex_init(&chip->lock);
 
 	spi_set_drvdata(spi, chip);
@@ -145,6 +132,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.direction_output = gen_74x164_direction_output;
 	chip->gpio_chip.get = gen_74x164_get_value;
 	chip->gpio_chip.set = gen_74x164_set_value;
+	chip->gpio_chip.base = -1;
 
 	if (of_property_read_u32(spi->dev.of_node, "registers-number", &chip->registers)) {
 		dev_err(&spi->dev, "Missing registers-number property in the DT.\n");
diff --git a/include/linux/spi/74x164.h b/include/linux/spi/74x164.h
deleted file mode 100644
index 0aa6acc..0000000
-- 
1.8.3.2

