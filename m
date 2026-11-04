Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776888;
	b=KQ9DFcdcskYZi6gCNPQLq5uUunjYAnHuE/+PyQ18zJJQBjTDxhbwUl+bPD5zN7flBWsK
	 y35WXYnQi1FfUdM9E++3gdp0fcHgyfCX13UeKTkkFaKO2kSOjnPbpj5QOtNTKoeeJL4qn
	 JRki3mwCGzkBdXznG9EzCiy4UBAvWNLZOM0i6La7OO4jh1RPjShPyHIwOAh1MUWkeIYtH
	 /WIIbcFl01PIti6xPLcy4Ix4YsptFqCmnE8cmQYr5r8tZVwWF1I9WGDGRN2RSJymUz650
	 lgIomlDxdHQAEhoaPDQnaL479Gh7tAw4utCtIghTbnJphB3njXsmjwGy6u6ooofzTsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776888;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uj63BoWUu91spjblyJkQMqqCfyFmmkhqKgwawHpuhO8=;
	b=y+CHhlu/ewCHyVtc/7JN4zAUr/ukrWzMDMXOuwuifx/p2QZAOxDLzPSmb1BkgMx9IDty
	 rMYAhywVi6nCKF2VyH5lTWoy5a3IUpiZTROJCjxkde6SkG/xf/v/d1MOuwLLvWQcQft4P
	 1y58RdM9T06Rw2sky/YcR4X3t5I8SmOCsQ3R9RKmWq+oNGYdZ9YhMxV+/0QRvA9212OUN
	 7HBGKP4kAtwtanqexb1v2ywe6HKmZgr/8uyFMsGxEXM6UfQt8mBoyiFFiv+5mThCEmD3F
	 /d/v/NmdJBd2v7QEM0yJK2RM2iUFn5JVWJIZPQ5iQijmamuOI8jif9vl14wYx7OmXOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUaUgGC9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C895606A339;
	Wed,  4 Nov 2026 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUaUgGC9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776888;
	b=xA/0wnGJlIKsvJf4nOJdGE42+MMtbWd/crL59YD99jQLJ0iArDVSmwOP7d+F2D6bcaue
	 RKVmryQ8dN4GGMgYOuk5YXHsBTHCT6RSiwPn8+60EH9B1ROiLiOVgfx1sgYVqNPe4FPjU
	 PHzHcus0Nevn08m3wt44YF93wzcJceSr9DNfNcE8SShRWjtiygvvpTjVDRkkJqr33wcDm
	 9+ZqayqPXQbzegIH6kFnMWX5vxXSf+MUWtXqUg3Te4Z3RMAtzRy32QLtdWk8cXkr9IYzj
	 Cn1AmFB/FD/AbQKqKhnJaxKmtzB2J24g++o9T6dxVo77UcjKWfAe6ajxIaSDSEcnxnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776888;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uj63BoWUu91spjblyJkQMqqCfyFmmkhqKgwawHpuhO8=;
	b=EaI69gxokA0Zzjad0/Bp4gOkqdddL7IeFPC4kw1E8L/n3NhdcV8dohDQW5G8ZfgjuJLD
	 1noK5fo7VDvzvSQE4mrwF1p/IbD5/FL4BX6IKo2vvHdRc2VAKBKmKZUSCiBLp93LiC6iT
	 V1GdxW/9V2hbDV5BPTKzSmJlUMXiX5Jw2kcYOFLCLxW5zFNJm0949T4FbnzifJuE2YUEr
	 fGJYWuykn74CQFPesT3Z0s5+QfelOPhGPlt4wOgUGTSNcuDSDxNxBglzcNb6cB0yBUW4X
	 9cT50TtkMF8J8S3QCuxHi4Eg/jDoaPLZHvDWbqbhMvKVbwFkhJHNjWwgzwPLmAPvXaA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92F4C1F00A1E;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776887;
	bh=Uj63BoWUu91spjblyJkQMqqCfyFmmkhqKgwawHpuhO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cUaUgGC9SwK4fh209aGzuP7aAIvHkfaa7miLcr8RDiKscszCtq4xQANdN5YtqxgGa
	 hfGAmVQYGvcT5lwzwNT094mnLxh+NH51lIYiA4CCRDdNkVdfMuhW0uW/RgxI+CHSzF
	 uk0kQaDR9HgTo0xKFQxLU41dgVwb5paPvYioAdrunHJ3iK9LpudxPKl2YJXLxiQRjo
	 hHdcNAo1Gji9gGm5WLusYm1PpkWGfKjZsiL3a92B+B3okhlIEX+Z/of4eVhggKMv9O
	 A4Nj2lov1UZj4xDXOoJWo1/n7HjUamncuZitgSuai1XavBHoZPfqOPl+NOP49PXUA4
	 25sdt7bPz5Ccw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2800446D00;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:18 -0500
