From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC] gpio: rcar: add gen[123] fallback compatibility strings
Date: Tue, 11 Jul 2017 14:38:30 +0200
Message-ID: <1499776710-25450-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-gpio@vger.kernel.org

Add fallback compatibility string for R-Car Gen 1, 2 and 3.

In the case of Renesas R-Car hardware we know that there are generations of
SoCs, f.e. Gen 1 and 2. But beyond that its not clear what the relationship
between IP blocks might be. For example, I believe that r8a7790 is older
than r8a7791 but that doesn't imply that the latter is a descendant of the
former or vice versa.

We can, however, by examining the documentation and behaviour of the
hardware at run-time observe that the current driver implementation appears
to be compatible with the IP blocks on SoCs within a given generation.

For the above reasons and convenience when enabling new SoCs a
per-generation fallback compatibility string scheme being adopted for
drivers for Renesas SoCs.

Also deprecate renesas,gpio-rcar as its name is more generic than its
implementation.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on linux-gpio/for-next
---
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt        | 15 +++++++++++----
 drivers/gpio/gpio-rcar.c                                  | 10 ++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 6826a371fb69..48634b01f1bf 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -2,7 +2,7 @@
 
 Required Properties:
 
-  - compatible: should contain one of the following.
+  - compatible: should contain one or more of the following:
     - "renesas,gpio-r8a7743": for R8A7743 (RZ/G1M) compatible GPIO controller.
     - "renesas,gpio-r8a7778": for R8A7778 (R-Mobile M1) compatible GPIO controller.
     - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
@@ -13,7 +13,14 @@ Required Properties:
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
     - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
-    - "renesas,gpio-rcar": for generic R-Car GPIO controller.
+    - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
+    - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
+    - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
+    - "renesas,gpio-rcar": deprecated.
+
+    When compatible with the generic version nodes must list the
+    SoC-specific version corresponding to the platform first followed by
+    the generic version.
 
   - reg: Base address and length of each memory resource used by the GPIO
     controller hardware module.
@@ -43,7 +50,7 @@ interrupt-controller/interrupts.txt.
 Example: R8A7779 (R-Car H1) GPIO controller nodes
 
 	gpio0: gpio@ffc40000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc40000 0x2c>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 141 0x4>;
@@ -55,7 +62,7 @@ Example: R8A7779 (R-Car H1) GPIO controller nodes
 	};
 	...
 	gpio6: gpio@ffc46000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
 		reg = <0xffc46000 0x2c>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 147 0x4>;
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 4a1536a050bc..1f0871553fd2 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -371,6 +371,16 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 		/* Gen3 GPIO is identical to Gen2. */
 		.data = &gpio_rcar_info_gen2,
 	}, {
+		.compatible = "renesas,rcar-gen1-gpio",
+		.data = &gpio_rcar_info_gen1,
+	}, {
+		.compatible = "renesas,rcar-gen2-gpio",
+		.data = &gpio_rcar_info_gen2,
+	}, {
+		.compatible = "renesas,rcar-gen3-gpio",
+		/* Gen3 GPIO is identical to Gen2. */
+		.data = &gpio_rcar_info_gen2,
+	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
 	}, {
-- 
2.1.4
