From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 4/8] arm: dts: r7s72100: GPIO and PFC device nodes
Date: Mon, 16 Jan 2017 13:12:48 +0100
Message-ID: <1484568772-18137-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
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
 arch/arm/boot/dts/r7s72100.dtsi | 136 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 3dd427d..4af7f01 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -359,6 +359,142 @@
 			<0xe8202000 0x1000>;
 	};
 
+	pfc: pfc@fcfe3300 {
+		compatible = "renesas,pfc-r7s72100";
+		reg = <0xfcfe3400 0x300>, /* PMC, PFC, PFCE */
+		      <0xfcfe3a00 0x100>, /* PFCAE */
+		      <0xfcfe7000 0x300>, /* PIBC, PBDC, PIPC */
+		      <0xfcfe7b40 0x04>, /* JPMC */
+		      <0xfcfe7b90 0x04>, /* JPMCSR */
+		      <0xfcfe7f00 0x04>; /* JPIBC */
+	};
+
+	port0: gpio@fcfe3000 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3200 0x2>; /* PPR0 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 0 6>;
+	};
+
+	port1: gpio@fcfe3004 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3004 0x2>, /* P1 */
+		      <0xfcfe3204 0x2>, /* PPR1 */
+		      <0xfcfe3304 0x2>; /* PM1 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 16 16>;
+	};
+
+	port2: gpio@fcfe3008 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3008 0x2>, /* P2 */
+		      <0xfcfe3208 0x2>, /* PPR2 */
+		      <0xfcfe3308 0x2>; /* PM2 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 32 16>;
+	};
+
+	port3: gpio@fcfe300c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe300c 0x2>, /* P3 */
+		      <0xfcfe320c 0x2>, /* PPR3 */
+		      <0xfcfe330c 0x2>; /* PM3 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 48 16>;
+	};
+
+	port4: gpio@fcfe3010 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3010 0x2>, /* P4 */
+		      <0xfcfe3210 0x2>, /* PPR4 */
+		      <0xfcfe3310 0x2>; /* PM4 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 64 16>;
+	};
+
+	port5: gpio@fcfe3014 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3014 0x2>, /* P5 */
+		      <0xfcfe3214 0x2>, /* PPR5 */
+		      <0xfcfe3314 0x2>; /* PM5 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 80 11>;
+	};
+
+	port6: gpio@fcfe3018 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3018 0x2>, /* P6 */
+		      <0xfcfe3218 0x2>, /* PPR6 */
+		      <0xfcfe3318 0x2>; /* PM6 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 96 16>;
+	};
+
+	port7: gpio@fcfe301c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe301c 0x2>, /* P7 */
+		      <0xfcfe321c 0x2>, /* PPR7 */
+		      <0xfcfe331c 0x2>; /* PM7 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 112 16>;
+	};
+
+	port8: gpio@fcfe3020 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3020 0x2>, /* P8 */
+		      <0xfcfe3220 0x2>, /* PPR8 */
+		      <0xfcfe3320 0x2>; /* PM8 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 128 16>;
+	};
+
+	port9: gpio@fcfe3024 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3024 0x2>, /* P9 */
+		      <0xfcfe3224 0x2>, /* PPR9 */
+		      <0xfcfe3324 0x2>; /* PM9 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 144 8>;
+	};
+
+	port10: gpio@fcfe3028 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe3028 0x2>, /* P10 */
+		      <0xfcfe3228 0x2>, /* PPR10 */
+		      <0xfcfe3328 0x2>; /* PM10 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 160 16>;
+	};
+
+	port11: gpio@fcfe302c {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe302c 0x2>, /* P11 */
+		      <0xfcfe322c 0x2>, /* PPR11 */
+		      <0xfcfe332c 0x2>; /* PM11 */
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&pfc 0 176 16>;
+	};
+
+	jtagport0: gpio@fcfe7b20 {
+		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
+		reg = <0xfcfe7b20 0x2>; /* JPPR0 */
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
