From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 5/6] ARM: dts: sunxi: Remove pinctrl groups setting bias
Date: Thu, 14 Mar 2019 20:32:54 +0100
Message-ID: <ca64e5b42aca638075f0b23ee887b79619884814.1552591798.git-series.maxime.ripard@bootlin.com>
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

So far we've enabled pull-up and pull-down resistors on GPIOs using a
pinctrl node. Now that the GPIO binding allows for a flag to declare this,
let's switch to it.

This brings us closer to removing all the GPIO pinctrl nodes, which will in
turn allow us to switch the pinctrl strict mode on.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts        | 20 +---
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts             | 10 +--
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts       | 20 +---
 arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts           | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet1.dts                  | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts              | 20 +---
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts           | 72 +++--------
 arch/arm/boot/dts/sun4i-a10-marsboard.dts              | 12 +--
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts         | 18 +---
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                | 12 +--
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts       | 19 +---
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts           | 10 +--
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts       | 10 +--
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts | 20 +---
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts               | 12 +--
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts        | 18 +---
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts              | 18 +---
 arch/arm/boot/dts/sun5i-a13-utoo-p66.dts               | 14 +--
 arch/arm/boot/dts/sun5i-r8-chip.dts                    | 12 +--
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi   | 20 +---
 arch/arm/boot/dts/sun6i-a31-colombus.dts               | 14 +--
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi   | 12 +--
 arch/arm/boot/dts/sun7i-a20-bananapi.dts               | 10 +--
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts            | 12 +--
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts              | 12 +--
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts         | 18 +---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts        | 18 +---
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts        | 18 +---
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts          | 12 +--
 arch/arm/boot/dts/sun7i-a20-orangepi.dts               | 12 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts          | 12 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts               | 12 +--
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts         | 12 +--
 arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts       | 12 +--
 arch/arm/boot/dts/sun8i-r16-parrot.dts                 | 12 +--
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi   | 12 +--
 36 files changed, 73 insertions(+), 514 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
index cf7b392dff31..f9f50028d9f2 100644
--- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
+++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
@@ -131,20 +131,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &reg_usb0_vbus {
 	status = "okay";
 };
