From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: dt-binding: fix generic pinmux/pinconf examples
Date: Sun, 15 Mar 2015 08:55:15 +0200
Message-ID: <b6effc6c0cb6b9488145b873dc01fcba2a4cd1df.1426402515.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:56395 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751122AbbCOGzc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 15 Mar 2015 02:55:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

pinconf_generic_dt_node_to_map() scans only subnodes of the pinctrl-0 pahndle,
not the referenced node itself. Change the example nodes to match.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../bindings/pinctrl/pinctrl-bindings.txt          | 30 ++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 950580c92448..e9ebe5d35835 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -137,12 +137,16 @@ groups			- the list of groups to select with this function
 Example:
 
 state_0_node_a {
-	function = "uart0";
-	groups = "u0rxtx", "u0rtscts";
+	uart0 {
+		function = "uart0";
+		groups = "u0rxtx", "u0rtscts";
+	};
 };
 state_1_node_a {
-	function = "spi0";
-	groups = "spi0pins";
+	spi0 {
+		function = "spi0";
+		groups = "spi0pins";
+	};
 };
 
 == Generic pin configuration node content ==
@@ -188,16 +192,22 @@ slew-rate		- set the slew rate
 For example:
 
 state_0_node_a {
-	pins = "GPIO0_AJ5", "GPIO2_AH4"; /* CTS+RXD */
-	bias-pull-up;
+	cts_rxd {
+		pins = "GPIO0_AJ5", "GPIO2_AH4"; /* CTS+RXD */
+		bias-pull-up;
+	};
 };
 state_1_node_a {
-	pins = "GPIO1_AJ3", "GPIO3_AH3"; /* RTS+TXD */
-	output-high;
+	rts_txd {
+		pins = "GPIO1_AJ3", "GPIO3_AH3"; /* RTS+TXD */
+		output-high;
+	};
 };
 state_2_node_a {
-	group = "foo-group";
-	bias-pull-up;
+	foo {
+		group = "foo-group";
+		bias-pull-up;
+	};
 };
 
 Some of the generic properties take arguments. For those that do, the
-- 
2.1.4

