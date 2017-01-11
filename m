From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 3/7] arm: dts: r7s72100: GPIO and PFC device nodes
Date: Wed, 11 Jan 2017 10:57:09 +0100
Message-ID: <1484128633-22683-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

Add support for r7s72100 PFC and GPIO device nodes port0 -> port11
and jtagport0.

Signed-off-by: Magnus Damm <damm@opensource.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100.dtsi | 138 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 3dd427d..09ca193 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -359,6 +359,144 @@
 			<0xe8202000 0x1000>;
 	};
 
+	pfc: pfc@fcfe3300 {
+		compatible = "renesas,pfc-r7s72100";
+		reg = <0xfcfe3300 0x400>, /* PM, PMC, PFC, PFCE */
+			  <0xfcfe3a00 0x100>, /* PFCAE */
+			  <0xfcfe7000 0x300>, /* PIBC, PBDC, PIPC */
+			  <0xfcfe7b40 0x04>, /* JPMC */
+			  <0xfcfe7b90 0x04>, /* JPMCSR */
+			  <0xfcfe7f00 0x04>; /* JPIBC */
+	};
+
+	port0: gpio@fcfe3100 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3100 0x4>, /* PSR */
+			  <0xfcfe3200 0x2>, /* PPR */
+			  <0xfcfe3800 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 0 6>;
+	};
+
+	port1: gpio@fcfe3104 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3104 0x4>, /* PSR */
+			  <0xfcfe3204 0x2>, /* PPR */
+			  <0xfcfe3804 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 16 16>;
+	};
+
+	port2: gpio@fcfe3108 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3108 0x4>, /* PSR */
+			  <0xfcfe3208 0x2>, /* PPR */
+			  <0xfcfe3808 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 32 16>;
+	};
+
+	port3: gpio@fcfe310c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe310c 0x4>, /* PSR */
+			  <0xfcfe320c 0x2>, /* PPR */
+			  <0xfcfe380c 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 48 16>;
+	};
+
+	port4: gpio@fcfe3110 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3110 0x4>, /* PSR */
+			  <0xfcfe3210 0x2>, /* PPR */
+			  <0xfcfe3810 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 64 16>;
+	};
+
+	port5: gpio@fcfe3114 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3114 0x4>, /* PSR */
+			  <0xfcfe3214 0x2>, /* PPR */
+			  <0xfcfe3814 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 80 11>;
+	};
+
+	port6: gpio@fcfe3118 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3118 0x4>, /* PSR */
+			  <0xfcfe3218 0x2>, /* PPR */
+			  <0xfcfe3818 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 96 16>;
+	};
+
+	port7: gpio@fcfe311c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe311c 0x4>, /* PSR */
+			  <0xfcfe321c 0x2>, /* PPR */
+			  <0xfcfe381c 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 112 16>;
+	};
+
+	port8: gpio@fcfe3120 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3120 0x4>, /* PSR */
+			  <0xfcfe3220 0x2>, /* PPR */
+			  <0xfcfe3820 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 128 16>;
+	};
+
+	port9: gpio@fcfe3124 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3124 0x4>, /* PSR */
+			  <0xfcfe3224 0x2>, /* PPR */
+			  <0xfcfe3824 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 144 8>;
+	};
+
+	port10: gpio@fcfe3128 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3128 0x4>, /* PSR */
+			  <0xfcfe3228 0x2>, /* PPR */
+			  <0xfcfe3828 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 160 16>;
+	};
+
+	port11: gpio@fcfe312c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe312c 0x4>, /* PSR */
+			  <0xfcfe322c 0x2>, /* PPR */
+			  <0xfcfe382c 0x4>; /* PMSR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 176 16>;
+	};
+
+	jtagport0: gpio@fcfe7b20 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe7b20 0x2>; /* JPPR */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 192 2>;
+	};
+
 	i2c0: i2c@fcfee000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.7.4
