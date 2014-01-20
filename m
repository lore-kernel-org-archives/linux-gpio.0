From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mcp23s08: depend on OF_GPIO
Date: Mon, 20 Jan 2014 09:09:04 +0100
Message-ID: <1390205344-15194-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:34668 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbaATIJN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2014 03:09:13 -0500
Received: by mail-wg0-f49.google.com with SMTP id a1so6464233wgh.28
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2014 00:09:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <poeschel@lemonage.de>

The MCP drivers fails to compile on trial builds due to missing
Kconfig dependency on OF_GPIO. Fix it.

Cc: Lars Poeschel <poeschel@lemonage.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2d49784109b5..d5bd9eece408 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -717,7 +717,7 @@ config GPIO_MAX7301
 
 config GPIO_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
-	depends on (SPI_MASTER && !I2C) || I2C
+	depends on (SPI_MASTER && !I2C) || I2C && OF_GPIO
 	help
 	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
 	  I/O expanders.
-- 
1.8.4.2