@@ -165,10 +151,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
index 197a1f2b75ff..03db18e367f9 100644
--- a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
@@ -184,12 +184,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
 };
 
 &reg_ahci_5v {
@@ -254,9 +248,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
index 896e27a08727..a262b1163b47 100644
--- a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
@@ -158,20 +158,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm0_pin>;
@@ -223,10 +209,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
index f63767cddd8e..693cddb75e9e 100644
--- a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
@@ -86,20 +86,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &reg_usb0_vbus {
 	status = "okay";
 };
@@ -121,10 +107,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-inet1.dts b/arch/arm/boot/dts/sun4i-a10-inet1.dts
index 26d0c1d6a02b..7eb7215ee390 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet1.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet1.dts
@@ -164,20 +164,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm0_pin>;
@@ -233,10 +219,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
index 71c27ea0b53e..0f5704e7fc6d 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
@@ -150,20 +150,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -209,10 +195,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
index 2f0d966f39ad..a5573bd1a566 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
@@ -61,8 +61,6 @@
 
 	gpio-keys {
 		compatible = "gpio-keys-polled";
-		pinctrl-names = "default";
-		pinctrl-0 = <&key_pins_inet9f>;
 		poll-interval = <20>;
 
 		left-joystick-left {
@@ -70,7 +68,7 @@
 			linux,code = <ABS_X>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
+			gpios = <&pio 0 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA6 */
 		};
 
 		left-joystick-right {
@@ -78,7 +76,7 @@
 			linux,code = <ABS_X>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
+			gpios = <&pio 0 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA5 */
 		};
 
 		left-joystick-up {
@@ -86,7 +84,7 @@
 			linux,code = <ABS_Y>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
+			gpios = <&pio 0 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA8 */
 		};
 
 		left-joystick-down {
@@ -94,7 +92,7 @@
 			linux,code = <ABS_Y>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
+			gpios = <&pio 0 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA9 */
 		};
 
 		right-joystick-left {
@@ -102,7 +100,7 @@
 			linux,code = <ABS_Z>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
+			gpios = <&pio 0 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA1 */
 		};
 
 		right-joystick-right {
@@ -110,7 +108,7 @@
 			linux,code = <ABS_Z>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
+			gpios = <&pio 0 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA0 */
 		};
 
 		right-joystick-up {
@@ -118,7 +116,7 @@
 			linux,code = <ABS_RZ>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
+			gpios = <&pio 0 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA3 */
 		};
 
 		right-joystick-down {
@@ -126,7 +124,7 @@
 			linux,code = <ABS_RZ>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
+			gpios = <&pio 0 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA4 */
 		};
 
 		dpad-left {
@@ -134,7 +132,7 @@
 			linux,code = <ABS_HAT0X>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 7 23 GPIO_ACTIVE_LOW>; /* PH23 */
+			gpios = <&pio 7 23 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH23 */
 		};
 
 		dpad-right {
@@ -142,7 +140,7 @@
 			linux,code = <ABS_HAT0X>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 7 24 GPIO_ACTIVE_LOW>; /* PH24 */
+			gpios = <&pio 7 24 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH24 */
 		};
 
 		dpad-up {
@@ -150,7 +148,7 @@
 			linux,code = <ABS_HAT0Y>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <0xffffffff>; /* -1 */
-			gpios = <&pio 7 25 GPIO_ACTIVE_LOW>; /* PH25 */
+			gpios = <&pio 7 25 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH25 */
 		};
 
 		dpad-down {
@@ -158,55 +156,55 @@
 			linux,code = <ABS_HAT0Y>;
 			linux,input-type = <EV_ABS>;
 			linux,input-value = <1>;
-			gpios = <&pio 7 26 GPIO_ACTIVE_LOW>; /* PH26 */
+			gpios = <&pio 7 26 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH26 */
 		};
 
 		x {
 			label = "Button X";
 			linux,code = <BTN_X>;
-			gpios = <&pio 0 16 GPIO_ACTIVE_LOW>; /* PA16 */
+			gpios = <&pio 0 16 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA16 */
 		};
 
 		y {
 			label = "Button Y";
 			linux,code = <BTN_Y>;
-			gpios = <&pio 0 14 GPIO_ACTIVE_LOW>; /* PA14 */
+			gpios = <&pio 0 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA14 */
 		};
 
 		a {
 			label = "Button A";
 			linux,code = <BTN_A>;
-			gpios = <&pio 0 17 GPIO_ACTIVE_LOW>; /* PA17 */
+			gpios = <&pio 0 17 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA17 */
 		};
 
 		b {
 			label = "Button B";
 			linux,code = <BTN_B>;
-			gpios = <&pio 0 15 GPIO_ACTIVE_LOW>; /* PA15 */
+			gpios = <&pio 0 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA15 */
 		};
 
 		select {
 			label = "Select Button";
 			linux,code = <BTN_SELECT>;
-			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
+			gpios = <&pio 0 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA11 */
 		};
 
 		start {
 			label = "Start Button";
 			linux,code = <BTN_START>;
-			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
+			gpios = <&pio 0 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA12 */
 		};
 
 		top-left {
 			label = "Top Left Button";
 			linux,code = <BTN_TL>;
-			gpios = <&pio 7 22 GPIO_ACTIVE_LOW>; /* PH22 */
+			gpios = <&pio 7 22 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH22 */
 		};
 
 		top-right {
 			label = "Top Right Button";
 			linux,code = <BTN_TR>;
-			gpios = <&pio 0 13 GPIO_ACTIVE_LOW>; /* PA13 */
+			gpios = <&pio 0 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA13 */
 		};
 	};
 };
@@ -306,30 +304,6 @@
 	status = "okay";
 };
 
