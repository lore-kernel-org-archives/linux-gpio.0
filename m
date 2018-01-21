From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] gpio: pca953x: add required properties to example in bindings
Date: Sun, 21 Jan 2018 13:38:22 +0100
Message-ID: <20180121123822.3059-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

The binding documentation was missing two required properties in the
example. Fix it and add them also to the list of required properties.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V1:
  * reworded text about the second cell

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 0d0158728f897b..9c60bfb2053c4c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -30,6 +30,11 @@ Required properties:
 	onnn,pca9654
 	exar,xra1202
 
+- gpio-controller: Marks the device node as a GPIO controller
+- #gpio-cells: Must be 2. The first cell is the GPIO number and the second
+  cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Note
+  that not all flags may be supported by the hardware or the driver.
+
 Optional properties:
  - reset-gpios: GPIO specification for the RESET input. This is an
 		active low signal to the PCA953x.
@@ -44,4 +49,6 @@ Example:
 		pinctrl-0 = <&pinctrl_pca9505>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
-- 
2.11.0
