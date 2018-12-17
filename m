From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: pinctrl: sunxi: Add supply properties
Date: Mon, 17 Dec 2018 14:16:26 +0100
Message-ID: <20181217131626.17098-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The pinctrl node can have multiple regulators for each of its GPIO banks.
Add the property descriptions.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index 258a4648ab81..1d898490f346 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -43,6 +43,19 @@ Note: For backward compatibility reasons, the hosc and losc clocks are only
 required if you need to use the optional input-debounce property. Any new
 device tree should set them.
 
+Each pin bank, depending on the SoC, can have an associated regulator:
+
+- vcc-pa-supply: for the A10, A20, A31, A31s, A80 and R40 SoCs
+- vcc-pb-supply: for the A31, A31s, A80 and V3s SoCs
+- vcc-pc-supply: for the A10, A20, A31, A31s, A64, A80, H5, R40 and V3s SoCs
+- vcc-pd-supply: for the A23, A31, A31s, A64, A80, A83t, H3, H5 and R40 SoCs
+- vcc-pe-supply: for the A10, A20, A31, A31s, A64, A80, R40 and V3s SoCs
+- vcc-pf-supply: for the A10, A20, A31, A31s, A80, R40 and V3s SoCs
+- vcc-pg-supply: for the A10, A20, A31, A31s, A64, A80, H3, H5, R40 and V3s SoCs
+- vcc-ph-supply: for the A31, A31s and A80 SoCs
+- vcc-pl-supply: for the r-pinctrl of the A64, A80 and A83t SoCs
+- vcc-pm-supply: for the r-pinctrl of the A31, A31s and A80 SoCs
+
 Optional properties:
   - input-debounce: Array of debouncing periods in microseconds. One period per
     irq bank found in the controller. 0 if no setup required.
-- 
2.19.2
