From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 49/54] mfd: tps65010: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:48:13 +0100
Message-ID: <1450795693-28364-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36562 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbbLVOsS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:48:18 -0500
Received: by mail-lb0-f171.google.com with SMTP id oh2so32281196lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:48:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

This also start to propagate the negative error code from the
smbus call if there is one, as the last commit of this series
will make the gpiolib core deal with that properly.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/mfd/tps65010.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index b96847491277..83e615ed100a 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -499,11 +499,11 @@ static int tps65010_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (offset < 4) {
 		value = i2c_smbus_read_byte_data(tps->client, TPS_DEFGPIO);
 		if (value < 0)
-			return 0;
+			return value;
 		if (value & (1 << (offset + 4)))	/* output */
 			return !(value & (1 << offset));
 		else					/* input */
-			return (value & (1 << offset));
+			return !!(value & (1 << offset));
 	}
 
 	/* REVISIT we *could* report LED1/nPG and LED2 state ... */
-- 
2.4.3

