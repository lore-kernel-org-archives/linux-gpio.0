From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: mcp23s08: Select REGMAP/REGMAP_I2C to fix build error
Date: Thu,  2 Feb 2017 18:13:06 +0800
Message-ID: <20170202101306.24976-1-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35308 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751002AbdBBKNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 05:13:21 -0500
Received: by mail-pg0-f66.google.com with SMTP id 204so1445968pge.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2017 02:13:20 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

This driver now using devm_regmap_init/devm_regmap_init_i2c, so it needs
to select REGMAP/REGMAP_I2C accordingly.

Fixes: ("3d84fdb3f0b5 gpio: mcp23s08: use regmap")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2d77392..28e6219 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1213,6 +1213,8 @@ config GPIO_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
+	select REGMAP_I2C if I2C
+	select REGMAP if SPI_MASTER
 	help
 	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
 	  I/O expanders.
-- 
2.9.3

