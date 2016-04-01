From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v4 1/6] pinctrl: baytrail: Add pin control data structures
Date: Fri,  1 Apr 2016 14:00:02 +0300
Message-ID: <1459508407-22011-2-git-send-email-cristina.ciocan@intel.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>
List-Id: linux-gpio@vger.kernel.org

In order to implement pin control for Baytrail, we need data structures
in which to store and pass along pin, group, function, community and SOC
data information.

Baytrail has 3 GPIO controllers. Add SCORE, NCORE and SUS controller data:
	- pins (for all controllers),
	- pad map for pins (for all controllers; we need this since pads
	are not ordered),
	- groups (for SCORE and SUS controllers),
	- functions (for SCORE and SUS controllers),
	- communities (for all controllers),
	- soc specific data gathering all of the above and the ACPI UID
	(for all controllers)
This information is useful for pin control functionality. NCORE data is
lighter than the other two controllers' due to lack of pin documentation in
the public datasheet.

Datasheet:
http://www.intel.com/content/www/us/en/embedded/products/bay-trail/atom-e3800-family-datasheet.html

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 628 +++++++++++++++++++++++++++++--
 1 file changed, 606 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 21b79a4..364f56c 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -73,17 +73,207 @@
 #define BYT_NCORE_ACPI_UID	"2"
 #define BYT_SUS_ACPI_UID	"3"
 
-/*
- * Baytrail gpio controller consist of three separate sub-controllers called
- * SCORE, NCORE and SUS. The sub-controllers are identified by their acpi UID.
- *
- * GPIO numbering is _not_ ordered meaning that gpio # 0 in ACPI namespace does
- * _not_ correspond to the first gpio register at controller's gpio base.
- * There is no logic or pattern in mapping gpio numbers to registers (pads) so
- * each sub-controller needs to have its own mapping table
- */
+struct byt_gpio_pin_context {
+	u32 conf0;
+	u32 val;
+};
+
+struct byt_simple_func_mux {
+	const char *name;
+	unsigned short func;
+};
+
+struct byt_mixed_func_mux {
+	const char *name;
+	const unsigned short *func_values;
+};
+
+struct byt_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	size_t npins;
+	unsigned short has_simple_funcs;
+	union {
+		const struct byt_simple_func_mux *simple_funcs;
+		const struct byt_mixed_func_mux *mixed_funcs;
+	};
+	size_t nfuncs;
+};
+
+struct byt_function {
+	const char *name;
+	const char * const *groups;
+	size_t ngroups;
+};
+
+struct byt_community {
+	unsigned int pin_base;
+	size_t npins;
+	const unsigned int *pad_map;
+	void __iomem *reg_base;
+};
+
+#define SIMPLE_FUNC(n, f)	\
+	{			\
+		.name	= (n),	\
+		.func	= (f),	\
+	}
+#define MIXED_FUNC(n, f)		\
+	{				\
+		.name		= (n),	\
+		.func_values	= (f),	\
+	}
+
+#define PIN_GROUP_SIMPLE(n, p, f)				\
+	{							\
+		.name			= (n),			\
+		.pins			= (p),			\
+		.npins			= ARRAY_SIZE((p)),	\
+		.has_simple_funcs	= 1,		\
+		.simple_funcs		= (f),			\
+		.nfuncs			= ARRAY_SIZE((f)),	\
+	}
+#define PIN_GROUP_MIXED(n, p, f)				\
+	{							\
+		.name			= (n),			\
+		.pins			= (p),			\
+		.npins			= ARRAY_SIZE((p)),	\
+		.has_simple_funcs	= 0,			\
+		.mixed_funcs		= (f),			\
+		.nfuncs			= ARRAY_SIZE((f)),	\
+	}
+
+#define FUNCTION(n, g)					\
+	{						\
+		.name		= (n),			\
+		.groups		= (g),			\
+		.ngroups	= ARRAY_SIZE((g)),	\
+	}
+
+#define COMMUNITY(p, n, map)		\
+	{				\
+		.pin_base	= (p),	\
+		.npins		= (n),	\
+		.pad_map	= (map),\
+	}
 
