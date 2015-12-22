From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 54/54] Revert "gpio: revert get() to non-errorprogating behaviour"
Date: Tue, 22 Dec 2015 15:52:02 +0100
Message-ID: <1450795922-28744-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33229 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525AbbLVOwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:52:06 -0500
Received: by mail-lf0-f46.google.com with SMTP id p203so132123923lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:52:05 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This reverts commit 45ad7db90b42555c8107f18ec6d6a1e9bce34860.

We have fixed all the drivers that were returning ambious values
not clamped to [0,1] or an error code, so return the error
propagating behaviour of the API.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d72ac1fdcd98..975a548bd71e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1303,13 +1303,7 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 	chip = desc->chip;
 	offset = gpio_chip_hwgpio(desc);
 	value = chip->get ? chip->get(chip, offset) : -EIO;
-	/*
-	 * FIXME: fix all drivers to clamp to [0,1] or return negative,
-	 * then change this to:
-	 * value = value < 0 ? value : !!value;
-	 * so we can properly propagate error codes.
-	 */
-	value = !!value;
+	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
 }
-- 
2.4.3

