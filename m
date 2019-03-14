From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 6/6] ARM: dts: sunxi: Remove useless pinctrl nodes
Date: Thu, 14 Mar 2019 20:32:55 +0100
Message-ID: <b102448c00768e07b0c28771935f52639aa83ef4.1552591798.git-series.maxime.ripard@bootlin.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

We have for the H3 boards some kind of cargo cult apparently, where we
would have a pinctrl node even for GPIOs without any particular settings.

This is pretty much useless, so let's remove them.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi       | 23 +----------------
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts    | 30 +---------------------
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts | 23 +----------------
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts  | 23 +----------------
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts   | 23 +----------------
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts |  9 +------
 6 files changed, 131 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index f110ee382239..ec2a05ff4b96 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -59,8 +59,6 @@
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_npi>, <&leds_r_npi>;
 
 		status {
 			label = "nanopi:blue:status";
@@ -78,8 +76,6 @@
 	r_gpio_keys {
 		compatible = "gpio-keys";
 		input-name = "k1";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_npi>;
 
 		k1 {
 			label = "k1";
@@ -104,25 +100,6 @@
 	status = "okay";
 };
 
-&pio {
-	leds_npi: led_pins {
-		pins = "PA10";
-		function = "gpio_out";
-	};
-};
-
-&r_pio {
-	leds_r_npi: led_pins {
-		pins = "PL10";
-		function = "gpio_out";
-	};
-
-	sw_r_npi: key_pins {
-		pins = "PL3";
-		function = "gpio_in";
-	};
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index f1fc6bdca8be..aa994e4a4abc 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -75,8 +75,6 @@
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_opc>, <&leds_r_opc>;
 
 		status_led {
 			label = "orangepi:red:status";
@@ -92,8 +90,6 @@
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_opc>;
 
 		sw2 {
 			label = "sw2";
@@ -110,8 +106,6 @@
 
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wifi_pwrseq_pin_orangepi>;
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 WIFI_EN */
 	};
 };
@@ -179,30 +173,6 @@
 	};
 };
 
-&pio {
-	leds_opc: led_pins {
-		pins = "PA15";
-		function = "gpio_out";
-	};
-};
-
-&r_pio {
-	leds_r_opc: led_pins {
-		pins = "PL10";
-		function = "gpio_out";
-	};
-
-	sw_r_opc: key_pins {
-		pins = "PL3", "PL4";
-		function = "gpio_in";
-	};
-
-	wifi_pwrseq_pin_orangepi: wifi_pwrseq_pin {
-		pins = "PL7";
-		function = "gpio_out";
-	};
-};
-
 &reg_usb1_vbus {
 	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
index 476ae8e387ca..34d8e5d236c9 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
@@ -74,8 +74,6 @@
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_opc>, <&leds_r_opc>;
 
 		pwr_led {
 			label = "orangepi:green:pwr";
@@ -91,8 +89,6 @@
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_opc>;
 
 		sw4 {
 			label = "sw4";
@@ -160,25 +156,6 @@
 	status = "okay";
 };
 
-&pio {
-	leds_opc: led_pins {
-		pins = "PA15";
-		function = "gpio_out";
-	};
-};
-
-&r_pio {
-	leds_r_opc: led_pins {
-		pins = "PL10";
-		function = "gpio_out";
-	};
-
-	sw_r_opc: key_pins {
-		pins = "PL3";
-		function = "gpio_in";
-	};
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 245fd658defb..a0026e03c295 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -73,8 +73,6 @@
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_opc>, <&leds_r_opc>;
 
 		pwr_led {
 			label = "orangepi:green:pwr";
@@ -90,8 +88,6 @@
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_opc>;
 
 		sw4 {
 			label = "sw4";
@@ -166,25 +162,6 @@
 	status = "okay";
 };
 
-&pio {
-	leds_opc: led_pins {
-		pins = "PA15";
-		function = "gpio_out";
-	};
-};
-
-&r_pio {
-	leds_r_opc: led_pins {
-		pins = "PL10";
-		function = "gpio_out";
-	};
-
-	sw_r_opc: key_pins {
-		pins = "PL3";
-		function = "gpio_in";
-	};
-};
-
 &reg_usb0_vbus {
 	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 46240334128f..22393c135f06 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -73,8 +73,6 @@
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_opc>, <&leds_r_opc>;
 
 		pwr_led {
 			label = "orangepi:green:pwr";
@@ -90,8 +88,6 @@
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_opc>;
 
 		sw4 {
 			label = "sw4";
@@ -179,13 +175,6 @@
 	status = "okay";
 };
 
-&pio {
-	leds_opc: led_pins {
-		pins = "PA15";
-		function = "gpio_out";
-	};
-};
-
 &r_i2c {
 	status = "okay";
 
@@ -210,18 +199,6 @@
 	};
 };
 
-&r_pio {
-	leds_r_opc: led_pins {
-		pins = "PL10";
-		function = "gpio_out";
-	};
-
-	sw_r_opc: key_pins {
-		pins = "PL3";
-		function = "gpio_in";
-	};
-};
-
 &reg_usb0_vbus {
 	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index ac8438c2cff1..97f497854e05 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -63,8 +63,6 @@
 
 	reg_usb3_vbus: usb3-vbus {
 		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb3_vbus_pin_a>;
 		regulator-name = "usb3-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -116,13 +114,6 @@
 	bias-pull-up;
 };
 
-&pio {
-	usb3_vbus_pin_a: usb3_vbus_pin {
-		pins = "PG11";
-		function = "gpio_out";
-	};
-};
-
 &r_i2c {
 	status = "okay";
 
-- 
git-series 0.9.1