-/* score_pins[gpio_nr] = pad_nr */
+struct byt_pinctrl_soc_data {
+	const char *uid;
+	const struct pinctrl_pin_desc *pins;
+	size_t npins;
+	const struct byt_pingroup *groups;
+	size_t ngroups;
+	const struct byt_function *functions;
+	size_t nfunctions;
+	const struct byt_community *communities;
+	size_t ncommunities;
+};
+
+/* SCORE pins, aka GPIOC_<pin_no> or GPIO_S0_SC[<pin_no>] */
+static const struct pinctrl_pin_desc byt_score_pins[] = {
+	PINCTRL_PIN(0, "SATA_GP0"),
+	PINCTRL_PIN(1, "SATA_GP1"),
+	PINCTRL_PIN(2, "SATA_LED#"),
+	PINCTRL_PIN(3, "PCIE_CLKREQ0"),
+	PINCTRL_PIN(4, "PCIE_CLKREQ1"),
+	PINCTRL_PIN(5, "PCIE_CLKREQ2"),
+	PINCTRL_PIN(6, "PCIE_CLKREQ3"),
+	PINCTRL_PIN(7, "SD3_WP"),
+	PINCTRL_PIN(8, "HDA_RST"),
+	PINCTRL_PIN(9, "HDA_SYNC"),
+	PINCTRL_PIN(10, "HDA_CLK"),
+	PINCTRL_PIN(11, "HDA_SDO"),
+	PINCTRL_PIN(12, "HDA_SDI0"),
+	PINCTRL_PIN(13, "HDA_SDI1"),
+	PINCTRL_PIN(14, "GPIO_S0_SC14"),
+	PINCTRL_PIN(15, "GPIO_S0_SC15"),
+	PINCTRL_PIN(16, "MMC1_CLK"),
+	PINCTRL_PIN(17, "MMC1_D0"),
+	PINCTRL_PIN(18, "MMC1_D1"),
+	PINCTRL_PIN(19, "MMC1_D2"),
+	PINCTRL_PIN(20, "MMC1_D3"),
+	PINCTRL_PIN(21, "MMC1_D4"),
+	PINCTRL_PIN(22, "MMC1_D5"),
+	PINCTRL_PIN(23, "MMC1_D6"),
+	PINCTRL_PIN(24, "MMC1_D7"),
+	PINCTRL_PIN(25, "MMC1_CMD"),
+	PINCTRL_PIN(26, "MMC1_RST"),
+	PINCTRL_PIN(27, "SD2_CLK"),
+	PINCTRL_PIN(28, "SD2_D0"),
+	PINCTRL_PIN(29, "SD2_D1"),
+	PINCTRL_PIN(30, "SD2_D2"),
+	PINCTRL_PIN(31, "SD2_D3_CD"),
+	PINCTRL_PIN(32, "SD2_CMD"),
+	PINCTRL_PIN(33, "SD3_CLK"),
+	PINCTRL_PIN(34, "SD3_D0"),
+	PINCTRL_PIN(35, "SD3_D1"),
+	PINCTRL_PIN(36, "SD3_D2"),
+	PINCTRL_PIN(37, "SD3_D3"),
+	PINCTRL_PIN(38, "SD3_CD"),
+	PINCTRL_PIN(39, "SD3_CMD"),
+	PINCTRL_PIN(40, "SD3_1P8EN"),
+	PINCTRL_PIN(41, "SD3_PWREN#"),
+	PINCTRL_PIN(42, "ILB_LPC_AD0"),
+	PINCTRL_PIN(43, "ILB_LPC_AD1"),
+	PINCTRL_PIN(44, "ILB_LPC_AD2"),
+	PINCTRL_PIN(45, "ILB_LPC_AD3"),
+	PINCTRL_PIN(46, "ILB_LPC_FRAME"),
+	PINCTRL_PIN(47, "ILB_LPC_CLK0"),
+	PINCTRL_PIN(48, "ILB_LPC_CLK1"),
+	PINCTRL_PIN(49, "ILB_LPC_CLKRUN"),
+	PINCTRL_PIN(50, "ILB_LPC_SERIRQ"),
+	PINCTRL_PIN(51, "PCU_SMB_DATA"),
+	PINCTRL_PIN(52, "PCU_SMB_CLK"),
+	PINCTRL_PIN(53, "PCU_SMB_ALERT"),
+	PINCTRL_PIN(54, "ILB_8254_SPKR"),
+	PINCTRL_PIN(55, "GPIO_S0_SC55"),
+	PINCTRL_PIN(56, "GPIO_S0_SC56"),
+	PINCTRL_PIN(57, "GPIO_S0_SC57"),
+	PINCTRL_PIN(58, "GPIO_S0_SC58"),
+	PINCTRL_PIN(59, "GPIO_S0_SC59"),
+	PINCTRL_PIN(60, "GPIO_S0_SC60"),
+	PINCTRL_PIN(61, "GPIO_S0_SC61"),
+	PINCTRL_PIN(62, "LPE_I2S2_CLK"),
+	PINCTRL_PIN(63, "LPE_I2S2_FRM"),
+	PINCTRL_PIN(64, "LPE_I2S2_DATAIN"),
+	PINCTRL_PIN(65, "LPE_I2S2_DATAOUT"),
+	PINCTRL_PIN(66, "SIO_SPI_CS"),
+	PINCTRL_PIN(67, "SIO_SPI_MISO"),
+	PINCTRL_PIN(68, "SIO_SPI_MOSI"),
+	PINCTRL_PIN(69, "SIO_SPI_CLK"),
+	PINCTRL_PIN(70, "SIO_UART1_RXD"),
+	PINCTRL_PIN(71, "SIO_UART1_TXD"),
+	PINCTRL_PIN(72, "SIO_UART1_RTS"),
+	PINCTRL_PIN(73, "SIO_UART1_CTS"),
+	PINCTRL_PIN(74, "SIO_UART2_RXD"),
+	PINCTRL_PIN(75, "SIO_UART2_TXD"),
+	PINCTRL_PIN(76, "SIO_UART2_RTS"),
+	PINCTRL_PIN(77, "SIO_UART2_CTS"),
+	PINCTRL_PIN(78, "SIO_I2C0_DATA"),
+	PINCTRL_PIN(79, "SIO_I2C0_CLK"),
+	PINCTRL_PIN(80, "SIO_I2C1_DATA"),
+	PINCTRL_PIN(81, "SIO_I2C1_CLK"),
+	PINCTRL_PIN(82, "SIO_I2C2_DATA"),
+	PINCTRL_PIN(83, "SIO_I2C2_CLK"),
+	PINCTRL_PIN(84, "SIO_I2C3_DATA"),
+	PINCTRL_PIN(85, "SIO_I2C3_CLK"),
+	PINCTRL_PIN(86, "SIO_I2C4_DATA"),
+	PINCTRL_PIN(87, "SIO_I2C4_CLK"),
+	PINCTRL_PIN(88, "SIO_I2C5_DATA"),
+	PINCTRL_PIN(89, "SIO_I2C5_CLK"),
+	PINCTRL_PIN(90, "SIO_I2C6_DATA"),
+	PINCTRL_PIN(91, "SIO_I2C6_CLK"),
+	PINCTRL_PIN(92, "GPIO_S0_SC92"),
+	PINCTRL_PIN(93, "GPIO_S0_SC93"),
+	PINCTRL_PIN(94, "SIO_PWM0"),
+	PINCTRL_PIN(95, "SIO_PWM1"),
+	PINCTRL_PIN(96, "PMC_PLT_CLK0"),
+	PINCTRL_PIN(97, "PMC_PLT_CLK1"),
+	PINCTRL_PIN(98, "PMC_PLT_CLK2"),
+	PINCTRL_PIN(99, "PMC_PLT_CLK3"),
+	PINCTRL_PIN(100, "PMC_PLT_CLK4"),
+	PINCTRL_PIN(101, "PMC_PLT_CLK5"),
+};
 
 static unsigned const score_pins[BYT_NGPIO_SCORE] = {
 	85, 89, 93, 96, 99, 102, 98, 101, 34, 37,
@@ -99,13 +289,285 @@ static unsigned const score_pins[BYT_NGPIO_SCORE] = {
 	97, 100,
 };
 
-static unsigned const ncore_pins[BYT_NGPIO_NCORE] = {
-	19, 18, 17, 20, 21, 22, 24, 25, 23, 16,
-	14, 15, 12, 26, 27, 1, 4, 8, 11, 0,
-	3, 6, 10, 13, 2, 5, 9, 7,
+static const unsigned int byt_score_pins_map[BYT_NGPIO_SCORE] = {
+	85, 89, 93, 96, 99, 102, 98, 101, 34, 37,
+	36, 38, 39, 35, 40, 84, 62, 61, 64, 59,
+	54, 56, 60, 55, 63, 57, 51, 50, 53, 47,
+	52, 49, 48, 43, 46, 41, 45, 42, 58, 44,
+	95, 105, 70, 68, 67, 66, 69, 71, 65, 72,
+	86, 90, 88, 92, 103, 77, 79, 83, 78, 81,
+	80, 82, 13, 12, 15, 14, 17, 18, 19, 16,
+	2, 1, 0, 4, 6, 7, 9, 8, 33, 32,
+	31, 30, 29, 27, 25, 28, 26, 23, 21, 20,
+	24, 22, 5, 3, 10, 11, 106, 87, 91, 104,
+	97, 100,
+};
+
+/* SCORE groups */
+static const unsigned int byt_score_uart1_pins[] = { 70, 71, 72, 73 };
+static const unsigned int byt_score_uart2_pins[] = { 74, 75, 76, 77 };
+static const struct byt_simple_func_mux byt_score_uart_mux[] = {
+	SIMPLE_FUNC("uart", 1),
+};
+
+static const unsigned int byt_score_pwm0_pins[] = { 94 };
+static const unsigned int byt_score_pwm1_pins[] = { 95 };
+static const struct byt_simple_func_mux byt_score_pwm_mux[] = {
+	SIMPLE_FUNC("pwm", 1),
+};
+
+static const unsigned int byt_score_sio_spi_pins[] = { 66, 67, 68, 69 };
+static const struct byt_simple_func_mux byt_score_spi_mux[] = {
+	SIMPLE_FUNC("spi", 1),
+};
+
+static const unsigned int byt_score_i2c5_pins[] = { 88, 89 };
+static const unsigned int byt_score_i2c6_pins[] = { 90, 91 };
+static const unsigned int byt_score_i2c4_pins[] = { 86, 87 };
+static const unsigned int byt_score_i2c3_pins[] = { 84, 85 };
+static const unsigned int byt_score_i2c2_pins[] = { 82, 83 };
+static const unsigned int byt_score_i2c1_pins[] = { 80, 81 };
+static const unsigned int byt_score_i2c0_pins[] = { 78, 79 };
+static const struct byt_simple_func_mux byt_score_i2c_mux[] = {
+	SIMPLE_FUNC("i2c", 1),
+};
+
+static const unsigned int byt_score_ssp0_pins[] = { 8, 9, 10, 11 };
+static const unsigned int byt_score_ssp1_pins[] = { 12, 13, 14, 15 };
+static const unsigned int byt_score_ssp2_pins[] = { 62, 63, 64, 65 };
+static const struct byt_simple_func_mux byt_score_ssp_mux[] = {
+	SIMPLE_FUNC("ssp", 1),
+};
+
+static const unsigned int byt_score_sdcard_pins[] = {
+	7, 33, 34, 35, 36, 37, 38, 39, 40, 41,
+};
+static const unsigned short byt_score_sdcard_mux_values[] = {
+	2, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+};
+static const struct byt_mixed_func_mux byt_score_sdcard_mux[] = {
+	MIXED_FUNC("sdcard", byt_score_sdcard_mux_values),
+};
+
+static const unsigned int byt_score_sdio_pins[] = { 27, 28, 29, 30, 31, 32 };
+static const struct byt_simple_func_mux byt_score_sdio_mux[] = {
+	SIMPLE_FUNC("sdio", 1),
+};
+
+static const unsigned int byt_score_emmc_pins[] = {
+	16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
+};
+static const struct byt_simple_func_mux byt_score_emmc_mux[] = {
+	SIMPLE_FUNC("emmc", 1),
+};
+
+static const unsigned int byt_score_ilb_lpc_pins[] = {
+	42, 43, 44, 45, 46, 47, 48, 49, 50,
+};
+static const struct byt_simple_func_mux byt_score_lpc_mux[] = {
+	SIMPLE_FUNC("lpc", 1),
+};
+
+static const unsigned int byt_score_sata_pins[] = { 0, 1, 2 };
+static const struct byt_simple_func_mux byt_score_sata_mux[] = {
+	SIMPLE_FUNC("sata", 1),
+};
+
+static const unsigned int byt_score_plt_clk0_pins[] = { 96 };
+static const unsigned int byt_score_plt_clk1_pins[] = { 97 };
+static const unsigned int byt_score_plt_clk2_pins[] = { 98 };
+static const unsigned int byt_score_plt_clk4_pins[] = { 99 };
+static const unsigned int byt_score_plt_clk5_pins[] = { 100 };
+static const unsigned int byt_score_plt_clk3_pins[] = { 101 };
+static const struct byt_simple_func_mux byt_score_plt_clk_mux[] = {
+	SIMPLE_FUNC("plt_clk", 1),
 };
 
-static unsigned const sus_pins[BYT_NGPIO_SUS] = {
+static const unsigned int byt_score_smbus_pins[] = { 51, 52, 53 };
+static const struct byt_simple_func_mux byt_score_smbus_mux[] = {
+	SIMPLE_FUNC("smbus", 1),
+};
+
+static const struct byt_pingroup byt_score_groups[] = {
+	PIN_GROUP_SIMPLE("uart1_grp",
+			 byt_score_uart1_pins, byt_score_uart_mux),
+	PIN_GROUP_SIMPLE("uart2_grp",
+			 byt_score_uart2_pins, byt_score_uart_mux),
+	PIN_GROUP_SIMPLE("pwm0_grp",
+			 byt_score_pwm0_pins, byt_score_pwm_mux),
+	PIN_GROUP_SIMPLE("pwm1_grp",
+			 byt_score_pwm1_pins, byt_score_pwm_mux),
+	PIN_GROUP_SIMPLE("ssp2_grp",
+			 byt_score_ssp2_pins, byt_score_pwm_mux),
+	PIN_GROUP_SIMPLE("sio_spi_grp",
+			 byt_score_sio_spi_pins, byt_score_spi_mux),
+	PIN_GROUP_SIMPLE("i2c5_grp",
+			 byt_score_i2c5_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c6_grp",
+			 byt_score_i2c6_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c4_grp",
+			 byt_score_i2c4_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c3_grp",
+			 byt_score_i2c3_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c2_grp",
+			 byt_score_i2c2_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c1_grp",
+			 byt_score_i2c1_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("i2c0_grp",
+			 byt_score_i2c0_pins, byt_score_i2c_mux),
+	PIN_GROUP_SIMPLE("ssp0_grp",
+			 byt_score_ssp0_pins, byt_score_ssp_mux),
+	PIN_GROUP_SIMPLE("ssp1_grp",
+			 byt_score_ssp1_pins, byt_score_ssp_mux),
+	PIN_GROUP_MIXED("sdcard_grp",
+			byt_score_sdcard_pins, byt_score_sdcard_mux),
+	PIN_GROUP_SIMPLE("sdio_grp",
+			 byt_score_sdio_pins, byt_score_sdio_mux),
+	PIN_GROUP_SIMPLE("emmc_grp",
+			 byt_score_emmc_pins, byt_score_emmc_mux),
+	PIN_GROUP_SIMPLE("lpc_grp",
+			 byt_score_ilb_lpc_pins, byt_score_lpc_mux),
+	PIN_GROUP_SIMPLE("sata_grp",
+			 byt_score_sata_pins, byt_score_sata_mux),
+	PIN_GROUP_SIMPLE("plt_clk0_grp",
+			 byt_score_plt_clk0_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("plt_clk1_grp",
+			 byt_score_plt_clk1_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("plt_clk2_grp",
+			 byt_score_plt_clk2_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("plt_clk3_grp",
+			 byt_score_plt_clk3_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("plt_clk4_grp",
+			 byt_score_plt_clk4_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("plt_clk5_grp",
+			 byt_score_plt_clk5_pins, byt_score_plt_clk_mux),
+	PIN_GROUP_SIMPLE("smbus_grp",
+			 byt_score_smbus_pins, byt_score_smbus_mux),
+};
+
+static const char * const byt_score_uart_groups[] = {
+	"uart1_grp", "uart2_grp",
+};
+static const char * const byt_score_pwm_groups[] = {
+	"pwm0_grp", "pwm1_grp",
+};
+static const char * const byt_score_ssp_groups[] = {
+	"ssp0_grp", "ssp1_grp", "ssp2_grp",
+};
+static const char * const byt_score_spi_groups[] = { "sio_spi_grp" };
+static const char * const byt_score_i2c_groups[] = {
+	"i2c0_grp", "i2c1_grp", "i2c2_grp", "i2c3_grp", "i2c4_grp", "i2c5_grp",
+	"i2c6_grp",
+};
+static const char * const byt_score_sdcard_groups[] = { "sdcard_grp" };
+static const char * const byt_score_sdio_groups[] = { "sdio_grp" };
+static const char * const byt_score_emmc_groups[] = { "emmc_grp" };
+static const char * const byt_score_lpc_groups[] = { "lpc_grp" };
+static const char * const byt_score_sata_groups[] = { "sata_grp" };
+static const char * const byt_score_plt_clk_groups[] = {
+	"plt_clk0_grp", "plt_clk1_grp", "plt_clk2_grp", "plt_clk3_grp",
+	"plt_clk4_grp", "plt_clk5_grp",
+};
+static const char * const byt_score_smbus_groups[] = { "smbus_grp" };
+static const char * const byt_score_gpio_groups[] = {
+	"uart1_grp", "uart2_grp", "pwm0_grp", "pwm1_grp", "ssp0_grp",
+	"ssp1_grp", "ssp2_grp", "sio_spi_grp", "i2c0_grp", "i2c1_grp",
+	"i2c2_grp", "i2c3_grp", "i2c4_grp", "i2c5_grp", "i2c6_grp",
+	"sdcard_grp", "sdio_grp", "emmc_grp", "lpc_grp", "sata_grp",
+	"plt_clk0_grp", "plt_clk1_grp", "plt_clk2_grp", "plt_clk3_grp",
+	"plt_clk4_grp", "plt_clk5_grp", "smbus_grp",
+
+};
+
+static const struct byt_function byt_score_functions[] = {
+	FUNCTION("uart", byt_score_uart_groups),
+	FUNCTION("pwm", byt_score_pwm_groups),
+	FUNCTION("ssp", byt_score_ssp_groups),
+	FUNCTION("spi", byt_score_spi_groups),
+	FUNCTION("i2c", byt_score_i2c_groups),
+	FUNCTION("sdcard", byt_score_sdcard_groups),
+	FUNCTION("sdio", byt_score_sdio_groups),
+	FUNCTION("emmc", byt_score_emmc_groups),
+	FUNCTION("lpc", byt_score_lpc_groups),
+	FUNCTION("sata", byt_score_sata_groups),
+	FUNCTION("plt_clk", byt_score_plt_clk_groups),
+	FUNCTION("smbus", byt_score_smbus_groups),
+	FUNCTION("gpio", byt_score_gpio_groups),
+};
+
+static const struct byt_community byt_score_communities[] = {
+	COMMUNITY(0, BYT_NGPIO_SCORE, byt_score_pins_map),
+};
+
+static const struct byt_pinctrl_soc_data byt_score_soc_data = {
+	.uid		= BYT_SCORE_ACPI_UID,
+	.pins		= byt_score_pins,
+	.npins		= ARRAY_SIZE(byt_score_pins),
+	.groups		= byt_score_groups,
+	.ngroups	= ARRAY_SIZE(byt_score_groups),
+	.functions	= byt_score_functions,
+	.nfunctions	= ARRAY_SIZE(byt_score_functions),
+	.communities	= byt_score_communities,
+	.ncommunities	= ARRAY_SIZE(byt_score_communities),
+};
+
+/* SUS pins, aka GPIOS_<pin_no> or GPIO_S5[<pin_no>]  */
+static const struct pinctrl_pin_desc byt_sus_pins[] = {
+	PINCTRL_PIN(0, "GPIO_S50"),
+	PINCTRL_PIN(1, "GPIO_S51"),
+	PINCTRL_PIN(2, "GPIO_S52"),
+	PINCTRL_PIN(3, "GPIO_S53"),
+	PINCTRL_PIN(4, "GPIO_S54"),
+	PINCTRL_PIN(5, "GPIO_S55"),
+	PINCTRL_PIN(6, "GPIO_S56"),
+	PINCTRL_PIN(7, "GPIO_S57"),
+	PINCTRL_PIN(8, "GPIO_S58"),
+	PINCTRL_PIN(9, "GPIO_S59"),
+	PINCTRL_PIN(10, "GPIO_S510"),
+	PINCTRL_PIN(11, "PMC_SUSPWRDNACK"),
+	PINCTRL_PIN(12, "PMC_SUSCLK0"),
+	PINCTRL_PIN(13, "GPIO_S513"),
+	PINCTRL_PIN(14, "USB_ULPI_RST"),
+	PINCTRL_PIN(15, "PMC_WAKE_PCIE0#"),
+	PINCTRL_PIN(16, "PMC_PWRBTN"),
+	PINCTRL_PIN(17, "GPIO_S517"),
+	PINCTRL_PIN(18, "PMC_SUS_STAT"),
+	PINCTRL_PIN(19, "USB_OC0"),
+	PINCTRL_PIN(20, "USB_OC1"),
+	PINCTRL_PIN(21, "PCU_SPI_CS1"),
+	PINCTRL_PIN(22, "GPIO_S522"),
+	PINCTRL_PIN(23, "GPIO_S523"),
+	PINCTRL_PIN(24, "GPIO_S524"),
+	PINCTRL_PIN(25, "GPIO_S525"),
+	PINCTRL_PIN(26, "GPIO_S526"),
+	PINCTRL_PIN(27, "GPIO_S527"),
+	PINCTRL_PIN(28, "GPIO_S528"),
+	PINCTRL_PIN(29, "GPIO_S529"),
+	PINCTRL_PIN(30, "GPIO_S530"),
+	PINCTRL_PIN(31, "USB_ULPI_CLK"),
+	PINCTRL_PIN(32, "USB_ULPI_DATA0"),
+	PINCTRL_PIN(33, "USB_ULPI_DATA1"),
+	PINCTRL_PIN(34, "USB_ULPI_DATA2"),
+	PINCTRL_PIN(35, "USB_ULPI_DATA3"),
+	PINCTRL_PIN(36, "USB_ULPI_DATA4"),
+	PINCTRL_PIN(37, "USB_ULPI_DATA5"),
+	PINCTRL_PIN(38, "USB_ULPI_DATA6"),
+	PINCTRL_PIN(39, "USB_ULPI_DATA7"),
+	PINCTRL_PIN(40, "USB_ULPI_DIR"),
+	PINCTRL_PIN(41, "USB_ULPI_NXT"),
+	PINCTRL_PIN(42, "USB_ULPI_STP"),
+	PINCTRL_PIN(43, "USB_ULPI_REFCLK"),
+};
+
+static const unsigned int sus_pins[BYT_NGPIO_SUS] = {
+	29, 33, 30, 31, 32, 34, 36, 35, 38, 37,
+	18, 7, 11, 20, 17, 1, 8, 10, 19, 12,
+	0, 2, 23, 39, 28, 27, 22, 21, 24, 25,
+	26, 51, 56, 54, 49, 55, 48, 57, 50, 58,
+	52, 53, 59, 40,
+};
+
+static const unsigned int byt_sus_pins_map[BYT_NGPIO_SUS] = {
 	29, 33, 30, 31, 32, 34, 36, 35, 38, 37,
 	18, 7, 11, 20, 17, 1, 8, 10, 19, 12,
 	0, 2, 23, 39, 28, 27, 22, 21, 24, 25,
@@ -113,6 +575,126 @@ static unsigned const sus_pins[BYT_NGPIO_SUS] = {
 	52, 53, 59, 40,
 };
 
+static const unsigned int byt_sus_usb_over_current_pins[] = { 19, 20 };
+static const struct byt_simple_func_mux byt_sus_usb_oc_mux[] = {
+	SIMPLE_FUNC("usb", 0),
+	SIMPLE_FUNC("gpio", 1),
+};
+
+static const unsigned int byt_sus_usb_ulpi_pins[] = {
+	14, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43,
+};
+static const unsigned short byt_sus_usb_ulpi_mode_values[] = {
+	2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+};
+static const unsigned short byt_sus_usb_ulpi_gpio_mode_values[] = {
+	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+static const struct byt_mixed_func_mux byt_sus_usb_ulpi_mux[] = {
+	MIXED_FUNC("usb", byt_sus_usb_ulpi_mode_values),
+	MIXED_FUNC("gpio", byt_sus_usb_ulpi_gpio_mode_values),
+};
+
+static const unsigned int byt_sus_pcu_spi_pins[] = { 21 };
+static const struct byt_simple_func_mux byt_sus_pcu_spi_mux[] = {
+	SIMPLE_FUNC("spi", 0),
+	SIMPLE_FUNC("gpio", 1),
+};
+
+static const struct byt_pingroup byt_sus_groups[] = {
+	PIN_GROUP_SIMPLE("usb_oc_grp",
+			byt_sus_usb_over_current_pins, byt_sus_usb_oc_mux),
+	PIN_GROUP_MIXED("usb_ulpi_grp",
+			byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_mux),
+	PIN_GROUP_SIMPLE("pcu_spi_grp",
+			byt_sus_pcu_spi_pins, byt_sus_pcu_spi_mux),
+};
+
+static const char * const byt_sus_usb_groups[] = {
+	"usb_oc_grp", "usb_ulpi_grp",
+};
+static const char * const byt_sus_spi_groups[] = { "pcu_spi_grp" };
+static const char * const byt_sus_gpio_groups[] = {
+	"usb_oc_grp", "usb_ulpi_grp", "pcu_spi_grp",
+};
+
+static const struct byt_function byt_sus_functions[] = {
+	FUNCTION("usb", byt_sus_usb_groups),
+	FUNCTION("spi", byt_sus_spi_groups),
+	FUNCTION("gpio", byt_sus_gpio_groups),
+};
+
+static const struct byt_community byt_sus_communities[] = {
+	COMMUNITY(0, BYT_NGPIO_SUS, byt_sus_pins_map),
+};
+
+static const struct byt_pinctrl_soc_data byt_sus_soc_data = {
+	.uid		= BYT_SUS_ACPI_UID,
+	.pins		= byt_sus_pins,
+	.npins		= ARRAY_SIZE(byt_sus_pins),
+	.groups		= byt_sus_groups,
+	.ngroups	= ARRAY_SIZE(byt_sus_groups),
+	.functions	= byt_sus_functions,
+	.nfunctions	= ARRAY_SIZE(byt_sus_functions),
+	.communities	= byt_sus_communities,
+	.ncommunities	= ARRAY_SIZE(byt_sus_communities),
+};
+
+static const struct pinctrl_pin_desc byt_ncore_pins[] = {
+	PINCTRL_PIN(0, "GPIO_NCORE0"),
+	PINCTRL_PIN(1, "GPIO_NCORE1"),
+	PINCTRL_PIN(2, "GPIO_NCORE2"),
+	PINCTRL_PIN(3, "GPIO_NCORE3"),
+	PINCTRL_PIN(4, "GPIO_NCORE4"),
+	PINCTRL_PIN(5, "GPIO_NCORE5"),
+	PINCTRL_PIN(6, "GPIO_NCORE6"),
+	PINCTRL_PIN(7, "GPIO_NCORE7"),
+	PINCTRL_PIN(8, "GPIO_NCORE8"),
+	PINCTRL_PIN(9, "GPIO_NCORE9"),
+	PINCTRL_PIN(10, "GPIO_NCORE10"),
+	PINCTRL_PIN(11, "GPIO_NCORE11"),
+	PINCTRL_PIN(12, "GPIO_NCORE12"),
+	PINCTRL_PIN(13, "GPIO_NCORE13"),
+	PINCTRL_PIN(14, "GPIO_NCORE14"),
+	PINCTRL_PIN(15, "GPIO_NCORE15"),
+	PINCTRL_PIN(16, "GPIO_NCORE16"),
+	PINCTRL_PIN(17, "GPIO_NCORE17"),
+	PINCTRL_PIN(18, "GPIO_NCORE18"),
+	PINCTRL_PIN(19, "GPIO_NCORE19"),
+	PINCTRL_PIN(20, "GPIO_NCORE20"),
+	PINCTRL_PIN(21, "GPIO_NCORE21"),
+	PINCTRL_PIN(22, "GPIO_NCORE22"),
+	PINCTRL_PIN(23, "GPIO_NCORE23"),
+	PINCTRL_PIN(24, "GPIO_NCORE24"),
+	PINCTRL_PIN(25, "GPIO_NCORE25"),
+	PINCTRL_PIN(26, "GPIO_NCORE26"),
+	PINCTRL_PIN(27, "GPIO_NCORE27"),
+};
+
+static unsigned const byt_ncore_pins_map[BYT_NGPIO_NCORE] = {
+	19, 18, 17, 20, 21, 22, 24, 25, 23, 16,
+	14, 15, 12, 26, 27, 1, 4, 8, 11, 0,
+	3, 6, 10, 13, 2, 5, 9, 7,
+};
+
+static const struct byt_community byt_ncore_communities[] = {
+	COMMUNITY(0, BYT_NGPIO_NCORE, byt_ncore_pins_map),
+};
+
+static const struct byt_pinctrl_soc_data byt_ncore_soc_data = {
+	.uid		= BYT_NCORE_ACPI_UID,
+	.pins		= byt_ncore_pins,
+	.npins		= ARRAY_SIZE(byt_ncore_pins),
+	.communities	= byt_ncore_communities,
+	.ncommunities	= ARRAY_SIZE(byt_ncore_communities),
+};
+
+static unsigned const ncore_pins[BYT_NGPIO_NCORE] = {
+	19, 18, 17, 20, 21, 22, 24, 25, 23, 16,
+	14, 15, 12, 26, 27, 1, 4, 8, 11, 0,
+	3, 6, 10, 13, 2, 5, 9, 7,
+};
+
 static struct pinctrl_gpio_range byt_ranges[] = {
 	{
 		.name = BYT_SCORE_ACPI_UID, /* match with acpi _UID in probe */
@@ -133,11 +715,6 @@ static struct pinctrl_gpio_range byt_ranges[] = {
 	},
 };
 
-struct byt_gpio_pin_context {
-	u32 conf0;
-	u32 val;
-};
-
 struct byt_gpio {
 	struct gpio_chip		chip;
 	struct platform_device		*pdev;
@@ -147,6 +724,13 @@ struct byt_gpio {
 	struct byt_gpio_pin_context	*saved_context;
 };
 
+static const struct byt_pinctrl_soc_data *byt_soc_data[] = {
+	&byt_score_soc_data,
+	&byt_sus_soc_data,
+	&byt_ncore_soc_data,
+	NULL,
+};
+
 static void __iomem *byt_gpio_reg(struct gpio_chip *chip, unsigned offset,
 				 int reg)
 {
@@ -713,8 +1297,8 @@ static const struct dev_pm_ops byt_gpio_pm_ops = {
 };
 
 static const struct acpi_device_id byt_gpio_acpi_match[] = {
-	{ "INT33B2", 0 },
-	{ "INT33FC", 0 },
+	{ "INT33B2", (kernel_ulong_t)byt_soc_data },
+	{ "INT33FC", (kernel_ulong_t)byt_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, byt_gpio_acpi_match);
-- 
1.9.1
