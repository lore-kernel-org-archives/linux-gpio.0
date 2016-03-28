From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v2 1/6] pinctrl: baytrail: Add pin control data structures
Date: Mon, 28 Mar 2016 16:29:35 +0300
Message-ID: <1459171780-24856-2-git-send-email-cristina.ciocan@intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:55439 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752673AbcC1N06 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 28 Mar 2016 09:26:58 -0400
In-Reply-To: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>

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
index 21b79a4..cd83de3 100644
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
+/* SCORE pins */
+static const struct pinctrl_pin_desc byt_score_pins[] = {
+	PINCTRL_PIN(0, "SATA_GP[0]"),		/* GPIOC_0 */
+	PINCTRL_PIN(1, "SATA_GP[1]"),		/* GPIOC_1 */
+	PINCTRL_PIN(2, "SATA_LED#"),		/* GPIOC_2 */
+	PINCTRL_PIN(3, "PCIE_CLKREQ[0]#"),	/* GPIOC_3 */
+	PINCTRL_PIN(4, "PCIE_CLKREQ[1]#"),	/* GPIOC_4 */
+	PINCTRL_PIN(5, "PCIE_CLKREQ[2]#"),	/* GPIOC_5 */
+	PINCTRL_PIN(6, "PCIE_CLKREQ[3]#"),	/* GPIOC_6 */
+	PINCTRL_PIN(7, "SD3_WP"),		/* GPIOC_7 */
+	PINCTRL_PIN(8, "HDA_RST#"),		/* GPIOC_8 */
+	PINCTRL_PIN(9, "HDA_SYNC"),		/* GPIOC_9 */
+	PINCTRL_PIN(10, "HDA_CLK"),		/* GPIOC_10 */
+	PINCTRL_PIN(11, "HDA_SDO"),		/* GPIOC_11 */
+	PINCTRL_PIN(12, "HDA_SDI[0]"),		/* GPIOC_12 */
+	PINCTRL_PIN(13, "HDA_SDI[1]"),		/* GPIOC_13 */
+	PINCTRL_PIN(14, "GPIO_S0_SC[014]"),	/* GPIOC_14 */
+	PINCTRL_PIN(15, "GPIO_S0_SC[015]"),	/* GPIOC_15 */
+	PINCTRL_PIN(16, "MMC1_CLK"),		/* GPIOC_16 */
+	PINCTRL_PIN(17, "MMC1_D[0]"),		/* GPIOC_17 */
+	PINCTRL_PIN(18, "MMC1_D[1]"),		/* GPIOC_18 */
+	PINCTRL_PIN(19, "MMC1_D[2]"),		/* GPIOC_19 */
+	PINCTRL_PIN(20, "MMC1_D[3]"),		/* GPIOC_20 */
+	PINCTRL_PIN(21, "MMC1_D[4]"),		/* GPIOC_21 */
+	PINCTRL_PIN(22, "MMC1_D[5]"),		/* GPIOC_22 */
+	PINCTRL_PIN(23, "MMC1_D[6]"),		/* GPIOC_23 */
+	PINCTRL_PIN(24, "MMC1_D[7]"),		/* GPIOC_24 */
+	PINCTRL_PIN(25, "MMC1_CMD"),		/* GPIOC_25 */
+	PINCTRL_PIN(26, "MMC1_RST#"),		/* GPIOC_26 */
+	PINCTRL_PIN(27, "SD2_CLK"),		/* GPIOC_27 */
+	PINCTRL_PIN(28, "SD2_D[0]"),		/* GPIOC_28 */
+	PINCTRL_PIN(29, "SD2_D[1]"),		/* GPIOC_29 */
+	PINCTRL_PIN(30, "SD2_D[2]"),		/* GPIOC_30 */
+	PINCTRL_PIN(31, "SD2_D[3]_CD#"),	/* GPIOC_31 */
+	PINCTRL_PIN(32, "SD2_CMD"),		/* GPIOC_32 */
+	PINCTRL_PIN(33, "SD3_CLK"),		/* GPIOC_33 */
+	PINCTRL_PIN(34, "SD3_D[0]"),		/* GPIOC_34 */
+	PINCTRL_PIN(35, "SD3_D[1]"),		/* GPIOC_35 */
+	PINCTRL_PIN(36, "SD3_D[2]"),		/* GPIOC_36 */
+	PINCTRL_PIN(37, "SD3_D[3]"),		/* GPIOC_37 */
+	PINCTRL_PIN(38, "SD3_CD#"),		/* GPIOC_38 */
+	PINCTRL_PIN(39, "SD3_CMD"),		/* GPIOC_39 */
+	PINCTRL_PIN(40, "SD3_1P8EN"),		/* GPIOC_40 */
+	PINCTRL_PIN(41, "SD3_PWREN#"),		/* GPIOC_41 */
+	PINCTRL_PIN(42, "ILB_LPC_AD[0]"),	/* GPIOC_42 */
+	PINCTRL_PIN(43, "ILB_LPC_AD[1]"),	/* GPIOC_43 */
+	PINCTRL_PIN(44, "ILB_LPC_AD[2]"),	/* GPIOC_44 */
+	PINCTRL_PIN(45, "ILB_LPC_AD[3]"),	/* GPIOC_45 */
+	PINCTRL_PIN(46, "ILB_LPC_FRAME#"),	/* GPIOC_46 */
+	PINCTRL_PIN(47, "ILB_LPC_CLK[0]"),	/* GPIOC_47 */
+	PINCTRL_PIN(48, "ILB_LPC_CLK[1]"),	/* GPIOC_48 */
+	PINCTRL_PIN(49, "ILB_LPC_CLKRUN#"),	/* GPIOC_49 */
+	PINCTRL_PIN(50, "ILB_LPC_SERIRQ"),	/* GPIOC_50 */
+	PINCTRL_PIN(51, "PCU_SMB_DATA"),	/* GPIOC_51 */
+	PINCTRL_PIN(52, "PCU_SMB_CLK"),		/* GPIOC_52 */
+	PINCTRL_PIN(53, "PCU_SMB_ALERT#"),	/* GPIOC_53 */
+	PINCTRL_PIN(54, "ILB_8254_SPKR"),	/* GPIOC_54 */
+	PINCTRL_PIN(55, "GPIO_S0_SC[055]"),	/* GPIOC_55 */
+	PINCTRL_PIN(56, "GPIO_S0_SC[056]"),	/* GPIOC_56 */
+	PINCTRL_PIN(57, "GPIO_S0_SC[057]"),	/* GPIOC_57 */
+	PINCTRL_PIN(58, "GPIO_S0_SC[058]"),	/* GPIOC_58 */
+	PINCTRL_PIN(59, "GPIO_S0_SC[059]"),	/* GPIOC_59 */
+	PINCTRL_PIN(60, "GPIO_S0_SC[060]"),	/* GPIOC_60 */
+	PINCTRL_PIN(61, "GPIO_S0_SC[061]"),	/* GPIOC_61 */
+	PINCTRL_PIN(62, "LPE_I2S2_CLK"),	/* GPIOC_62 */
+	PINCTRL_PIN(63, "LPE_I2S2_FRM"),	/* GPIOC_63 */
+	PINCTRL_PIN(64, "LPE_I2S2_DATAIN"),	/* GPIOC_64 */
+	PINCTRL_PIN(65, "LPE_I2S2_DATAOUT"),	/* GPIOC_65 */
+	PINCTRL_PIN(66, "SIO_SPI_CS#"),		/* GPIOC_66 */
+	PINCTRL_PIN(67, "SIO_SPI_MISO"),	/* GPIOC_67 */
+	PINCTRL_PIN(68, "SIO_SPI_MOSI"),	/* GPIOC_68 */
+	PINCTRL_PIN(69, "SIO_SPI_CLK"),		/* GPIOC_69 */
+	PINCTRL_PIN(70, "SIO_UART1_RXD"),	/* GPIOC_70 */
+	PINCTRL_PIN(71, "SIO_UART1_TXD"),	/* GPIOC_71 */
+	PINCTRL_PIN(72, "SIO_UART1_RTS#"),	/* GPIOC_72 */
+	PINCTRL_PIN(73, "SIO_UART1_CTS#"),	/* GPIOC_73 */
+	PINCTRL_PIN(74, "SIO_UART2_RXD"),	/* GPIOC_74 */
+	PINCTRL_PIN(75, "SIO_UART2_TXD"),	/* GPIOC_75 */
+	PINCTRL_PIN(76, "SIO_UART2_RTS#"),	/* GPIOC_76 */
+	PINCTRL_PIN(77, "SIO_UART2_CTS#"),	/* GPIOC_77 */
+	PINCTRL_PIN(78, "SIO_I2C0_DATA"),	/* GPIOC_78 */
+	PINCTRL_PIN(79, "SIO_I2C0_CLK"),	/* GPIOC_79 */
+	PINCTRL_PIN(80, "SIO_I2C1_DATA"),	/* GPIOC_80 */
+	PINCTRL_PIN(81, "SIO_I2C1_CLK"),	/* GPIOC_81 */
+	PINCTRL_PIN(82, "SIO_I2C2_DATA"),	/* GPIOC_82 */
+	PINCTRL_PIN(83, "SIO_I2C2_CLK"),	/* GPIOC_83 */
+	PINCTRL_PIN(84, "SIO_I2C3_DATA"),	/* GPIOC_84 */
+	PINCTRL_PIN(85, "SIO_I2C3_CLK"),	/* GPIOC_85 */
+	PINCTRL_PIN(86, "SIO_I2C4_DATA"),	/* GPIOC_86 */
+	PINCTRL_PIN(87, "SIO_I2C4_CLK"),	/* GPIOC_87 */
+	PINCTRL_PIN(88, "SIO_I2C5_DATA"),	/* GPIOC_88 */
+	PINCTRL_PIN(89, "SIO_I2C5_CLK"),	/* GPIOC_89 */
+	PINCTRL_PIN(90, "SIO_I2C6_DATA"),	/* GPIOC_90 */
+	PINCTRL_PIN(91, "SIO_I2C6_CLK"),	/* GPIOC_91 */
+	PINCTRL_PIN(92, "GPIO_S0_SC[092]"),	/* GPIOC_92 */
+	PINCTRL_PIN(93, "GPIO_S0_SC[093]"),	/* GPIOC_93 */
+	PINCTRL_PIN(94, "SIO_PWM[0]"),		/* GPIOC_94 */
+	PINCTRL_PIN(95, "SIO_PWM[1]"),		/* GPIOC_95 */
+	PINCTRL_PIN(96, "PMC_PLT_CLK[0]"),	/* GPIOC_96 */
+	PINCTRL_PIN(97, "PMC_PLT_CLK[1]"),	/* GPIOC_97 */
+	PINCTRL_PIN(98, "PMC_PLT_CLK[2]"),	/* GPIOC_98 */
+	PINCTRL_PIN(99, "PMC_PLT_CLK[3]"),	/* GPIOC_99 */
+	PINCTRL_PIN(100, "PMC_PLT_CLK[4]"),	/* GPIOC_100 */
+	PINCTRL_PIN(101, "PMC_PLT_CLK[5]"),	/* GPIOC_101 */
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
+/* SUS pins */
+static const struct pinctrl_pin_desc byt_sus_pins[] = {
+	PINCTRL_PIN(0, "GPIO_S5[00]"),		/* GPIO_SUS0 */
+	PINCTRL_PIN(1, "GPIO_S5[01]"),		/* GPIO_SUS1 */
+	PINCTRL_PIN(2, "GPIO_S5[02]"),		/* GPIO_SUS2 */
+	PINCTRL_PIN(3, "GPIO_S5[03]"),		/* GPIO_SUS3 */
+	PINCTRL_PIN(4, "GPIO_S5[04]"),		/* GPIO_SUS4 */
+	PINCTRL_PIN(5, "GPIO_S5[05]"),		/* GPIO_SUS5 */
+	PINCTRL_PIN(6, "GPIO_S5[06]"),		/* GPIO_SUS6 */
+	PINCTRL_PIN(7, "GPIO_S5[07]"),		/* GPIO_SUS7 */
+	PINCTRL_PIN(8, "GPIO_S5[08]"),		/* SEC_GPIO_SUS8 */
+	PINCTRL_PIN(9, "GPIO_S5[09]"),		/* SEC_GPIO_SUS9 */
+	PINCTRL_PIN(10, "GPIO_S5[10]"),		/* SEC_GPIO_SUS10 */
+	PINCTRL_PIN(11, "PMC_SUSPWRDNACK"),	/* GPIOS_11 */
+	PINCTRL_PIN(12, "PMC_SUSCLK[0]"),	/* GPIOS_12 */
+	PINCTRL_PIN(13, "GPIO_S5[13]"),		/* GPIOS_13 */
+	PINCTRL_PIN(14, "USB_ULPI_RST#"),	/* GPIOS_14 */
+	PINCTRL_PIN(15, "PMC_WAKE_PCIE[0]#"),	/* GPIOS_15 */
+	PINCTRL_PIN(16, "PMC_PWRBTN#"),		/* GPIOS_16 */
+	PINCTRL_PIN(17, "GPIO_S5[17]"),		/* GPIOS_17 */
+	PINCTRL_PIN(18, "PMC_SUS_STAT#"),	/* GPIOS_18 */
+	PINCTRL_PIN(19, "USB_OC[0]#"),		/* GPIOS_19 */
+	PINCTRL_PIN(20, "USB_OC[1]#"),		/* GPIOS_20 */
+	PINCTRL_PIN(21, "PCU_SPI_CS[1]#"),	/* GPIOS_21 */
+	PINCTRL_PIN(22, "GPIO_S5[22]"),		/* GPIOS_22 */
+	PINCTRL_PIN(23, "GPIO_S5[23]"),		/* GPIOS_23 */
+	PINCTRL_PIN(24, "GPIO_S5[24]"),		/* GPIOS_24 */
+	PINCTRL_PIN(25, "GPIO_S5[25]"),		/* GPIOS_25 */
+	PINCTRL_PIN(26, "GPIO_S5[26]"),		/* GPIOS_26 */
+	PINCTRL_PIN(27, "GPIO_S5[27]"),		/* GPIOS_27 */
+	PINCTRL_PIN(28, "GPIO_S5[28]"),		/* GPIOS_28 */
+	PINCTRL_PIN(29, "GPIO_S5[29]"),		/* GPIOS_29 */
+	PINCTRL_PIN(30, "GPIO_S5[30]"),		/* GPIOS_30 */
+	PINCTRL_PIN(31, "USB_ULPI_CLK"),	/* GPIOS_31 */
+	PINCTRL_PIN(32, "USB_ULPI_DATA[0]"),	/* GPIOS_32 */
+	PINCTRL_PIN(33, "USB_ULPI_DATA[1]"),	/* GPIOS_33 */
+	PINCTRL_PIN(34, "USB_ULPI_DATA[2]"),	/* GPIOS_34 */
+	PINCTRL_PIN(35, "USB_ULPI_DATA[3]"),	/* GPIOS_35 */
+	PINCTRL_PIN(36, "USB_ULPI_DATA[4]"),	/* GPIOS_36 */
+	PINCTRL_PIN(37, "USB_ULPI_DATA[5]"),	/* GPIOS_37 */
+	PINCTRL_PIN(38, "USB_ULPI_DATA[6]"),	/* GPIOS_38 */
+	PINCTRL_PIN(39, "USB_ULPI_DATA[7]"),	/* GPIOS_39 */
+	PINCTRL_PIN(40, "USB_ULPI_DIR"),	/* GPIOS_40 */
+	PINCTRL_PIN(41, "USB_ULPI_NXT"),	/* GPIOS_41 */
+	PINCTRL_PIN(42, "USB_ULPI_STP"),	/* GPIOS_42 */
+	PINCTRL_PIN(43, "USB_ULPI_REFCLK"),	/* GPIOS_43 */
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
+	PINCTRL_PIN(0, "GPIO_NCORE[0]"),
+	PINCTRL_PIN(1, "GPIO_NCORE[1]"),
+	PINCTRL_PIN(2, "GPIO_NCORE[2]"),
+	PINCTRL_PIN(3, "GPIO_NCORE[3]"),
+	PINCTRL_PIN(4, "GPIO_NCORE[4]"),
+	PINCTRL_PIN(5, "GPIO_NCORE[5]"),
+	PINCTRL_PIN(6, "GPIO_NCORE[6]"),
+	PINCTRL_PIN(7, "GPIO_NCORE[7]"),
+	PINCTRL_PIN(8, "GPIO_NCORE[8]"),
+	PINCTRL_PIN(9, "GPIO_NCORE[9]"),
+	PINCTRL_PIN(10, "GPIO_NCORE[10]"),
+	PINCTRL_PIN(11, "GPIO_NCORE[11]"),
+	PINCTRL_PIN(12, "GPIO_NCORE[12]"),
+	PINCTRL_PIN(13, "GPIO_NCORE[13]"),
+	PINCTRL_PIN(14, "GPIO_NCORE[14]"),
+	PINCTRL_PIN(15, "GPIO_NCORE[15]"),
+	PINCTRL_PIN(16, "GPIO_NCORE[16]"),
+	PINCTRL_PIN(17, "GPIO_NCORE[17]"),
+	PINCTRL_PIN(18, "GPIO_NCORE[18]"),
+	PINCTRL_PIN(19, "GPIO_NCORE[19]"),
+	PINCTRL_PIN(20, "GPIO_NCORE[20]"),
+	PINCTRL_PIN(21, "GPIO_NCORE[21]"),
+	PINCTRL_PIN(22, "GPIO_NCORE[22]"),
+	PINCTRL_PIN(23, "GPIO_NCORE[23]"),
+	PINCTRL_PIN(24, "GPIO_NCORE[24]"),
+	PINCTRL_PIN(25, "GPIO_NCORE[25]"),
+	PINCTRL_PIN(26, "GPIO_NCORE[26]"),
+	PINCTRL_PIN(27, "GPIO_NCORE[27]"),
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

