From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 058/182] gpio: sch311x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:37 +0100
Message-ID: <1449667357-32529-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34988 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754560AbbLINWm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:42 -0500
Received: by lbpu9 with SMTP id u9so29666866lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bruno Randolf <br1@einfach.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Bruno Randolf <br1@einfach.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sch311x.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index b454792de778..1cbd77a04e7b 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -93,13 +93,6 @@ static struct sch311x_gpio_block_def sch311x_gpio_blocks[] = {
 	},
 };
 
-static inline struct sch311x_gpio_block *
-to_sch311x_gpio_block(struct gpio_chip *chip)
-{
-	return container_of(chip, struct sch311x_gpio_block, chip);
-}
-
-
 /*
  *	Super-IO functions
  */
@@ -142,7 +135,7 @@ static inline void sch311x_sio_outb(int sio_config_port, int reg, int val)
 
 static int sch311x_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	if (block->config_regs[offset] == 0) /* GPIO is not available */
 		return -ENODEV;
@@ -158,7 +151,7 @@ static int sch311x_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void sch311x_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	if (block->config_regs[offset] == 0) /* GPIO is not available */
 		return;
@@ -168,7 +161,7 @@ static void sch311x_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 	unsigned char data;
 
 	spin_lock(&block->lock);
@@ -192,7 +185,7 @@ static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
 static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
 			     int value)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 	 __sch311x_gpio_set(block, offset, value);
@@ -201,7 +194,7 @@ static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
 
 static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 	outb(SCH311X_GPIO_CONF_IN, block->runtime_reg +
@@ -214,7 +207,7 @@ static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
-	struct sch311x_gpio_block *block = to_sch311x_gpio_block(chip);
+	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 
@@ -267,7 +260,7 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 		block->data_reg = sch311x_gpio_blocks[i].data_reg;
 		block->runtime_reg = pdata->runtime_reg;
 
-		err = gpiochip_add(&block->chip);
+		err = gpiochip_add_data(&block->chip, block);
 		if (err < 0) {
 			dev_err(&pdev->dev,
 				"Could not register gpiochip, %d\n", err);
-- 
2.4.3

