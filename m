From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mcp23s08: make driver depend on OF_GPIO
Date: Wed,  7 Sep 2016 23:17:10 +0200
Message-ID: <1473283030-22371-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35258 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750772AbcIGVRQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 17:17:16 -0400
Received: by mail-lf0-f47.google.com with SMTP id l131so7552656lfl.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 14:17:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>, Phil Reid <preid@electromag.com.au>

The MCP23S08 driver certainly accesses fields inside the
struct gpio_chip that are only available under CONFIG_OF_GPIO
not just CONFIG_OF, so update the Kconfig and driver to reflect
this.

Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Phil Reid <preid@electromag.com.au>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig         | 1 +
 drivers/gpio/gpio-mcp23s08.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 66a94103798b..24caedb00a7a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1131,6 +1131,7 @@ menu "SPI or I2C GPIO expanders"
 
 config GPIO_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
+	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index ac22efc1840e..99d37b56c258 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -564,7 +564,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.direction_output = mcp23s08_direction_output;
 	mcp->chip.set = mcp23s08_set;
 	mcp->chip.dbg_show = mcp23s08_dbg_show;
-#ifdef CONFIG_OF
+#ifdef CONFIG_OF_GPIO
 	mcp->chip.of_gpio_n_cells = 2;
 	mcp->chip.of_node = dev->of_node;
 #endif
-- 
2.7.4

