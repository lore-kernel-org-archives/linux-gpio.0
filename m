Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739516;
	b=vmIVenkegAR3w5nquT1/Dot4ZtuC2M9ZUtBXmx764LdBurl+Gcm7ThM16Hahv5pNsAp8
	 YGmQAHXfX/Th4vw1Rh4az3iwYyjR8FO78u3gcCvEKneqO2OvqCDQRi55uAwP6zCoEaNXF
	 YSnfjYZa6TIJaAlQaKNWVZwixVPWUmfTIv4EWBhCwUcGT/h64y4uS1zobKTE2hjm7nqB4
	 48kZ8o8V7S1AuFqzIzV/G/l7H1Mi8oog1QFCqan6cRQORLgaTGvFhQyTDWl9NwRUgQbHw
	 k2EC5Zo/wPaZk6uVoNF4BrSJxqAa0/yo8TGGy5Lmdye5uDd19dW2M1Hc+kDFv5VhYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739516;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5uo/8JWKiktnTJAVi7eZ1RA0ug1j3vdnO8lLDK/Mx7M=;
	b=is6REzgwEgYoyR+Nu8qmrJgaL7+UaoJMHUBCMZcJwJe+rLZ/W9GrXm/LEd9xQmGaWbvk
	 oc1VvHFzzCfavQpKhQmM7lUQgjH8gtafeccrHfk+5WfzSXJcKt5wA4mOxbAczwF6xUlei
	 5fVvWA6Xm83GLg6FWmwTcur2QIsVDG1/z+nJvnAPhNIuim5enRtx6NSx0JX5IhqDZ6wVB
	 3Db2qkS92ZemBS3/z+WuMcwO9eULmxgdjtEkVX1uoTxWfyLWb3/azZdYFDsoCYx8Ixtgo
	 AZrKgJ7jA5shGv/jZjxHFDWQzgJ8UcBkXtf3bnAy6+H+1Y1N4T4+NadahDEGb/xx+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Cq/fBV6D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E748606A33F;
	Sun, 15 Nov 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cq/fBV6D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1762E1F000C4;
	Sun, 15 Nov 2026 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739516;
	bh=5uo/8JWKiktnTJAVi7eZ1RA0ug1j3vdnO8lLDK/Mx7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cq/fBV6DO28TdOkve7xeW0TnNfam72jxw66JkzDrcU8hHdZtfGE2nLC1HxsM0fFxT
	 yWSprfOjr8AEQknXXG8nr5XbRu+roJHpNfkIHfiXcJyeCuonrz3AkwfohHuOw2cTzi
	 Xe6eGhtP5iE2+B88s+Ppdo7N6llE40TMJL/8xSqTfiXVDRj+DelavEHmtaXMdZgzmG
	 9GqI03ud6SU3U32oZZEOjZwyVCxm07+rEu299HFZwSRJEehs0+z2gcEpWW7aQcQrAa
	 X28xEqsU5ze8JWks4EvX7/eiyAsXkgE8xj0cVOrk17ndnah4Ehkdb+vc3hohKwtVEN
	 LUW5WJqqahpeQ==
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
Subject: [PATCH v2 12/13] arm64: dts: synaptics: add SL2610 family SoCs
Date: Sun, 15 Nov 2026 18:23:51 +0800
Message-ID: <20261115102401.3520-13-jszhang@kernel.org>
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

Describe the CPUs, interrupt controller, system controllers and supported
serial, I2C, I3C, SPI and GPIO peripherals for the SL2610 family.

Use the SL2610 peripheral compatibles already documented in the upstream
bindings and share clock, reset and pin configuration providers through
the system controller nodes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/sl2611.dtsi | 457 ++++++++++++++++++++++
 arch/arm64/boot/dts/synaptics/sl2613.dtsi |  12 +
 arch/arm64/boot/dts/synaptics/sl2615.dtsi |  46 +++
 arch/arm64/boot/dts/synaptics/sl2617.dtsi |  46 +++
 arch/arm64/boot/dts/synaptics/sl2619.dtsi |  44 +++
 5 files changed, 605 insertions(+)
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi

diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
new file mode 100644
index 000000000000..663fe6034ba0
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/clock/syna,sl2610.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/syna,sl2610-reset.h>
+
+/ {
+	compatible = "syna,sl2611";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	optee {
+		compatible = "linaro,optee-tz";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+
+		L3: l3-cache0 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <75>;
+				exit-latency-us = <155>;
+				min-residency-us = <50000>;
+			};
+		};
+	};
+
+	osc: osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		sm-bus {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			dma-ranges = <0xa0000000 0x00000000 0x10000000>;
+
+			sm_clk: sm_pinctrl: sm_rst: sm_chip: syscon@e5025000 {
+				compatible = "syna,sl2610-mcu-syscon", "syscon";
+				reg = <0xe5025000 0x1000>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+				clocks = <&osc>;
+			};
+
+			sm_uart0: serial@e5030000 {
+				compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+				reg = <0xe5030000 0x100>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART0>, <&sm_clk CLK_CFG_UART0>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart1: serial@e5031000 {
+				compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+				reg = <0xe5031000 0x100>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART1>, <&sm_clk CLK_CFG_UART1>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart2: serial@e5032000 {
+				compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+				reg = <0xe5032000 0x100>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART2>, <&sm_clk CLK_CFG_UART2>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart3: serial@e5033000 {
+				compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+				reg = <0xe5033000 0x100>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART3>, <&sm_clk CLK_CFG_UART3>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_spi1: spi@e5034000 {
+				compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
+				reg = <0xe5034000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				num-cs = <4>;
+				clocks = <&sm_clk CLK_SER_SPIM>, <&sm_clk CLK_CFG_SPIM>;
+				clock-names = "ssi_clk", "pclk";
+				interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i2c0: i2c@e5035000 {
+				compatible = "syna,sl2610-i2c", "snps,designware-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0xe5035000 0x100>;
+				clocks = <&sm_clk CLK_SER_I2CM0>, <&sm_clk CLK_CFG_I2CM0>;
+				clock-names = "ref", "pclk";
+				i2c-sda-falling-time-ns = <510>;
+				i2c-scl-falling-time-ns = <510>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i2c1: i2c@e5036000 {
+				compatible = "syna,sl2610-i2c", "snps,designware-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0xe5036000 0x100>;
+				clocks = <&sm_clk CLK_SER_I2CM1>, <&sm_clk CLK_CFG_I2CM1>;
+				clock-names = "ref", "pclk";
+				i2c-sda-falling-time-ns = <510>;
+				i2c-scl-falling-time-ns = <510>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i3c0: i3c@e5037000 {
+				compatible = "syna,sl2610-i3c", "snps,dw-i3c-master-1.00a";
+				#address-cells = <3>;
+				#size-cells = <0>;
+				reg = <0xe5037000 0x1000>;
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&sm_rst RST_SM_I3CSRST>, <&sm_rst RST_SM_I3CPRST>;
+				clocks = <&sm_clk CLK_SER_I3C>, <&sm_clk CLK_CFG_I3C>;
+				clock-names = "core", "apb";
+				status = "disabled";
+			};
+
+			sm_gpio0: gpio@e5038000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe5038000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portc: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <16>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio1: gpio@e5039000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe5039000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portd: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio2: gpio@e503a000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe503a000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				porte: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio3: gpio@e503b000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe503b000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portf: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+		};
+
+		aioclk: aviogbl: syscon@f7490000 {
+			compatible = "syna,sl2610-avio-syscon", "syscon";
+			reg = <0xf7490000 0x4000>;
+			clocks = <&osc>;
+		};
+
+		clk: pinctrl: rst: chip: syscon@f7e10000 {
+			compatible = "syna,sl2610-soc-syscon", "syscon";
+			reg = <0xf7e10000 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc>;
+		};
+
+		cpuclk: cpu_wrap: syscon@f7e30000 {
+			compatible = "syna,sl2610-cpu-syscon", "syscon";
+			reg = <0xf7e30000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&osc>;
+			syna,gbl-syscon = <&chip>;
+		};
+
+		gic: interrupt-controller@f7e59000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0xf7e59000 0x1000>,
+			      <0xf7e5a000 0x2000>,
+			      <0xf7e5c000 0x2000>,
+			      <0xf7e5e000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		soc_uart0: serial@f7f00000 {
+			compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+			reg = <0xf7f00000 0x100>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART0>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart1: serial@f7f01000 {
+			compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+			reg = <0xf7f01000 0x100>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART1>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart2: serial@f7f02000 {
+			compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+			reg = <0xf7f02000 0x100>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART2>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart3: serial@f7f03000 {
+			compatible = "syna,sl2610-uart", "snps,dw-apb-uart";
+			reg = <0xf7f03000 0x100>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART3>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_spi0: spi@f7f04000 {
+			compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f04000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI0>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_i2c0: i2c@f7f05000 {
+			compatible = "syna,sl2610-i2c", "snps,designware-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf7f05000 0x100>;
+			clocks = <&clk CLK_APBI2C0>;
+			i2c-sda-hold-time-ns = <449>;
+			i2c-sda-falling-time-ns = <425>;
+			i2c-scl-falling-time-ns = <205>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_i2c1: i2c@f7f06000 {
+			compatible = "syna,sl2610-i2c", "snps,designware-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf7f06000 0x100>;
+			clocks = <&clk CLK_APBI2C1>;
+			i2c-sda-hold-time-ns = <449>;
+			i2c-sda-falling-time-ns = <425>;
+			i2c-scl-falling-time-ns = <205>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_gpio0: gpio@f7f07000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xf7f07000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APBGPIO>;
+			clock-names = "bus";
+
+			porta: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		soc_spi1: spi@f7f0b000 {
+			compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0b000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI1>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_spi2: spi@f7f0c000 {
+			compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0c000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI2>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_spi3: spi@f7f0d000 {
+			compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0d000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI3>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_gpio1: gpio@f7f0e000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xf7f0e000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APBGPIO>;
+			clock-names = "bus";
+
+			portb: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2613.dtsi b/arch/arm64/boot/dts/synaptics/sl2613.dtsi
new file mode 100644
index 000000000000..379809901677
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2613.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2611.dtsi"
+
+/ {
+	compatible = "syna,sl2613";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2615.dtsi b/arch/arm64/boot/dts/synaptics/sl2615.dtsi
new file mode 100644
index 000000000000..11b1fe316aa6
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2615.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	compatible = "syna,sl2615";
+
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2617.dtsi b/arch/arm64/boot/dts/synaptics/sl2617.dtsi
new file mode 100644
index 000000000000..a0de686d1fae
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2617.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	compatible = "syna,sl2617";
+
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2619.dtsi b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
new file mode 100644
index 000000000000..96bd58bbed3e
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
-- 
2.55.0

