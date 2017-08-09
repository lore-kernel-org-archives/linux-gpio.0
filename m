From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] gpio: rcar: reinstate generic compat string
Date: Wed,  9 Aug 2017 10:21:06 +0200
Message-ID: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-gpio@vger.kernel.org

commit d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility
strings") deprecated the generic compat string, renesas,gpio-rcar. After
further discussion this appears not to have been desirable as that compat
string is compatible with all R-Car SoCs supported in upstream.

This commit partially reverts that commit, and updates related
documentation and examples.

Fixes: d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility strings")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt     | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 48634b01f1bf..347d8ede2982 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -16,11 +16,13 @@ Required Properties:
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
     - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
     - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
-    - "renesas,gpio-rcar": deprecated.
+    - "renesas,gpio-rcar": for generic R-Car GPIO controller.
 
-    When compatible with the generic version nodes must list the
-    SoC-specific version corresponding to the platform first followed by
-    the generic version.
+    Nodes should list all of the following that are compatible
+    in this order:
+    - A SoC-specific version
+    - A generic R-Car generation version
+    - The generic R-Car version
 
   - reg: Base address and length of each memory resource used by the GPIO
     controller hardware module.
@@ -50,7 +52,9 @@ interrupt-controller/interrupts.txt.
 Example: R8A7779 (R-Car H1) GPIO controller nodes
 
 	gpio0: gpio@ffc40000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
+		compatible = "renesas,gpio-r8a7779",
+			     "renesas,rcar-gen1-gpio",
+			     "renesas,gpio-rcar";
 		reg = <0xffc40000 0x2c>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 141 0x4>;
@@ -62,7 +66,9 @@ Example: R8A7779 (R-Car H1) GPIO controller nodes
 	};
 	...
 	gpio6: gpio@ffc46000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
+		compatible = "renesas,gpio-r8a7779",
+			     "renesas,rcar-gen1-gpio",
+			     "renesas,gpio-rcar";
 		reg = <0xffc46000 0x2c>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 147 0x4>;
-- 
2.1.4
