Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332395;
	b=iJLmAWRaLW5/2a9U1l5r4biWbU3EtBspzNV5TYcbEB3aan2lcPGQHGaOCBAMQiEZcrHj
	 WYsd5i0MYnl179dYApwGRUQVE0xlGuU+HFl+rXzdBC5aCIP90KpN6cvuzFksKmeLmZKYO
	 ATpoyK54xyvXe3V9Y8asx9btbklkUDs7Wx9EvareKMyYItXsmMvdgnpuufVdXkgHnGMEN
	 U1+bs/I9rW+XPfAHD7iYZI4igCPQAyAxyuIOQt8nVKbUFSh1JK74DpBCKURHBrjjWCrFb
	 43/lrdioZ9iyx0bjPmf6coaMurbmsri6I2GJx308sDTqkXazKIeZAqamdVBFcn2Ck5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332395;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8dvpHXUBkAadUYWgCgllKyAssW/EVsBX1pVxRqdyCzU=;
	b=WL0tx2DfPOrBk4vVLprPdCn/JDTZMnTJavgsS4MKsD6jAxKhMOIsPEieW1urbJLM88C0
	 9Yu55S54re2vaxBSLhfSyYik8wxse9WMxveGTVE8eYazSjzCARroFWu3wnf/+exBXY0mh
	 IJtc7ng20jaLxLezWqwtVCoDcDwJfadYG+jBd35XqrjH6DywaGLVlkg1nS2QrRGm/ayZj
	 /wRBHAxCUOWbUh5bBe1ZpYx8W0PTCTuPmjHv4Pl2zb46e8ZDf7ZxmgvdFe/DA1Sew34Ba
	 6m8Nt4WPEPnv2aBQ1XCXUXUjdcJ+XpsIo4Ye38/7epL3e+tLoNlGek7I076TntJpDiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A00606A33D;
	Tue, 10 Nov 2026 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A00606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpp0-001CWh-2X;
	Tue, 10 Nov 2026 18:39:50 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 7/7] pinctrl: airoha: add support of an7589 SoC
Date: Tue, 10 Nov 2026 18:39:41 +0100
Message-Id: <20261110173941.301478-8-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pin controller support for the Airoha AN7589. Its GPIO block is
the EN7581 one with a third bank, giving 74 GPIOs. Pin functions are
selected through a separate IOMUX block holding a 4 bit mode per pin,
where mode 0 is GPIO.

As on the EN7581, the pwm function is available on GPIO0 to GPIO15
through the GPIO flash mode register.

Unlike on the other SoCs, the pull and drive registers of the AN7589
are not known, so no pull or drive configuration is provided.

Signed-off-by: John Crispin <john@phrozen.org>
---
 MAINTAINERS                             |   1 +
 drivers/pinctrl/airoha/Kconfig          |  11 +
 drivers/pinctrl/airoha/Makefile         |   1 +
 drivers/pinctrl/airoha/pinctrl-an7589.c | 721 ++++++++++++++++++++++++
 4 files changed, 734 insertions(+)
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7589.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2041a8aed28f..159a8818e1ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22141,6 +22141,7 @@ F:	Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 F:	drivers/pinctrl/airoha/pinctrl-airoha.c
+F:	drivers/pinctrl/airoha/pinctrl-an7589.c
 
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
index 0f0986c81219..1948101ae5ac 100644
--- a/drivers/pinctrl/airoha/Kconfig
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -16,6 +16,7 @@ config PINCTRL_AIROHA
 	imply PINCTRL_AIROHA_AN7563
 	imply PINCTRL_AIROHA_AN7581
 	imply PINCTRL_AIROHA_AN7583
+	imply PINCTRL_AIROHA_AN7589
 	imply PINCTRL_AIROHA_EN7523
 	imply PINCTRL_AIROHA_EN7528
 	help
@@ -46,6 +47,16 @@ config PINCTRL_AIROHA_AN7583
 	  Say yes here to support pin controller and gpio driver
 	  on Airoha AN7583, AN7553, AN7567 and other compatible SoCs.
 
+config PINCTRL_AIROHA_AN7589
+	tristate "AN7589 pinctrl"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_AIROHA
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on Airoha AN7589 and other compatible SoCs. The AN7589
+	  selects pin functions through its IOMUX block and has
+	  74 GPIOs in three banks.
+
 config PINCTRL_AIROHA_EN7523
 	tristate "EN7523 pinctrl"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
index 4dc7c556ce4d..550803cbd5b6 100644
--- a/drivers/pinctrl/airoha/Makefile
+++ b/drivers/pinctrl/airoha/Makefile
@@ -7,5 +7,6 @@ obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 obj-$(CONFIG_PINCTRL_AIROHA_AN7563)	+= pinctrl-an7563.o
 obj-$(CONFIG_PINCTRL_AIROHA_AN7581)	+= pinctrl-an7581.o
 obj-$(CONFIG_PINCTRL_AIROHA_AN7583)	+= pinctrl-an7583.o
