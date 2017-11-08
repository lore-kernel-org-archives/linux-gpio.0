From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 1/4] documentation: Add compatibles for Amlogic Meson AXG pin controllers
Date: Wed, 8 Nov 2017 14:47:11 +0800
Message-ID: <20171108064711.32376-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

Add compatibles for Amlogic Meson AXG pin controllers

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 2392557ede27..2c12f9789116 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -9,6 +9,8 @@ Required properties for the root node:
 		      "amlogic,meson-gxbb-aobus-pinctrl"
 		      "amlogic,meson-gxl-periphs-pinctrl"
 		      "amlogic,meson-gxl-aobus-pinctrl"
+		      "amlogic,meson-axg-periphs-pinctrl"
+		      "amlogic,meson-axg-aobus-pinctrl"
  - reg: address and size of registers controlling irq functionality
 
 === GPIO sub-nodes ===
-- 
2.14.1
