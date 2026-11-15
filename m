Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739482;
	b=dGLHKz/kfb/Bg8HSr9ne2pGfnShPGdpbGw37upYPNfAjokzTLY4yZB5cmmQGhi9dgoLU
	 7D039u87wi2HeeilDabau9dW/5DZKTjeJsQpNcClgYlCCblWEuYIDvGeNJkZMCzqiOA6J
	 XRGfHvvOJOdzayrEmucaMOmnh/oszz1ALp3cBYyaQbzJ1W1QFHnKnq19s4dSH5c0hJsiI
	 9z+EKuoCufNJl47aP3X8S+K6quvgGiZSOWkvCnDGqkTLAw693vSyDbKrfXVsvltDoGqaW
	 VKmM8zDtmBmrnLLuY/0M1odOcz5C+j3ENuIz0Mat9O5oPT9cFnhJGkCw2yAfoBmtCkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739482;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oxCJiOICUUs74Xo0MPxD2a6PIQWU/RA5n1ab3q90to4=;
	b=RvPTXx/sqMI2ETVtI40MkFLD03+uWRE9ZbTewvwClye1V4gvuG4ZAGUWgloHGyiETp0V
	 Cad8aeRl1JeAwrtrhCxyx9is3NON26sDPD7SX/pntVpUq52WZjWam/IUiEE8PsaHDJeKJ
	 ZDCVQo2rGxhRBC3tR2VjQs1gGO+zdSdYRK8zKDbWPdSynsnaWS21uxydErxCmZQ6n5M0b
	 WrBFVLZJYRFHr2xVl5md6djZI6h5cfgVgu9PGwykTZRJf2XTNKL7MBXGySEb0/1r9MUUx
	 c5Harz3dI/pR6l0KwZH/V5aIzn3ApNiqbbP2xB/nakMhNttN1nk+/n2O3VRw7jApH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JiiBcW3X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FE606A884;
	Sun, 15 Nov 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JiiBcW3X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601241F000CA;
	Sun, 15 Nov 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739482;
	bh=oxCJiOICUUs74Xo0MPxD2a6PIQWU/RA5n1ab3q90to4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JiiBcW3Xpm7P0APa3wxcDnkfwrNAoJA+QbjpuCDRZjfL3pUBVBsWBu5BCOFxWEBgO
	 6EJKHYL1iF5GKBbOMIUnKYefftNdDoieFrxvmo8p/ad01psduSjcqnwhvkmHz9wjBe
	 iFCyDdg96a/eJe4dBxFmwW4Xg895S/lEOgN202ZZJGlRNGfYXxvk8ImzXonx/PEkGE
	 as+o5Lzwf7tsmTpmgzY7MPUKT9rplqRIkhL7IVpPHETosMF2rTAFP7qU7darMacrOD
	 5UU5fDxLmV2dez+B0wZrJjZHadJ6MEMYabEosj8czI2O8eryo6tABgKTACu9TuAlbD
	 zMRrOw1F4k12A==
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
Subject: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system controllers
Date: Sun, 15 Nov 2026 18:23:44 +0800
Message-ID: <20261115102401.3520-6-jszhang@kernel.org>
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

Describe the SoC, MCU, AVIO and CPU system control blocks, including their
clock inputs, clock and reset providers, and pin configuration subnodes.
The clock and reset providers share each register block node.

Add the clock and reset identifiers used by consumers of these blocks.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 include/dt-bindings/clock/syna,sl2610.h       | 131 +++++++++++++
 include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++++++++
 4 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
 create mode 100644 include/dt-bindings/clock/syna,sl2610.h
 create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h

diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
new file mode 100644
index 000000000000..cdf947cb3e0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/synaptics/syna,sl2610-soc-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics SL2610 system control registers
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description: |
+  The SL2610 family has separate SoC, MCU, AVIO, and CPU system control
+  register blocks. The SoC and MCU blocks provide clocks, resets, and pin
+  control. The CPU block provides clocks. The AVIO block contains audio PLLs.
+
+  Clock and reset specifiers refer directly to the system control node.
+  Pin group configurations are direct children of the SoC or MCU node.
+  There are no separate clock, reset, or pin controller child nodes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - syna,sl2610-soc-syscon
+          - syna,sl2610-mcu-syscon
+          - syna,sl2610-avio-syscon
+          - syna,sl2610-cpu-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: External reference clock input.
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  syna,gbl-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the SoC system control registers for CPU PLL bypass.
+
+patternProperties:
+  '-(pmux|pins)$':
+    type: object
+    description: Pin group mux and electrical configuration.
+    allOf:
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+    properties:
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+      function:
+        $ref: /schemas/types.yaml#/definitions/string
+      bias-pull-up:
+        description: |
+          Enable pull-up bias and select its strength. A value of 0 selects
+          normal pull-up and 1 selects strong pull-up. The boolean form is
+          equivalent to 1 and selects strong pull-up. Use bias-disable to
+          disable pull bias. Values are mode selectors, not resistance in Ohms.
+        oneOf:
+          - type: boolean
+          - $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+      bias-pull-down:
+        description: |
+          Enable the default pull-down with a boolean or 1, or disable it with 0.
+          Pull resistance is not selectable.
+        oneOf:
+          - type: boolean
+          - $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+    required:
+      - groups
+      - function
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - syna,sl2610-soc-syscon
+              - syna,sl2610-mcu-syscon
+    then:
+      required:
+        - '#clock-cells'
+        - '#reset-cells'
+    else:
+      properties:
+        '#reset-cells': false
+      patternProperties:
+        '-(pmux|pins)$': false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl2610-cpu-syscon
+    then:
+      required:
+        - '#clock-cells'
+        - syna,gbl-syscon
+    else:
+      properties:
+        syna,gbl-syscon: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl2610-avio-syscon
+    then:
+      properties:
+        '#clock-cells': false
+
+additionalProperties: false
+
+examples:
+  - |
+    soc_syscon: syscon@f7e10000 {
+        compatible = "syna,sl2610-soc-syscon", "syscon";
+        reg = <0xf7e10000 0x10000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        i2c2-pmux {
+            groups = "GPIO23", "GPIO24";
+            function = "tw2";
+            bias-pull-up = <0>;
+        };
+
+        i2c3-pmux {
+            groups = "GPIO27", "GPIO28";
+            function = "tw3";
+            bias-pull-up;
+        };
+    };
+
+    syscon@e5025000 {
+        compatible = "syna,sl2610-mcu-syscon", "syscon";
+        reg = <0xe5025000 0x1000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        i2c0-pmux {
+            groups = "SM_GPIO12", "SM_GPIO13";
+            function = "tw0";
+        };
+    };
+
+    syscon@f7e30000 {
+        compatible = "syna,sl2610-cpu-syscon", "syscon";
+        reg = <0xf7e30000 0x4000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+        syna,gbl-syscon = <&soc_syscon>;
+    };
+
+    syscon@f7490000 {
+        compatible = "syna,sl2610-avio-syscon", "syscon";
+        reg = <0xf7490000 0x4000>;
+        clocks = <&osc>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..e7c061ae5a87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3808,9 +3808,12 @@ M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
+F:	include/dt-bindings/clock/syna,sl2610.h
+F:	include/dt-bindings/reset/syna,sl2610-reset.h
 
 ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT
 M:	Hans Verkuil <hverkuil@kernel.org>
diff --git a/include/dt-bindings/clock/syna,sl2610.h b/include/dt-bindings/clock/syna,sl2610.h
new file mode 100644
index 000000000000..c563a2b5ed06
--- /dev/null
+++ b/include/dt-bindings/clock/syna,sl2610.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Synaptics SL2610 clock tree IDs
+ *
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/* SoC domain */
+
+/* GBL common clks */
+#define CLK_CPUFASTREF		0
+#define CLK_MEMFASTREF		1
+#define CLK_CFG			2
+#define CLK_SYS			3
+#define CLK_PERIFSYS		4
+#define CLK_APBCORE		5
+#define CLK_APBSER		6
+#define CLK_ATB			7
+#define CLK_HPC			8
+#define CLK_EMMC		9
+#define CLK_SD0			10
+#define CLK_SD1			11
+#define CLK_GETHRGMII		12
+#define CLK_GETHRGMII1		13
+#define CLK_GE0_PTP_REF		14
+#define CLK_GE1_PTP_REF		15
+#define CLK_USB2TEST		16
+#define CLK_USB2TEST480MG0	17
+#define CLK_USB2TEST480MG1	18
+#define CLK_USB2TEST480MG2	19
+#define CLK_USB2TEST100MG0	20
+#define CLK_USB2TEST100MG1	21
+#define CLK_USB2TEST100MG2	22
+#define CLK_USB2TEST100MG3	23
+#define CLK_PERIFTEST125MG0	24
+#define CLK_PERIFTEST200MG0	25
+#define CLK_PERIFTEST200MG1	26
+#define CLK_GPU			27
+#define CLK_NPU			28
+#define CLK_AVIOSYS		29
+#define CLK_AIOSYS		30
+#define CLK_AVIO_LCDC2SCAN	31
+#define CLK_AVIO_IPI		32
+#define CLK_AVIO_P		33
+#define CLK_AVIO_DPHYRXTXESC	34
+#define CLK_AVIOFPLL		35
+#define CLK_AVIO_RX_SCANBYTE	36
+#define CLK_AVIO_RX_SCANTEST	37
+
+/* GBL gate clks */
+#define CLK_USB0CORE		38
+#define CLK_SDIOSYS		39
+#define CLK_EMMCSYS		40
+#define CLK_GPUAXI		41
+#define CLK_GETHRGMIISYS	42
+#define CLK_SDIO1SYS		43
+#define CLK_USB1CORE		44
+#define CLK_GETHRGMII1SYS	45
+#define CLK_USB0PHYREF		46
+#define CLK_USB1PHYREF		47
+#define CLK_APBUART0		48
+#define CLK_APBUART1		49
+#define CLK_APBUART2		50
+#define CLK_APBUART3		51
+#define CLK_APBI2C0		52
+#define CLK_APBI2C1		53
+#define CLK_APBSPI0		54
+#define CLK_APBSPI1		55
+#define CLK_APBSPI2		56
+#define CLK_APBSPI3		57
+#define CLK_APBGPIO		58
+#define CLK_APBTIMERS		59
+#define CLK_APBSYSCNT		60
+#define CLK_APBWDT		61
+#define CLK_APBDMA		62
+#define SL2610_CLK_MAX		63
+
+/* cpuss */
+#define CLK_CPU0		0
+#define CLK_CPU1		1
+#define CLK_DSU			2
+#define SL2610_CPU_CLK_MAX	3
+
+
+/* sysmgr domain */
+
+#define CLK_CFG_UART0		0
+#define CLK_SER_UART0		1
+#define CLK_CFG_UART1		2
+#define CLK_CFG_UART2		3
+#define CLK_CFG_UART3		4
+#define CLK_CFG_GPIO		5
+#define CLK_CFG_I2CM0		6
+#define CLK_CFG_I2CM1		7
+#define CLK_CFG_SPIM		8
+#define CLK_CFG_SPIS		9
+#define CLK_CFG_I3C		10
+#define CLK_CFG_XSPI		11
+#define CLK_AXI_XSPI		12
+#define CLK_CFG_PVT		13
+#define CLK_CFG_ADC		14
+#define CLK_CFG_PWM		15
+#define CLK_BUS_CAN0		16
+#define CLK_BUS_CAN1		17
+#define CLK_CFG_PDM		18
+
+#define CLK_SER_UART1		19
+#define CLK_SER_UART2		20
+#define CLK_SER_UART3		21
+#define CLK_DEB_GPIO		22
+#define CLK_SER_I2CM0		23
+#define CLK_SER_I2CM1		24
+#define CLK_SER_SPIM		25
+#define CLK_SER_SPIS		26
+#define CLK_SER_I3C		27
+#define CLK_SER_XSPI		28
+#define CLK_HS_PVT		29
+#define CLK_CORE_ADC		30
+#define CLK_SER_PWM		31
+#define CLK_SER_CAN0		32
+#define CLK_SER_CAN1		33
+#define CLK_SER_PDM		34
+#define CLK_REF_CALIB		35
+
+#define CLK_MCU_REF		36
+#define CLK_MCU_PLL		37
+#define CLK_MCU_IO_PLL		38
+#define CLK_MCU_APB		39
+#define CLK_MCU_AXI		40
diff --git a/include/dt-bindings/reset/syna,sl2610-reset.h b/include/dt-bindings/reset/syna,sl2610-reset.h
new file mode 100644
index 000000000000..909d63147692
--- /dev/null
+++ b/include/dt-bindings/reset/syna,sl2610-reset.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2026 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#ifndef _DT_BINDINGS_SL2610_RESET_H
+#define _DT_BINDINGS_SL2610_RESET_H
+
+/* ACPU subsystem */
+#define RST_SOC_SDIO0		0
+#define RST_SOC_USB0		1
+#define RST_SOC_EMMC		2
+#define RST_SOC_GETH0		3
+#define RST_SOC_SDIO1		4
+#define RST_SOC_USB1		5
+#define RST_SOC_GETH1		6
+#define RST_SOC_USB0PHY		7
+#define RST_SOC_USB0CORE	8
+#define RST_SOC_USB0MAHB	9
+#define RST_SOC_USB1PHY		10
+#define RST_SOC_USB1CORE	11
+#define RST_SOC_USB1MAHB	12
+#define RST_SOC_UART0		13
+#define RST_SOC_UART1		14
+#define RST_SOC_UART2		15
+#define RST_SOC_UART3		16
+#define RST_SOC_I2C0		17
+#define RST_SOC_I2C1		18
+#define RST_SOC_SPI0		19
+#define RST_SOC_SPI1		20
+#define RST_SOC_SPI2		21
+#define RST_SOC_SPI3		22
+#define RST_SOC_APBTIMERS	23
+#define RST_SOC_APBSYSCNT	24
+#define RST_SOC_APBWDT		25
+#define RST_SOC_APBGPIO		26
+#define RST_SOC_APBDMA		27
+#define RST_SOC_GPUCORE		28
+#define RST_SOC_NPUCORE		29
+#define RST_SOC_AVIOAIOG	30
+#define RST_SOC_AVIOVPPG	31
+#define RST_SOC_AVIOVIPG	32
+
+/* system subsystem */
+#define RST_SM_ADCCORE		0
+#define RST_SM_ADCPRST		1
+#define RST_SM_CAN0PRST		2
+#define RST_SM_CAN0SRST		3
+#define RST_SM_CAN1PRST		4
+#define RST_SM_CAN1SRST		5
+#define RST_SM_GPIOPRST		6
+#define RST_SM_GPIOSRST		7
+#define RST_SM_I2CM0PRST	8
+#define RST_SM_I2CM0SRST	9
+#define RST_SM_I2CM1PRST	10
+#define RST_SM_I2CM1SRST	11
+#define RST_SM_I3CPRST		12
+#define RST_SM_I3CSRST		13
+#define RST_SM_PDMPRST		14
+#define RST_SM_PDMSRST		15
+#define RST_SM_PVTHSRST		16
+#define RST_SM_PVTPRST		17
+#define RST_SM_PWMPERIRST	18
+#define RST_SM_PWMPRST		19
+#define RST_SM_SPIMPRST		20
+#define RST_SM_SPIMSRST		21
+#define RST_SM_SPISPRST		22
+#define RST_SM_SPISSRST		23
+#define RST_SM_UART0PRST	24
+#define RST_SM_UART0SRST	25
+#define RST_SM_UART1PRST	26
+#define RST_SM_UART1SRST	27
+#define RST_SM_UART2PRST	28
+#define RST_SM_UART2SRST	29
+#define RST_SM_UART3PRST	30
+#define RST_SM_UART3SRST	31
+
+#endif /* _DT_BINDINGS_SL2610_RESET_H */
-- 
2.55.0

