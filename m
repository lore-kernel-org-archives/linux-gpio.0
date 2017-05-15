From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 01/14] gpio: mcp23s08: move to pinctrl
Date: Mon, 15 May 2017 11:24:25 +0200
Message-ID: <20170515092438.13076-2-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

This moves the mcp23s08 driver from gpio to pinctrl. Actual
pinctrl support for configuration of the pull-up resistors
follows in its own patch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/configs/lpc32xx_defconfig                      |  2 +-
 arch/blackfin/configs/BF609-EZKIT_defconfig             |  2 +-
 arch/blackfin/mach-bf527/boards/tll6527m.c              |  4 ++--
 arch/blackfin/mach-bf609/boards/ezkit.c                 |  4 ++--
 drivers/gpio/Kconfig                                    | 17 -----------------
 drivers/gpio/Makefile                                   |  1 -
 drivers/pinctrl/Kconfig                                 | 13 +++++++++++++
 drivers/pinctrl/Makefile                                |  1 +
 .../gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c}      |  0
 9 files changed, 20 insertions(+), 24 deletions(-)
 rename drivers/{gpio/gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} (100%)

diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 6ba430d2b5b2..e15fa5f168bb 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -112,7 +112,7 @@ CONFIG_GPIO_SX150X=y
 CONFIG_GPIO_74X164=y
 CONFIG_GPIO_MAX7301=y
 CONFIG_GPIO_MC33880=y
-CONFIG_GPIO_MCP23S08=y
+CONFIG_PINCTRL_MCP23S08=y
 CONFIG_SENSORS_DS620=y
 CONFIG_SENSORS_MAX6639=y
 CONFIG_WATCHDOG=y
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
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 23ca51ee6b28..5f88d7324e02 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1227,23 +1227,6 @@ config GPIO_PISOSR
 
 endmenu
 
-menu "SPI or I2C GPIO expanders"
-	depends on (SPI_MASTER && !I2C) || I2C
-
-config GPIO_MCP23S08
-	tristate "Microchip MCP23xxx I/O expander"
-	depends on OF_GPIO
-	select GPIOLIB_IRQCHIP
-	select REGMAP_I2C if I2C
-	select REGMAP if SPI_MASTER
-	help
-	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
-	  I/O expanders.
-	  This provides a GPIO interface supporting inputs and outputs.
-	  The I2C versions of the chips can be used as interrupt-controller.
-
-endmenu
-
 menu "USB GPIO expanders"
 	depends on USB
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 68b96277d9fa..89f10061a5c1 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -77,7 +77,6 @@ obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
 obj-$(CONFIG_GPIO_MERRIFIELD)	+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
-obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 37af5e3029d5..b5aa50c51633 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -146,6 +146,19 @@ config PINCTRL_FALCON
 	depends on SOC_FALCON
 	depends on PINCTRL_LANTIQ
 
+config PINCTRL_MCP23S08
+	tristate "Microchip MCP23xxx I/O expander"
+	depends on OF_GPIO
+	depends on SPI_MASTER || I2C
+	select GPIOLIB_IRQCHIP
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
+	help
+	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
+	  I/O expanders.
+	  This provides a GPIO interface supporting inputs and outputs.
+	  The I2C versions of the chips can be used as interrupt-controller.
+
 config PINCTRL_MESON
 	bool
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 0e9b2226a7c2..59d793aa3db3 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
 obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
+obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
similarity index 100%
rename from drivers/gpio/gpio-mcp23s08.c
rename to drivers/pinctrl/pinctrl-mcp23s08.c
-- 
2.11.0
