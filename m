From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/2] DT: Add documentation for gpio-rt2880
Date: Thu,  9 Oct 2014 22:07:20 +0200
Message-ID: <1412885241-12476-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Describe gpio-rt2880 binding.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
 .../devicetree/bindings/gpio/gpio-rt2880.txt       |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rt2880.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
new file mode 100644
index 0000000..b4acf02
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
@@ -0,0 +1,40 @@
+Ralink SoC GPIO controller bindings
+
+Required properties:
+- compatible:
+  - "ralink,rt2880-gpio" for Ralink controllers
+- #gpio-cells : Should be two.
+  - first cell is the pin number
+  - second cell is used to specify optional parameters (unused)
+- gpio-controller : Marks the device node as a GPIO controller
+- reg : Physical base address and length of the controller's registers
+- interrupt-parent: phandle to the INTC device node
+- interrupts : Specify the INTC interrupt number
+- ralink,num-gpios : Specify the number of GPIOs
+- ralink,register-map : The register layout depends on the GPIO bank and actual
+		SoC type. Register offsets need to be in this order.
+		[ INT, EDGE, RENA, FENA, DATA, DIR, POL, SET, RESET, TOGGLE ]
+
+Optional properties:
+- ralink,gpio-base : Specify the GPIO chips base number
+
+Example:
+
+	gpio0: gpio@600 {
+		compatible = "ralink,rt5350-gpio", "ralink,rt2880-gpio";
+
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		reg = <0x600 0x34>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <6>;
+
+		ralink,gpio-base = <0>;
+		ralink,num-gpios = <24>;
+		ralink,register-map = [ 00 04 08 0c
+				20 24 28 2c
+				30 34 ];
+
+	};
-- 
1.7.10.4
