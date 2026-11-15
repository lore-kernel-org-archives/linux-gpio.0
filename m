Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739521;
	b=h08pvTYzyJw8hyE2vZvbQiar7oMbRl4GuO2P/lDGjvJhPTCg0evIzy4NYu3b1FyEblaR
	 AvhzEE9EI9Irkpv0AWjEk7HRToKLLYcTE4nllYoLxWeCKl0d9OXHAXskguhM8ZT+/iNws
	 bfAud/emLJ83YcMAwJjmTKyfqwvwOWX7HfB1o1nR/F9vUR/ujt5sUkSl0fjo/s7AC/ygn
	 TxihNHZ+rQYrQgmbAaGQE6s41EM9H2K9ZQayb7rGtPaFyTqRIDiLQO2q1NZLVOQF/V40z
	 HtqcWkh5pHXQG0t/NEvfGFPGWpLXD4MR+hqNBwmG1jG4bedVIkkplPcPMtB3BhkPDPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739521;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=62CfwsBmKGKY7Fn9rT9RDvCYZzjZgQypRjRx11DS/CE=;
	b=nD3YbOn9YncSAplVxgt9FyRsAYaqNS7J0Lb7Z2QRtRZ7wWJKg/2rb4qjHV+YYGwRUxqo
	 2+PnqUtZSN4f3NIr8WXmNESJJIWX5pxSYShsK3ePU5w1n8xZ8SBX17CE5Yq7cm4hgrU65
	 p70hxn3OvDEV3DlcLT9IUP7B3PJE+vsPwrWOpRE/kUospN0niHy85HEUCxXYOySfCfuQR
	 oKtDy2cbkhPZdbnXw//zVZzJs4Vvo2O/PBbDrUsvUK6nPSd7Bf68Ka7aHOiekBnytHb+j
	 yoZ6oAgGteQ43aUVlDTWbphzgrd4xTMnOel3HGkOOq4m1mg06LWEP0CgxhjILWLV8bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHYVNZOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F700606A31A;
	Sun, 15 Nov 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHYVNZOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34531F0092F;
	Sun, 15 Nov 2026 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739521;
	bh=62CfwsBmKGKY7Fn9rT9RDvCYZzjZgQypRjRx11DS/CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHYVNZOEBPLRcgAtKvuULYHQjJhuC3nTBjIbD+QdlvSBlnXBm03raYEp8TiBsOpgm
	 FFSBpCTSayaI0R67EuTfgAYiSuDHU2J6LHKpqhUZOMdH1nH+1496g9oFcfmud/omSk
	 3LYkxT1bBip5ATI0ihVu6h1ExD6St4bdeO/Gra5Z2kLXVO6E6CV3DWqxCHRtPaYRCp
	 Ia15IqXEgH6ECyZH9Fel1lLKWMUNtec8Ctlglrpxg1vlbErWolaJcjlIlKPpzOywHV
	 JzW8P/gmusgcW8oaPpuHNBa1YmWeZSwni4Xv/o/owDV7HOav2pdFbi3xxFCIuTy2uS
	 BKFQPZbQGTMuA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK boards
Date: Sun, 15 Nov 2026 18:23:52 +0800
Message-ID: <20261115102401.3520-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
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

Add device trees for the SL2611, SL2613, SL2615, SL2617 and SL2619
reference development kits. Share their common console, memory, pin
configuration and regulator descriptions and enable the populated
peripherals.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +++
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++++++++++++++++
 7 files changed, 220 insertions(+)
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi

diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
index de71ddda6835..810d0d08c2de 100644
--- a/arch/arm64/boot/dts/synaptics/Makefile
+++ b/arch/arm64/boot/dts/synaptics/Makefile
@@ -2,3 +2,8 @@
 # Berlin SoC Family
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
new file mode 100644
index 000000000000..585872307834
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2611.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2611 RDK";
+	compatible = "syna,sl2611-rdk", "syna,sl2611";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
new file mode 100644
index 000000000000..de75c9fab6a2
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2613.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2613 RDK";
+	compatible = "syna,sl2613-rdk", "syna,sl2613";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
new file mode 100644
index 000000000000..ae03638a3a53
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2615.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2615 RDK";
+	compatible = "syna,sl2615-rdk", "syna,sl2615";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
new file mode 100644
index 000000000000..ba4ea21ac505
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2617.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2617 RDK";
+	compatible = "syna,sl2617-rdk", "syna,sl2617";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
new file mode 100644
index 000000000000..58901ac2a050
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2619.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2619 RDK";
+	compatible = "syna,sl2619-rdk", "syna,sl2619";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
new file mode 100644
index 000000000000..78a9b28fdf99
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	aliases {
+		serial0 = &sm_uart0;
+		serial1 = &sm_uart1;
+		serial2 = &sm_uart2;
+		serial3 = &sm_uart3;
+		serial4 = &soc_uart0;
+		serial5 = &soc_uart1;
+		serial6 = &soc_uart2;
+		serial7 = &soc_uart3;
+		i2c0 = &sm_i2c0;
+		i2c1 = &sm_i2c1;
+		i2c2 = &soc_i2c0;
+		i2c3 = &soc_i2c1;
+		spi1 = &sm_spi1;
+		spi2 = &soc_spi0;
+		spi3 = &soc_spi1;
+		spi4 = &soc_spi2;
+		spi5 = &soc_spi3;
+	};
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vcore>;
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	soc_i2c0_pmux: soc_i2c0-pmux {
+		groups = "GPIO23", "GPIO24";
+		function = "tw2";
+		drive-strength = <7>;
+	};
+};
+
+&sm_pinctrl {
+	sm_i2c0_pmux: i2c0-pmux {
+		groups = "SM_GPIO12", "SM_GPIO13";
+		function = "tw0";
+		drive-strength = <7>;
+	};
+
+	sm_i2c1_pmux: i2c1-pmux {
+		groups = "SM_GPIO3", "SM_GPIO4";
+		function = "tw1";
+		drive-strength = <7>;
+	};
+
+	vcore_gpio_pmux: vcore-gpio-pmux {
+		groups = "SM_GPIO5";
+		function = "gpio";
+	};
+};
+
+&sm_uart0 {
+	status = "okay";
+};
+
+&sm_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c0_pmux>;
+	clock-frequency = <100000>;
+
+	expander0: gpio@43 {
+		compatible = "fcs,fxl6408";
+		reg = <0x43>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	expander1: gpio@44 {
+		compatible = "fcs,fxl6408";
+		reg = <0x44>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sm_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c1_pmux>;
+	clock-frequency = <100000>;
+
+	vcore: regulator@60 {
+		compatible = "silergy,sy8827n";
+		reg = <0x60>;
+		regulator-name = "vcore";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <987500>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-active-discharge = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcore_gpio_pmux>;
+		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&soc_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&soc_i2c0_pmux>;
+	clock-frequency = <100000>;
+};
+
+&sm_uart1 {
+	status = "okay";
+};
-- 
2.55.0

