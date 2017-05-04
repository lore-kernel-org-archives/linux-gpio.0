From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 2/2] pinctrl: mcp23s08: drop OF_GPIO dependency
Date: Thu,  4 May 2017 15:24:11 +0200
Message-ID: <20170504132411.10973-3-sebastian.reichel@collabora.co.uk>
References: <20170504132411.10973-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170504132411.10973-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

The driver compiles & works perfectly fine without OF_GPIO on x86,
so lets drop the dependency.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 2ff95fe3017d..52a5e5881936 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -137,7 +137,6 @@ config PINCTRL_FALCON
 
 config PINCTRL_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
-	depends on OF_GPIO
 	depends on SPI_MASTER || I2C
 	select GPIOLIB_IRQCHIP
 	select REGMAP_I2C if I2C
-- 
2.11.0