Subject: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776885; l=18715;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=JGxibuJu6BwlvFy7CBKtnsTqH1G4NAbjCidvDAblz/w=;
 b=2ICLcVmkMvLiAiNhDeBHRwtCZsjXp0mCm2UiwZBmQHn1quB5ExkCGKIDi+3zc2Ai1yTZIfeHF
 +yj/RVUcoEpAEE5dONh1cGmfgUEywci9Pt2ZrtTtRINcimcZiVtNgON
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Add a driver for the pin controller of the Siflower SF19A2890. Each pin
is a group of its own. The functions are named after the peripheral
they connect, and each lists the pins it can use with the mux mode that
selects it there. The function tables cover what the vendor firmware and
the OpenWrt port use; the rest of the modes are undocumented.

Based on the OpenWrt driver by Chuanhong Guo, which exposed the mux
modes as functions "func0" to "func3". That driver was itself based on
the BCM2835 pin controller driver.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/pinctrl/Kconfig             |  14 +
 drivers/pinctrl/Makefile            |   1 +
 drivers/pinctrl/pinctrl-sf19a2890.c | 536 ++++++++++++++++++++++++++++++++++++
 3 files changed, 551 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index dc7138302..1321eb679 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -562,6 +562,20 @@ config PINCTRL_SCMI
 	  It uses SCMI Message Protocol to interact with the
 	  firmware providing all the pinctrl controls.
 
+config PINCTRL_SF19A2890
+	tristate "Siflower SF19A2890 pin controller"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	depends on OF
+	default MACH_SIFLOWER_MIPS
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  Support for the pin controller of the Siflower SF19A2890 SoC. It
+	  selects the function of each pin and sets its bias, input enable,
+	  Schmitt trigger and drive strength. The SoC's GPIO controller uses
+	  it to switch pins to GPIO.
+
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ce0825f4f..2cb2c229c 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
 obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
