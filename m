From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 05/14] pinctrl: mcp23s08: drop OF_GPIO dependency
Date: Mon, 15 May 2017 11:24:29 +0200
Message-ID: <20170515092438.13076-6-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59843 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759591AbdEOJZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 05:25:11 -0400
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

The driver compiles & works perfectly fine without OF_GPIO on x86,
so lets drop the dependency.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1dabd1d79c1d..1c80b970554e 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -148,7 +148,6 @@ config PINCTRL_FALCON
 
 config PINCTRL_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
-	depends on OF_GPIO
 	depends on SPI_MASTER || I2C
 	select GPIOLIB_IRQCHIP
 	select REGMAP_I2C if I2C
-- 
2.11.0