-&pio {
-	key_pins_inet9f: key-pins {
-		pins = "PA0", "PA1", "PA3", "PA4",
-		       "PA5", "PA6", "PA8", "PA9",
-		       "PA11", "PA12", "PA13",
-		       "PA14", "PA15", "PA16", "PA17",
-		       "PH22", "PH23", "PH24", "PH25", "PH26";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -375,10 +349,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-marsboard.dts b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
index 0dbf69576512..a178f34dd08c 100644
--- a/arch/arm/boot/dts/sun4i-a10-marsboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
@@ -148,14 +148,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_usb1_vbus {
 	status = "okay";
 };
@@ -183,9 +175,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
index b74a61496537..f357ce8fd33b 100644
--- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
@@ -186,18 +186,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 &reg_ahci_5v {
@@ -229,10 +217,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio   = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio   = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH5 */
 	usb0_vbus-supply   = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index d82a604f3d9c..45d5627ffaac 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -154,14 +154,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 #include "axp209.dtsi"
 
 &reg_dcdc2 {
@@ -201,9 +193,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_vcc5v0>; /* USB1 VBUS is always on */
 	usb2_vbus-supply = <&reg_vcc5v0>; /* USB2 VBUS is always on */
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
index 84b25be1ac94..704eefd70fd0 100644
--- a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
@@ -146,20 +146,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-};
-
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm0_pin>;
@@ -212,9 +198,8 @@
 
 &usbphy {
 	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
index c88f08984483..e6528e06ade5 100644
--- a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
@@ -119,12 +119,6 @@
 };
 
 &pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG12";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
 	led_pins_t004: led-pin {
 		pins = "PB2";
 		function = "gpio_out";
@@ -149,9 +143,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	usb0_id_det-gpio = <&pio 6 12 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG12 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
index 262c2ffbdcfa..76f32d744e58 100644
--- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
@@ -218,12 +218,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG12";
-		function = "gpio_in";
-		bias-pull-up;
-	};
 };
 
 &reg_usb0_vbus {
@@ -271,9 +265,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	usb0_id_det-gpio = <&pio 6 12 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG12 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
index f3cede9beb63..3217e1e2e59a 100644
--- a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
+++ b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
@@ -127,20 +127,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PG1";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG2";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm0_pin>;
@@ -195,10 +181,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
-	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_id_det-gpio = <&pio 6 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG2 */
+	usb0_vbus_det-gpio = <&pio 6 1 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PG1 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_ldo3>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
index 9369f7453beb..9b9f2a574851 100644
--- a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
+++ b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
@@ -124,14 +124,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG2";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 #include "axp209.dtsi"
 
 &reg_dcdc2 {
@@ -182,9 +174,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpios = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
+	usb0_id_det-gpios = <&pio 6 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG2 */
 	usb0_vbus_det-gpios = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_ldo3>;
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
index 943868e495bc..f615381af2bf 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
@@ -109,18 +109,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG2";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PG1";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 &reg_usb0_vbus {
@@ -145,10 +133,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
-	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_id_det-gpio = <&pio 6 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG2 */
+	usb0_vbus_det-gpio = <&pio 6 1 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PG1 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index 9409c232d48a..8bd9d935390e 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -204,18 +204,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG2";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PG1";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 &reg_usb0_vbus {
@@ -253,10 +241,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
-	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_id_det-gpio = <&pio 6 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG2 */
+	usb0_vbus_det-gpio = <&pio 6 1 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PG1 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
index 732873cbeedc..a3f23ec6b33b 100644
--- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
@@ -61,10 +61,8 @@
 	i2c_lcd: i2c-gpio {
 		/* The lcd panel i2c interface is hooked up via gpios */
 		compatible = "i2c-gpio";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c_lcd_pins>;
-		gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>, /* PG12, sda */
-			<&pio 6 10 GPIO_ACTIVE_HIGH>; /* PG10, scl */
+		gpios = <&pio 6 12 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>, /* PG12, sda */
+			<&pio 6 10 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG10, scl */
 		i2c-gpio,delay-us = <5>;
 	};
 };
@@ -94,14 +92,6 @@
 	};
 };
 
-&pio {
-	i2c_lcd_pins: i2c-lcd-pin {
-		pins = "PG10", "PG12";
-		function = "gpio_out";
-		bias-pull-up;
-	};
-};
-
 &reg_usb0_vbus {
 	gpio = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
 };
diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
index f4298facf9dc..1a169280272f 100644
--- a/arch/arm/boot/dts/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
@@ -84,9 +84,7 @@
 
 	onewire {
 		compatible = "w1-gpio";
-		gpios = <&pio 3 2 GPIO_ACTIVE_HIGH>; /* PD2 */
-		pinctrl-names = "default";
-		pinctrl-0 = <&chip_w1_pin>;
+		gpios = <&pio 3 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PD2 */
 	};
 };
 
@@ -173,14 +171,6 @@
 	status = "okay";
 };
 
-&pio {
-	chip_w1_pin: chip-w1-pin {
-		pins = "PD2";
-		function = "gpio_in";
-	        bias-pull-up;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-min-microvolt = <1000000>;
 	regulator-max-microvolt = <1400000>;
diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
index 5b1f0e198eb6..5391425e183d 100644
--- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
@@ -132,20 +132,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PG1";
-		function = "gpio_in";
-		bias-pull-down;
-	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PG2";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -198,10 +184,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
-	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_id_det-gpio = <&pio 6 2 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PG2 */
+	usb0_vbus_det-gpio = <&pio 6 1 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PG1 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_ldo3>;
diff --git a/arch/arm/boot/dts/sun6i-a31-colombus.dts b/arch/arm/boot/dts/sun6i-a31-colombus.dts
index 0b7bedf85fb9..d6c633221d3d 100644
--- a/arch/arm/boot/dts/sun6i-a31-colombus.dts
+++ b/arch/arm/boot/dts/sun6i-a31-colombus.dts
@@ -63,10 +63,8 @@
 	i2c_lcd: i2c {
 		/* The lcd panel i2c interface is hooked up via gpios */
 		compatible = "i2c-gpio";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c_lcd_pins>;
-		gpios = <&pio 0 23 GPIO_ACTIVE_HIGH>, /* PA23, sda */
-			<&pio 0 24 GPIO_ACTIVE_HIGH>; /* PA24, scl */
+		gpios = <&pio 0 23 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>, /* PA23, sda */
+			<&pio 0 24 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PA24, scl */
 		i2c-gpio,delay-us = <5>;
 	};
 };
@@ -113,14 +111,6 @@
 	status = "okay";
 };
 
-&pio {
-	i2c_lcd_pins: i2c-lcd-pins {
-		pins = "PA23", "PA24";
-		function = "gpio_out";
-		bias-pull-up;
-	};
-};
-
 &reg_usb2_vbus {
 	gpio = <&pio 7 24 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
index 86143de21c22..f9df5c106993 100644
--- a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
@@ -73,14 +73,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PA15";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &p2wi {
 	status = "okay";
 
@@ -173,9 +165,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 0 15 GPIO_ACTIVE_HIGH>; /* PA15 */
+	usb0_id_det-gpio = <&pio 0 15 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PA15 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_drivevbus>;
 	usb1_vbus-supply = <&reg_dldo1>;
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 81bc85d398c1..e4f59ab72ac0 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -246,12 +246,6 @@
 			"SPI-MISO", "SPI-CE1", "",
 		"IO-6", "IO-3", "IO-2", "IO-0", "", "", "", "",
 		"", "", "", "", "", "", "", "";
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
 };
 
 #include "axp209.dtsi"
@@ -329,9 +323,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index 200685b0b1cb..0d24389584c4 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -173,14 +173,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_ahci_5v {
 	status = "okay";
 };
@@ -236,9 +228,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
index f91e1bee44e8..c1fbb05f7ff3 100644
--- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
@@ -229,14 +229,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 #include "axp209.dtsi"
 
 &ac_power_supply {
@@ -322,9 +314,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
index 5e411194bf62..d2eba2025bd8 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
@@ -174,18 +174,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 &reg_ahci_5v {
@@ -217,10 +205,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index 4e1c590eb098..7ad8fe2de1f7 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -179,18 +179,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 &reg_ahci_5v {
@@ -267,10 +255,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 840ae1194a66..f295da9a082e 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -252,18 +252,6 @@
 		function = "gpio_out";
 		drive-strength = <20>;
 	};
-
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-
-	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
-		pins = "PH5";
-		function = "gpio_in";
-		bias-pull-down;
-	};
 };
 
 #include "axp209.dtsi"
@@ -355,10 +343,8 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>; /* PH5 */
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
index 15881081cac4..ecf4374e0413 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
@@ -176,14 +176,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -239,9 +231,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi.dts b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
index d64de2e73a9f..3e0469c213ab 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
@@ -135,14 +135,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -198,9 +190,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
index 538ea15fa32f..262f5a9a29e2 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
@@ -168,14 +168,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_ahci_5v {
 	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
 	status = "okay";
@@ -226,9 +218,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
index a72ed4318d04..52870aca9fc9 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
@@ -168,14 +168,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_ahci_5v {
 	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
@@ -226,9 +218,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index ffade253d129..f34cb62be91d 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -156,14 +156,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm0_pin>;
@@ -223,9 +215,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
diff --git a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
index c27e56091fb1..42c2056c9620 100644
--- a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
@@ -145,14 +145,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH4";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -206,9 +198,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_id_det-gpio = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
diff --git a/arch/arm/boot/dts/sun8i-r16-parrot.dts b/arch/arm/boot/dts/sun8i-r16-parrot.dts
index 316998e9ec5d..4f48eec6b2ef 100644
--- a/arch/arm/boot/dts/sun8i-r16-parrot.dts
+++ b/arch/arm/boot/dts/sun8i-r16-parrot.dts
@@ -158,14 +158,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_det: usb0-id-detect-pin {
-		pins = "PD10";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &r_rsb {
 	status = "okay";
 
@@ -314,10 +306,8 @@
 
 &usbphy {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_det>;
 	usb0_vbus-supply = <&reg_drivevbus>;
-	usb0_id_det-gpios = <&pio 3 10 GPIO_ACTIVE_HIGH>; /* PD10 */
+	usb0_id_det-gpios = <&pio 3 10 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PD10 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 };
diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
index 189e479eb95a..91d7815bfb8e 100644
--- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
@@ -86,14 +86,6 @@
 	status = "okay";
 };
 
-&pio {
-	usb0_id_detect_pin: usb0-id-detect-pin {
-		pins = "PH8";
-		function = "gpio_in";
-		bias-pull-up;
-	};
-};
-
 &r_rsb {
 	status = "okay";
 
@@ -224,9 +216,7 @@
 };
 
 &usbphy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb0_id_detect_pin>;
-	usb0_id_det-gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	usb0_id_det-gpio = <&pio 7 8 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH8 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_drivevbus>;
 	status = "okay";
-- 
git-series 0.9.1
