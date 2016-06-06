From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 3/3] arm64: dts: r8a7795: salvator: enable UHS for SDHI 0 & 3
Date: Mon,  6 Jun 2016 08:50:11 +0200
Message-ID: <1465195811-3041-4-git-send-email-wsa@the-dreams.de>
References: <1465195811-3041-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465195811-3041-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index abb25cfc20bd57..726426693f1fa0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -229,11 +229,25 @@
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
 	};
 
 	sdhi3_pins: sd3 {
 		groups = "sdhi3_data4", "sdhi3_ctrl";
 		function = "sdhi3";
+		power-source = <3300>;
+	};
+
+	sdhi3_pins_uhs: sd3_uhs {
+		groups = "sdhi3_data4", "sdhi3_ctrl";
+		function = "sdhi3";
+		power-source = <1800>;
 	};
 
 	sound_pins: sound {
@@ -374,25 +388,29 @@
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi0>;
 	vqmmc-supply = <&vccq_sdhi0>;
 	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	bus-width = <4>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
 &sdhi3 {
 	pinctrl-0 = <&sdhi3_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi3_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi3>;
 	vqmmc-supply = <&vccq_sdhi3>;
 	cd-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	bus-width = <4>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
-- 
2.8.1