+obj-$(CONFIG_PINCTRL_AIROHA_AN7589)	+= pinctrl-an7589.o
 obj-$(CONFIG_PINCTRL_AIROHA_EN7523)	+= pinctrl-en7523.o
 obj-$(CONFIG_PINCTRL_AIROHA_EN7528)	+= pinctrl-en7528.o
diff --git a/drivers/pinctrl/airoha/pinctrl-an7589.c b/drivers/pinctrl/airoha/pinctrl-an7589.c
new file mode 100644
index 000000000000..39654a9a94e4
--- /dev/null
+++ b/drivers/pinctrl/airoha/pinctrl-an7589.c
@@ -0,0 +1,721 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: John Crispin <john@phrozen.org>
+ *
+ * AN7589 SoC pinctrl data for the Airoha pinctrl driver (pinctrl-airoha.c).
+ *
+ * The GPIO controller at 0x1fbf0200 is the EN7581 one with a third bank
+ * for GPIO64-GPIO79. Pin functions are selected through the IOMUX block
+ * at 0x1fa30000, one 4 bit mode field per pin. Mode 0 is GPIO on every
+ * pin, so pins 0-73 map to GPIO0-GPIO73 and carry no dedicated pads.
+ */
+
+#include "airoha-common.h"
+
+#define AN7589_NUM_PINS				74
+
+#define REG_GPIO_CTRL4				0x00c0
+#define REG_GPIO_DATA2				0x00c4
+#define REG_GPIO_OE2				0x00c8
+#define REG_GPIO_INT2				0x00cc
+#define REG_GPIO_INT_EDGE4			0x00d0
+#define REG_GPIO_INT_LEVEL4			0x00d4
+
+#define REG_GPIO_FLASH_MODE_CFG			0x0034
+#define   GPIO_FLASH_MODE_CFG(n)		BIT(n)
+
+#define AN7589_IOMUX_MODE_BITS			4
+#define AN7589_IOMUX_MODE_GPIO			0
+
+static const struct airoha_pinctrl_iomux iomux_info = {
+	.mode_bits = AN7589_IOMUX_MODE_BITS,
+	.gpio_mode = AN7589_IOMUX_MODE_GPIO,
+};
+
+static const u32 gpio_data_regs[] = {
+	REG_GPIO_DATA,
+	REG_GPIO_DATA1,
+	REG_GPIO_DATA2
+};
+
+static const u32 gpio_out_regs[] = {
+	REG_GPIO_OE,
+	REG_GPIO_OE1,
+	REG_GPIO_OE2
+};
+
+static const u32 gpio_dir_regs[] = {
+	REG_GPIO_CTRL,
+	REG_GPIO_CTRL1,
+	REG_GPIO_CTRL2,
+	REG_GPIO_CTRL3,
+	REG_GPIO_CTRL4
+};
+
+static const u32 irq_status_regs[] = {
+	REG_GPIO_INT,
+	REG_GPIO_INT1,
+	REG_GPIO_INT2
+};
+
+static const u32 irq_level_regs[] = {
+	REG_GPIO_INT_LEVEL,
+	REG_GPIO_INT_LEVEL1,
+	REG_GPIO_INT_LEVEL2,
+	REG_GPIO_INT_LEVEL3,
+	REG_GPIO_INT_LEVEL4
+};
+
+static const u32 irq_edge_regs[] = {
+	REG_GPIO_INT_EDGE,
+	REG_GPIO_INT_EDGE1,
+	REG_GPIO_INT_EDGE2,
+	REG_GPIO_INT_EDGE3,
+	REG_GPIO_INT_EDGE4
+};
+
+static const struct airoha_gpiochip_regs gpiochip_regs = {
+	.ngpio = AN7589_NUM_PINS,
+	.data = gpio_data_regs,
+	.dir = gpio_dir_regs,
+	.out = gpio_out_regs,
+	.status = irq_status_regs,
+	.level = irq_level_regs,
+	.edge = irq_edge_regs,
+};
+
+static const struct pinctrl_pin_desc pinctrl_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+	PINCTRL_PIN(32, "gpio32"),
+	PINCTRL_PIN(33, "gpio33"),
+	PINCTRL_PIN(34, "gpio34"),
+	PINCTRL_PIN(35, "gpio35"),
+	PINCTRL_PIN(36, "gpio36"),
+	PINCTRL_PIN(37, "gpio37"),
+	PINCTRL_PIN(38, "gpio38"),
+	PINCTRL_PIN(39, "gpio39"),
+	PINCTRL_PIN(40, "gpio40"),
+	PINCTRL_PIN(41, "gpio41"),
+	PINCTRL_PIN(42, "gpio42"),
+	PINCTRL_PIN(43, "gpio43"),
+	PINCTRL_PIN(44, "gpio44"),
+	PINCTRL_PIN(45, "gpio45"),
+	PINCTRL_PIN(46, "gpio46"),
+	PINCTRL_PIN(47, "gpio47"),
+	PINCTRL_PIN(48, "gpio48"),
+	PINCTRL_PIN(49, "gpio49"),
+	PINCTRL_PIN(50, "gpio50"),
+	PINCTRL_PIN(51, "gpio51"),
+	PINCTRL_PIN(52, "gpio52"),
+	PINCTRL_PIN(53, "gpio53"),
+	PINCTRL_PIN(54, "gpio54"),
+	PINCTRL_PIN(55, "gpio55"),
+	PINCTRL_PIN(56, "gpio56"),
+	PINCTRL_PIN(57, "gpio57"),
+	PINCTRL_PIN(58, "gpio58"),
+	PINCTRL_PIN(59, "gpio59"),
+	PINCTRL_PIN(60, "gpio60"),
+	PINCTRL_PIN(61, "gpio61"),
+	PINCTRL_PIN(62, "gpio62"),
+	PINCTRL_PIN(63, "gpio63"),
+	PINCTRL_PIN(64, "gpio64"),
+	PINCTRL_PIN(65, "gpio65"),
+	PINCTRL_PIN(66, "gpio66"),
+	PINCTRL_PIN(67, "gpio67"),
+	PINCTRL_PIN(68, "gpio68"),
+	PINCTRL_PIN(69, "gpio69"),
+	PINCTRL_PIN(70, "gpio70"),
+	PINCTRL_PIN(71, "gpio71"),
+	PINCTRL_PIN(72, "gpio72"),
+	PINCTRL_PIN(73, "gpio73"),
+};
+
+static const int uart1_pins[] = { 55, 56 };
+static const u8 uart1_modes[] = { 1, 1 };
+static const int uart2_pins[] = { 13, 14 };
+static const u8 uart2_modes[] = { 4, 4 };
+static const int uart3_pins[] = { 25, 26 };
+static const u8 uart3_modes[] = { 4, 4 };
+static const int uart3_alt_pins[] = { 33 };
+static const u8 uart3_alt_modes[] = { 4 };
+static const int uart4_pins[] = { 41, 42 };
+static const u8 uart4_modes[] = { 4, 4 };
+static const int uart5_pins[] = { 25, 26 };
+static const u8 uart5_modes[] = { 5, 5 };
+static const int uart5_alt_pins[] = { 41, 42 };
+static const u8 uart5_alt_modes[] = { 5, 5 };
+static const int uart5_full_pins[] = { 51, 52, 27, 28 };
+static const u8 uart5_full_modes[] = { 5, 5, 5, 5 };
+static const int uart6_pins[] = { 13, 14 };
+static const u8 uart6_modes[] = { 5, 5 };
+static const int uart6_full_pins[] = { 13, 14, 15, 16 };
+static const u8 uart6_full_modes[] = { 5, 5, 5, 5 };
+static const int i2c0_pins[] = { 57, 58 };
+static const u8 i2c0_modes[] = { 1, 1 };
+static const int i2c1_pins[] = { 35, 36 };
+static const u8 i2c1_modes[] = { 4, 4 };
+static const int i2c2_pins[] = { 51, 52 };
+static const u8 i2c2_modes[] = { 4, 4 };
+static const int i2c3_pins[] = { 5, 7 };
+static const u8 i2c3_modes[] = { 5, 5 };
+static const int i2c4_pins[] = { 59, 60 };
+static const u8 i2c4_modes[] = { 4, 4 };
+static const int spi0_pins[] = { 61, 62, 63, 64 };
+static const u8 spi0_modes[] = { 1, 1, 1, 1 };
+static const int ext_spi0_full_pins[] = { 61, 62, 63, 64, 21, 22, 23 };
+static const u8 ext_spi0_full_modes[] = { 1, 1, 1, 1, 1, 2, 2 };
+static const int ext_spi1_pins[] = { 5, 6, 7, 48 };
+static const u8 ext_spi1_modes[] = { 1, 1, 1, 1 };
+static const int ext_spi1_full_pins[] = { 5, 6, 7, 48, 18, 3 };
+static const u8 ext_spi1_full_modes[] = { 1, 1, 1, 1, 1, 1 };
+static const int ext_spi2_pins[] = { 30, 31, 32, 33 };
+static const u8 ext_spi2_modes[] = { 1, 1, 1, 1 };
+static const int ext_spi2_full_pins[] = { 30, 31, 32, 33, 27, 28 };
+static const u8 ext_spi2_full_modes[] = { 1, 1, 1, 1, 1, 1 };
+static const int ext_spi3_pins[] = { 44, 34, 46, 45 };
+static const u8 ext_spi3_modes[] = { 1, 1, 1, 1 };
+static const int ext_spi3_full_pins[] = { 44, 34, 46, 45, 29, 43 };
+static const u8 ext_spi3_full_modes[] = { 1, 1, 1, 1, 1, 1 };
+static const int pcm1_pins[] = { 9, 10, 11, 12 };
+static const u8 pcm1_modes[] = { 3, 3, 3, 3 };
+static const int pcm2_pins[] = { 5, 6, 7, 48 };
+static const u8 pcm2_modes[] = { 3, 3, 3, 3 };
+static const int pcm_spi_pins[] = { 5, 6, 7, 48 };
+static const u8 pcm_spi_modes[] = { 2, 2, 2, 2 };
+static const int pcm_spi_cs_pins[] = { 13, 14, 15, 16 };
+static const u8 pcm_spi_cs_modes[] = { 2, 2, 2, 2 };
+static const int pcm_ctrl_pins[] = { 3, 4 };
+static const u8 pcm_ctrl_modes[] = { 2, 2 };
+static const int i2s_pins[] = { 13, 14, 15, 16 };
+static const u8 i2s_modes[] = { 3, 3, 3, 3 };
+static const int mdio0_pins[] = { 59, 60 };
+static const u8 mdio0_modes[] = { 1, 1 };
+static const int mdio1_pins[] = { 5, 7 };
+static const u8 mdio1_modes[] = { 7, 7 };
+static const int mdio2_pins[] = { 51, 52 };
+static const u8 mdio2_modes[] = { 2, 2 };
+static const int mdcs_pins[] = { 5 };
+static const u8 mdcs_modes[] = { 4 };
+static const int mdios_pins[] = { 7 };
+static const u8 mdios_modes[] = { 4 };
+static const int emmc_pins[] = { 17, 18, 19, 20, 21, 22, 23, 24,
+				 61, 62, 63, 64 };
+static const u8 emmc_modes[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };
+static const int pcie0_rst_pins[] = { 65 };
+static const u8 pcie0_rst_modes[] = { 1 };
+static const int pcie1_rst_pins[] = { 66 };
+static const u8 pcie1_rst_modes[] = { 1 };
+static const int pcie2_rst_pins[] = { 67 };
+static const u8 pcie2_rst_modes[] = { 1 };
+static const int pcie0_clkreq_pins[] = { 68 };
+static const u8 pcie0_clkreq_modes[] = { 1 };
+static const int pcie1_clkreq_pins[] = { 69 };
+static const u8 pcie1_clkreq_modes[] = { 1 };
+static const int pcie2_clkreq_pins[] = { 70 };
+static const u8 pcie2_clkreq_modes[] = { 1 };
+static const int pcie0_wake_pins[] = { 71 };
+static const u8 pcie0_wake_modes[] = { 1 };
+static const int pcie1_wake_pins[] = { 72 };
+static const u8 pcie1_wake_modes[] = { 1 };
+static const int pcie2_wake_pins[] = { 73 };
+static const u8 pcie2_wake_modes[] = { 1 };
+static const int pon1_pins[] = { 41, 42, 45, 46 };
+static const u8 pon1_modes[] = { 2, 2, 2, 2 };
+static const int pon2_pins[] = { 34, 37, 39 };
+static const u8 pon2_modes[] = { 2, 2, 2 };
+static const int sgpio0_pins[] = { 49, 50, 51 };
+static const u8 sgpio0_modes[] = { 5, 5, 5 };
+static const int sgpio1_pins[] = { 3, 4, 6 };
+static const u8 sgpio1_modes[] = { 5, 5, 5 };
+static const int watchdog_pins[] = { 40 };
+static const u8 watchdog_modes[] = { 3 };
+static const int shiftmux_spi_pins[] = { 61, 62, 63 };
+static const u8 shiftmux_spi_modes[] = { 2, 2, 2 };
+static const int tod_pins[] = { 31 };
+static const u8 tod_modes[] = { 4 };
+static const int sync_e_pins[] = { 28 };
+static const u8 sync_e_modes[] = { 2 };
+static const int cpu_jtag_pins[] = { 3, 13, 14, 15, 16 };
+static const u8 cpu_jtag_modes[] = { 9, 9, 9, 9, 9 };
+static const int cpu_jtag_alt_pins[] = { 41, 42, 43, 44, 45 };
+static const u8 cpu_jtag_alt_modes[] = { 8, 8, 8, 8, 8 };
+static const int npu_jtag_pins[] = { 3, 13, 14, 15, 16 };
+static const u8 npu_jtag_modes[] = { 8, 8, 8, 8, 8 };
+static const int ibex_jtag_pins[] = { 67, 69, 70, 72, 73 };
+static const u8 ibex_jtag_modes[] = { 8, 8, 8, 8, 8 };
+static const int pma50eth_jtag_pins[] = { 30, 31, 32, 33, 38 };
+static const u8 pma50eth_jtag_modes[] = { 8, 8, 8, 8, 8 };
+static const int ainpu_jtag_pins[] = { 30, 31, 32, 33, 38 };
+static const u8 ainpu_jtag_modes[] = { 9, 9, 9, 9, 9 };
+static const int pma50pon_jtag_pins[] = { 41, 42, 43, 44, 45 };
+static const u8 pma50pon_jtag_modes[] = { 9, 9, 9, 9, 9 };
+static const int gpio0_pins[] = { 0 };
+static const int gpio1_pins[] = { 1 };
+static const int gpio2_pins[] = { 2 };
+static const int gpio3_pins[] = { 3 };
+static const int gpio4_pins[] = { 4 };
+static const int gpio5_pins[] = { 5 };
+static const int gpio6_pins[] = { 6 };
+static const int gpio7_pins[] = { 7 };
+static const int gpio8_pins[] = { 8 };
+static const int gpio9_pins[] = { 9 };
+static const int gpio10_pins[] = { 10 };
+static const int gpio11_pins[] = { 11 };
+static const int gpio12_pins[] = { 12 };
+static const int gpio13_pins[] = { 13 };
+static const int gpio14_pins[] = { 14 };
+static const int gpio15_pins[] = { 15 };
+static const u8 pwm_modes[] = { AN7589_IOMUX_MODE_GPIO };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("uart1", uart1),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("uart3", uart3),
+	PINCTRL_PIN_GROUP("uart3_alt", uart3_alt),
+	PINCTRL_PIN_GROUP("uart4", uart4),
+	PINCTRL_PIN_GROUP("uart5", uart5),
+	PINCTRL_PIN_GROUP("uart5_alt", uart5_alt),
+	PINCTRL_PIN_GROUP("uart5_full", uart5_full),
+	PINCTRL_PIN_GROUP("uart6", uart6),
+	PINCTRL_PIN_GROUP("uart6_full", uart6_full),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("i2c2", i2c2),
+	PINCTRL_PIN_GROUP("i2c3", i2c3),
+	PINCTRL_PIN_GROUP("i2c4", i2c4),
+	PINCTRL_PIN_GROUP("spi0", spi0),
+	PINCTRL_PIN_GROUP("ext_spi0_full", ext_spi0_full),
+	PINCTRL_PIN_GROUP("ext_spi1", ext_spi1),
+	PINCTRL_PIN_GROUP("ext_spi1_full", ext_spi1_full),
+	PINCTRL_PIN_GROUP("ext_spi2", ext_spi2),
+	PINCTRL_PIN_GROUP("ext_spi2_full", ext_spi2_full),
+	PINCTRL_PIN_GROUP("ext_spi3", ext_spi3),
+	PINCTRL_PIN_GROUP("ext_spi3_full", ext_spi3_full),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_cs", pcm_spi_cs),
+	PINCTRL_PIN_GROUP("pcm_ctrl", pcm_ctrl),
+	PINCTRL_PIN_GROUP("i2s", i2s),
+	PINCTRL_PIN_GROUP("mdio0", mdio0),
+	PINCTRL_PIN_GROUP("mdio1", mdio1),
+	PINCTRL_PIN_GROUP("mdio2", mdio2),
+	PINCTRL_PIN_GROUP("mdcs", mdcs),
+	PINCTRL_PIN_GROUP("mdios", mdios),
+	PINCTRL_PIN_GROUP("emmc", emmc),
+	PINCTRL_PIN_GROUP("pcie0_rst", pcie0_rst),
+	PINCTRL_PIN_GROUP("pcie1_rst", pcie1_rst),
+	PINCTRL_PIN_GROUP("pcie2_rst", pcie2_rst),
+	PINCTRL_PIN_GROUP("pcie0_clkreq", pcie0_clkreq),
+	PINCTRL_PIN_GROUP("pcie1_clkreq", pcie1_clkreq),
+	PINCTRL_PIN_GROUP("pcie2_clkreq", pcie2_clkreq),
+	PINCTRL_PIN_GROUP("pcie0_wake", pcie0_wake),
+	PINCTRL_PIN_GROUP("pcie1_wake", pcie1_wake),
+	PINCTRL_PIN_GROUP("pcie2_wake", pcie2_wake),
+	PINCTRL_PIN_GROUP("pon1", pon1),
+	PINCTRL_PIN_GROUP("pon2", pon2),
+	PINCTRL_PIN_GROUP("sgpio0", sgpio0),
+	PINCTRL_PIN_GROUP("sgpio1", sgpio1),
+	PINCTRL_PIN_GROUP("watchdog", watchdog),
+	PINCTRL_PIN_GROUP("shiftmux_spi", shiftmux_spi),
+	PINCTRL_PIN_GROUP("tod", tod),
+	PINCTRL_PIN_GROUP("sync_e", sync_e),
+	PINCTRL_PIN_GROUP("cpu_jtag", cpu_jtag),
+	PINCTRL_PIN_GROUP("cpu_jtag_alt", cpu_jtag_alt),
+	PINCTRL_PIN_GROUP("npu_jtag", npu_jtag),
+	PINCTRL_PIN_GROUP("ibex_jtag", ibex_jtag),
+	PINCTRL_PIN_GROUP("pma50eth_jtag", pma50eth_jtag),
+	PINCTRL_PIN_GROUP("ainpu_jtag", ainpu_jtag),
+	PINCTRL_PIN_GROUP("pma50pon_jtag", pma50pon_jtag),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+};
+
+static const char *const uart1_groups[] = { "uart1" };
+static const char *const uart2_groups[] = { "uart2" };
+static const char *const uart3_groups[] = { "uart3", "uart3_alt" };
+static const char *const uart4_groups[] = { "uart4" };
+static const char *const uart5_groups[] = { "uart5", "uart5_alt", "uart5_full" };
+static const char *const uart6_groups[] = { "uart6", "uart6_full" };
+static const char *const i2c0_groups[] = { "i2c0" };
+static const char *const i2c1_groups[] = { "i2c1" };
+static const char *const i2c2_groups[] = { "i2c2" };
+static const char *const i2c3_groups[] = { "i2c3" };
+static const char *const i2c4_groups[] = { "i2c4" };
+static const char *const spi_groups[] = { "spi0", "ext_spi0_full" };
+static const char *const ext_spi1_groups[] = { "ext_spi1", "ext_spi1_full" };
+static const char *const ext_spi2_groups[] = { "ext_spi2", "ext_spi2_full" };
+static const char *const ext_spi3_groups[] = { "ext_spi3", "ext_spi3_full" };
+static const char *const pcm1_groups[] = { "pcm1" };
+static const char *const pcm2_groups[] = { "pcm2" };
+static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_cs", "pcm_ctrl" };
+static const char *const i2s_groups[] = { "i2s" };
+static const char *const mdio0_groups[] = { "mdio0" };
+static const char *const mdio1_groups[] = { "mdio1" };
+static const char *const mdio2_groups[] = { "mdio2" };
+static const char *const mdcs_groups[] = { "mdcs" };
+static const char *const mdios_groups[] = { "mdios" };
+static const char *const emmc_groups[] = { "emmc" };
+static const char *const pcie0_groups[] = { "pcie0_rst", "pcie0_clkreq", "pcie0_wake" };
+static const char *const pcie1_groups[] = { "pcie1_rst", "pcie1_clkreq", "pcie1_wake" };
+static const char *const pcie2_groups[] = { "pcie2_rst", "pcie2_clkreq", "pcie2_wake" };
+static const char *const pon1_groups[] = { "pon1" };
+static const char *const pon2_groups[] = { "pon2" };
+static const char *const sgpio0_groups[] = { "sgpio0" };
+static const char *const sgpio1_groups[] = { "sgpio1" };
+static const char *const watchdog_groups[] = { "watchdog" };
+static const char *const shiftmux_spi_groups[] = { "shiftmux_spi" };
+static const char *const tod_groups[] = { "tod" };
+static const char *const sync_e_groups[] = { "sync_e" };
+static const char *const cpu_jtag_groups[] = { "cpu_jtag", "cpu_jtag_alt" };
+static const char *const npu_jtag_groups[] = { "npu_jtag" };
+static const char *const ibex_jtag_groups[] = { "ibex_jtag" };
+static const char *const pma50eth_jtag_groups[] = { "pma50eth_jtag" };
+static const char *const ainpu_jtag_groups[] = { "ainpu_jtag" };
+static const char *const pma50pon_jtag_groups[] = { "pma50pon_jtag" };
+static const char *const pwm_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6",
+	"gpio7", "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13",
+	"gpio14", "gpio15",
+};
+
+static const struct airoha_pinctrl_func_group uart1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart1", uart1),
+};
+
+static const struct airoha_pinctrl_func_group uart2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart2", uart2),
+};
+
+static const struct airoha_pinctrl_func_group uart3_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart3", uart3),
+	PINCTRL_MODE_FUNC_GROUP("uart3_alt", uart3_alt),
+};
+
+static const struct airoha_pinctrl_func_group uart4_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart4", uart4),
+};
+
+static const struct airoha_pinctrl_func_group uart5_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart5", uart5),
+	PINCTRL_MODE_FUNC_GROUP("uart5_alt", uart5_alt),
+	PINCTRL_MODE_FUNC_GROUP("uart5_full", uart5_full),
+};
+
+static const struct airoha_pinctrl_func_group uart6_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("uart6", uart6),
+	PINCTRL_MODE_FUNC_GROUP("uart6_full", uart6_full),
+};
+
+static const struct airoha_pinctrl_func_group i2c0_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2c0", i2c0),
+};
+
+static const struct airoha_pinctrl_func_group i2c1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2c1", i2c1),
+};
+
+static const struct airoha_pinctrl_func_group i2c2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2c2", i2c2),
+};
+
+static const struct airoha_pinctrl_func_group i2c3_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2c3", i2c3),
+};
+
+static const struct airoha_pinctrl_func_group i2c4_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2c4", i2c4),
+};
+
+static const struct airoha_pinctrl_func_group spi_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("spi0", spi0),
+	PINCTRL_MODE_FUNC_GROUP("ext_spi0_full", ext_spi0_full),
+};
+
+static const struct airoha_pinctrl_func_group ext_spi1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("ext_spi1", ext_spi1),
+	PINCTRL_MODE_FUNC_GROUP("ext_spi1_full", ext_spi1_full),
+};
+
+static const struct airoha_pinctrl_func_group ext_spi2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("ext_spi2", ext_spi2),
+	PINCTRL_MODE_FUNC_GROUP("ext_spi2_full", ext_spi2_full),
+};
+
+static const struct airoha_pinctrl_func_group ext_spi3_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("ext_spi3", ext_spi3),
+	PINCTRL_MODE_FUNC_GROUP("ext_spi3_full", ext_spi3_full),
+};
+
+static const struct airoha_pinctrl_func_group pcm1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcm1", pcm1),
+};
+
+static const struct airoha_pinctrl_func_group pcm2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcm2", pcm2),
+};
+
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_MODE_FUNC_GROUP("pcm_spi_cs", pcm_spi_cs),
+	PINCTRL_MODE_FUNC_GROUP("pcm_ctrl", pcm_ctrl),
+};
+
+static const struct airoha_pinctrl_func_group i2s_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("i2s", i2s),
+};
+
+static const struct airoha_pinctrl_func_group mdio0_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("mdio0", mdio0),
+};
+
+static const struct airoha_pinctrl_func_group mdio1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("mdio1", mdio1),
+};
+
+static const struct airoha_pinctrl_func_group mdio2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("mdio2", mdio2),
+};
+
+static const struct airoha_pinctrl_func_group mdcs_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("mdcs", mdcs),
+};
+
+static const struct airoha_pinctrl_func_group mdios_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("mdios", mdios),
+};
+
+static const struct airoha_pinctrl_func_group emmc_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("emmc", emmc),
+};
+
+static const struct airoha_pinctrl_func_group pcie0_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcie0_rst", pcie0_rst),
+	PINCTRL_MODE_FUNC_GROUP("pcie0_clkreq", pcie0_clkreq),
+	PINCTRL_MODE_FUNC_GROUP("pcie0_wake", pcie0_wake),
+};
+
+static const struct airoha_pinctrl_func_group pcie1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcie1_rst", pcie1_rst),
+	PINCTRL_MODE_FUNC_GROUP("pcie1_clkreq", pcie1_clkreq),
+	PINCTRL_MODE_FUNC_GROUP("pcie1_wake", pcie1_wake),
+};
+
+static const struct airoha_pinctrl_func_group pcie2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pcie2_rst", pcie2_rst),
+	PINCTRL_MODE_FUNC_GROUP("pcie2_clkreq", pcie2_clkreq),
+	PINCTRL_MODE_FUNC_GROUP("pcie2_wake", pcie2_wake),
+};
+
+static const struct airoha_pinctrl_func_group pon1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pon1", pon1),
+};
+
+static const struct airoha_pinctrl_func_group pon2_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pon2", pon2),
+};
+
+static const struct airoha_pinctrl_func_group sgpio0_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("sgpio0", sgpio0),
+};
+
+static const struct airoha_pinctrl_func_group sgpio1_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("sgpio1", sgpio1),
+};
+
+static const struct airoha_pinctrl_func_group watchdog_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("watchdog", watchdog),
+};
+
+static const struct airoha_pinctrl_func_group shiftmux_spi_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("shiftmux_spi", shiftmux_spi),
+};
+
+static const struct airoha_pinctrl_func_group tod_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("tod", tod),
+};
+
+static const struct airoha_pinctrl_func_group sync_e_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("sync_e", sync_e),
+};
+
+static const struct airoha_pinctrl_func_group cpu_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("cpu_jtag", cpu_jtag),
+	PINCTRL_MODE_FUNC_GROUP("cpu_jtag_alt", cpu_jtag_alt),
+};
+
+static const struct airoha_pinctrl_func_group npu_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("npu_jtag", npu_jtag),
+};
+
+static const struct airoha_pinctrl_func_group ibex_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("ibex_jtag", ibex_jtag),
+};
+
+static const struct airoha_pinctrl_func_group pma50eth_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pma50eth_jtag", pma50eth_jtag),
+};
+
+static const struct airoha_pinctrl_func_group ainpu_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("ainpu_jtag", ainpu_jtag),
+};
+
+static const struct airoha_pinctrl_func_group pma50pon_jtag_func_group[] = {
+	PINCTRL_MODE_FUNC_GROUP("pma50pon_jtag", pma50pon_jtag),
+};
+
+#define AN7589_PINCTRL_PWM(gpio, n)				\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_MUX,			\
+			REG_GPIO_FLASH_MODE_CFG,		\
+			GPIO_FLASH_MODE_CFG(n),			\
+			GPIO_FLASH_MODE_CFG(n)			\
+		},						\
+		.regmap_size = 1,				\
+		.pin_modes = pwm_modes,				\
+	}
+
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
+	AN7589_PINCTRL_PWM("gpio0", 0),
+	AN7589_PINCTRL_PWM("gpio1", 1),
+	AN7589_PINCTRL_PWM("gpio2", 2),
+	AN7589_PINCTRL_PWM("gpio3", 3),
+	AN7589_PINCTRL_PWM("gpio4", 4),
+	AN7589_PINCTRL_PWM("gpio5", 5),
+	AN7589_PINCTRL_PWM("gpio6", 6),
+	AN7589_PINCTRL_PWM("gpio7", 7),
+	AN7589_PINCTRL_PWM("gpio8", 8),
+	AN7589_PINCTRL_PWM("gpio9", 9),
+	AN7589_PINCTRL_PWM("gpio10", 10),
+	AN7589_PINCTRL_PWM("gpio11", 11),
+	AN7589_PINCTRL_PWM("gpio12", 12),
+	AN7589_PINCTRL_PWM("gpio13", 13),
+	AN7589_PINCTRL_PWM("gpio14", 14),
+	AN7589_PINCTRL_PWM("gpio15", 15),
+};
+
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("uart1", uart1),
+	PINCTRL_FUNC_DESC("uart2", uart2),
+	PINCTRL_FUNC_DESC("uart3", uart3),
+	PINCTRL_FUNC_DESC("uart4", uart4),
+	PINCTRL_FUNC_DESC("uart5", uart5),
+	PINCTRL_FUNC_DESC("uart6", uart6),
+	PINCTRL_FUNC_DESC("i2c0", i2c0),
+	PINCTRL_FUNC_DESC("i2c1", i2c1),
+	PINCTRL_FUNC_DESC("i2c2", i2c2),
+	PINCTRL_FUNC_DESC("i2c3", i2c3),
+	PINCTRL_FUNC_DESC("i2c4", i2c4),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("ext_spi1", ext_spi1),
+	PINCTRL_FUNC_DESC("ext_spi2", ext_spi2),
+	PINCTRL_FUNC_DESC("ext_spi3", ext_spi3),
+	PINCTRL_FUNC_DESC("pcm1", pcm1),
+	PINCTRL_FUNC_DESC("pcm2", pcm2),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("mdio0", mdio0),
+	PINCTRL_FUNC_DESC("mdio1", mdio1),
+	PINCTRL_FUNC_DESC("mdio2", mdio2),
+	PINCTRL_FUNC_DESC("mdcs", mdcs),
+	PINCTRL_FUNC_DESC("mdios", mdios),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pcie0", pcie0),
+	PINCTRL_FUNC_DESC("pcie1", pcie1),
+	PINCTRL_FUNC_DESC("pcie2", pcie2),
+	PINCTRL_FUNC_DESC("pon1", pon1),
+	PINCTRL_FUNC_DESC("pon2", pon2),
+	PINCTRL_FUNC_DESC("sgpio0", sgpio0),
+	PINCTRL_FUNC_DESC("sgpio1", sgpio1),
+	PINCTRL_FUNC_DESC("watchdog", watchdog),
+	PINCTRL_FUNC_DESC("shiftmux_spi", shiftmux_spi),
+	PINCTRL_FUNC_DESC("tod", tod),
+	PINCTRL_FUNC_DESC("sync_e", sync_e),
+	PINCTRL_FUNC_DESC("cpu_jtag", cpu_jtag),
+	PINCTRL_FUNC_DESC("npu_jtag", npu_jtag),
+	PINCTRL_FUNC_DESC("ibex_jtag", ibex_jtag),
+	PINCTRL_FUNC_DESC("pma50eth_jtag", pma50eth_jtag),
+	PINCTRL_FUNC_DESC("ainpu_jtag", ainpu_jtag),
+	PINCTRL_FUNC_DESC("pma50pon_jtag", pma50pon_jtag),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+};
+
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.iomux_info = &iomux_info,
+	.pinctrl_name = KBUILD_MODNAME,
+	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &gpiochip_regs,
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AN7589_NUM_PINS,
+};
+
+static const struct of_device_id airoha_pinctrl_of_match[] = {
+	{ .compatible = "airoha,an7589-pinctrl", .data = &pinctrl_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
+
+static struct platform_driver airoha_pinctrl_driver = {
+	.probe = airoha_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-airoha-an7589",
+		.of_match_table = airoha_pinctrl_of_match,
+	},
+};
+module_platform_driver(airoha_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("John Crispin <john@phrozen.org>");
+MODULE_DESCRIPTION("Pinctrl driver for Airoha AN7589 SoC");
-- 
2.34.1

