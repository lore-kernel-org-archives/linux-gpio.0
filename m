From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support
Date: Thu,  7 May 2015 12:54:59 +0300
Message-ID: <1430992499-90406-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Intel Sunrisepoint-H is a desktop version of the PCH (Platform Controller
Hub). It has slightly different pin configuration compared to the LP
version. This patch adds support for Sunrisepoint-H to the existing
pinctrl-sunrisepoint.c driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 263 +++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 55d025dc89e8..1de9ae5010db 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -284,8 +284,271 @@ static const struct intel_pinctrl_soc_data sptlp_soc_data = {
 	.ncommunities = ARRAY_SIZE(sptlp_communities),
 };
 
+/* Sunrisepoint-H */
+static const struct pinctrl_pin_desc spth_pins[] = {
+	/* GPP_A */
+	PINCTRL_PIN(0, "RCINB"),
+	PINCTRL_PIN(1, "LAD_0"),
+	PINCTRL_PIN(2, "LAD_1"),
+	PINCTRL_PIN(3, "LAD_2"),
+	PINCTRL_PIN(4, "LAD_3"),
+	PINCTRL_PIN(5, "LFRAMEB"),
+	PINCTRL_PIN(6, "SERIQ"),
+	PINCTRL_PIN(7, "PIRQAB"),
+	PINCTRL_PIN(8, "CLKRUNB"),
+	PINCTRL_PIN(9, "CLKOUT_LPC_0"),
+	PINCTRL_PIN(10, "CLKOUT_LPC_1"),
+	PINCTRL_PIN(11, "PMEB"),
+	PINCTRL_PIN(12, "BM_BUSYB"),
+	PINCTRL_PIN(13, "SUSWARNB_SUS_PWRDNACK"),
+	PINCTRL_PIN(14, "SUS_STATB"),
+	PINCTRL_PIN(15, "SUSACKB"),
+	PINCTRL_PIN(16, "CLKOUT_48"),
+	PINCTRL_PIN(17, "ISH_GP_7"),
+	PINCTRL_PIN(18, "ISH_GP_0"),
+	PINCTRL_PIN(19, "ISH_GP_1"),
+	PINCTRL_PIN(20, "ISH_GP_2"),
+	PINCTRL_PIN(21, "ISH_GP_3"),
+	PINCTRL_PIN(22, "ISH_GP_4"),
+	PINCTRL_PIN(23, "ISH_GP_5"),
+	/* GPP_B */
+	PINCTRL_PIN(24, "CORE_VID_0"),
+	PINCTRL_PIN(25, "CORE_VID_1"),
+	PINCTRL_PIN(26, "VRALERTB"),
+	PINCTRL_PIN(27, "CPU_GP_2"),
+	PINCTRL_PIN(28, "CPU_GP_3"),
+	PINCTRL_PIN(29, "SRCCLKREQB_0"),
+	PINCTRL_PIN(30, "SRCCLKREQB_1"),
+	PINCTRL_PIN(31, "SRCCLKREQB_2"),
+	PINCTRL_PIN(32, "SRCCLKREQB_3"),
+	PINCTRL_PIN(33, "SRCCLKREQB_4"),
+	PINCTRL_PIN(34, "SRCCLKREQB_5"),
+	PINCTRL_PIN(35, "EXT_PWR_GATEB"),
+	PINCTRL_PIN(36, "SLP_S0B"),
+	PINCTRL_PIN(37, "PLTRSTB"),
+	PINCTRL_PIN(38, "SPKR"),
+	PINCTRL_PIN(39, "GSPI0_CSB"),
+	PINCTRL_PIN(40, "GSPI0_CLK"),
+	PINCTRL_PIN(41, "GSPI0_MISO"),
+	PINCTRL_PIN(42, "GSPI0_MOSI"),
+	PINCTRL_PIN(43, "GSPI1_CSB"),
+	PINCTRL_PIN(44, "GSPI1_CLK"),
+	PINCTRL_PIN(45, "GSPI1_MISO"),
+	PINCTRL_PIN(46, "GSPI1_MOSI"),
+	PINCTRL_PIN(47, "SML1ALERTB"),
+	/* GPP_C */
+	PINCTRL_PIN(48, "SMBCLK"),
+	PINCTRL_PIN(49, "SMBDATA"),
+	PINCTRL_PIN(50, "SMBALERTB"),
+	PINCTRL_PIN(51, "SML0CLK"),
+	PINCTRL_PIN(52, "SML0DATA"),
+	PINCTRL_PIN(53, "SML0ALERTB"),
+	PINCTRL_PIN(54, "SML1CLK"),
+	PINCTRL_PIN(55, "SML1DATA"),
+	PINCTRL_PIN(56, "UART0_RXD"),
+	PINCTRL_PIN(57, "UART0_TXD"),
+	PINCTRL_PIN(58, "UART0_RTSB"),
+	PINCTRL_PIN(59, "UART0_CTSB"),
+	PINCTRL_PIN(60, "UART1_RXD"),
+	PINCTRL_PIN(61, "UART1_TXD"),
+	PINCTRL_PIN(62, "UART1_RTSB"),
+	PINCTRL_PIN(63, "UART1_CTSB"),
+	PINCTRL_PIN(64, "I2C0_SDA"),
+	PINCTRL_PIN(65, "I2C0_SCL"),
+	PINCTRL_PIN(66, "I2C1_SDA"),
+	PINCTRL_PIN(67, "I2C1_SCL"),
+	PINCTRL_PIN(68, "UART2_RXD"),
+	PINCTRL_PIN(69, "UART2_TXD"),
+	PINCTRL_PIN(70, "UART2_RTSB"),
+	PINCTRL_PIN(71, "UART2_CTSB"),
+	/* GPP_D */
+	PINCTRL_PIN(72, "SPI1_CSB"),
+	PINCTRL_PIN(73, "SPI1_CLK"),
+	PINCTRL_PIN(74, "SPI1_MISO_IO_1"),
+	PINCTRL_PIN(75, "SPI1_MOSI_IO_0"),
+	PINCTRL_PIN(76, "ISH_I2C2_SDA"),
+	PINCTRL_PIN(77, "SSP0_SFRM"),
+	PINCTRL_PIN(78, "SSP0_TXD"),
+	PINCTRL_PIN(79, "SSP0_RXD"),
+	PINCTRL_PIN(80, "SSP0_SCLK"),
+	PINCTRL_PIN(81, "ISH_SPI_CSB"),
+	PINCTRL_PIN(82, "ISH_SPI_CLK"),
+	PINCTRL_PIN(83, "ISH_SPI_MISO"),
+	PINCTRL_PIN(84, "ISH_SPI_MOSI"),
+	PINCTRL_PIN(85, "ISH_UART0_RXD"),
+	PINCTRL_PIN(86, "ISH_UART0_TXD"),
+	PINCTRL_PIN(87, "ISH_UART0_RTSB"),
+	PINCTRL_PIN(88, "ISH_UART0_CTSB"),
+	PINCTRL_PIN(89, "DMIC_CLK_1"),
+	PINCTRL_PIN(90, "DMIC_DATA_1"),
+	PINCTRL_PIN(91, "DMIC_CLK_0"),
+	PINCTRL_PIN(92, "DMIC_DATA_0"),
+	PINCTRL_PIN(93, "SPI1_IO_2"),
+	PINCTRL_PIN(94, "SPI1_IO_3"),
+	PINCTRL_PIN(95, "ISH_I2C2_SCL"),
+	/* GPP_E */
+	PINCTRL_PIN(96, "SATAXPCIE_0"),
+	PINCTRL_PIN(97, "SATAXPCIE_1"),
+	PINCTRL_PIN(98, "SATAXPCIE_2"),
+	PINCTRL_PIN(99, "CPU_GP_0"),
+	PINCTRL_PIN(100, "SATA_DEVSLP_0"),
+	PINCTRL_PIN(101, "SATA_DEVSLP_1"),
+	PINCTRL_PIN(102, "SATA_DEVSLP_2"),
+	PINCTRL_PIN(103, "CPU_GP_1"),
+	PINCTRL_PIN(104, "SATA_LEDB"),
+	PINCTRL_PIN(105, "USB2_OCB_0"),
+	PINCTRL_PIN(106, "USB2_OCB_1"),
+	PINCTRL_PIN(107, "USB2_OCB_2"),
+	PINCTRL_PIN(108, "USB2_OCB_3"),
+	/* GPP_F */
+	PINCTRL_PIN(109, "SATAXPCIE_3"),
+	PINCTRL_PIN(110, "SATAXPCIE_4"),
+	PINCTRL_PIN(111, "SATAXPCIE_5"),
+	PINCTRL_PIN(112, "SATAXPCIE_6"),
+	PINCTRL_PIN(113, "SATAXPCIE_7"),
+	PINCTRL_PIN(114, "SATA_DEVSLP_3"),
+	PINCTRL_PIN(115, "SATA_DEVSLP_4"),
+	PINCTRL_PIN(116, "SATA_DEVSLP_5"),
+	PINCTRL_PIN(117, "SATA_DEVSLP_6"),
+	PINCTRL_PIN(118, "SATA_DEVSLP_7"),
+	PINCTRL_PIN(119, "SATA_SCLOCK"),
+	PINCTRL_PIN(120, "SATA_SLOAD"),
+	PINCTRL_PIN(121, "SATA_SDATAOUT1"),
+	PINCTRL_PIN(122, "SATA_SDATAOUT0"),
+	PINCTRL_PIN(123, "GPP_F_14"),
+	PINCTRL_PIN(124, "USB_OCB_4"),
+	PINCTRL_PIN(125, "USB_OCB_5"),
+	PINCTRL_PIN(126, "USB_OCB_6"),
+	PINCTRL_PIN(127, "USB_OCB_7"),
+	PINCTRL_PIN(128, "L_VDDEN"),
+	PINCTRL_PIN(129, "L_BKLTEN"),
+	PINCTRL_PIN(130, "L_BKLTCTL"),
+	PINCTRL_PIN(131, "GPP_F_22"),
+	PINCTRL_PIN(132, "GPP_F_23"),
+	/* GPP_G */
+	PINCTRL_PIN(133, "FAN_TACH_0"),
+	PINCTRL_PIN(134, "FAN_TACH_1"),
+	PINCTRL_PIN(135, "FAN_TACH_2"),
+	PINCTRL_PIN(136, "FAN_TACH_3"),
+	PINCTRL_PIN(137, "FAN_TACH_4"),
+	PINCTRL_PIN(138, "FAN_TACH_5"),
+	PINCTRL_PIN(139, "FAN_TACH_6"),
+	PINCTRL_PIN(140, "FAN_TACH_7"),
+	PINCTRL_PIN(141, "FAN_PWM_0"),
+	PINCTRL_PIN(142, "FAN_PWM_1"),
+	PINCTRL_PIN(143, "FAN_PWM_2"),
+	PINCTRL_PIN(144, "FAN_PWM_3"),
+	PINCTRL_PIN(145, "GSXDOUT"),
+	PINCTRL_PIN(146, "GSXSLOAD"),
+	PINCTRL_PIN(147, "GSXDIN"),
+	PINCTRL_PIN(148, "GSXRESETB"),
+	PINCTRL_PIN(149, "GSXCLK"),
+	PINCTRL_PIN(150, "ADR_COMPLETE"),
+	PINCTRL_PIN(151, "NMIB"),
+	PINCTRL_PIN(152, "SMIB"),
+	PINCTRL_PIN(153, "GPP_G_20"),
+	PINCTRL_PIN(154, "GPP_G_21"),
+	PINCTRL_PIN(155, "GPP_G_22"),
+	PINCTRL_PIN(156, "GPP_G_23"),
+	/* GPP_H */
+	PINCTRL_PIN(157, "SRCCLKREQB_6"),
+	PINCTRL_PIN(158, "SRCCLKREQB_7"),
+	PINCTRL_PIN(159, "SRCCLKREQB_8"),
+	PINCTRL_PIN(160, "SRCCLKREQB_9"),
+	PINCTRL_PIN(161, "SRCCLKREQB_10"),
+	PINCTRL_PIN(162, "SRCCLKREQB_11"),
+	PINCTRL_PIN(163, "SRCCLKREQB_12"),
+	PINCTRL_PIN(164, "SRCCLKREQB_13"),
+	PINCTRL_PIN(165, "SRCCLKREQB_14"),
+	PINCTRL_PIN(166, "SRCCLKREQB_15"),
+	PINCTRL_PIN(167, "SML2CLK"),
+	PINCTRL_PIN(168, "SML2DATA"),
+	PINCTRL_PIN(169, "SML2ALERTB"),
+	PINCTRL_PIN(170, "SML3CLK"),
+	PINCTRL_PIN(171, "SML3DATA"),
+	PINCTRL_PIN(172, "SML3ALERTB"),
+	PINCTRL_PIN(173, "SML4CLK"),
+	PINCTRL_PIN(174, "SML4DATA"),
+	PINCTRL_PIN(175, "SML4ALERTB"),
+	PINCTRL_PIN(176, "ISH_I2C0_SDA"),
+	PINCTRL_PIN(177, "ISH_I2C0_SCL"),
+	PINCTRL_PIN(178, "ISH_I2C1_SDA"),
+	PINCTRL_PIN(179, "ISH_I2C1_SCL"),
+	PINCTRL_PIN(180, "GPP_H_23"),
+	/* GPP_I */
+	PINCTRL_PIN(181, "DDSP_HDP_0"),
+	PINCTRL_PIN(182, "DDSP_HDP_1"),
+	PINCTRL_PIN(183, "DDSP_HDP_2"),
+	PINCTRL_PIN(184, "DDSP_HDP_3"),
+	PINCTRL_PIN(185, "EDP_HPD"),
+	PINCTRL_PIN(186, "DDPB_CTRLCLK"),
+	PINCTRL_PIN(187, "DDPB_CTRLDATA"),
+	PINCTRL_PIN(188, "DDPC_CTRLCLK"),
+	PINCTRL_PIN(189, "DDPC_CTRLDATA"),
+	PINCTRL_PIN(190, "DDPD_CTRLCLK"),
+	PINCTRL_PIN(191, "DDPD_CTRLDATA"),
+};
+
+static const unsigned spth_spi0_pins[] = { 39, 40, 41, 42 };
+static const unsigned spth_spi1_pins[] = { 43, 44, 45, 46 };
+static const unsigned spth_uart0_pins[] = { 56, 57, 58, 59 };
+static const unsigned spth_uart1_pins[] = { 60, 61, 62, 63 };
+static const unsigned spth_uart2_pins[] = { 68, 69, 71, 71 };
+static const unsigned spth_i2c0_pins[] = { 64, 65 };
+static const unsigned spth_i2c1_pins[] = { 66, 67 };
+static const unsigned spth_i2c2_pins[] = { 76, 95 };
+
+static const struct intel_pingroup spth_groups[] = {
+	PIN_GROUP("spi0_grp", spth_spi0_pins, 1),
+	PIN_GROUP("spi1_grp", spth_spi1_pins, 1),
+	PIN_GROUP("uart0_grp", spth_uart0_pins, 1),
+	PIN_GROUP("uart1_grp", spth_uart1_pins, 1),
+	PIN_GROUP("uart2_grp", spth_uart2_pins, 1),
+	PIN_GROUP("i2c0_grp", spth_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", spth_i2c1_pins, 1),
+	PIN_GROUP("i2c2_grp", spth_i2c2_pins, 2),
+};
+
+static const char * const spth_spi0_groups[] = { "spi0_grp" };
+static const char * const spth_spi1_groups[] = { "spi0_grp" };
+static const char * const spth_uart0_groups[] = { "uart0_grp" };
+static const char * const spth_uart1_groups[] = { "uart1_grp" };
+static const char * const spth_uart2_groups[] = { "uart2_grp" };
+static const char * const spth_i2c0_groups[] = { "i2c0_grp" };
+static const char * const spth_i2c1_groups[] = { "i2c1_grp" };
+static const char * const spth_i2c2_groups[] = { "i2c2_grp" };
+
+static const struct intel_function spth_functions[] = {
+	FUNCTION("spi0", spth_spi0_groups),
+	FUNCTION("spi1", spth_spi1_groups),
+	FUNCTION("uart0", spth_uart0_groups),
+	FUNCTION("uart1", spth_uart1_groups),
+	FUNCTION("uart2", spth_uart2_groups),
+	FUNCTION("i2c0", spth_i2c0_groups),
+	FUNCTION("i2c1", spth_i2c1_groups),
+	FUNCTION("i2c2", spth_i2c2_groups),
+};
+
+static const struct intel_community spth_communities[] = {
+	SPT_COMMUNITY(0, 0, 47),
+	SPT_COMMUNITY(1, 48, 180),
+	SPT_COMMUNITY(2, 181, 191),
+};
+
+static const struct intel_pinctrl_soc_data spth_soc_data = {
+	.pins = spth_pins,
+	.npins = ARRAY_SIZE(spth_pins),
+	.groups = spth_groups,
+	.ngroups = ARRAY_SIZE(spth_groups),
+	.functions = spth_functions,
+	.nfunctions = ARRAY_SIZE(spth_functions),
+	.communities = spth_communities,
+	.ncommunities = ARRAY_SIZE(spth_communities),
+};
+
 static const struct acpi_device_id spt_pinctrl_acpi_match[] = {
 	{ "INT344B", (kernel_ulong_t)&sptlp_soc_data },
+	{ "INT345D", (kernel_ulong_t)&spth_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, spt_pinctrl_acpi_match);
-- 
2.1.4
