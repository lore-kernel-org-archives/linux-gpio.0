From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 2/6] blackfin: boards: MCP23S08 config has been renamed
Date: Thu, 27 Apr 2017 16:19:33 +0200
Message-ID: <20170427141937.762-3-sebastian.reichel@collabora.co.uk>
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
 arch/blackfin/mach-bf527/boards/tll6527m.c | 4 ++--
 arch/blackfin/mach-bf609/boards/ezkit.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/blackfin/mach-bf527/boards/tll6527m.c b/arch/blackfin/mach-bf527/boards/tll6527m.c
index c1acce4c2e45..be61477826f3 100644
--- a/arch/blackfin/mach-bf527/boards/tll6527m.c
+++ b/arch/blackfin/mach-bf527/boards/tll6527m.c
@@ -348,7 +348,7 @@ static struct platform_device bfin_i2s = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_GPIO_MCP23S08)
+#if IS_ENABLED(CONFIG_PINCTRL_MCP23S08)
 #include <linux/spi/mcp23s08.h>
 static const struct mcp23s08_platform_data bfin_mcp23s08_sys_gpio_info = {
 	.chip[0].is_present = true,
@@ -423,7 +423,7 @@ static struct spi_board_info bfin_spi_board_info[] __initdata = {
 		.mode = SPI_CPHA | SPI_CPOL,
 	},
 #endif
-#if IS_ENABLED(CONFIG_GPIO_MCP23S08)
+#if IS_ENABLED(CONFIG_PINCTRL_MCP23S08)
 	{
 		.modalias = "mcp23s08",
 		.platform_data = &bfin_mcp23s08_sys_gpio_info,
diff --git a/arch/blackfin/mach-bf609/boards/ezkit.c b/arch/blackfin/mach-bf609/boards/ezkit.c
index 9231e5a72b93..51157a255824 100644
--- a/arch/blackfin/mach-bf609/boards/ezkit.c
+++ b/arch/blackfin/mach-bf609/boards/ezkit.c
@@ -1887,7 +1887,7 @@ static struct platform_device i2c_bfin_twi1_device = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_GPIO_MCP23S08)
+#if IS_ENABLED(CONFIG_PINCTRL_MCP23S08)
 #include <linux/spi/mcp23s08.h>
 static const struct mcp23s08_platform_data bfin_mcp23s08_soft_switch0 = {
 	.base = 120,
@@ -1929,7 +1929,7 @@ static struct i2c_board_info __initdata bfin_i2c_board_info0[] = {
 		I2C_BOARD_INFO("ssm2602", 0x1b),
 	},
 #endif
-#if IS_ENABLED(CONFIG_GPIO_MCP23S08)
+#if IS_ENABLED(CONFIG_PINCTRL_MCP23S08)
 	{
 		I2C_BOARD_INFO("mcp23017", 0x21),
 		.platform_data = (void *)&bfin_mcp23s08_soft_switch0
-- 
2.11.0
