From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 164/182] mfd: htc-i2cpld: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:47:45 +0100
Message-ID: <1449668865-6307-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35887 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINru (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:47:50 -0500
Received: by lfs39 with SMTP id 39so34752165lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:47:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/htc-i2cpld.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index bd6b96d07ab8..3f9eee5f8fb9 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -227,8 +227,7 @@ static irqreturn_t htcpld_handler(int irq, void *dev)
 static void htcpld_chip_set(struct gpio_chip *chip, unsigned offset, int val)
 {
 	struct i2c_client *client;
-	struct htcpld_chip *chip_data =
-		container_of(chip, struct htcpld_chip, chip_out);
+	struct htcpld_chip *chip_data = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	client = chip_data->client;
@@ -257,14 +256,12 @@ static void htcpld_chip_set_ni(struct work_struct *work)
 
 static int htcpld_chip_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct htcpld_chip *chip_data;
+	struct htcpld_chip *chip_data = gpiochip_get_data(chip);
 	u8 cache;
 
 	if (!strncmp(chip->label, "htcpld-out", 10)) {
-		chip_data = container_of(chip, struct htcpld_chip, chip_out);
 		cache = chip_data->cache_out;
 	} else if (!strncmp(chip->label, "htcpld-in", 9)) {
-		chip_data = container_of(chip, struct htcpld_chip, chip_in);
 		cache = chip_data->cache_in;
 	} else
 		return -EINVAL;
@@ -291,9 +288,7 @@ static int htcpld_direction_input(struct gpio_chip *chip,
 
 static int htcpld_chip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct htcpld_chip *chip_data;
-
-	chip_data = container_of(chip, struct htcpld_chip, chip_in);
+	struct htcpld_chip *chip_data = gpiochip_get_data(chip);
 
 	if (offset < chip_data->nirqs)
 		return chip_data->irq_start + offset;
@@ -451,14 +446,14 @@ static int htcpld_register_chip_gpio(
 	gpio_chip->ngpio           = plat_chip_data->num_gpios;
 
 	/* Add the GPIO chips */
-	ret = gpiochip_add(&(chip->chip_out));
+	ret = gpiochip_add_data(&(chip->chip_out), chip);
 	if (ret) {
 		dev_warn(dev, "Unable to register output GPIOs for 0x%x: %d\n",
 			 plat_chip_data->addr, ret);
 		return ret;
 	}
 
-	ret = gpiochip_add(&(chip->chip_in));
+	ret = gpiochip_add_data(&(chip->chip_in), chip);
 	if (ret) {
 		dev_warn(dev, "Unable to register input GPIOs for 0x%x: %d\n",
 			 plat_chip_data->addr, ret);
-- 
2.4.3

