From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5 v2] pinctrl: Add DT bindings for Cortina Gemini
Date: Mon, 31 Jul 2017 23:30:50 +0200
Message-ID: <20170731213050.4794-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:38400 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751533AbdGaVa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 17:30:58 -0400
Received: by mail-lf0-f52.google.com with SMTP id y15so118824742lfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 14:30:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org

The Cortina Gemini pin controller uses the standard pin control
bindings for muxing functions with groups so these bindings
should be entirely uncontroversial.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- State that the pin controller must be a subnode of the
  system controller.
- Drop the phandle to the system controller: we can simply
  look up the parent.
---
 .../bindings/pinctrl/cortina,gemini-pinctrl.txt    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
new file mode 100644
index 000000000000..61466c58faae
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
@@ -0,0 +1,59 @@
+Cortina Systems Gemini pin controller
+
+This pin controller is found in the Cortina Systems Gemini SoC family,
+see further arm/gemini.txt. It is a purely group-based multiplexing pin
+controller.
+
+The pin controller node must be a subnode of the system controller node.
+
+Required properties:
+- compatible: "cortina,gemini-pinctrl"
+
+Subnodes of the pin controller contain pin control multiplexing set-up.
+Please refer to pinctrl-bindings.txt for generic pin multiplexing nodes.
+
+Example:
+
+
+syscon {
+	compatible = "cortina,gemini-syscon";
+	...
+	pinctrl {
+		compatible = "cortina,gemini-pinctrl";
+		pinctrl-names = "default";
+		pinctrl-0 = <&dram_default_pins>, <&system_default_pins>,
+		    <&vcontrol_default_pins>;
+
+		dram_default_pins: pinctrl-dram {
+			mux {
+				function = "dram";
+				groups = "dramgrp";
+			};
+		};
+		rtc_default_pins: pinctrl-rtc {
+			mux {
+				function = "rtc";
+				groups = "rtcgrp";
+			};
+		};
+		power_default_pins: pinctrl-power {
+			mux {
+				function = "power";
+				groups = "powergrp";
+			};
+		};
+		system_default_pins: pinctrl-system {
+			mux {
+				function = "system";
+				groups = "systemgrp";
+			};
+		};
+		(...)
+		uart_default_pins: pinctrl-uart {
+			mux {
+				function = "uart";
+				groups = "uartrxtxgrp";
+			};
+		};
+	};
+};
-- 
2.9.4

