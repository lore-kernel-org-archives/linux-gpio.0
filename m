From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: mcp23s08: improve I2C Kconfig dependency
Date: Tue, 30 May 2017 11:11:28 +0200
Message-ID: <20170530091314.891224-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:64248 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdE3JNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 05:13:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

With "SPI_MASTER=y && I2C=m", we can build mcp23s08 as a built-in driver,
which then results in a link failure:

drivers/pinctrl/built-in.o: In function `mcp23s08_probe_one.isra.0':
:(.text+0x7910): undefined reference to `__devm_regmap_init_i2c'
drivers/pinctrl/built-in.o: In function `mcp23s08_init':
:(.init.text+0x110): undefined reference to `i2c_register_driver'
drivers/pinctrl/built-in.o: In function `mcp23s08_exit':
:(.exit.text+0x3c): undefined reference to `i2c_del_driver'

To avoid the problem, this adds another dependency on I2C that enforces
mcp23s08 to be a loadable module whenever the I2C core is a module.

Fixes: 64ac43e6fa28 ("gpio: mcp23s08: move to pinctrl")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index becda8f47e9e..ab4630ea305c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -149,6 +149,7 @@ config PINCTRL_FALCON
 config PINCTRL_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
 	depends on SPI_MASTER || I2C
+	depends on I2C || I2C=n
 	select GPIOLIB_IRQCHIP
 	select REGMAP_I2C if I2C
 	select REGMAP_SPI if SPI_MASTER
-- 
2.9.0

