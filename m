From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/2] gpio: correct docs about return value of gpiod_get_direction
Date: Tue,  9 Jan 2018 12:35:53 +0100
Message-ID: <20180109113554.4337-1-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41442 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750896AbeAILgE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jan 2018 06:36:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The use of the GPIOF_* flags is deprecated, so don't advertise them
here. Document the plain numbers for now until we have a better
solution.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4e5..d3a91cf8fc73d4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -195,7 +195,7 @@ static int gpiochip_find_base(int ngpio)
  * gpiod_get_direction - return the current direction of a GPIO
  * @desc:	GPIO to get the direction of
  *
- * Return GPIOF_DIR_IN or GPIOF_DIR_OUT, or an error code in case of error.
+ * Returns 0 for output, 1 for input, or an error code in case of error.
  *
  * This function may sleep if gpiod_cansleep() is true.
  */
-- 
2.11.0

