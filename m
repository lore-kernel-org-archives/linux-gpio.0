From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 045/182] gpio: octeon: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:02 +0100
Message-ID: <1449667142-31883-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33034 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINTI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:08 -0500
Received: by lbbkw15 with SMTP id kw15so29817595lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: David Daney <david.daney@cavium.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-octeon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afbb2417dfbc..7665ebcd0c1d 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -41,7 +41,7 @@ struct octeon_gpio {
 
 static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 {
-	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
+	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 
 	cvmx_write_csr(gpio->register_base + bit_cfg_reg(offset), 0);
 	return 0;
@@ -49,7 +49,7 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 
 static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
+	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
 	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
 	cvmx_write_csr(reg, mask);
@@ -58,7 +58,7 @@ static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
 			       int value)
 {
-	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
+	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	union cvmx_gpio_bit_cfgx cfgx;
 
 	octeon_gpio_set(chip, offset, value);
@@ -72,7 +72,7 @@ static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
 
 static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
+	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
 
 	return ((1ull << offset) & read_bits) != 0;
@@ -117,7 +117,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
 	chip->set = octeon_gpio_set;
-	err = gpiochip_add(chip);
+	err = gpiochip_add_data(chip, gpio);
 	if (err)
 		goto out;
 
-- 
2.4.3

