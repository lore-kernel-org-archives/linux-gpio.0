From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: 74x164: Use spi_write() helper instead of open coding
Date: Fri, 17 Jun 2016 18:39:28 +0200
Message-ID: <1466181568-24049-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58555 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024AbcFQQjr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2016 12:39:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-74x164.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 80f9ddf13343c67e..a6607faf2fdf822e 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -35,13 +35,8 @@ struct gen_74x164_chip {
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
-	struct spi_transfer xfer = {
-		.tx_buf = chip->buffer,
-		.len = chip->registers,
-	};
-
-	return spi_sync_transfer(to_spi_device(chip->gpio_chip.parent),
-				 &xfer, 1);
+	return spi_write(to_spi_device(chip->gpio_chip.parent), chip->buffer,
+			 chip->registers);
 }
 
 static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
-- 
1.9.1

