From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 074/182] gpio: tz1090: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:07 +0100
Message-ID: <1449667627-920-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33944 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754319AbbLIN1M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:12 -0500
Received: by lbbcs9 with SMTP id cs9so29870668lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, James Hogan <james.hogan@imgtec.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tz1090.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 7858d90202f3..c2acf9b64a73 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -62,7 +62,6 @@ struct tz1090_gpio_bank {
 	int irq;
 	char label[16];
 };
-#define to_bank(c)	container_of(c, struct tz1090_gpio_bank, chip)
 
 /**
  * struct tz1090_gpio - Overall GPIO device private data
@@ -187,7 +186,7 @@ static inline int tz1090_gpio_read_bit(struct tz1090_gpio_bank *bank,
 static int tz1090_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 	tz1090_gpio_set_bit(bank, REG_GPIO_DIR, offset);
 
 	return 0;
@@ -196,7 +195,7 @@ static int tz1090_gpio_direction_input(struct gpio_chip *chip,
 static int tz1090_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int offset, int output_value)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 	int lstat;
 
 	__global_lock2(lstat);
@@ -212,7 +211,7 @@ static int tz1090_gpio_direction_output(struct gpio_chip *chip,
  */
 static int tz1090_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 
 	return tz1090_gpio_read_bit(bank, REG_GPIO_DIN, offset);
 }
@@ -223,14 +222,14 @@ static int tz1090_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static void tz1090_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			    int output_value)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 
 	tz1090_gpio_mod_bit(bank, REG_GPIO_DOUT, offset, output_value);
 }
 
 static int tz1090_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 	int ret;
 
 	ret = pinctrl_request_gpio(chip->base + offset);
@@ -245,7 +244,7 @@ static int tz1090_gpio_request(struct gpio_chip *chip, unsigned int offset)
 
 static void tz1090_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 
 	pinctrl_free_gpio(chip->base + offset);
 
@@ -254,7 +253,7 @@ static void tz1090_gpio_free(struct gpio_chip *chip, unsigned int offset)
 
 static int tz1090_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_gpio_bank *bank = to_bank(chip);
+	struct tz1090_gpio_bank *bank = gpiochip_get_data(chip);
 
 	if (!bank->domain)
 		return -EINVAL;
@@ -440,7 +439,7 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpio_bank_info *info)
 	bank->chip.ngpio		= 30;
 
 	/* Add the GPIO bank */
-	gpiochip_add(&bank->chip);
+	gpiochip_add_data(&bank->chip, bank);
 
 	/* Get the GPIO bank IRQ if provided */
 	bank->irq = irq_of_parse_and_map(np, 0);
-- 
2.4.3