+obj-$(CONFIG_PINCTRL_SF19A2890)	+= pinctrl-sf19a2890.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
diff --git a/drivers/pinctrl/pinctrl-sf19a2890.c b/drivers/pinctrl/pinctrl-sf19a2890.c
new file mode 100644
index 000000000..dbc8ac34b
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-sf19a2890.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Siflower SF19A2890 pin controller
+ *
+ * Based on the OpenWrt driver by Chuanhong Guo <gch981213@gmail.com>,
+ * which was based on the Broadcom BCM2835 GPIO unit driver:
+ * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#define SF19A2890_NUM_PINS	49
+
+/* Pad configuration */
+#define REG_PC(pin)		((pin) * 0x8)
+#define  PC_OEN			BIT(7)
+#define  PC_ST			BIT(6)
+#define  PC_IE			BIT(5)
+#define  PC_PD			BIT(4)
+#define  PC_PU			BIT(3)
+#define  PC_DS			GENMASK(2, 0)
+
+#define DRIVE_MIN_MA		6
+#define DRIVE_STEP_MA		3
+
+/*
+ * Pin mux. With FUNC_SW clear, the pad's output enable is forced by
+ * PC_OEN; with it set, the GPIO or the function drives it. FMUX_SEL picks
+ * the GPIO, and MODE the function, when FMUX_SEL is clear.
+ */
+#define REG_PMX(pin)		((pin) * 0x8 + 0x4)
+#define  PMX_FUNC_SW		BIT(3)
+#define  PMX_FMUX_SEL		BIT(2)
+#define  PMX_MODE		GENMASK(1, 0)
+
+struct sf19a2890_pinctrl {
+	struct device *dev;
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+};
+
+static const struct pinctrl_pin_desc sf19a2890_pins[] = {
+	PINCTRL_PIN(0, "JTAG_TDO"),
+	PINCTRL_PIN(1, "JTAG_TDI"),
+	PINCTRL_PIN(2, "JTAG_TMS"),
+	PINCTRL_PIN(3, "JTAG_TCK"),
+	PINCTRL_PIN(4, "JTAG_RST"),
+	PINCTRL_PIN(5, "SPI_TXD"),
+	PINCTRL_PIN(6, "SPI_RXD"),
+	PINCTRL_PIN(7, "SPI_CLK"),
+	PINCTRL_PIN(8, "SPI_CSN"),
+	PINCTRL_PIN(9, "UART_TX"),
+	PINCTRL_PIN(10, "UART_RX"),
+	PINCTRL_PIN(11, "I2C_DAT"),
+	PINCTRL_PIN(12, "I2C_CLK"),
+	PINCTRL_PIN(13, "RGMII_GTX_CLK"),
+	PINCTRL_PIN(14, "RGMII_TXCLK"),
+	PINCTRL_PIN(15, "RGMII_TXD0"),
+	PINCTRL_PIN(16, "RGMII_TXD1"),
+	PINCTRL_PIN(17, "RGMII_TXD2"),
+	PINCTRL_PIN(18, "RGMII_TXD3"),
+	PINCTRL_PIN(19, "RGMII_TXCTL"),
+	PINCTRL_PIN(20, "RGMII_RXCLK"),
+	PINCTRL_PIN(21, "RGMII_RXD0"),
+	PINCTRL_PIN(22, "RGMII_RXD1"),
+	PINCTRL_PIN(23, "RGMII_RXD2"),
+	PINCTRL_PIN(24, "RGMII_RXD3"),
+	PINCTRL_PIN(25, "RGMII_RXCTL"),
+	PINCTRL_PIN(26, "RGMII_COL"),
+	PINCTRL_PIN(27, "RGMII_CRS"),
+	PINCTRL_PIN(28, "RGMII_MDC"),
+	PINCTRL_PIN(29, "RGMII_MDIO"),
+	PINCTRL_PIN(30, "HB0_PA_EN"),
+	PINCTRL_PIN(31, "HB0_LNA_EN"),
+	PINCTRL_PIN(32, "HB0_SW_CTRL0"),
+	PINCTRL_PIN(33, "HB0_SW_CTRL1"),
+	PINCTRL_PIN(34, "HB1_PA_EN"),
+	PINCTRL_PIN(35, "HB1_LNA_EN"),
+	PINCTRL_PIN(36, "HB1_SW_CTRL0"),
+	PINCTRL_PIN(37, "HB1_SW_CTRL1"),
+	PINCTRL_PIN(38, "LB0_PA_EN"),
+	PINCTRL_PIN(39, "LB0_LNA_EN"),
+	PINCTRL_PIN(40, "LB0_SW_CTRL0"),
+	PINCTRL_PIN(41, "LB0_SW_CTRL1"),
+	PINCTRL_PIN(42, "LB1_PA_EN"),
+	PINCTRL_PIN(43, "LB1_LNA_EN"),
+	PINCTRL_PIN(44, "LB1_SW_CTRL0"),
+	PINCTRL_PIN(45, "LB1_SW_CTRL1"),
+	PINCTRL_PIN(46, "CLK_OUT"),
+	PINCTRL_PIN(47, "EXT_CLK_IN"),
+	PINCTRL_PIN(48, "DRVVBUS0"),
+};
+
+static_assert(ARRAY_SIZE(sf19a2890_pins) == SF19A2890_NUM_PINS);
+
+/* A pin that a function can use, and the mux mode that selects it */
+struct sf19a2890_func_pin {
+	unsigned int pin;
+	u8 mode;
+};
+
+struct sf19a2890_function {
+	const char *name;
+	const char * const *groups;
+	const struct sf19a2890_func_pin *pins;
+	unsigned int npins;
+};
+
+/*
+ * Each pin is a group of its own, named after the pin. A function's group
+ * list names the pins it can use, in the same order as its pin table.
+ */
+#define SF19A2890_FUNCTION(_name, ...)					\
+	static const struct sf19a2890_func_pin sf19a2890_##_name##_pins[] = { \
+		__VA_ARGS__						\
+	}
+
+#define PIN_MODE(_pin, _mode)	{ .pin = (_pin), .mode = (_mode) }
+
+SF19A2890_FUNCTION(jtag, PIN_MODE(0, 0), PIN_MODE(1, 0), PIN_MODE(2, 0),
+		   PIN_MODE(3, 0), PIN_MODE(4, 0));
+static const char * const sf19a2890_jtag_groups[] = {
+	"JTAG_TDO", "JTAG_TDI", "JTAG_TMS", "JTAG_TCK", "JTAG_RST",
+};
+
+SF19A2890_FUNCTION(uart1, PIN_MODE(0, 1), PIN_MODE(1, 1), PIN_MODE(2, 1),
+		   PIN_MODE(3, 1));
+static const char * const sf19a2890_uart1_groups[] = {
+	"JTAG_TDO", "JTAG_TDI", "JTAG_TMS", "JTAG_TCK",
+};
+
+SF19A2890_FUNCTION(pwm0, PIN_MODE(3, 3));
+static const char * const sf19a2890_pwm0_groups[] = { "JTAG_TCK" };
+
+SF19A2890_FUNCTION(pwm1, PIN_MODE(4, 2));
+static const char * const sf19a2890_pwm1_groups[] = { "JTAG_RST" };
+
+SF19A2890_FUNCTION(spi, PIN_MODE(5, 0), PIN_MODE(6, 0), PIN_MODE(7, 0),
+		   PIN_MODE(8, 0));
+static const char * const sf19a2890_spi_groups[] = {
+	"SPI_TXD", "SPI_RXD", "SPI_CLK", "SPI_CSN",
+};
+
+/* UART0's CTS and RTS are on the I2C pins */
+SF19A2890_FUNCTION(uart0, PIN_MODE(9, 0), PIN_MODE(10, 0), PIN_MODE(11, 0),
+		   PIN_MODE(12, 0));
+static const char * const sf19a2890_uart0_groups[] = {
+	"UART_TX", "UART_RX", "I2C_DAT", "I2C_CLK",
+};
+
+SF19A2890_FUNCTION(uart2, PIN_MODE(11, 1), PIN_MODE(12, 1));
+static const char * const sf19a2890_uart2_groups[] = { "I2C_DAT", "I2C_CLK" };
+
+SF19A2890_FUNCTION(i2c0, PIN_MODE(11, 2), PIN_MODE(12, 2));
+static const char * const sf19a2890_i2c0_groups[] = { "I2C_DAT", "I2C_CLK" };
+
+SF19A2890_FUNCTION(rgmii, PIN_MODE(14, 0), PIN_MODE(15, 0), PIN_MODE(16, 0),
+		   PIN_MODE(17, 0), PIN_MODE(18, 0), PIN_MODE(19, 0),
+		   PIN_MODE(20, 0), PIN_MODE(21, 0), PIN_MODE(22, 0),
+		   PIN_MODE(23, 0), PIN_MODE(24, 0), PIN_MODE(25, 0));
+static const char * const sf19a2890_rgmii_groups[] = {
+	"RGMII_TXCLK", "RGMII_TXD0", "RGMII_TXD1", "RGMII_TXD2",
+	"RGMII_TXD3", "RGMII_TXCTL", "RGMII_RXCLK", "RGMII_RXD0",
+	"RGMII_RXD1", "RGMII_RXD2", "RGMII_RXD3", "RGMII_RXCTL",
+};
+
+SF19A2890_FUNCTION(mdio, PIN_MODE(28, 0), PIN_MODE(29, 0));
+static const char * const sf19a2890_mdio_groups[] = {
+	"RGMII_MDC", "RGMII_MDIO",
+};
+
+/* The power amplifier, LNA and antenna switch controls of the radios */
+SF19A2890_FUNCTION(wlan, PIN_MODE(30, 0), PIN_MODE(31, 0), PIN_MODE(32, 0),
+		   PIN_MODE(33, 0), PIN_MODE(34, 0), PIN_MODE(35, 0),
+		   PIN_MODE(36, 0), PIN_MODE(37, 0), PIN_MODE(38, 0),
+		   PIN_MODE(39, 0), PIN_MODE(40, 0), PIN_MODE(41, 0),
+		   PIN_MODE(42, 0), PIN_MODE(43, 0), PIN_MODE(44, 0),
+		   PIN_MODE(45, 0));
+static const char * const sf19a2890_wlan_groups[] = {
+	"HB0_PA_EN", "HB0_LNA_EN", "HB0_SW_CTRL0", "HB0_SW_CTRL1",
+	"HB1_PA_EN", "HB1_LNA_EN", "HB1_SW_CTRL0", "HB1_SW_CTRL1",
+	"LB0_PA_EN", "LB0_LNA_EN", "LB0_SW_CTRL0", "LB0_SW_CTRL1",
+	"LB1_PA_EN", "LB1_LNA_EN", "LB1_SW_CTRL0", "LB1_SW_CTRL1",
+};
+
+#define FUNCTION(_name)							\
+	{								\
+		.name = #_name,						\
+		.groups = sf19a2890_##_name##_groups,			\
+		.pins = sf19a2890_##_name##_pins,			\
+		.npins = ARRAY_SIZE(sf19a2890_##_name##_pins),		\
+	}
+
+static const struct sf19a2890_function sf19a2890_functions[] = {
+	FUNCTION(i2c0),
+	FUNCTION(jtag),
+	FUNCTION(mdio),
+	FUNCTION(pwm0),
+	FUNCTION(pwm1),
+	FUNCTION(rgmii),
+	FUNCTION(spi),
+	FUNCTION(uart0),
+	FUNCTION(uart1),
+	FUNCTION(uart2),
+	FUNCTION(wlan),
+};
+
+static u32 sf19a2890_pinctrl_read(struct sf19a2890_pinctrl *pc, u32 reg)
+{
+	return readl(pc->base + reg);
+}
+
+static void sf19a2890_pinctrl_write(struct sf19a2890_pinctrl *pc, u32 reg,
+				    u32 val)
+{
+	writel(val, pc->base + reg);
+}
+
+static void sf19a2890_pinctrl_rmw(struct sf19a2890_pinctrl *pc, u32 reg,
+				  u32 clr, u32 set)
+{
+	u32 val = sf19a2890_pinctrl_read(pc, reg);
+
+	sf19a2890_pinctrl_write(pc, reg, (val & ~clr) | set);
+}
+
+static int sf19a2890_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return SF19A2890_NUM_PINS;
+}
+
+static const char *sf19a2890_get_group_name(struct pinctrl_dev *pctldev,
+					    unsigned int selector)
+{
+	return sf19a2890_pins[selector].name;
+}
+
+static int sf19a2890_get_group_pins(struct pinctrl_dev *pctldev,
+				    unsigned int selector,
+				    const unsigned int **pins,
+				    unsigned int *num_pins)
+{
+	*pins = &sf19a2890_pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static void sf19a2890_pin_dbg_show(struct pinctrl_dev *pctldev,
+				   struct seq_file *s, unsigned int offset)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	u32 conf = sf19a2890_pinctrl_read(pc, REG_PC(offset));
+	u32 mux = sf19a2890_pinctrl_read(pc, REG_PMX(offset));
+
+	if (!(mux & PMX_FUNC_SW))
+		seq_printf(s, "forced %s", conf & PC_OEN ? "input" : "output");
+	else if (mux & PMX_FMUX_SEL)
+		seq_puts(s, "gpio");
+	else
+		seq_printf(s, "mode %lu", FIELD_GET(PMX_MODE, mux));
+
+	seq_printf(s, "%s%s%s%s drive %lu mA",
+		   conf & PC_IE ? " input" : "",
+		   conf & PC_ST ? " schmitt" : "",
+		   conf & PC_PU ? " pull-up" : "",
+		   conf & PC_PD ? " pull-down" : "",
+		   DRIVE_MIN_MA + FIELD_GET(PC_DS, conf) * DRIVE_STEP_MA);
+}
+
+static const struct pinctrl_ops sf19a2890_pctl_ops = {
+	.get_groups_count = sf19a2890_get_groups_count,
+	.get_group_name = sf19a2890_get_group_name,
+	.get_group_pins = sf19a2890_get_group_pins,
+	.pin_dbg_show = sf19a2890_pin_dbg_show,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int sf19a2890_pmx_free(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* Back to a forced input with the input buffer off */
+	sf19a2890_pinctrl_rmw(pc, REG_PC(pin), PC_IE, PC_OEN);
+	sf19a2890_pinctrl_rmw(pc, REG_PMX(pin), PMX_FUNC_SW, 0);
+
+	return 0;
+}
+
+static int sf19a2890_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(sf19a2890_functions);
+}
+
+static const char *sf19a2890_get_function_name(struct pinctrl_dev *pctldev,
+					       unsigned int selector)
+{
+	return sf19a2890_functions[selector].name;
+}
+
+static int sf19a2890_get_function_groups(struct pinctrl_dev *pctldev,
+					 unsigned int selector,
+					 const char * const **groups,
+					 unsigned int * const num_groups)
+{
+	*groups = sf19a2890_functions[selector].groups;
+	*num_groups = sf19a2890_functions[selector].npins;
+
+	return 0;
+}
+
+static int sf19a2890_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int func_selector,
+			     unsigned int group_selector)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct sf19a2890_function *func =
+		&sf19a2890_functions[func_selector];
+	unsigned int pin = sf19a2890_pins[group_selector].number;
+	unsigned int i;
+
+	for (i = 0; i < func->npins; i++) {
+		if (func->pins[i].pin != pin)
+			continue;
+
+		sf19a2890_pinctrl_write(pc, REG_PMX(pin),
+					PMX_FUNC_SW |
+					FIELD_PREP(PMX_MODE, func->pins[i].mode));
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int sf19a2890_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int pin)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	sf19a2890_pinctrl_write(pc, REG_PMX(pin), PMX_FUNC_SW | PMX_FMUX_SEL);
+	/* The GPIO block reads the pad back through the input buffer */
+	sf19a2890_pinctrl_rmw(pc, REG_PC(pin), 0, PC_IE);
+
+	return 0;
+}
+
+static void sf19a2890_gpio_disable_free(struct pinctrl_dev *pctldev,
+					struct pinctrl_gpio_range *range,
+					unsigned int pin)
+{
+	sf19a2890_pmx_free(pctldev, pin);
+}
+
+static const struct pinmux_ops sf19a2890_pmx_ops = {
+	.free = sf19a2890_pmx_free,
+	.get_functions_count = sf19a2890_get_functions_count,
+	.get_function_name = sf19a2890_get_function_name,
+	.get_function_groups = sf19a2890_get_function_groups,
+	.set_mux = sf19a2890_set_mux,
+	.gpio_request_enable = sf19a2890_gpio_request_enable,
+	.gpio_disable_free = sf19a2890_gpio_disable_free,
+	.strict = true,
+};
+
+static int sf19a2890_pinconf_get(struct pinctrl_dev *pctldev,
+				 unsigned int pin, unsigned long *config)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 val = sf19a2890_pinctrl_read(pc, REG_PC(pin));
+	u32 arg;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (val & (PC_PU | PC_PD))
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (!(val & PC_PU))
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (!(val & PC_PD))
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!(val & PC_IE))
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!(val & PC_ST))
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = DRIVE_MIN_MA + FIELD_GET(PC_DS, val) * DRIVE_STEP_MA;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int sf19a2890_pinconf_set(struct pinctrl_dev *pctldev,
+				 unsigned int pin, unsigned long *configs,
+				 unsigned int num_configs)
+{
+	struct sf19a2890_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	u32 val = sf19a2890_pinctrl_read(pc, REG_PC(pin));
+	unsigned int i;
+	u32 arg;
+
+	for (i = 0; i < num_configs; i++) {
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (pinconf_to_config_param(configs[i])) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			val &= ~(PC_PU | PC_PD);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			val &= ~PC_PD;
+			val |= PC_PU;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			val &= ~PC_PU;
+			val |= PC_PD;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (arg)
+				val |= PC_IE;
+			else
+				val &= ~PC_IE;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (arg)
+				val |= PC_ST;
+			else
+				val &= ~PC_ST;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (arg < DRIVE_MIN_MA ||
+			    arg > DRIVE_MIN_MA + DRIVE_STEP_MA * FIELD_MAX(PC_DS) ||
+			    (arg - DRIVE_MIN_MA) % DRIVE_STEP_MA)
+				return -EINVAL;
+			val &= ~PC_DS;
+			val |= FIELD_PREP(PC_DS,
+					  (arg - DRIVE_MIN_MA) / DRIVE_STEP_MA);
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	sf19a2890_pinctrl_write(pc, REG_PC(pin), val);
+
+	return 0;
+}
+
+static const struct pinconf_ops sf19a2890_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = sf19a2890_pinconf_get,
+	.pin_config_set = sf19a2890_pinconf_set,
+};
+
+static const struct pinctrl_desc sf19a2890_pinctrl_desc = {
+	.name = "sf19a2890-pinctrl",
+	.pins = sf19a2890_pins,
+	.npins = ARRAY_SIZE(sf19a2890_pins),
+	.pctlops = &sf19a2890_pctl_ops,
+	.pmxops = &sf19a2890_pmx_ops,
+	.confops = &sf19a2890_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static int sf19a2890_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sf19a2890_pinctrl *pc;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	pc->dev = dev;
+
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->base))
+		return PTR_ERR(pc->base);
+
+	pc->pctl = devm_pinctrl_register(dev, &sf19a2890_pinctrl_desc, pc);
+	if (IS_ERR(pc->pctl))
+		return dev_err_probe(dev, PTR_ERR(pc->pctl),
+				     "failed to register pinctrl\n");
+
+	return 0;
+}
+
+static const struct of_device_id sf19a2890_pinctrl_match[] = {
+	{ .compatible = "siflower,sf19a2890-pinctrl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sf19a2890_pinctrl_match);
+
+static struct platform_driver sf19a2890_pinctrl_driver = {
+	.probe = sf19a2890_pinctrl_probe,
+	.driver = {
+		.name = "sf19a2890-pinctrl",
+		.of_match_table = sf19a2890_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(sf19a2890_pinctrl_driver);
+
+MODULE_DESCRIPTION("Siflower SF19A2890 pin controller driver");
+MODULE_LICENSE("GPL");

-- 
Git-155)


