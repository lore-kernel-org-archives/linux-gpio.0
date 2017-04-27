From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 3/6] blackfin: defconfig: MCP23S08 config has been renamed
Date: Thu, 27 Apr 2017 16:19:34 +0200
Message-ID: <20170427141937.762-4-sebastian.reichel@collabora.co.uk>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

The mcp23s08 driver now supports pinconf, so the config
option has been renamed from CONFIG_GPIO_MCP23S08 to
CONFIG_PINCTRL_MCP23S08.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/blackfin/configs/BF609-EZKIT_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/blackfin/configs/BF609-EZKIT_defconfig b/arch/blackfin/configs/BF609-EZKIT_defconfig
index ba4267f658af..3ce77f07208a 100644
--- a/arch/blackfin/configs/BF609-EZKIT_defconfig
+++ b/arch/blackfin/configs/BF609-EZKIT_defconfig
@@ -105,7 +105,7 @@ CONFIG_SPI=y
 CONFIG_SPI_ADI_V3=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_MCP23S08=y
+CONFIG_PINCTRL_MCP23S08=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_BFIN_WDT=y
-- 
2.11.0
